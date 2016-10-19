import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import syntaxtree.AllocationExpression;
import syntaxtree.AndExpression;
import syntaxtree.ArrayAllocationExpression;
import syntaxtree.ArrayAssignmentStatement;
import syntaxtree.ArrayLength;
import syntaxtree.ArrayLookup;
import syntaxtree.ArrayType;
import syntaxtree.AssignmentStatement;
import syntaxtree.Block;
import syntaxtree.BooleanType;
import syntaxtree.BracketExpression;
import syntaxtree.ClassDeclaration;
import syntaxtree.ClassExtendsDeclaration;
import syntaxtree.CompareExpression;
import syntaxtree.Expression;
import syntaxtree.ExpressionList;
import syntaxtree.ExpressionRest;
import syntaxtree.FalseLiteral;
import syntaxtree.FormalParameter;
import syntaxtree.FormalParameterList;
import syntaxtree.FormalParameterRest;
import syntaxtree.Goal;
import syntaxtree.Identifier;
import syntaxtree.IfStatement;
import syntaxtree.IntegerLiteral;
import syntaxtree.IntegerType;
import syntaxtree.MainClass;
import syntaxtree.MessageSend;
import syntaxtree.MethodDeclaration;
import syntaxtree.MinusExpression;
import syntaxtree.NotExpression;
import syntaxtree.PlusExpression;
import syntaxtree.PrimaryExpression;
import syntaxtree.PrintStatement;
import syntaxtree.Statement;
import syntaxtree.ThisExpression;
import syntaxtree.TimesExpression;
import syntaxtree.TrueLiteral;
import syntaxtree.Type;
import syntaxtree.TypeDeclaration;
import syntaxtree.VarDeclaration;
import syntaxtree.WhileStatement;
import visitor.GJDepthFirst;


public class ToPigletVisitor extends GJDepthFirst<Object,SymbolInterface>{
	
	int currentTemp=20;
	int currentLabel=1;
	int currentTab=0;
	String pigletString="";
	
	int newLabel()
	{
		return currentLabel++;
	}
	
	int newTemp()
	{
		return currentTemp++;
	}
	
	void append(String str)
	{
		pigletString+=str;
	}
	
	void appendInNewLine(String str)
	{
		char[] chars = new char[currentTab];
		Arrays.fill(chars, '\t');		
		pigletString+="\n"+new String(chars)+str;
	}
	
	
	//
	   // User-generated visitor methods below
	   //

	   /**
	    * f0 -> MainClass()
	    * f1 -> ( TypeDeclaration() )*
	    * f2 -> <EOF>
	    */
	   public Object visit(Goal n, SymbolInterface argu) {
	      Object _ret=null;
	      n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      n.f2.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> "class"
	    * f1 -> Identifier()
	    * f2 -> "{"
	    * f3 -> "public"
	    * f4 -> "static"
	    * f5 -> "void"
	    * f6 -> "main"
	    * f7 -> "("
	    * f8 -> "String"
	    * f9 -> "["
	    * f10 -> "]"
	    * f11 -> Identifier()
	    * f12 -> ")"
	    * f13 -> "{"
	    * f14 -> ( VarDeclaration() )*
	    * f15 -> ( Statement() )*
	    * f16 -> "}"
	    * f17 -> "}"
	    */
	   public Object visit(MainClass n, SymbolInterface argu) {
	      Object _ret=null;
	      append("MAIN");
	      currentTab++;
	      n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      n.f2.accept(this, argu);
	      n.f3.accept(this, argu);
	      n.f4.accept(this, argu);
	      n.f5.accept(this, argu);
	      n.f6.accept(this, argu);
	      n.f7.accept(this, argu);
	      n.f8.accept(this, argu);
	      n.f9.accept(this, argu);
	      n.f10.accept(this, argu);
	      n.f11.accept(this, argu);
	      n.f12.accept(this, argu);
	      n.f13.accept(this, argu);
	      SymbolTable table=(SymbolTable)argu;
	      n.f14.accept(this, table.mainClassItem.functionItem);	      
	      n.f15.accept(this, table.mainClassItem.functionItem);
	      n.f16.accept(this, argu);
	      n.f17.accept(this, argu);
	      currentTab--;
	      appendInNewLine("END");
	      return _ret;
	   }

	   /**
	    * f0 -> ClassDeclaration()
	    *       | ClassExtendsDeclaration()
	    */
	   public Object visit(TypeDeclaration n, SymbolInterface argu) {
	      Object _ret=null;
	      n.f0.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> "class"
	    * f1 -> Identifier()
	    * f2 -> "{"
	    * f3 -> ( VarDeclaration() )*
	    * f4 -> ( MethodDeclaration() )*
	    * f5 -> "}"
	    */
	   public Object visit(ClassDeclaration n, SymbolInterface argu) {
	      Object _ret=null;
	      SymbolTable table=(SymbolTable)argu;
	      n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      ClassItem classItem=table.SearchClass(n.f1.f0.toString());
	      n.f2.accept(this, argu);
	      n.f3.accept(this, classItem);
	      n.f4.accept(this, classItem);
	      n.f5.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> "class"
	    * f1 -> Identifier()
	    * f2 -> "extends"
	    * f3 -> Identifier()
	    * f4 -> "{"
	    * f5 -> ( VarDeclaration() )*
	    * f6 -> ( MethodDeclaration() )*
	    * f7 -> "}"
	    */
	   public Object visit(ClassExtendsDeclaration n, SymbolInterface argu) {
	      Object _ret=null;
	      SymbolTable table=(SymbolTable)argu;
	      n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      n.f2.accept(this, argu);
	      n.f3.accept(this, argu);
	      ClassItem classItem=table.SearchClass(n.f1.f0.toString());
	      n.f4.accept(this, argu);
	      n.f5.accept(this, classItem);
	      n.f6.accept(this, classItem);
	      n.f7.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> Type()
	    * f1 -> Identifier()
	    * f2 -> ";"
	    */
	   public Object visit(VarDeclaration n, SymbolInterface argu) {
	      Object _ret=null;	      
	      n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      n.f2.accept(this, argu);
	      if(argu instanceof FunctionItem)
	      {
	    	  FunctionItem function=(FunctionItem)argu;
	    	  VariableItem variable=function.SearchVariable(n.f1.f0.toString());
	    	  variable.indexOfTemp=newTemp();
	      }
	      return _ret;
	   }

	   /**
	    * f0 -> "public"
	    * f1 -> Type()
	    * f2 -> Identifier()
	    * f3 -> "("
	    * f4 -> ( FormalParameterList() )?
	    * f5 -> ")"
	    * f6 -> "{"
	    * f7 -> ( VarDeclaration() )*
	    * f8 -> ( Statement() )*
	    * f9 -> "return"
	    * f10 -> Expression()
	    * f11 -> ";"
	    * f12 -> "}"
	    */
	   public Object visit(MethodDeclaration n, SymbolInterface argu) {
	      Object _ret=null;
	      ClassItem classitem=(ClassItem)argu;
	      appendInNewLine("");
	      n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      n.f2.accept(this, argu);
	      FunctionItem function=classitem.SearchFunction(n.f2.f0.toString());
	      appendInNewLine(classitem.name+"_"+function.name+" [ "+(function.parameterType.size()+1)+" ] ");
	      currentTab++;
	      appendInNewLine("BEGIN");
	      currentTab++;
	      n.f3.accept(this, argu);
	      n.f4.accept(this, function);
	      n.f5.accept(this, argu);
	      n.f6.accept(this, argu);
	      n.f7.accept(this, function);
	      n.f8.accept(this, function);
	      n.f9.accept(this, argu);
	      int retIndex = (Integer)(((List<Object>)n.f10.accept(this, function)).get(0));
	      currentTab--;
	      appendInNewLine("RETURN TEMP "+retIndex);	      
	      appendInNewLine("END");
	      currentTab--;
	      n.f11.accept(this, argu);
	      n.f12.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> FormalParameter()
	    * f1 -> ( FormalParameterRest() )*
	    */
	   public Object visit(FormalParameterList n, SymbolInterface argu) {
	      Object _ret=null;
	      n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> Type()
	    * f1 -> Identifier()
	    */
	   public Object visit(FormalParameter n, SymbolInterface argu) {
	      Object _ret=null;
	      n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> ","
	    * f1 -> FormalParameter()
	    */
	   public Object visit(FormalParameterRest n, SymbolInterface argu) {
	      Object _ret=null;
	      n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> ArrayType()
	    *       | BooleanType()
	    *       | IntegerType()
	    *       | Identifier()
	    */
	   public Object visit(Type n, SymbolInterface argu) {
	      Object _ret=null;
	      n.f0.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> "int"
	    * f1 -> "["
	    * f2 -> "]"
	    */
	   public Object visit(ArrayType n, SymbolInterface argu) {
	      Object _ret=null;
	      n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      n.f2.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> "boolean"
	    */
	   public Object visit(BooleanType n, SymbolInterface argu) {
	      Object _ret=null;
	      n.f0.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> "int"
	    */
	   public Object visit(IntegerType n, SymbolInterface argu) {
	      Object _ret=null;
	      n.f0.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> Block()
	    *       | AssignmentStatement()
	    *       | ArrayAssignmentStatement()
	    *       | IfStatement()
	    *       | WhileStatement()
	    *       | PrintStatement()
	    */
	   public Object visit(Statement n, SymbolInterface argu) {
	      Object _ret=null;
	      n.f0.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> "{"
	    * f1 -> ( Statement() )*
	    * f2 -> "}"
	    */
	   public Object visit(Block n, SymbolInterface argu) {
	      Object _ret=null;
	      n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      n.f2.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> Identifier()
	    * f1 -> "="
	    * f2 -> Expression()
	    * f3 -> ";"
	    */
	   public Object visit(AssignmentStatement n, SymbolInterface argu) {
	      Object _ret=null;
	      n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      List<Object> _retList=(List<Object>) n.f2.accept(this, argu);
	      n.f3.accept(this, argu);
	      FunctionItem function=(FunctionItem)argu;
    	  VariableItem variable=function.SearchVariable(n.f0.f0.toString());
    	  appendInNewLine(String.format("MOVE TEMP %1d TEMP %2d",variable.indexOfTemp,(Integer)_retList.get(0)));
	      return _ret;
	   }

	   /**
	    * f0 -> Identifier()
	    * f1 -> "["
	    * f2 -> Expression()
	    * f3 -> "]"
	    * f4 -> "="
	    * f5 -> Expression()
	    * f6 -> ";"
	    */
	   public Object visit(ArrayAssignmentStatement n, SymbolInterface argu) {
	      Object _ret=null;
	      n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      n.f2.accept(this, argu);
	      n.f3.accept(this, argu);
	      n.f4.accept(this, argu);
	      n.f5.accept(this, argu);
	      n.f6.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> "if"
	    * f1 -> "("
	    * f2 -> Expression()
	    * f3 -> ")"
	    * f4 -> Statement()
	    * f5 -> "else"
	    * f6 -> Statement()
	    */
	   public Object visit(IfStatement n, SymbolInterface argu) {
	      Object _ret=null;
	      int label1=newLabel();
	      int label2=newLabel();
	      n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      int tempIndex = (Integer)((List<Object>)n.f2.accept(this, argu)).get(0);
	      n.f3.accept(this, argu);
	      appendInNewLine("CJUMP TEMP "+tempIndex+" L"+label1);
	      n.f4.accept(this, argu);
	      appendInNewLine("JUMP L"+label2);
	      appendInNewLine("L"+label1+" NOOP");
	      n.f5.accept(this, argu);
	      
	      n.f6.accept(this, argu);
	      appendInNewLine("L"+label2+" NOOP");
	      return _ret;
	   }

	   /**
	    * f0 -> "while"
	    * f1 -> "("
	    * f2 -> Expression()
	    * f3 -> ")"
	    * f4 -> Statement()
	    */
	   public Object visit(WhileStatement n, SymbolInterface argu) {
	      Object _ret=null;
	      n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      n.f2.accept(this, argu);
	      n.f3.accept(this, argu);
	      n.f4.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> "System.out.println"
	    * f1 -> "("
	    * f2 -> Expression()
	    * f3 -> ")"
	    * f4 -> ";"
	    */
	   public Object visit(PrintStatement n, SymbolInterface argu) {
	      Object _ret=null;
	      n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      int tempIndex =(Integer)((List<Object>)n.f2.accept(this, argu)).get(0);
	      appendInNewLine("PRINT TEMP "+tempIndex);
	      n.f3.accept(this, argu);
	      n.f4.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> AndExpression()
	    *       | CompareExpression()
	    *       | PlusExpression()
	    *       | MinusExpression()
	    *       | TimesExpression()
	    *       | ArrayLookup()
	    *       | ArrayLength()
	    *       | MessageSend()
	    *       | PrimaryExpression()
	    */
	   public Object visit(Expression n, SymbolInterface argu) {
	      Object _ret=null;
	      _ret = n.f0.accept(this, argu);	      
	      return _ret;
	   }

	   /**
	    * f0 -> PrimaryExpression()
	    * f1 -> "&&"
	    * f2 -> PrimaryExpression()
	    */
	   public Object visit(AndExpression n, SymbolInterface argu) {
	      Object _ret=null;
	      n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      n.f2.accept(this, argu);
	      return 250;
	   }

	   /**
	    * f0 -> PrimaryExpression()
	    * f1 -> "<"
	    * f2 -> PrimaryExpression()
	    */
	   public Object visit(CompareExpression n, SymbolInterface argu) {
		   List<Object> _ret=new ArrayList<Object>();	
		   int tempIndex1=(Integer)(((List<Object>)n.f0.accept(this, argu)).get(0));
	      n.f1.accept(this, argu);
	      int tempIndex2=(Integer)(((List<Object>)n.f2.accept(this, argu)).get(0));
	      int tempIndex=newTemp();
	      appendInNewLine(String.format("MOVE TEMP %1d LT TEMP %2d TEMP %3d", tempIndex,tempIndex1,tempIndex2));
	      _ret.add(tempIndex);
	      _ret.add(new VariableType(FourType.Boolean));
	      return _ret;
	   }

	   /**
	    * f0 -> PrimaryExpression()
	    * f1 -> "+"
	    * f2 -> PrimaryExpression()
	    */
	   public Object visit(PlusExpression n, SymbolInterface argu) {
	      Object _ret=null;
	      n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      n.f2.accept(this, argu);
	      return 250;
	   }

	   /**
	    * f0 -> PrimaryExpression()
	    * f1 -> "-"
	    * f2 -> PrimaryExpression()
	    */
	   public Object visit(MinusExpression n, SymbolInterface argu) {
		   List<Object> _ret=new ArrayList<Object>();		   
	      int tempIndex1=(Integer)(((List<Object>)n.f0.accept(this, argu)).get(0));
	      n.f1.accept(this, argu);
	      int tempIndex2=(Integer)(((List<Object>)n.f2.accept(this, argu)).get(0));
	      int tempIndex=newTemp();
	      appendInNewLine(String.format("MOVE TEMP %1d MINUS TEMP %2d TEMP %3d", tempIndex,tempIndex1,tempIndex2));
	      _ret.add(tempIndex);
	      _ret.add(new VariableType(FourType.Integer));
	      return _ret;
	   }

	   /**
	    * f0 -> PrimaryExpression()
	    * f1 -> "*"
	    * f2 -> PrimaryExpression()
	    */
	   public Object visit(TimesExpression n, SymbolInterface argu) {
		   List<Object> _ret=new ArrayList<Object>();		   
		      int tempIndex1=(Integer)(((List<Object>)n.f0.accept(this, argu)).get(0));
		      n.f1.accept(this, argu);
		      int tempIndex2=(Integer)(((List<Object>)n.f2.accept(this, argu)).get(0));
		      int tempIndex=newTemp();
		      appendInNewLine(String.format("MOVE TEMP %1d TIMES TEMP %2d TEMP %3d", tempIndex,tempIndex1,tempIndex2));
		      _ret.add(tempIndex);
		      _ret.add(new VariableType(FourType.Integer));
		      return _ret;
	   }

	   /**
	    * f0 -> PrimaryExpression()
	    * f1 -> "["
	    * f2 -> PrimaryExpression()
	    * f3 -> "]"
	    */
	   public Object visit(ArrayLookup n, SymbolInterface argu) {
	      Object _ret=null;
	      n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      n.f2.accept(this, argu);
	      n.f3.accept(this, argu);
	      return 250;
	   }

	   /**
	    * f0 -> PrimaryExpression()
	    * f1 -> "."
	    * f2 -> "length"
	    */
	   public Object visit(ArrayLength n, SymbolInterface argu) {
	      Object _ret=null;
	      n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      n.f2.accept(this, argu);
	      return 250;
	   }

	   /**
	    * f0 -> PrimaryExpression()
	    * f1 -> "."
	    * f2 -> Identifier()
	    * f3 -> "("
	    * f4 -> ( ExpressionList() )?
	    * f5 -> ")"
	    */
	   public Object visit(MessageSend n, SymbolInterface argu) {
		   List<Object> _ret=new ArrayList<Object>();
	      int tempIndex=newTemp();
	      int tempFunctionIndex1=newTemp();
	      int tempFunctionIndex2=newTemp();
	      List<Object> pExp=(List<Object>)n.f0.accept(this, argu);
	      int tempIndexExp=(Integer)(pExp.get(0));
	      VariableType typeExp=(VariableType)(pExp.get(1));
	      ClassItem classItem=((FunctionItem)argu).parentClass.parentTable.SearchClass(typeExp.name);
	      FunctionItem functionItem=classItem.SearchFunction(n.f2.f0.toString());
	   
	      appendInNewLine(String.format("HLOAD TEMP %1d TEMP %2d 0",tempFunctionIndex1,tempIndexExp));
	      appendInNewLine(String.format("HLOAD TEMP %1d TEMP %2d %3d",tempFunctionIndex2,tempFunctionIndex1,4*functionItem.indexInParent));
	      n.f1.accept(this, argu);
	      n.f2.accept(this, argu);
	      n.f3.accept(this, argu);
	      String parameterString = (String)n.f4.accept(this, argu);
	      if(parameterString==null)
	    	  parameterString="";
	      n.f5.accept(this, argu);
	      appendInNewLine(String.format("MOVE TEMP %1d CALL TEMP %2d (TEMP %3d%4s)",tempIndex,tempFunctionIndex2,tempIndexExp,parameterString)); 
	      _ret.add(tempIndex);
	      _ret.add(functionItem.retType);
	      return _ret;
	   }

	   /**
	    * f0 -> Expression()
	    * f1 -> ( ExpressionRest() )*
	    */
	   public Object visit(ExpressionList n, SymbolInterface argu) {	      
	      String str="";
		   List<Object> _ret= (List<Object>) n.f0.accept(this, argu);
		   str+=" TEMP "+_ret.get(0);
	      String str1=(String)n.f1.accept(this, argu);
	      if(str1!=null)
	    	  str+=str1;
	      return str;
	   }

	   /**
	    * f0 -> ","
	    * f1 -> Expression()
	    */
	   public Object visit(ExpressionRest n, SymbolInterface argu) {	      
	      n.f0.accept(this, argu);
	      List<Object> _ret= (List<Object>)n.f1.accept(this, argu);
	      return " TEMP "+_ret.get(0);
	   }

	   /**
	    * f0 -> IntegerLiteral()
	    *       | TrueLiteral()
	    *       | FalseLiteral()
	    *       | Identifier()
	    *       | ThisExpression()
	    *       | ArrayAllocationExpression()
	    *       | AllocationExpression()
	    *       | NotExpression()
	    *       | BracketExpression()
	    */
	   public Object visit(PrimaryExpression n, SymbolInterface argu) {
		   Object _ret=null;
	      _ret = n.f0.accept(this, argu);
	      if(n.f0.choice instanceof Identifier)
	      {
	    	  String identifier=((Identifier)n.f0.choice).f0.toString();
	    	  FunctionItem function=(FunctionItem)argu;	    	  
	    	  ArrayList<Object> _retList=new ArrayList<Object>();
	    	  VariableItem variable=null;
	    	  for(int i=0;i<function.variableItem.size();i++)
	    	  {
	    		  variable=function.variableItem.get(i);
	    		  if(variable.name==identifier)
	    		  {
	    			  if(i<function.parameterType.size())
	    				  _retList.add(i+1);
	    			  else
	    				  _retList.add(variable.indexOfTemp);
	    			  break;
	    		  }
	    	  }
	    	  
	    	
	    	  _retList.add(variable.type);
	    	  return _retList;
	      }
	      return _ret;
	   }

	   /**
	    * f0 -> <INTEGER_LITERAL>
	    */
	   public Object visit(IntegerLiteral n, SymbolInterface argu) {
	      List<Object> _ret=new ArrayList<Object>();
	      int tempIndex=newTemp();
	      n.f0.accept(this, argu);
	      appendInNewLine(String.format("MOVE TEMP %1d %2s",tempIndex,n.f0.toString()));
	      _ret.add(tempIndex);
	      _ret.add(new VariableType(FourType.Integer));
	      return _ret;
	   }

	   /**
	    * f0 -> "true"
	    */
	   public Object visit(TrueLiteral n, SymbolInterface argu) {
		   List<Object> _ret=new ArrayList<Object>();
		      int tempIndex=newTemp();
		      n.f0.accept(this, argu);
		      appendInNewLine(String.format("MOVE TEMP %1d %2s",tempIndex,"1"));
		      _ret.add(tempIndex,new VariableType(FourType.Boolean));
		      return _ret;
	   }

	   /**
	    * f0 -> "false"
	    */
	   public Object visit(FalseLiteral n, SymbolInterface argu) {
		   List<Object> _ret=new ArrayList<Object>();
		      int tempIndex=newTemp();
		      n.f0.accept(this, argu);
		      appendInNewLine(String.format("MOVE TEMP %1d %2s",tempIndex,"0"));
		      _ret.add(tempIndex,new VariableType(FourType.Boolean));
		      return _ret;
	   }

	   /**
	    * f0 -> <IDENTIFIER>
	    */
	   public Object visit(Identifier n, SymbolInterface argu) {
	      Object _ret=null;
	      n.f0.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> "this"
	    */
	   public Object visit(ThisExpression n, SymbolInterface argu) {
		   List<Object> _ret=new ArrayList<Object>();
	      n.f0.accept(this, argu);
	      FunctionItem function=(FunctionItem)argu;
	      ClassItem classitem=function.parentClass;
	      _ret.add(0);
	      _ret.add(new VariableType(FourType.Object,classitem.name));
	      return _ret;
	   }

	   /**
	    * f0 -> "new"
	    * f1 -> "int"
	    * f2 -> "["
	    * f3 -> Expression()
	    * f4 -> "]"
	    */
	   public Object visit(ArrayAllocationExpression n, SymbolInterface argu) {
		   List<Object> _ret=new ArrayList<Object>();
	      n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      n.f2.accept(this, argu);
	      n.f3.accept(this, argu);
	      n.f4.accept(this, argu);
	      _ret.add(250);
	      _ret.add(new VariableType(FourType.IntegerArray));
	      return _ret;
	   }

	   /**
	    * f0 -> "new"
	    * f1 -> Identifier()
	    * f2 -> "("
	    * f3 -> ")"
	    */
	   public Object visit(AllocationExpression n, SymbolInterface argu) {
		   List<Object> _ret=new ArrayList<Object>();
		   int tempIndex=newTemp();
		   int newTemp1=newTemp();
		   int newTemp2=newTemp();
	      n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      n.f2.accept(this, argu);
	      n.f3.accept(this, argu);
	      ClassItem classitem=((FunctionItem)argu).parentClass.parentTable.SearchClass(n.f1.f0.toString());
	      appendInNewLine(String.format("MOVE TEMP %1d HALLOCATE %2d",newTemp1,4*classitem.functionItem.size()));
	      appendInNewLine(String.format("MOVE TEMP %1d HALLOCATE %2d",newTemp2,4*classitem.variableItem.size()+4));
	      for(int i=0;i<classitem.functionItem.size();i++)
	      {
	    	  appendInNewLine(String.format("HSTORE TEMP %1d %2d %3s_%4s",newTemp1,4*i,classitem.name,classitem.functionItem.get(i).name));
	      }
	      appendInNewLine(String.format("HSTORE TEMP %1d 0 TEMP %2d",newTemp2,newTemp1));
	      _ret.add(newTemp2);
	      _ret.add(new VariableType(FourType.Object,n.f1.f0.toString()));
	      return _ret;
	   }

	   /**
	    * f0 -> "!"
	    * f1 -> Expression()
	    */
	   public Object visit(NotExpression n, SymbolInterface argu) {
		   List<Object> _ret=new ArrayList<Object>();
	      n.f0.accept(this, argu);
	      int tempIndex=newTemp();
	      int retTempIndex = (Integer)((ArrayList<Object>)(n.f1.accept(this, argu))).get(0);
	      appendInNewLine(String.format("MOVE TEMP %1d MINUS 1 TEMP %2d",tempIndex,retTempIndex));
	      _ret.add(tempIndex);
	      _ret.add(new VariableType(FourType.Boolean));
	      return _ret;
	   }

	   /**
	    * f0 -> "("
	    * f1 -> Expression()
	    * f2 -> ")"
	    */
	   public Object visit(BracketExpression n, SymbolInterface argu) {
	      Object _ret=null;
	      n.f0.accept(this, argu);
	      _ret = n.f1.accept(this, argu);
	      n.f2.accept(this, argu);
	      return _ret;
	   }

}
