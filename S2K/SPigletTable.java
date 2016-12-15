import java.util.ArrayList;
import java.util.List;


public class SPigletTable {
	static List<SPigletProcedure> allProcedure=new ArrayList<SPigletProcedure>();
	
	static void AddProcedure(SPigletProcedure procedure)
	{
		allProcedure.add(procedure);
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
}

class SPigletProcedure
{
	String name;
	int numberOfParameter;
	int maxTemp;
	List<SPigletStatement> allStatement = new ArrayList<SPigletStatement>();
	
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
}

class SPigletStatement
{
	boolean hasLabel=false;
	String label="";
	boolean canJump=false;
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
			System.out.print("May jump to "+jumpToLabel);
		else
			System.out.print("Will not jump.");
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



