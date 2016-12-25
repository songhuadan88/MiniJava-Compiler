import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Queue;
import java.util.Set;
import java.util.TreeSet;


public class SPigletTable {
	static List<SPigletProcedure> allProcedure=new ArrayList<SPigletProcedure>();
	
	static void AddProcedure(SPigletProcedure procedure)
	{
		allProcedure.add(procedure);
	}
	
	static void DivideBasicBlock()
	{
		for(SPigletProcedure procedure : allProcedure)
		{
			procedure.DivideBasicBlock();
		}
	}
	
	static void LivenessAnalyze()
	{
		for(SPigletProcedure procedure : allProcedure)
		{
			procedure.LivenessAnalyze();
		}
	}
	
	static void AllocateRegister()
	{
		for(SPigletProcedure procedure : allProcedure)
		{
			procedure.AllocateRegister();
		}
	}
	
	static int MaximumOfProcedureParameter()
	{
		int ret=0;
		for(SPigletProcedure procedure : allProcedure)
		{
			ret=Math.max(ret, procedure.numberOfParameter);
		}
		return ret;
	}
	
	static SPigletProcedure SearchProcedure(String name)
	{
		for(SPigletProcedure procedure : allProcedure)
		{
			if(procedure.name==name)
				return procedure;
		}
		return null;
	}
	
	static void Print()
	{
		System.out.println(String.format("Totally %d procedure.",allProcedure.size()));
		for(SPigletProcedure procedure : allProcedure)
		{
			System.out.println();
			procedure.Print();
		}
	}
	
	static void PrintBasicBlock()
	{
		System.out.println(String.format("Totally %d procedure.",allProcedure.size()));
		for(SPigletProcedure procedure : allProcedure)
		{
			System.out.println();
			procedure.PrintBasicBlock();
		}
	}
}

class SPigletProcedure
{
	String name;
	int numberOfParameter;
	int maxTemp;
	List<SPigletStatement> allStatement = new ArrayList<SPigletStatement>();
	List<SPigletBasicBlock> allBasicBlock=new ArrayList<SPigletBasicBlock>();
	
	public SPigletProcedure(String _name, int _numberOfParameter)
	{
		name=_name;
		numberOfParameter=_numberOfParameter;
		maxTemp=0;
	}
	
	public void AddStatement(SPigletStatement statement)
	{
		allStatement.add(statement);
	}

	public void DivideBasicBlock()
	{
		Set<Integer> blockHead=new TreeSet<Integer>();
		for(int i=0;i<allStatement.size();i++)
		{
			if(i==0)
			{
				blockHead.add(i);
				continue;
			}
			if(allStatement.get(i).hasLabel)
			{
				blockHead.add(i);
				continue;
			}
			if(allStatement.get(i-1).canJump || allStatement.get(i-1).mustJump)
			{
				blockHead.add(i);
				continue;
			}
		}
		
		int lastHead=-1;		
		for(Integer head:blockHead)
		{
			if(lastHead==-1)
			{
				lastHead=head;
				continue;
			}
			SPigletBasicBlock block=new SPigletBasicBlock(this,lastHead,head-1);
			allBasicBlock.add(block);
			lastHead=head;
		}
		SPigletBasicBlock block=new SPigletBasicBlock(this,lastHead,allStatement.size()-1);
		allBasicBlock.add(block);
		SPigletBasicBlock exitBlock=new SPigletBasicBlock(this);
		allBasicBlock.add(exitBlock);
		block.AddChildrenBlock(exitBlock);
		
		for(SPigletBasicBlock b:allBasicBlock)
		{
			SPigletStatement lastStatement=allStatement.get(b.endIndex);
			if(lastStatement.mustJump || lastStatement.canJump)
			{
				String label=lastStatement.jumpToLabel;
				for(SPigletBasicBlock b1:allBasicBlock)
				{
					SPigletStatement firstStatement=allStatement.get(b1.startIndex);
					if(firstStatement.hasLabel && firstStatement.label==label)
					{
						b.AddChildrenBlock(b1);
					}
				}
			}
			if(!lastStatement.mustJump)
			{
				for(SPigletBasicBlock b1:allBasicBlock)
				{
					if(b1.startIndex==b.endIndex+1)
					{
						b.AddChildrenBlock(b1);
					}
				}
			}
		}
		
	}
	
	public void LivenessAnalyze()
	{
		Queue<SPigletBasicBlock> changed=new LinkedList<SPigletBasicBlock>();
		for(SPigletBasicBlock block : allBasicBlock)
		{
			if(block.isExitBlock)
				continue;
			for(int i=block.startIndex;i<=block.endIndex;i++)
			{
				SPigletStatement statement=allStatement.get(i);
				for(int temp : statement.assignedTemp)
				{
					if(block.USE.contains(temp) || block.DEF.contains(temp))
						continue;
					block.DEF.add(temp);
				}
				for(int temp : statement.accessedTemp)
				{
					if(block.USE.contains(temp) || block.DEF.contains(temp))
						continue;
					block.USE.add(temp);
				}
			}
			changed.add(block);
		}
		
		while(!changed.isEmpty())
		{
			SPigletBasicBlock block=changed.remove();
			block.OUT.clear();
			for(SPigletBasicBlock b : block.childrenBlock)
				block.OUT.addAll(b.IN);
			Set<Integer> originalIN=new HashSet<Integer>(block.IN);
			Set<Integer> calc=new HashSet<Integer>(block.OUT);
			calc.removeAll(block.DEF);
			calc.addAll(block.USE);			
			if(originalIN.size()!=calc.size() || !originalIN.containsAll(calc))
			{
				block.IN=new HashSet<Integer>(calc);
				for(SPigletBasicBlock b : block.parentBlock)
				{
					changed.add(b);
				}
			}
		}
		
		// analyze for each statement
		for(SPigletBasicBlock block : allBasicBlock)
		{
			if(block.isExitBlock)
				continue;
			for(int i=block.endIndex;i>=block.startIndex;i--)
			{
				SPigletStatement statement=allStatement.get(i);
				statement.OUT=new HashSet<Integer>(i==block.endIndex?block.OUT:allStatement.get(i+1).IN);
				statement.IN=new HashSet<Integer>(statement.OUT);
				statement.IN.removeAll(statement.assignedTemp);
				statement.IN.addAll(statement.accessedTemp);				
			}
		}
	}

	// return the first available register position for all the current registers
	private static int AvailableRegister(List<Map<Integer,Integer>> allRegister)
	{
		int ret=0;
		boolean flag=true;
		while(flag)
		{
			flag=false;
			for(Map<Integer,Integer> register: allRegister)
			{
				if(register.containsValue(ret))
				{
					ret++;
					flag=true;
				}
			}
		}
		return ret;
	}
	
	public void AllocateRegister()
	{
		for(SPigletBasicBlock block : allBasicBlock)
		{
			if(block.isExitBlock)
				continue;
			for(Integer temp : block.IN)
			{
				if(block.INregister.containsKey(temp))
					continue;
				List<Map<Integer,Integer>> allRegister=new ArrayList<Map<Integer,Integer>>();
				List<Map<Integer,Integer>> allRegisterForAvailiable=new ArrayList<Map<Integer,Integer>>();
				for(SPigletBasicBlock b : allBasicBlock)
				{
					if(b.isExitBlock)
						continue;
					if(b.IN.contains(temp))
						allRegister.add(b.INregister);
					if(b.OUT.contains(temp))
						allRegister.add(b.OUTregister);
					if(b.IN.contains(temp) || b.OUT.contains(temp))
					{
						allRegisterForAvailiable.add(b.INregister);
						allRegisterForAvailiable.add(b.OUTregister);
					}
				}
				int r=AvailableRegister(allRegisterForAvailiable);
				for(Map<Integer,Integer> register: allRegister)
				{
					register.put(temp, r);
				}
			}
			for(Integer temp : block.OUT)
			{
				if(block.OUTregister.containsKey(temp))
					continue;
				List<Map<Integer,Integer>> allRegister=new ArrayList<Map<Integer,Integer>>();
				List<Map<Integer,Integer>> allRegisterForAvailiable=new ArrayList<Map<Integer,Integer>>();
				for(SPigletBasicBlock b : allBasicBlock)
				{
					if(b.isExitBlock)
						continue;
					if(b.IN.contains(temp))
						allRegister.add(b.INregister);
					if(b.OUT.contains(temp))
						allRegister.add(b.OUTregister);
					if(b.IN.contains(temp) || b.OUT.contains(temp))
					{
						allRegisterForAvailiable.add(b.INregister);
						allRegisterForAvailiable.add(b.OUTregister);
					}
				}
				int r=AvailableRegister(allRegisterForAvailiable);
				for(Map<Integer,Integer> register: allRegister)
				{
					register.put(temp, r);
				}
			}
		}
		
		// allocate register for statements
		for(SPigletBasicBlock block : allBasicBlock)
		{
			if(block.isExitBlock)
				continue;
			// IN already, insert assign and access, save to statement register, delete to OUT
			Map<Integer,Integer> current=new HashMap<Integer,Integer>(block.INregister);
			List<Map<Integer,Integer>> allRegisterForAvailiable=new ArrayList<Map<Integer,Integer>>();
			allRegisterForAvailiable.add(block.INregister);
			allRegisterForAvailiable.add(block.OUTregister);
			allRegisterForAvailiable.add(current);
			for(int i=block.startIndex;i<=block.endIndex;i++)
			{
				SPigletStatement statement=allStatement.get(i);				
				for(Integer temp : statement.assignedTemp)
				{
					if(current.containsKey(temp))
						continue;
					int r=AvailableRegister(allRegisterForAvailiable);
					if(block.INregister.containsKey(temp))
						r=block.INregister.get(temp);
					if(block.OUTregister.containsKey(temp))
						r=block.OUTregister.get(temp);
					current.put(temp, r);
				}
				for(Integer temp : statement.accessedTemp)
				{
					if(current.containsKey(temp))
						continue;
					int r=AvailableRegister(allRegisterForAvailiable);
					if(block.INregister.containsKey(temp))
						r=block.INregister.get(temp);
					if(block.OUTregister.containsKey(temp))
						r=block.OUTregister.get(temp);
					current.put(temp, r);
				}
				statement.register = new HashMap<Integer,Integer>(current);
				Set<Integer> keys = new HashSet<Integer>(current.keySet());
				for(Integer key : keys)
				{
					if(!statement.OUT.contains(key))
						current.remove(key);
				}
			}
			
		}
	}
	
	public int NeededRegister()
	{
		int maxRegister=-1;
		for(SPigletStatement statement : allStatement)
		{
			for(Integer r : statement.register.values())
			{
				maxRegister=Math.max(maxRegister, r);
			}
		}
		return maxRegister + 1;
	}
	
	public int NeededStackSpace() 
	{		
		return Math.max(0, numberOfParameter-4) + NeededRegister();	
	}
	
	public TempStorePosition GetStorePosition(int tempIndex, int statementIndex)
	{
		Map<Integer,Integer> register=allStatement.get(statementIndex).register;
		if(!register.containsKey(tempIndex))
			return null;
		int r=register.get(tempIndex);
		TempStorePosition storePosition=new TempStorePosition();
		if(r<18)
		{
			storePosition.type=StorePositionType.REGISTER;
			storePosition.registerName=(r<8?"s"+r:"t"+(r-8));
		}
		else
		{
			storePosition.type=StorePositionType.STACK;
			storePosition.stackIndex=Math.max(0, numberOfParameter-4) + r;
		}
		return storePosition;
	}
	
	public void Print()
	{
		System.out.println(String.format("Procedure %s, parameter %d, maxtemp %d, with %d statements, need %d registers",name,numberOfParameter,maxTemp,allStatement.size(),NeededRegister()));
		for(SPigletStatement statement : allStatement)
		{
			statement.Print();
		}
	}
	
	public void PrintBasicBlock()
	{
		System.out.println(String.format("Procedure %s, with %d basicblocks and %d statements",name,allBasicBlock.size(),allStatement.size()));
		for(SPigletBasicBlock block:allBasicBlock)
		{
			block.PrintBasicBlock();
		}
	}
}

class SPigletBasicBlock
{
	boolean isExitBlock;
	SPigletProcedure parentProcudre;
	int startIndex;
	int endIndex;	
	List<SPigletBasicBlock> childrenBlock=new ArrayList<SPigletBasicBlock>();
	List<SPigletBasicBlock> parentBlock=new ArrayList<SPigletBasicBlock>();
	Set<Integer> IN,OUT,USE,DEF;
	Map<Integer,Integer> INregister=new HashMap<Integer,Integer>(),OUTregister=new HashMap<Integer,Integer>();
	
	public SPigletBasicBlock(SPigletProcedure procedure)
	{
		isExitBlock=true;
		parentProcudre=procedure;
		IN=new HashSet<Integer>();
		OUT=new HashSet<Integer>();
		USE=new HashSet<Integer>();
		DEF=new HashSet<Integer>();
	}
	
	public SPigletBasicBlock(SPigletProcedure procedure,int start, int end)
	{
		isExitBlock=false;
		parentProcudre=procedure;
		startIndex=start;
		endIndex=end;
		IN=new HashSet<Integer>();
		OUT=new HashSet<Integer>();
		USE=new HashSet<Integer>();
		DEF=new HashSet<Integer>();
	}
	
	public void AddChildrenBlock(SPigletBasicBlock child)
	{
		childrenBlock.add(child);
		child.parentBlock.add(this);
	}
	
	private String ShortDescription()
	{
		if(isExitBlock)
			return "[ExitBlock]";
		return String.format("[%d-%d]", startIndex,endIndex);
	}
	
	public void PrintBasicBlock()
	{		
		System.out.println(String.format("BasicBlock %s, %d children, %d parents" , ShortDescription(),childrenBlock.size(),parentBlock.size()));
		for(SPigletBasicBlock child : childrenBlock)
		{
			System.out.println(String.format("\tOne child: %s", child.ShortDescription()));
		}
		for(SPigletBasicBlock parent : parentBlock)
		{
			System.out.println(String.format("\tOne parent: %s", parent.ShortDescription()));
		}
		System.out.println("\tUSE: "+USE.toString());
		System.out.println("\tDEF: "+DEF.toString());
		System.out.println("\tIN: "+IN.toString());
		System.out.println("\tOUT: "+OUT.toString());
		System.out.println("\tINregister: "+INregister.toString());
		System.out.println("\tOUTregister: "+OUTregister.toString());
	}
}

class SPigletStatement
{
	boolean hasLabel=false;
	String label="";
	boolean canJump=false;
	boolean mustJump=false;
	String jumpToLabel="";
	
	Set<Integer> assignedTemp=new HashSet<Integer>();
	Set<Integer> accessedTemp=new HashSet<Integer>();
	Set<Integer> IN;
	Set<Integer> OUT;
	Map<Integer,Integer> register;
	
	public void Print()
	{
		if(hasLabel)
			System.out.print("With label: "+label);
		else
			System.out.print("No label.");
		if(canJump)
			System.out.print(" May jump to "+jumpToLabel);
		else if(mustJump)
			System.out.print(" Must jump to "+jumpToLabel);
		else
			System.out.print(" Will not jump.");
		System.out.print(" Accessed: "+accessedTemp.toString());
		System.out.print(" Assigned: "+assignedTemp.toString());
		System.out.print(" IN: "+IN.toString());
		System.out.print(" OUT: "+OUT.toString());
		System.out.println();
		System.out.println("\tRegister: "+register.toString());
	}
	
}

enum StorePositionType{REGISTER,STACK}
class TempStorePosition
{
	StorePositionType type;
	String registerName;
	int stackIndex;
}



