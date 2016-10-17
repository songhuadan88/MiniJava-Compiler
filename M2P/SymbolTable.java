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
		classItem.parentTable=this;
	}

	public void addClass(ClassItem _classItem) {
		// TODO Auto-generated method stub
		classItem.add(_classItem);
		_classItem.parentTable=this;
	}

	public void addVariable(VariableItem variableItem) {
		// no need to implement
		
	}
	
	public ClassItem SearchClass(String className) {
		// TODO Auto-generated method stub
		for(ClassItem classitem : classItem)
		{
			if(classitem.name==className)
				return classitem;
		}
		return null;
	}

	public void MakeOrder() {
		// TODO Auto-generated method stub
		mainClassItem.MakeOrder();
		for(ClassItem classitem : classItem)
		{
			classitem.MakeVariableOrder();
			classitem.MakeFunctionOrder();
		}
	}
	

}

class ClassItem implements SymbolInterface
{
	SymbolTable parentTable=null;
	String name;
	boolean hasParent;
	String parentName;
	List<FunctionItem> functionItem=new ArrayList<FunctionItem>();
	List<VariableItem> variableItem=new ArrayList<VariableItem>();
	
	public ClassItem(){}
	
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
		_functionItem.parentClass=this;
	}

	public void addVariable(VariableItem _variableItem) {
		// TODO Auto-generated method stub
		variableItem.add(_variableItem);
	}

	public FunctionItem SearchFunction(String functionName) {
		// TODO Auto-generated method stub
		for(FunctionItem function : functionItem)
		{
			if(function.name==functionName)
				return function;
		}
		
		if(hasParent)
		{
			ClassItem parentClass=parentTable.SearchClass(parentName);
			return parentClass.SearchFunction(functionName);
		}
		
		return null;
	}

	public VariableItem SearchVariable(String variableName) {
		// TODO Auto-generated method stub
		for(VariableItem variable : variableItem)
		{
			if(variable.name==variableName)
				return variable;
		}
		
		if(hasParent)
		{
			ClassItem parentClass=parentTable.SearchClass(parentName);
			return parentClass.SearchVariable(variableName);
		}
		
		return null;
	}


	public int MakeVariableOrder() {
		// TODO Auto-generated method stub
		int index=0;
		if(hasParent)
		{
			ClassItem parentClass=parentTable.SearchClass(parentName);
			index = parentClass.MakeVariableOrder();
		}
		for(VariableItem variable : variableItem)
		{
			variable.indexInParent=index++;
		}
		
		return index;
	}
	
	public int MakeFunctionOrder(){
		int index=0;
		if(hasParent)
		{
			ClassItem parentClass=parentTable.SearchClass(parentName);
			index = parentClass.MakeFunctionOrder();
		}
		for(FunctionItem function : functionItem)
		{
			function.indexInParent=index++;
		}
		
		return index;
		
	}

}

class MainClassItem extends ClassItem
{
	String name;
	MainFunctionItem functionItem;
	public MainClassItem(String _name) {
		// TODO Auto-generated constructor stub
		name=_name;
	}

	public void MakeOrder() {
		// TODO Auto-generated method stub
		functionItem.indexInParent=0;		
	}

	public void addMainFunction(MainFunctionItem _functionItem) {
		// TODO Auto-generated method stub
		functionItem=_functionItem;
		_functionItem.parentClass=this;
	}

	public void addVariable(VariableItem variableItem) {
		// no need to implement
		
	}
	
}

class FunctionItem implements SymbolInterface
{
	int indexInParent=0;
	int indexOfTemp=0;

	ClassItem parentClass;
	String name;
	VariableType retType;
	List<VariableItem> variableItem=new ArrayList<VariableItem>();
	List<VariableType> parameterType=new ArrayList<VariableType>();	
	
	public FunctionItem(){}
	
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

	public VariableItem SearchVariable(String variableName) {
		// TODO Auto-generated method stub
		for(VariableItem variable : variableItem)
		{
			if(variable.name==variableName)
				return variable;
		}
		return null;
	}
	

}

class MainFunctionItem extends FunctionItem 
{
	int indexInParent=0;
	int indexOfTemp=0;

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
	int indexInParent=0;
	int indexOfTemp=0;

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

	// check whether an instance of type1 is an instance of type 2
	public static boolean IsA(VariableType type1, VariableType type2, SymbolTable symbolTable) {
		// TODO Auto-generated method stub
		if(type1.type==FourType.Boolean || type1.type==FourType.Integer || type1.type==FourType.IntegerArray)
			return type1.type==type2.type;
		if(type1.type==FourType.Object)
		{
			if(type2.type!=FourType.Object)
				return false;
			if(type1.name==type2.name)
				return true;
			ClassItem classItem=symbolTable.SearchClass(type1.name);
			if(classItem==null)
				return false;
			return IsA(new VariableType(FourType.Object,classItem.parentName),type2,symbolTable);
		}
		return false;
	}	
}


