import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


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
		Set<Integer> blockHead=new HashSet<Integer>();
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
	
	public int NeededStackSpace() 
	{
		return maxTemp+10;
//		if(numberOfParameter <= 4)
//		{
//			return Math.max(0,  maxTemp-numberOfParameter-9);
//		}
//		else
//		{
//			return Math.max(0, maxTemp-13);
//		}		
	}
	
	public TempStorePosition GetStorePosition(int tempIndex, int statementIndex)
	{
		TempStorePosition storePosition=new TempStorePosition();
		storePosition.type=StorePositionType.STACK;
		storePosition.stackIndex=tempIndex;
		return storePosition;
//		if(numberOfParameter > 4)
//		{
//			if(tempIndex<=3)
//			{
//				storePosition.type=StorePositionType.REGISTER;
//				storePosition.registerName="a"+tempIndex;
//			}
//			else if(tempIndex < numberOfParameter)
//			{
//				storePosition.type=StorePositionType.STACK;
//				storePosition.stackIndex=tempIndex -4;				
//			}
//			else if (tempIndex<=numberOfParameter+9)
//			{
//				storePosition.type=StorePositionType.REGISTER;
//				storePosition.registerName="t"+(tempIndex-numberOfParameter);
//			}
//			else
//			{
//				storePosition.type=StorePositionType.STACK;
//				storePosition.stackIndex=tempIndex - 14;	
//			}
//		}
//		else
//		{
//			if(tempIndex<numberOfParameter)
//			{
//				storePosition.type=StorePositionType.REGISTER;
//				storePosition.registerName="a"+tempIndex;
//			}
//			else if(tempIndex<=numberOfParameter+9)
//			{
//				storePosition.type=StorePositionType.REGISTER;
//				storePosition.registerName="t"+(tempIndex-numberOfParameter);
//			}
//			else
//			{
//				storePosition.type=StorePositionType.STACK;
//				storePosition.stackIndex=tempIndex - 10 - numberOfParameter;	
//			}
//		}
//		
//		return storePosition;
	}
	
	public void Print()
	{
		System.out.println(String.format("Procedure %s, parameter %d, maxtemp %d, with %d statements",name,numberOfParameter,maxTemp,allStatement.size()));
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
	int startIndex;
	int endIndex;	
	List<SPigletBasicBlock> childrenBlock=new ArrayList<SPigletBasicBlock>();
	List<SPigletBasicBlock> parentBlock=new ArrayList<SPigletBasicBlock>();
	SPigletProcedure parentProcudre;
	
	public SPigletBasicBlock(SPigletProcedure procedure)
	{
		isExitBlock=true;
		parentProcudre=procedure;
	}
	
	public SPigletBasicBlock(SPigletProcedure procedure,int start, int end)
	{
		isExitBlock=false;
		parentProcudre=procedure;
		startIndex=start;
		endIndex=end;
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
			System.out.println(String.format("One child: %s", child.ShortDescription()));
		}
		for(SPigletBasicBlock parent : parentBlock)
		{
			System.out.println(String.format("One parent: %s", parent.ShortDescription()));
		}
	}
}

class SPigletStatement
{
	boolean hasLabel=false;
	String label="";
	boolean canJump=false;
	boolean mustJump=false;
	String jumpToLabel="";
	
	List<Integer> assignedTemp=new ArrayList<Integer>();
	List<Integer> accessedTemp=new ArrayList<Integer>();
	
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
		System.out.println();
	}
	
}

enum StorePositionType{REGISTER,STACK}
class TempStorePosition
{
	StorePositionType type;
	String registerName;
	int stackIndex;
}



