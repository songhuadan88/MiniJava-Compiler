import java.security.InvalidParameterException;
import java.util.ArrayList;
import java.util.List;

public class SymbolTable {
	static FirstClass mainClass;
	static List<OrdinaryClass> allOrdinaryClass=new ArrayList<OrdinaryClass>();

	public static void addMainClass(FirstClass _mainClass) { 
		mainClass=_mainClass;		
	}

	public static void addOrdinaryClass(OrdinaryClass ordinaryClass) {
		allOrdinaryClass.add(ordinaryClass);		
	}

	public static OrdinaryClass SearchClass(String className) {
		// TODO Auto-generated method stub
		for(OrdinaryClass ordinaryClass : allOrdinaryClass)
		{
			if(ordinaryClass.name==className)
				return ordinaryClass;
		}
		return null;
	}
}

class OrdinaryClass 
{	
	String name;
	boolean hasParent;
	String parentName;
	List<Method> allMethod=new ArrayList<Method>();
	List<Variable> allVariable=new ArrayList<Variable>();
	
	public OrdinaryClass(String _name) {
		// TODO Auto-generated constructor stub
		name=_name;
		hasParent=false;
	}

	public OrdinaryClass(String _name, String _parentName) {
		// TODO Auto-generated constructor stub
		name=_name;
		parentName=_parentName;
		hasParent=true;
	}

	public void addMethod(Method method) {
		// TODO Auto-generated method stub
		allMethod.add(method);
		method.parentClass=this;
	}

	public void addVariable(Variable variable) {
		// TODO Auto-generated method stub
		allVariable.add(variable);
	}
	
	// the identifier should combine with class name and method name
	public List<String> GetMethodIdentifier()
	{
		List<String> allMethodIdentifier=null;
		if(hasParent)
		{
			OrdinaryClass parentClass=SymbolTable.SearchClass(parentName);
			allMethodIdentifier=parentClass.GetMethodIdentifier();
		}
		else
			allMethodIdentifier=new ArrayList<String>();
		for(Method method : allMethod)
		{
			boolean hasInParent=false;
			for(int i=0;i<allMethodIdentifier.size();i++)
			{
				if(allMethodIdentifier.get(i).endsWith("_"+method.name))
				{
					allMethodIdentifier.set(i, String.format("%1s_%2s", name, method.name));
					hasInParent=true;
					break;
				}
			}				
			if(!hasInParent)
				allMethodIdentifier.add(String.format("%1s_%2s", name, method.name));
			
		}
		return allMethodIdentifier;
	}

	// return the index for the method, the index should start with parent class
	public int SearchMethod(String methodName) {
		List<String> methodIdentifier = GetMethodIdentifier();
		for(int i=0;i<methodIdentifier.size();i++)
		{
			if(methodIdentifier.get(i).endsWith("_"+methodName))
				return i;
		}
		return -1;		
	}

	// return the index for the variable, the index should start with parent class
	public int SearchVariable(String variableName) {
		// TODO Auto-generated method stub		
		int numberOfVariableInParentClass=0;
		if(hasParent)
		{
			OrdinaryClass parentClass=SymbolTable.SearchClass(parentName);
			numberOfVariableInParentClass = parentClass.NumberOfVariable();
		}
		for(int i=0;i<allVariable.size();i++)
		{
			if(allVariable.get(i).name==variableName)
				return i+numberOfVariableInParentClass;
		}
		if(hasParent)
		{
			OrdinaryClass parentClass=SymbolTable.SearchClass(parentName);
			return parentClass.SearchVariable(variableName);
		}
		return -1;
	}
	
	public int NumberOfVariable()
	{
		int num=0;
		if(hasParent)
		{
			OrdinaryClass parentClass=SymbolTable.SearchClass(parentName);
			num = parentClass.NumberOfVariable();
		}
		return num+allVariable.size();
	}
	
	public int NumberOfMethod()
	{
		int num=0;
		if(hasParent)
		{
			OrdinaryClass parentClass=SymbolTable.SearchClass(parentName);
			num = parentClass.NumberOfMethod();
		}
		return num+allMethod.size();
	}

	public VariableType SearchTypeForVariable(String variableName) {
		for(int i=0;i<allVariable.size();i++)
		{
			if(allVariable.get(i).name==variableName)
				return allVariable.get(i).type;
		}
		if(hasParent)
		{
			OrdinaryClass parentClass=SymbolTable.SearchClass(parentName);
			return parentClass.SearchTypeForVariable(variableName);
		}		
		return null;
	}
	
	public VariableType SearchRetTypeForVariable(String methodName)
	{
		for(int i=0;i<allMethod.size();i++)
		{
			if(allMethod.get(i).name==methodName)
				return allMethod.get(i).retType;
		}
		if(hasParent)
		{
			OrdinaryClass parentClass=SymbolTable.SearchClass(parentName);
			return parentClass.SearchRetTypeForVariable(methodName);
		}		
		return null;
	}
}

class FirstClass
{
	String name;
	MainMethod method;
	
	public FirstClass(String _name) {
		// TODO Auto-generated constructor stub
		name=_name;
	}

	public void addMainMethod(MainMethod _method) {
		// TODO Auto-generated method stub
		method=_method;		
	}
}

class Method
{
	OrdinaryClass parentClass;
	String name;
	VariableType retType;
	List<Variable> allLocalVariable=new ArrayList<Variable>();
	List<Variable> allParameter=new ArrayList<Variable>();	
	
	public Method(String _name, VariableType _retType) {
		// TODO Auto-generated constructor stub
		name=_name;
		retType=_retType;
	}

	public void addLocalVariable(Variable variable) {
		// TODO Auto-generated method stub
		allLocalVariable.add(variable);
	}

	public void addParameter(Variable variable) {
		// TODO Auto-generated method stub				
		allParameter.add(variable);
	}

	// return the index of variable in allLocalVariable, if does not exist return -1
	public int SearchVariableAsLocalVariable(String variableName) {
		// TODO Auto-generated method stub
		for(int i=0;i<allLocalVariable.size();i++)
		{
			if(allLocalVariable.get(i).name==variableName)
				return i;
		}
		return -1;
	}
	
	public int SearchVariableAsParameter(String variableName)
	{
		for(int i=0;i<allParameter.size();i++)
		{
			if(allParameter.get(i).name==variableName)
				return i;
		}
		return -1;
	}
	
	public int SearchVariableAsClassVariable(String variableName)
	{
		return parentClass.SearchVariable(variableName);
	}

	public VariableType SearchTypeForVariable(String variableName) {
		for(Variable variable : allLocalVariable)
		{
			if(variable.name==variableName)
				return variable.type;
		}
		for(Variable variable : allParameter)
		{
			if(variable.name==variableName)
				return variable.type;
		}
		return parentClass.SearchTypeForVariable(variableName);
	}
}

class MainMethod
{
	String parameterName;
	List<Variable> allLocalVariable=new ArrayList<Variable>();

	public MainMethod(String _name) {
		// TODO Auto-generated constructor stub		
		parameterName=_name;
	}

	public void addLocalVariable(Variable variable) {
		// TODO Auto-generated method stub
		allLocalVariable.add(variable);
	}
}

class Variable 
{
	VariableType type;
	String name;

	public Variable(VariableType _type, String _name) {
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
		if(_type==FourType.Integer || _type==FourType.IntegerArray || _type==FourType.Boolean)
			type=_type;
		else
			throw new InvalidParameterException();
	}
	
	VariableType(FourType _type, String _name)
	{
		if(_type==FourType.Object)
		{
			type=_type;
			name=_name;
		}
		else
			throw new InvalidParameterException();
	}
}
