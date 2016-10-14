import java.util.ArrayList;
import java.util.List;

interface SymbolInterface{

	void addVariable(VariableItem variableItem); // implemented by function and class
}

public class SymbolTable implements SymbolInterface {
	MainClassItem mainClassItem;
	List<ClassItem> classItem=new ArrayList<ClassItem>();

	public void addMainClass(MainClassItem classItem) {
		// TODO Auto-generated method stub
		mainClassItem=classItem;
	}

	public void addClass(ClassItem _classItem) {
		// TODO Auto-generated method stub
		classItem.add(_classItem);
	}

	public void addVariable(VariableItem variableItem) {
		// no need to implement
		
	}

}

class ClassItem implements SymbolInterface
{
	String name;
	boolean hasParent;
	String parentName;
	List<FunctionItem> functionItem=new ArrayList<FunctionItem>();
	List<VariableItem> variableItem=new ArrayList<VariableItem>();
	
	public ClassItem(String _name) {
		// TODO Auto-generated constructor stub
		name=_name;
		hasParent=false;
	}

	public ClassItem(String _name, String _parentName) {
		// TODO Auto-generated constructor stub
		name=_name;
		parentName=_parentName;
		hasParent=true;
	}

	public void addFunction(FunctionItem _functionItem) {
		// TODO Auto-generated method stub
		functionItem.add(_functionItem);
	}

	public void addVariable(VariableItem _variableItem) {
		// TODO Auto-generated method stub
		variableItem.add(_variableItem);
	}
	
}

class MainClassItem implements SymbolInterface
{
	String name;
	MainFunctionItem functionItem;
	public MainClassItem(String _name) {
		// TODO Auto-generated constructor stub
		name=_name;
	}

	public void addMainFunction(MainFunctionItem _functionItem) {
		// TODO Auto-generated method stub
		functionItem=_functionItem;
	}

	public void addVariable(VariableItem variableItem) {
		// TODO Auto-generated method stub
		
	}
	
}

class FunctionItem implements SymbolInterface
{
	String name;
	VariableType retType;
	List<VariableItem> variableItem=new ArrayList<VariableItem>();
	List<VariableType> parameterType=new ArrayList<VariableType>();
	public FunctionItem(String _name, VariableType _retType) {
		// TODO Auto-generated constructor stub
		name=_name;
		retType=_retType;
	}

	public void addVariable(VariableItem _variableItem) {
		// TODO Auto-generated method stub
		variableItem.add(_variableItem);
	}

	public void addParameter(VariableType _type, String _name) {
		// TODO Auto-generated method stub
		parameterType.add(_type);
		VariableItem _variableItem=new VariableItem(_type,_name);		
		variableItem.add(_variableItem);
	}
	
}

class MainFunctionItem implements SymbolInterface
{
	String parameterName;
	List<VariableItem> variableItem=new ArrayList<VariableItem>();

	public MainFunctionItem(String _name) {
		// TODO Auto-generated constructor stub
		parameterName=_name;
	}

	public void addVariable(VariableItem _variableItem) {
		// TODO Auto-generated method stub
		variableItem.add(_variableItem);
	}
	
}

class VariableItem
{
	VariableType type;
	String name;

	public VariableItem(VariableType _type, String _name) {
		// TODO Auto-generated constructor stub
		type=_type;
		name=_name;
	}	
}

enum FourType{Unknown,Integer,IntegerArray,Boolean,Object}

class VariableType
{
	FourType type;
	String name;
	
	VariableType(FourType _type)
	{
		type=_type;
	}
	
	VariableType(FourType _type, String _name)
	{
		type=_type;
		name=_name;
	}	
}


