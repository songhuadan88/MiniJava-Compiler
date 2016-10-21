import java.util.ArrayList;
import java.util.Enumeration;
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
import syntaxtree.MessageSend;
import syntaxtree.MainClass;
import syntaxtree.MethodDeclaration;
import syntaxtree.MinusExpression;
import syntaxtree.Node;
import syntaxtree.NodeListOptional;
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
import visitor.*;

public class BuildSymbolTableVisitor extends GJDepthFirst<Object,Object>
{

	   public Object visit(NodeListOptional n, Object argu) {
		   List<Object> _ret=new ArrayList<Object>();
		   if ( n.present() ) {	        
	         int _count=0;
	         for ( Enumeration<Node> e = n.elements(); e.hasMoreElements(); ) {
	            _ret.add(e.nextElement().accept(this,argu));
	            _count++;
	         }	       
		   }	    
	       return _ret;
	   }

	/**
	    * f0 -> MainClass()
	    * f1 -> ( TypeDeclaration() )*
	    * f2 -> <EOF>
	    */
	   public Object visit(Goal n, Object argu) {	      
	      FirstClass mainClass =(FirstClass)n.f0.accept(this, argu);
	      SymbolTable.addMainClass(mainClass);
	      List<OrdinaryClass> allOrdinaryClass = (List<OrdinaryClass>) n.f1.accept(this, argu);
	      for(OrdinaryClass ordinaryClass : allOrdinaryClass)
	    	  SymbolTable.addOrdinaryClass(ordinaryClass);	      
	      n.f2.accept(this, argu);
	      return null;
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
	   public Object visit(MainClass n, Object argu) {	           	      
	      n.f0.accept(this, argu);
	      String className = (String)n.f1.accept(this, argu);
	      FirstClass mainClass=new FirstClass(className);
	      n.f2.accept(this, argu);
	      n.f3.accept(this, argu);
	      n.f4.accept(this, argu);
	      n.f5.accept(this, argu);
	      n.f6.accept(this, argu);
	      n.f7.accept(this, argu);
	      n.f8.accept(this, argu);
	      n.f9.accept(this, argu);
	      n.f10.accept(this, argu);
	      String parameterName=(String) n.f11.accept(this, argu);
	      MainMethod method=new MainMethod(parameterName);
	      n.f12.accept(this, argu);
	      n.f13.accept(this, argu);
	      List<Variable> allVariable =(List<Variable>) n.f14.accept(this, method);
	      for(Variable variable : allVariable)
	    	  method.addLocalVariable(variable);
	      n.f15.accept(this, method);
	      n.f16.accept(this, argu);
	      n.f17.accept(this, argu);
	      mainClass.addMainMethod(method);	      	     
	      return mainClass;
	   }

	   /**
	    * f0 -> ClassDeclaration()
	    *       | ClassExtendsDeclaration()
	    */
	   public Object visit(TypeDeclaration n, Object argu) {	      
	      return n.f0.accept(this, argu);	      
	   }

	   /**
	    * f0 -> "class"
	    * f1 -> Identifier()
	    * f2 -> "{"
	    * f3 -> ( VarDeclaration() )*
	    * f4 -> ( MethodDeclaration() )*
	    * f5 -> "}"
	    */
	   public Object visit(ClassDeclaration n, Object argu) {	          
	      n.f0.accept(this, argu);
	      String className = (String)n.f1.accept(this, argu);
	      OrdinaryClass ordinaryClass=new OrdinaryClass(className);
	      n.f2.accept(this, argu);
	      List<Variable> allVariable=(List<Variable>) n.f3.accept(this, ordinaryClass);
	      for(Variable variable : allVariable)
	    	  ordinaryClass.addVariable(variable);
	      List<Method> allMethod =(List<Method>) n.f4.accept(this, ordinaryClass);
	      for(Method method : allMethod)
	    	  ordinaryClass.addMethod(method);
	      n.f5.accept(this, argu);	      
	      return ordinaryClass;
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
	   public Object visit(ClassExtendsDeclaration n, Object argu) {	      
	      n.f0.accept(this, argu);
	      String className =(String)n.f1.accept(this, argu);
	      n.f2.accept(this, argu);
	      String parentClassName =(String)n.f3.accept(this, argu);
	      OrdinaryClass ordinaryClass=new OrdinaryClass(className,parentClassName);
	      n.f4.accept(this, argu);
	      List<Variable> allVariable=(List<Variable>) n.f5.accept(this, ordinaryClass);
	      for(Variable variable : allVariable)
	    	  ordinaryClass.addVariable(variable);
	      List<Method> allMethod =(List<Method>) n.f6.accept(this, ordinaryClass);
	      for(Method method : allMethod)
	    	  ordinaryClass.addMethod(method);
	      n.f7.accept(this, argu);	     
	      return ordinaryClass;
	   }

	   /**
	    * f0 -> Type()
	    * f1 -> Identifier()
	    * f2 -> ";"
	    */
	   public Object visit(VarDeclaration n, Object argu) {	      
	      VariableType type=(VariableType)n.f0.accept(this, argu);
	      String variableName =(String)n.f1.accept(this, argu);
	      n.f2.accept(this, argu);
	      Variable variable=new Variable(type,variableName);	     
	      return variable;
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
	   public Object visit(MethodDeclaration n, Object argu) {	       	      
	      n.f0.accept(this, argu);
	      VariableType retType=(VariableType)n.f1.accept(this, argu);
	      String methodName =(String) n.f2.accept(this, argu);
	      Method method=new Method(methodName,retType);
	      n.f3.accept(this, argu);
	      List<Variable> allParameter = (List<Variable>)n.f4.accept(this, method);
	      if(allParameter !=null)
	      {
		      for(Variable parameter : allParameter)
		    	  method.addParameter(parameter);
	      }
	      n.f5.accept(this, argu);
	      n.f6.accept(this, argu);
	      List<Variable> allVariable = (List<Variable>)n.f7.accept(this, method);
	      for(Variable variable : allVariable)
	    	  method.addLocalVariable(variable);
	      n.f8.accept(this, method);
	      n.f9.accept(this, argu);
	      n.f10.accept(this, method);
	      n.f11.accept(this, argu);
	      n.f12.accept(this, argu);	      
	      return method;
	   }

	   /**
	    * f0 -> FormalParameter()
	    * f1 -> ( FormalParameterRest() )*
	    */
	   public Object visit(FormalParameterList n, Object argu) {
	      List<Variable> allParameter=new ArrayList<Variable>();     
	      Variable firstParameter = (Variable)n.f0.accept(this, argu);
	      allParameter.add(firstParameter);
	      List<Variable> restParameter =(List<Variable>)n.f1.accept(this, argu);
	      allParameter.addAll(restParameter);
	      return allParameter;
	   }

	   /**
	    * f0 -> Type()
	    * f1 -> Identifier()
	    */
	   public Object visit(FormalParameter n, Object argu) {	      	      
	      VariableType type=(VariableType)n.f0.accept(this, argu);
	      String parameterName=(String)n.f1.accept(this, argu);	      
	      return new Variable(type,parameterName);
	   }

	   /**
	    * f0 -> ","
	    * f1 -> FormalParameter()
	    */
	   public Object visit(FormalParameterRest n, Object argu) {	      
	      n.f0.accept(this, argu);
	      return n.f1.accept(this, argu);	      
	   }

	   /**
	    * f0 -> ArrayType()
	    *       | BooleanType()
	    *       | IntegerType()
	    *       | Identifier()
	    */
	   public Object visit(Type n, Object argu) {	      
	      Object ret = n.f0.accept(this, argu);
	      if(n.f0.choice instanceof Identifier)
	      {
	    	  return new VariableType(FourType.Object,(String)ret);
	      }
	      return ret;
	   }

	   /**
	    * f0 -> "int"
	    * f1 -> "["
	    * f2 -> "]"
	    */
	   public Object visit(ArrayType n, Object argu) {	      
	      n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      n.f2.accept(this, argu);
	      return new VariableType(FourType.IntegerArray);
	   }

	   /**
	    * f0 -> "boolean"
	    */
	   public Object visit(BooleanType n, Object argu) {	      
	      n.f0.accept(this, argu);
	      return new VariableType(FourType.Boolean);
	   }

	   /**
	    * f0 -> "int"
	    */
	   public Object visit(IntegerType n, Object argu) {	      
	      n.f0.accept(this, argu);
	      return new VariableType(FourType.Integer);
	   }

	   /**
	    * f0 -> Block()
	    *       | AssignmentStatement()
	    *       | ArrayAssignmentStatement()
	    *       | IfStatement()
	    *       | WhileStatement()
	    *       | PrintStatement()
	    */
	   public Object visit(Statement n, Object argu) {
	      Object _ret=null;
	      n.f0.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> "{"
	    * f1 -> ( Statement() )*
	    * f2 -> "}"
	    */
	   public Object visit(Block n, Object argu) {
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
	   public Object visit(AssignmentStatement n, Object argu) {
	      Object _ret=null;
	      n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      n.f2.accept(this, argu);
	      n.f3.accept(this, argu);
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
	   public Object visit(ArrayAssignmentStatement n, Object argu) {
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
	   public Object visit(IfStatement n, Object argu) {
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
	    * f0 -> "while"
	    * f1 -> "("
	    * f2 -> Expression()
	    * f3 -> ")"
	    * f4 -> Statement()
	    */
	   public Object visit(WhileStatement n, Object argu) {
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
	   public Object visit(PrintStatement n, Object argu) {
	      Object _ret=null;
	      n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      n.f2.accept(this, argu);
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
	   public Object visit(Expression n, Object argu) {
	      Object _ret=null;
	      n.f0.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> PrimaryExpression()
	    * f1 -> "&&"
	    * f2 -> PrimaryExpression()
	    */
	   public Object visit(AndExpression n, Object argu) {
	      Object _ret=null;
	      n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      n.f2.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> PrimaryExpression()
	    * f1 -> "<"
	    * f2 -> PrimaryExpression()
	    */
	   public Object visit(CompareExpression n, Object argu) {
	      Object _ret=null;
	      n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      n.f2.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> PrimaryExpression()
	    * f1 -> "+"
	    * f2 -> PrimaryExpression()
	    */
	   public Object visit(PlusExpression n, Object argu) {
	      Object _ret=null;
	      n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      n.f2.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> PrimaryExpression()
	    * f1 -> "-"
	    * f2 -> PrimaryExpression()
	    */
	   public Object visit(MinusExpression n, Object argu) {
	      Object _ret=null;
	      n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      n.f2.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> PrimaryExpression()
	    * f1 -> "*"
	    * f2 -> PrimaryExpression()
	    */
	   public Object visit(TimesExpression n, Object argu) {
	      Object _ret=null;
	      n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      n.f2.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> PrimaryExpression()
	    * f1 -> "["
	    * f2 -> PrimaryExpression()
	    * f3 -> "]"
	    */
	   public Object visit(ArrayLookup n, Object argu) {
	      Object _ret=null;
	      n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      n.f2.accept(this, argu);
	      n.f3.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> PrimaryExpression()
	    * f1 -> "."
	    * f2 -> "length"
	    */
	   public Object visit(ArrayLength n, Object argu) {
	      Object _ret=null;
	      n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      n.f2.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> PrimaryExpression()
	    * f1 -> "."
	    * f2 -> Identifier()
	    * f3 -> "("
	    * f4 -> ( ExpressionList() )?
	    * f5 -> ")"
	    */
	   public Object visit(MessageSend n, Object argu) {
	      Object _ret=null;
	      n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      n.f2.accept(this, argu);
	      n.f3.accept(this, argu);
	      n.f4.accept(this, argu);
	      n.f5.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> Expression()
	    * f1 -> ( ExpressionRest() )*
	    */
	   public Object visit(ExpressionList n, Object argu) {
	      Object _ret=null;
	      n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> ","
	    * f1 -> Expression()
	    */
	   public Object visit(ExpressionRest n, Object argu) {
	      Object _ret=null;
	      n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      return _ret;
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
	   public Object visit(PrimaryExpression n, Object argu) {
	      Object _ret=null;
	      n.f0.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> <INTEGER_LITERAL>
	    */
	   public Object visit(IntegerLiteral n, Object argu) {
	      Object _ret=null;
	      n.f0.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> "true"
	    */
	   public Object visit(TrueLiteral n, Object argu) {
	      Object _ret=null;
	      n.f0.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> "false"
	    */
	   public Object visit(FalseLiteral n, Object argu) {
	      Object _ret=null;
	      n.f0.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> <IDENTIFIER>
	    */
	   public Object visit(Identifier n, Object argu) {	      
	      n.f0.accept(this, argu);
	      return n.f0.toString();
	   }

	   /**
	    * f0 -> "this"
	    */
	   public Object visit(ThisExpression n, Object argu) {
	      Object _ret=null;
	      n.f0.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> "new"
	    * f1 -> "int"
	    * f2 -> "["
	    * f3 -> Expression()
	    * f4 -> "]"
	    */
	   public Object visit(ArrayAllocationExpression n, Object argu) {
	      Object _ret=null;
	      n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      n.f2.accept(this, argu);
	      n.f3.accept(this, argu);
	      n.f4.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> "new"
	    * f1 -> Identifier()
	    * f2 -> "("
	    * f3 -> ")"
	    */
	   public Object visit(AllocationExpression n, Object argu) {
	      Object _ret=null;
	      n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      n.f2.accept(this, argu);
	      n.f3.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> "!"
	    * f1 -> Expression()
	    */
	   public Object visit(NotExpression n, Object argu) {
	      Object _ret=null;
	      n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> "("
	    * f1 -> Expression()
	    * f2 -> ")"
	    */
	   public Object visit(BracketExpression n, Object argu) {
	      Object _ret=null;
	      n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      n.f2.accept(this, argu);
	      return _ret;
	   }

}
