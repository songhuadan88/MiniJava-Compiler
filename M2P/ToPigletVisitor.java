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


public class ToPigletVisitor extends GJDepthFirst<Object,Object>{
	
	int currentLabel=1;
	int currentTab=0;
	String pigletString="";
	
	String newLabel()
	{
		String label=String.format("L%1d", currentLabel);
		currentLabel++;
		return label;
	}
	
	void append(String str)
	{
		char[] chars = new char[currentTab];
		Arrays.fill(chars, '\t');
		pigletString+=new String(chars)+str+"\n";
	}
	
	
	//
	   // User-generated visitor methods below
	   //

	   /**
	    * f0 -> MainClass()
	    * f1 -> ( TypeDeclaration() )*
	    * f2 -> <EOF>
	    */
	   public Object visit(Goal n, Object argu) {
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
	   public Object visit(MainClass n, Object argu) {
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
	      MethodArgument methodArgu=new MethodArgument(null,1);
	      n.f14.accept(this, methodArgu);	      
	      n.f15.accept(this, methodArgu);
	      n.f16.accept(this, argu);
	      n.f17.accept(this, argu);
	      currentTab--;
	      append("END");
	      return _ret;
	   }

	   /**
	    * f0 -> ClassDeclaration()
	    *       | ClassExtendsDeclaration()
	    */
	   public Object visit(TypeDeclaration n, Object argu) {
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
	   public Object visit(ClassDeclaration n, Object argu) {
	      Object _ret=null;	      
	      n.f0.accept(this, argu);
	      String className =(String)n.f1.accept(this, argu);
	      OrdinaryClass ordinaryClass=SymbolTable.SearchClass(className);
	      n.f2.accept(this, argu);
	      n.f3.accept(this, ordinaryClass);
	      n.f4.accept(this, ordinaryClass);
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
	   public Object visit(ClassExtendsDeclaration n, Object argu) {
	      Object _ret=null;	      
	      n.f0.accept(this, argu);
	      String className =(String)n.f1.accept(this, argu);
	      n.f2.accept(this, argu);
	      n.f3.accept(this, argu);
	      OrdinaryClass ordinaryClass=SymbolTable.SearchClass(className);
	      n.f4.accept(this, argu);
	      n.f5.accept(this, ordinaryClass);
	      n.f6.accept(this, ordinaryClass);
	      n.f7.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> Type()
	    * f1 -> Identifier()
	    * f2 -> ";"
	    */
	   public Object visit(VarDeclaration n, Object argu) {
	      Object _ret=null;	      
	      n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      n.f2.accept(this, argu);
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
	   public Object visit(MethodDeclaration n, Object argu) {
	      Object _ret=null;
	      OrdinaryClass ordinaryClass=(OrdinaryClass)argu;
	      append("");
	      n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      String methodName =(String)n.f2.accept(this, argu);
	      Method method=null;
	      for(Method m : ordinaryClass.allMethod)
	      {
	    	  if(m.name==methodName)
	    		  method=m;
	      }
	      append(String.format("%1s_%2s [ %3d ]",ordinaryClass.name,method.name,method.allParameter.size()+1));
	      currentTab++;
	      append("BEGIN");
	      currentTab++;
	      n.f3.accept(this, argu);
	      n.f4.accept(this, argu);
	      n.f5.accept(this, argu);
	      n.f6.accept(this, argu);
	      n.f7.accept(this, argu);
	      MethodArgument methodArgu=new MethodArgument(method,method.allParameter.size()+method.allLocalVariable.size());
	      n.f8.accept(this, methodArgu);
	      n.f9.accept(this, argu);
	      ExpressionResult retExpression = (ExpressionResult)n.f10.accept(this, methodArgu);
	      currentTab--;
	      append(String.format("RETURN TEMP %1d",retExpression.tempIndex));	      
	      append("END");
	      currentTab--;
	      n.f11.accept(this, argu);
	      n.f12.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> FormalParameter()
	    * f1 -> ( FormalParameterRest() )*
	    */
	   public Object visit(FormalParameterList n, Object argu) {
	      Object _ret=null;
	      n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> Type()
	    * f1 -> Identifier()
	    */
	   public Object visit(FormalParameter n, Object argu) {
	      Object _ret=null;
	      n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> ","
	    * f1 -> FormalParameter()
	    */
	   public Object visit(FormalParameterRest n, Object argu) {
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
	   public Object visit(Type n, Object argu) {
	      Object _ret=null;
	      n.f0.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> "int"
	    * f1 -> "["
	    * f2 -> "]"
	    */
	   public Object visit(ArrayType n, Object argu) {
	      Object _ret=null;
	      n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      n.f2.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> "boolean"
	    */
	   public Object visit(BooleanType n, Object argu) {
	      Object _ret=null;
	      n.f0.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> "int"
	    */
	   public Object visit(IntegerType n, Object argu) {
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
	      String leftValueName = (String)n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      ExpressionResult rightValueExpression=(ExpressionResult) n.f2.accept(this, argu);
	      n.f3.accept(this, argu);
	      MethodArgument methodArgu=(MethodArgument)argu;    	  
	      int indexAsLocalVariable =  methodArgu.method.SearchVariableAsLocalVariable(leftValueName);
	      if(indexAsLocalVariable >=0)
	      {
	    	  append(String.format("MOVE TEMP %1d TEMP %2d",methodArgu.method.allParameter.size()+indexAsLocalVariable+1,rightValueExpression.tempIndex));
	    	  return _ret;
	      }
	      int indexAsParameter =methodArgu.method.SearchVariableAsParameter(leftValueName);
	      if(indexAsParameter >= 0)
	      {
	    	  append(String.format("MOVE TEMP %1d TEMP %2d",indexAsParameter+1,rightValueExpression.tempIndex));
	    	  return _ret;
	      }
	      int indexAsClassVariable=methodArgu.method.SearchVariableAsClassVariable(leftValueName);
	      if(indexAsClassVariable >=0)
	      {
	    	  append(String.format("HSTORE TEMP %1d %2d TEMP %3d",0,4*indexAsClassVariable+4,rightValueExpression.tempIndex));
	    	  return _ret;
	      }
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
	      MethodArgument methodArgu=(MethodArgument)argu;   
	      String leftValueAddressName =(String)n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      ExpressionResult leftValueOffsetExpression =(ExpressionResult) n.f2.accept(this, argu);
	      n.f3.accept(this, argu);
	      n.f4.accept(this, argu);
	      ExpressionResult rightValueExpression = (ExpressionResult)n.f5.accept(this, argu);
	      n.f6.accept(this, argu);	      
	      
	      int indexAsLocalVariable =  methodArgu.method.SearchVariableAsLocalVariable(leftValueAddressName);
	      if(indexAsLocalVariable >=0)
	      {
	    	  int middleValueTempIndex=methodArgu.newTemp();
	    	  append(String.format("MOVE TEMP %1d PLUS TEMP %2d TEMP %3d", middleValueTempIndex,methodArgu.method.allParameter.size()+indexAsLocalVariable+1,leftValueOffsetExpression.tempIndex ));
	    	  append(String.format("HSTORE TEMP %1d %2d TEMP %3d",middleValueTempIndex, 4,rightValueExpression.tempIndex));
	    	  return _ret;
	      }
	      int indexAsParameter =methodArgu.method.SearchVariableAsParameter(leftValueAddressName);
	      if(indexAsParameter >= 0)
	      {
	    	  int middleValueTempIndex=methodArgu.newTemp();
	    	  append(String.format("MOVE TEMP %1d PLUS TEMP %2d TEMP %3d", middleValueTempIndex,indexAsParameter+1,leftValueOffsetExpression.tempIndex ));
	    	  append(String.format("HSTORE TEMP %1d %2d TEMP %3d",middleValueTempIndex, 4,rightValueExpression.tempIndex));
	    	  return _ret;
	      }
	      int indexAsClassVariable=methodArgu.method.SearchVariableAsClassVariable(leftValueAddressName);
	      if(indexAsClassVariable >=0)
	      {
	    	  int middleValueTempIndex1=methodArgu.newTemp();
	    	  int middleValueTempIndex2=methodArgu.newTemp();
	    	  append(String.format("HLOAD TEMP %1d TEMP 0 %2d",middleValueTempIndex1,4*indexAsClassVariable+4));
	    	  append(String.format("MOVE TEMP %1d PLUS TEMP %2d TEMP %3d", middleValueTempIndex2,middleValueTempIndex1,leftValueOffsetExpression.tempIndex));
	    	  append(String.format("HSTORE TEMP %1d %2d TEMP %3d",middleValueTempIndex2,4, rightValueExpression.tempIndex));
	    	  return _ret;
	      }	      
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
	      String label1=newLabel();
	      String label2=newLabel();
	      n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      ExpressionResult conditionExpression =(ExpressionResult) n.f2.accept(this, argu);
	      n.f3.accept(this, argu);
	      append(String.format("CJUMP TEMP %1d %2s",conditionExpression.tempIndex,label1));
	      n.f4.accept(this, argu);
	      append(String.format("JUMP %1s",label2));
	      append(String.format("%1s NOOP",label1));
	      n.f5.accept(this, argu);
	      n.f6.accept(this, argu);
	      append(String.format("%1s NOOP",label2));
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
	      String label1=newLabel();
	      String label2=newLabel();
	      append(String.format("%1s NOOP", label2));	    
	      n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      ExpressionResult conditionExpression =(ExpressionResult) n.f2.accept(this, argu);
	      n.f3.accept(this, argu);
	      append(String.format("CJUMP TEMP %1d %2s",conditionExpression.tempIndex,label1));
	      n.f4.accept(this, argu);
	      append(String.format("JUMP %1s",label2));
	      append(String.format("%1s NOOP", label1));	     
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
	      ExpressionResult printExpression =(ExpressionResult) n.f2.accept(this, argu);
	      append(String.format("PRINT TEMP %1d",printExpression.tempIndex));
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
	      _ret = n.f0.accept(this, argu);	      
	      return _ret;
	   }

	   /**
	    * f0 -> PrimaryExpression()
	    * f1 -> "&&"
	    * f2 -> PrimaryExpression()
	    */
	   public Object visit(AndExpression n, Object argu) {		   
		   MethodArgument methodArgu=(MethodArgument)argu;   
		   String label1=newLabel();
		   String label2=newLabel();
		   int resultTempIndex=methodArgu.newTemp();
		   ExpressionResult operand1Expression=(ExpressionResult)n.f0.accept(this, argu);
   	       n.f1.accept(this, argu);
	       append(String.format("CJUMP TEMP %1d %2s",operand1Expression.tempIndex,label1));
	       ExpressionResult operand2Expression=(ExpressionResult)n.f2.accept(this, argu);     
	       append(String.format("MOVE TEMP %1d TEMP %2d", resultTempIndex,operand2Expression.tempIndex));
	       append(String.format("JUMP %1s",label2));   
	       append(String.format("%1s NOOP", label1));
	       append(String.format("MOVE TEMP %1d 0",resultTempIndex)); 	      
 	       append(String.format("%1s NOOP", label2));	    
 	       return new ExpressionResult(operand1Expression.type,resultTempIndex);
	   }

	   /**
	    * f0 -> PrimaryExpression()
	    * f1 -> "<"
	    * f2 -> PrimaryExpression()
	    */
	   public Object visit(CompareExpression n, Object argu) {		   
		  ExpressionResult operand1Expression=(ExpressionResult)n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      ExpressionResult operand2Expression=(ExpressionResult)n.f2.accept(this, argu);   
	      MethodArgument methodArgu=(MethodArgument)argu;   
	      int resultTempIndex=methodArgu.newTemp();
	      append(String.format("MOVE TEMP %1d LT TEMP %2d TEMP %3d", resultTempIndex,operand1Expression.tempIndex,operand2Expression.tempIndex));	      
	      return new ExpressionResult(new VariableType(FourType.Boolean),resultTempIndex);
	   }

	   /**
	    * f0 -> PrimaryExpression()
	    * f1 -> "+"
	    * f2 -> PrimaryExpression()
	    */
	   public Object visit(PlusExpression n, Object argu) {
		      ExpressionResult operand1Expression=(ExpressionResult)n.f0.accept(this, argu);
		      n.f1.accept(this, argu);
		      ExpressionResult operand2Expression=(ExpressionResult)n.f2.accept(this, argu);   
		      MethodArgument methodArgu=(MethodArgument)argu;   
		      int resultTempIndex=methodArgu.newTemp();
		      append(String.format("MOVE TEMP %1d PLUS TEMP %2d TEMP %3d", resultTempIndex,operand1Expression.tempIndex,operand2Expression.tempIndex));	      
		      return new ExpressionResult(operand1Expression.type,resultTempIndex);
	   }

	   /**
	    * f0 -> PrimaryExpression()
	    * f1 -> "-"
	    * f2 -> PrimaryExpression()
	    */
	   public Object visit(MinusExpression n, Object argu) {
		      ExpressionResult operand1Expression=(ExpressionResult)n.f0.accept(this, argu);
		      n.f1.accept(this, argu);
		      ExpressionResult operand2Expression=(ExpressionResult)n.f2.accept(this, argu);   
		      MethodArgument methodArgu=(MethodArgument)argu;   
		      int resultTempIndex=methodArgu.newTemp();
		      append(String.format("MOVE TEMP %1d MINUS TEMP %2d TEMP %3d", resultTempIndex,operand1Expression.tempIndex,operand2Expression.tempIndex));	      
		      return new ExpressionResult(operand1Expression.type,resultTempIndex);
	   }

	   /**
	    * f0 -> PrimaryExpression()
	    * f1 -> "*"
	    * f2 -> PrimaryExpression()
	    */
	   public Object visit(TimesExpression n, Object argu) {
		      ExpressionResult operand1Expression=(ExpressionResult)n.f0.accept(this, argu);
		      n.f1.accept(this, argu);
		      ExpressionResult operand2Expression=(ExpressionResult)n.f2.accept(this, argu);   
		      MethodArgument methodArgu=(MethodArgument)argu;   
		      int resultTempIndex=methodArgu.newTemp();
		      append(String.format("MOVE TEMP %1d TIMES TEMP %2d TEMP %3d", resultTempIndex,operand1Expression.tempIndex,operand2Expression.tempIndex));	      
		      return new ExpressionResult(operand1Expression.type,resultTempIndex);
	   }

	   /**
	    * f0 -> PrimaryExpression()
	    * f1 -> "["
	    * f2 -> PrimaryExpression()
	    * f3 -> "]"
	    */
	   public Object visit(ArrayLookup n, Object argu) {
		  ExpressionResult addressExpression=(ExpressionResult)n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      ExpressionResult offsetExpression=(ExpressionResult)n.f2.accept(this, argu);
	      n.f3.accept(this, argu);
	      MethodArgument methodArgu=(MethodArgument)argu; 
	      int middleValueTempIndex=methodArgu.newTemp();
	      int resultTempIndex=methodArgu.newTemp();
	      append(String.format("MOVE TEMP %1d PLUS TEMP %2d TEMP %3d",middleValueTempIndex,addressExpression.tempIndex,offsetExpression.tempIndex));
	      append(String.format("HLOAD TEMP %1d TEMP %2d 4",resultTempIndex,middleValueTempIndex));	      
	      return new ExpressionResult(new VariableType(FourType.Integer),resultTempIndex);
	   }

	   /**
	    * f0 -> PrimaryExpression()
	    * f1 -> "."
	    * f2 -> "length"
	    */
	   public Object visit(ArrayLength n, Object argu) {
		  ExpressionResult addressExpression=(ExpressionResult)n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      n.f2.accept(this, argu);
	      MethodArgument methodArgu=(MethodArgument)argu; 
	      int resultTempIndex=methodArgu.newTemp();
	      append(String.format("HLOAD TEMP %1d TEMP %2d 0",resultTempIndex,addressExpression.tempIndex));	      
	      return new ExpressionResult(new VariableType(FourType.Integer),resultTempIndex);
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
		   MethodArgument methodArgu=(MethodArgument)argu; 
		   ExpressionResult variableExpression=(ExpressionResult)n.f0.accept(this, argu);
		   n.f1.accept(this, argu);
		   String methodName = (String)n.f2.accept(this, argu);
		   n.f3.accept(this, argu);
		   MethodParameterArgument methodParameterArgu =new MethodParameterArgument(methodArgu);
		   n.f4.accept(this, methodParameterArgu);	 
		   n.f5.accept(this, argu);
		   
		   OrdinaryClass ordinaryClass=SymbolTable.SearchClass(variableExpression.type.name);
	      int methodIndex=ordinaryClass.SearchMethod(methodName);
	      int middleValueTempIndex1=methodArgu.newTemp();
	      int middleValueTempIndex2=methodArgu.newTemp();
	      int retTempIndex=methodArgu.newTemp();
	      append(String.format("HLOAD TEMP %1d TEMP %2d 0",middleValueTempIndex1,variableExpression.tempIndex));
	      append(String.format("HLOAD TEMP %1d TEMP %2d %3d",middleValueTempIndex2,middleValueTempIndex1,4*methodIndex));
	      append(String.format("MOVE TEMP %1d CALL TEMP %2d (TEMP %3d%4s)",retTempIndex,middleValueTempIndex2,variableExpression.tempIndex,methodParameterArgu.parameterTemp)); 	      
	      return new ExpressionResult(ordinaryClass.SearchRetTypeForVariable(methodName),retTempIndex);
	   }

	   /**
	    * f0 -> Expression()
	    * f1 -> ( ExpressionRest() )*
	    */
	   public Object visit(ExpressionList n, Object argu) {	      	 
		   MethodParameterArgument methodParameterArgu = (MethodParameterArgument)argu;
	      ExpressionResult firstExpression=(ExpressionResult)n.f0.accept(this, methodParameterArgu.methodArgu);
	      methodParameterArgu.parameterTemp += " TEMP "+firstExpression.tempIndex;
	      n.f1.accept(this, argu);
	      return null;
	   }

	   /**
	    * f0 -> ","
	    * f1 -> Expression()
	    */
	   public Object visit(ExpressionRest n, Object argu) {	      
		   MethodParameterArgument methodParameterArgu = (MethodParameterArgument)argu;
	      n.f0.accept(this, argu);
	      ExpressionResult theExpression=(ExpressionResult)n.f1.accept(this, methodParameterArgu.methodArgu);
	      methodParameterArgu.parameterTemp += " TEMP "+theExpression.tempIndex;
	      return null;
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
	      _ret = n.f0.accept(this, argu);
	      if(n.f0.choice instanceof Identifier)
	      {
	    	  String variableName=((Identifier)n.f0.choice).f0.toString();
	    	  MethodArgument methodArgu=(MethodArgument)argu;  	  
	    	  Method method=methodArgu.method;
	    	  int indexAsLocalVariable = method.SearchVariableAsLocalVariable(variableName);
	    	  if(indexAsLocalVariable >= 0)
	    	  {
	    		  return new ExpressionResult(method.SearchTypeForVariable(variableName),method.allParameter.size()+indexAsLocalVariable+1);
	    	  }
	    	  int indexAsParameter= method.SearchVariableAsParameter(variableName);
	    	  if(indexAsParameter >=0)
	    	  {
	    		  return new ExpressionResult(method.SearchTypeForVariable(variableName),indexAsParameter+1);
	    	  }
	    	  int indexAsClassVariable=method.SearchVariableAsClassVariable(variableName);
	    	  if(indexAsClassVariable >= 0)
	    	  {
	    		  int retValueTempIndex=methodArgu.newTemp();
	    		  append(String.format("HLOAD TEMP %1d TEMP 0 %2d", retValueTempIndex, 4*indexAsClassVariable+4));
	    		  return new ExpressionResult(method.SearchTypeForVariable(variableName),retValueTempIndex);
	    	  }
	    	  return null;	    	  
	      }
	      return _ret;
	   }

	   /**
	    * f0 -> <INTEGER_LITERAL>
	    */
	   public Object visit(IntegerLiteral n, Object argu) {
	      n.f0.accept(this, argu);
	      MethodArgument methodArgu=(MethodArgument)argu; 
	      int resultTempIndex=methodArgu.newTemp();
	      append(String.format("MOVE TEMP %1d %2s",resultTempIndex,n.f0.toString()));	      
	      return new ExpressionResult(new VariableType(FourType.Integer),resultTempIndex);	      
	   }

	   /**
	    * f0 -> "true"
	    */
	   public Object visit(TrueLiteral n, Object argu) {
		   n.f0.accept(this, argu);
		   MethodArgument methodArgu=(MethodArgument)argu; 
		   int resultTempIndex=methodArgu.newTemp();
		   append(String.format("MOVE TEMP %1d %2s",resultTempIndex,"1"));		      
		   return new ExpressionResult(new VariableType(FourType.Boolean),resultTempIndex);
	   }

	   /**
	    * f0 -> "false"
	    */
	   public Object visit(FalseLiteral n, Object argu) {
		   n.f0.accept(this, argu);
		   MethodArgument methodArgu=(MethodArgument)argu; 
		   int resultTempIndex=methodArgu.newTemp();
		   append(String.format("MOVE TEMP %1d %2s",resultTempIndex,"0"));		      
		   return new ExpressionResult(new VariableType(FourType.Boolean),resultTempIndex);
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
	      n.f0.accept(this, argu);
	      MethodArgument methodArgu=(MethodArgument)argu; 
	      OrdinaryClass ordinaryClass=methodArgu.method.parentClass;	      
	      return new ExpressionResult(new VariableType(FourType.Object,ordinaryClass.name),0);
	   }

	   /**
	    * f0 -> "new"
	    * f1 -> "int"
	    * f2 -> "["
	    * f3 -> Expression()
	    * f4 -> "]"
	    */
	   public Object visit(ArrayAllocationExpression n, Object argu) {		   
	      n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      n.f2.accept(this, argu);
	      ExpressionResult lengthExpression=(ExpressionResult)n.f3.accept(this, argu);
	      n.f4.accept(this, argu);
	      MethodArgument methodArgu=(MethodArgument)argu;
	      int middleValueTempIndex1=methodArgu.newTemp();
	      int middleValueTempIndex2=methodArgu.newTemp();
	      int addressTempIndex=methodArgu.newTemp();
	      append(String.format("MOVE TEMP %1d TIMES TEMP %2d 4",middleValueTempIndex1,lengthExpression.tempIndex));
	      append(String.format("MOVE TEMP %1d PLUS TEMP %2d 4",middleValueTempIndex2,middleValueTempIndex1));
	      append(String.format("MOVE TEMP %1d HALLOCATE TEMP %2d",addressTempIndex,middleValueTempIndex2));
	      append(String.format("HSTORE TEMP %1d 0 TEMP %2d",addressTempIndex,lengthExpression.tempIndex));	      	      
	      return new ExpressionResult(new VariableType(FourType.IntegerArray),addressTempIndex);
	   }

	   /**
	    * f0 -> "new"
	    * f1 -> Identifier()
	    * f2 -> "("
	    * f3 -> ")"
	    */
	   public Object visit(AllocationExpression n, Object argu) {		   
	      n.f0.accept(this, argu);
	      String className = (String)n.f1.accept(this, argu);
	      n.f2.accept(this, argu);
	      n.f3.accept(this, argu);
	      int middleValueTempIndex1=0,middleValueTempIndex2=0;
	      MethodArgument methodArgu=(MethodArgument)argu;
	      middleValueTempIndex1=methodArgu.newTemp();
	      middleValueTempIndex2=methodArgu.newTemp();
	      
	      OrdinaryClass ordinaryClass=SymbolTable.SearchClass(className);
	      append(String.format("MOVE TEMP %1d HALLOCATE %2d",middleValueTempIndex1,4*ordinaryClass.NumberOfMethod()));
	      append(String.format("MOVE TEMP %1d HALLOCATE %2d",middleValueTempIndex2,4*ordinaryClass.NumberOfVariable()+4));
	      List<String> methodIdentifier = ordinaryClass.GetMethodIdentifier();
	      for(int i=0;i<methodIdentifier.size();i++)
	      {
	    	  String iden= methodIdentifier.get(i);
	    	  int methodNameTempIndex=methodArgu.newTemp();
	    	  append(String.format("MOVE TEMP %1d ",methodNameTempIndex)+iden);
	    	  append(String.format("HSTORE TEMP %1d %2d TEMP %3d",middleValueTempIndex1,4*i,methodNameTempIndex));
	      }
	      append(String.format("HSTORE TEMP %1d 0 TEMP %2d",middleValueTempIndex2,middleValueTempIndex1));	      
	      return new ExpressionResult(new VariableType(FourType.Object,className),middleValueTempIndex2);
	   }

	   /**
	    * f0 -> "!"
	    * f1 -> Expression()
	    */
	   public Object visit(NotExpression n, Object argu) {		   
	      n.f0.accept(this, argu);	      
	      ExpressionResult operandExpression=(ExpressionResult)n.f1.accept(this, argu);
	      MethodArgument methodArgu=(MethodArgument)argu; 
	      int resultTempIndex=methodArgu.newTemp();
	      append(String.format("MOVE TEMP %1d MINUS 1 TEMP %2d",resultTempIndex,operandExpression.tempIndex));	      
	      return new ExpressionResult(new VariableType(FourType.Boolean),resultTempIndex);
	   }

	   /**
	    * f0 -> "("
	    * f1 -> Expression()
	    * f2 -> ")"
	    */
	   public Object visit(BracketExpression n, Object argu) {
	      Object _ret=null;
	      n.f0.accept(this, argu);
	      _ret = n.f1.accept(this, argu);
	      n.f2.accept(this, argu);
	      return _ret;
	   }

}

class ExpressionResult
{
	VariableType type;
	int tempIndex;
	
	public ExpressionResult(VariableType _type, int _index)
	{
		type=_type;
		tempIndex=_index;
	}
}

class MethodArgument
{
	Method method;
	int usedTemp;
	
	public MethodArgument(Method _method, int _usedTemp)
	{
		method=_method;
		usedTemp=_usedTemp;
	}
	
	public int newTemp()
	{
		usedTemp++;
		return usedTemp;
	}
}

class MethodParameterArgument
{
	MethodArgument methodArgu;
	String parameterTemp;
	
	public MethodParameterArgument(MethodArgument _method)
	{
		methodArgu = _method;
		parameterTemp= "";
	}
}