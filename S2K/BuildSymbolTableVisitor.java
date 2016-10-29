import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import syntaxtree.BinOp;
import syntaxtree.CJumpStmt;
import syntaxtree.Call;
import syntaxtree.ErrorStmt;
import syntaxtree.Exp;
import syntaxtree.Goal;
import syntaxtree.HAllocate;
import syntaxtree.HLoadStmt;
import syntaxtree.HStoreStmt;
import syntaxtree.IntegerLiteral;
import syntaxtree.JumpStmt;
import syntaxtree.Label;
import syntaxtree.MoveStmt;
import syntaxtree.NoOpStmt;
import syntaxtree.Node;
import syntaxtree.NodeListOptional;
import syntaxtree.NodeOptional;
import syntaxtree.NodeSequence;
import syntaxtree.Operator;
import syntaxtree.PrintStmt;
import syntaxtree.Procedure;
import syntaxtree.SimpleExp;
import syntaxtree.Stmt;
import syntaxtree.StmtExp;
import syntaxtree.StmtList;
import syntaxtree.Temp;
import visitor.GJDepthFirst;


public class BuildSymbolTableVisitor extends GJDepthFirst<Object,Object>
{

	   public Object visit(NodeOptional n, Object argu) {
	      if ( n.present() )
	         return n.node.accept(this,argu);
	      else
	         return null;
	   }


	   public Object visit(NodeListOptional n, Object argu) {
		   List<Object> _ret=new ArrayList<Object>();
		   if ( n.present() ) {
	         
	         int _count=0;
	         for ( Enumeration<Node> e = n.elements(); e.hasMoreElements(); ) {
	            Object elementRet = e.nextElement().accept(this,argu);
	            _ret.add(elementRet);
	            _count++;
	         }
	         return _ret;
	      }
	      else
	         return _ret;
	   }

	   public Object visit(NodeSequence n, Object argu) {
	      
		   
		   SPigletStatement statement=null;
		   String label=null;
	      int _count=0;
	      for ( Enumeration<Node> e = n.elements(); e.hasMoreElements(); ) {
	         if(_count==0)
	    	  label = (String)e.nextElement().accept(this,argu);
	         else if(_count==1)
	        	 statement=(SPigletStatement)e.nextElement().accept(this,argu);
	         _count++;
	      }
	      if(label!=null)
	    	 {
	    	  statement.hasLabel=true;
	    	  statement.label=label;
	    	 }
	      return statement;
	   }

	   /**
	    * f0 -> "MAIN"
	    * f1 -> StmtList()
	    * f2 -> "END"
	    * f3 -> ( Procedure() )*
	    * f4 -> <EOF>
	    */
	   public Object visit(Goal n, Object argu) {
	      Object _ret=null;
	      SPigletProcedure procedure=new SPigletProcedure("MAIN",0);
	      n.f0.accept(this, argu);
	      n.f1.accept(this, procedure);
	      n.f2.accept(this, argu);
	      SPigletTable.AddProcedure(procedure);
	      n.f3.accept(this, argu);
	      n.f4.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> ( ( Label() )? Stmt() )*
	    */
	   public Object visit(StmtList n, Object argu) {
	      Object _ret=null;
	      n.f0.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> Label()
	    * f1 -> "["
	    * f2 -> IntegerLiteral()
	    * f3 -> "]"
	    * f4 -> StmtExp()
	    */
	   public Object visit(Procedure n, Object argu) {
	      Object _ret=null;
	      String procedureName= (String) n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      int numberOfParameter =(Integer) n.f2.accept(this, argu);
	      n.f3.accept(this, argu);
	      SPigletProcedure procedure=new SPigletProcedure(procedureName,numberOfParameter);
	      n.f4.accept(this, procedure);
	      SPigletTable.AddProcedure(procedure);
	      return _ret;
	   }

	   /**
	    * f0 -> NoOpStmt()
	    *       | ErrorStmt()
	    *       | CJumpStmt()
	    *       | JumpStmt()
	    *       | HStoreStmt()
	    *       | HLoadStmt()
	    *       | MoveStmt()
	    *       | PrintStmt()
	    */
	   public Object visit(Stmt n, Object argu) {
	      Object _ret=null;
	      _ret = n.f0.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> "NOOP"
	    */
	   public Object visit(NoOpStmt n, Object argu) {
	      n.f0.accept(this, argu);
	      return new SPigletStatement();
	   }

	   /**
	    * f0 -> "ERROR"
	    */
	   public Object visit(ErrorStmt n, Object argu) {
	      
	      n.f0.accept(this, argu);
	      return new SPigletStatement();
	   }

	   /**
	    * f0 -> "CJUMP"
	    * f1 -> Temp()
	    * f2 -> Label()
	    */
	   public Object visit(CJumpStmt n, Object argu) {
	      
	      n.f0.accept(this, argu);
	      int tempIndex=(Integer)n.f1.accept(this, argu);
	      String label=(String)n.f2.accept(this, argu);
	      SPigletStatement statement=new SPigletStatement();
	      statement.accessedTemp.add(tempIndex);
	      statement.canJump=true;
	      statement.jumpToLabel=label;
	      return statement;
	   }

	   /**
	    * f0 -> "JUMP"
	    * f1 -> Label()
	    */
	   public Object visit(JumpStmt n, Object argu) {
	      
	      n.f0.accept(this, argu);
	      String label=(String)n.f1.accept(this, argu);
	      SPigletStatement statement=new SPigletStatement();	      
	      statement.canJump=true;
	      statement.jumpToLabel=label;
	      return statement;
	   }

	   /**
	    * f0 -> "HSTORE"
	    * f1 -> Temp()
	    * f2 -> IntegerLiteral()
	    * f3 -> Temp()
	    */
	   public Object visit(HStoreStmt n, Object argu) {
	      
	      n.f0.accept(this, argu);
	      int addressTemp=(Integer)n.f1.accept(this, argu);
	      n.f2.accept(this, argu);
	      int contentTemp=(Integer)n.f3.accept(this, argu);
	      SPigletStatement statement=new SPigletStatement();
	      statement.accessedTemp.add(addressTemp);
	      statement.accessedTemp.add(contentTemp);
	      return statement;
	   }

	   /**
	    * f0 -> "HLOAD"
	    * f1 -> Temp()
	    * f2 -> Temp()
	    * f3 -> IntegerLiteral()
	    */
	   public Object visit(HLoadStmt n, Object argu) {
	      
	      n.f0.accept(this, argu);
	      int destTemp=(Integer)n.f1.accept(this, argu);
	      int addressTemp=(Integer)n.f2.accept(this, argu);
	      n.f3.accept(this, argu);
	      SPigletStatement statement=new SPigletStatement();
	      statement.accessedTemp.add(addressTemp);
	      statement.assignedTemp.add(destTemp);
	      return statement;
	   }

	   /**
	    * f0 -> "MOVE"
	    * f1 -> Temp()
	    * f2 -> Exp()
	    */
	   public Object visit(MoveStmt n, Object argu) {
	      
	      n.f0.accept(this, argu);
	      int destTemp=(Integer)n.f1.accept(this, argu);
	      List<Integer> expList=(List<Integer>) n.f2.accept(this, argu);
	      SPigletStatement statement=new SPigletStatement();
	      statement.accessedTemp.addAll(expList);
	      statement.assignedTemp.add(destTemp);
	      return statement;
	   }

	   /**
	    * f0 -> "PRINT"
	    * f1 -> SimpleExp()
	    */
	   public Object visit(PrintStmt n, Object argu) {
	      
	      n.f0.accept(this, argu);
	      List<Integer> expList=(List<Integer>)n.f1.accept(this, argu);
	      SPigletStatement statement=new SPigletStatement();
	      statement.accessedTemp.addAll(expList);	      
	      return statement;
	   }

	   /**
	    * f0 -> Call()
	    *       | HAllocate()
	    *       | BinOp()
	    *       | SimpleExp()
	    */
	   public Object visit(Exp n, Object argu) {
	      Object _ret=null;
	      _ret = n.f0.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> "BEGIN"
	    * f1 -> StmtList()
	    * f2 -> "RETURN"
	    * f3 -> SimpleExp()
	    * f4 -> "END"
	    */
	   public Object visit(StmtExp n, Object argu) {
	      Object _ret=null;
	      SPigletProcedure procedure=(SPigletProcedure)argu;
	      n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      n.f2.accept(this, argu);
	      List<Integer> retList=(List<Integer>)n.f3.accept(this, argu);
	      n.f4.accept(this, argu);
	      SPigletStatement statement=new SPigletStatement();
	      statement.accessedTemp.addAll(retList);
	      procedure.AddStatement(statement);
	      return _ret;
	   }

	   /**
	    * f0 -> "CALL"
	    * f1 -> SimpleExp()
	    * f2 -> "("
	    * f3 -> ( Temp() )*
	    * f4 -> ")"
	    */
	   public Object visit(Call n, Object argu) {
	      
	      n.f0.accept(this, argu);
	      List<Integer> funcList=(List<Integer>)n.f1.accept(this, argu);
	      List<Integer> callList=new ArrayList<Integer>();
	      callList.addAll(funcList);
	      n.f2.accept(this, argu);
	      List<Integer> parameterList=(List<Integer>)n.f3.accept(this, argu);
	      n.f4.accept(this, argu);
	      callList.addAll(parameterList);
	      return callList;
	   }

	   /**
	    * f0 -> "HALLOCATE"
	    * f1 -> SimpleExp()
	    */
	   public Object visit(HAllocate n, Object argu) {
	      
	      n.f0.accept(this, argu);
	      return n.f1.accept(this, argu);
	      
	   }

	   /**
	    * f0 -> Operator()
	    * f1 -> Temp()
	    * f2 -> SimpleExp()
	    */
	   public Object visit(BinOp n, Object argu) {
	      List<Integer> binOpList=new ArrayList<Integer>();
	      n.f0.accept(this, argu);
	      int op1TempIndex= (Integer)n.f1.accept(this, argu);
	      binOpList.add(op1TempIndex);
	      List<Integer> op2List=(List<Integer>)n.f2.accept(this, argu);
	      binOpList.addAll(op2List);
	      return binOpList;
	   }

	   /**
	    * f0 -> "LT"
	    *       | "PLUS"
	    *       | "MINUS"
	    *       | "TIMES"
	    */
	   public Object visit(Operator n, Object argu) {
	      Object _ret=null;
	      n.f0.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> Temp()
	    *       | IntegerLiteral()
	    *       | Label()
	    */
	   public Object visit(SimpleExp n, Object argu) {
	      List<Integer> _ret=new ArrayList<Integer>();
	      Object tempIndex = n.f0.accept(this, argu);
	      if(n.f0.choice instanceof Temp)
	      {
	    	  _ret.add((Integer)tempIndex);
	      }
	      return _ret;
	   }

	   /**
	    * f0 -> "TEMP"
	    * f1 -> IntegerLiteral()
	    */
	   public Object visit(Temp n, Object argu) {
	      
	      n.f0.accept(this, argu);
	      SPigletProcedure procedure=(SPigletProcedure)argu;
	      int tempIndex= (Integer)n.f1.accept(this, argu);
	      if(tempIndex>procedure.maxTemp)
	    	  procedure.maxTemp=tempIndex;
	      return tempIndex;
	   }

	   /**
	    * f0 -> <INTEGER_LITERAL>
	    */
	   public Object visit(IntegerLiteral n, Object argu) {	      
	      n.f0.accept(this, argu);
	      return Integer.parseInt( n.f0.toString());
	   }

	   /**
	    * f0 -> <IDENTIFIER>
	    */
	   public Object visit(Label n, Object argu) {	  
	      n.f0.accept(this, argu);
	      return n.f0.toString();
	   }
}
