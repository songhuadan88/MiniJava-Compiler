import java.util.ArrayList;
import java.util.Arrays;
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


public class ToKangaVisitor extends GJDepthFirst<Object,Object>
{
	String kangaString = "";
	int currentTab=0;	
	boolean hasGotTab=false;
	
	void GetTab()
	{
		if(!hasGotTab)
		{
			hasGotTab=true;
			char[] chars = new char[currentTab];
			Arrays.fill(chars, '\t');
			kangaString+=new String(chars);
		}
	}
	
	void appendNoNewLine(String str)
	{
		GetTab();
		kangaString+=str+" ";
	}
	
	void append(String str)
	{
		GetTab();
		kangaString+=str+"\n";
		hasGotTab=false;
	}


		   public Object visit(NodeListOptional n, Object argu) {			   
			   if ( n.present() ) {		         
		         int _count=0;
		         for ( Enumeration<Node> e = n.elements(); e.hasMoreElements(); ) {
		            Object elementRet = e.nextElement().accept(this,argu);
		            if(elementRet instanceof SPigletStatement) // returned by a statement
		            {
		            	ProcedureArgument procedureArgu=(ProcedureArgument)argu;
		            	procedureArgu.currentStatementIndex++;
		            }
		            else if(elementRet instanceof Integer) // returned by Temp as parameters of method
		            {
		            	MethodArgument methodArgu=(MethodArgument)argu;
		            	int tempIndex=(Integer)elementRet;
		            	String addrTempStr= GetExpressionStringForTemp(methodArgu.procedureArgu,tempIndex,"v0");
		            	if(methodArgu.currentParameterIndex<4)
		            	{
		            		append(String.format("MOVE a%d %s",methodArgu.currentParameterIndex,addrTempStr));
		            	}
		            	else
		            	{
		            		append(String.format("PASSARG %d %s",methodArgu.currentParameterIndex-3,addrTempStr));
		            	}
		            	methodArgu.currentParameterIndex++;
		            }
		            _count++;
		         }		        
		      }
		      return null;
		         
		   }

		   public Object visit(NodeSequence n, Object argu) {		
		      int _count=0;
		      for ( Enumeration<Node> e = n.elements(); e.hasMoreElements(); ) {
		         if(_count==0)
		         {
		    	   String label = (String)e.nextElement().accept(this,argu);
		    	   if(label!=null)
		    	   {
		    		   appendNoNewLine(label);
		    	   }
		         }
		         else
		        	 e.nextElement().accept(this,argu);
		         _count++;
		      }
		      return null;
		   }

	String GetExpressionStringForTemp(ProcedureArgument procedureArgu, int tempIndex, String preferredReg)
	{
		String tempStr="";
  	  TempStorePosition storePosition=procedureArgu.procedure.GetStorePosition(tempIndex,procedureArgu.currentStatementIndex); 
  	  if(storePosition.type==StorePositionType.REGISTER)
  		tempStr=storePosition.registerName;
  	  else
  	  {
  		  append(String.format("ALOAD %s SPILLEDARG %d",preferredReg,storePosition.stackIndex));
  		tempStr=preferredReg;
  	  }
  	  return tempStr;
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
	      SPigletProcedure procedure=SPigletTable.SearchProcedure("MAIN");
	      ProcedureArgument procedureArgu=new ProcedureArgument(procedure);
	      append(String.format("MAIN [0][%d][%d]",procedure.NeededStackSpace(),SPigletTable.MaximumOfProcedureParameter()));
	      currentTab ++;
	      n.f0.accept(this, argu);
	      n.f1.accept(this, procedureArgu);
	      n.f2.accept(this, argu);
	      currentTab--;
	      append("END");
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
	      return new SPigletStatement();
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
	      String procedureName =(String)n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      n.f2.accept(this, argu);
	      n.f3.accept(this, argu);
	      SPigletProcedure procedure=SPigletTable.SearchProcedure(procedureName);
	      ProcedureArgument procedureArgu=new ProcedureArgument(procedure);
	      append(String.format("%s [%d][%d][%d]",procedureName,procedure.numberOfParameter,procedure.NeededStackSpace(),SPigletTable.MaximumOfProcedureParameter()));
	      currentTab++;
	      
	      for(int i=4;i<procedure.numberOfParameter;i++)
	      {
	    	  append(String.format("ALOAD v0 SPILLEDARG %d",i-4));
	    	  append(String.format("ASTORE SPILLEDARG %d v0",i));
	      }
	      for(int i=0;i<Math.min(4,procedure.numberOfParameter);i++)
	      {
	    	  append(String.format("ASTORE SPILLEDARG %d a%d",i,i));
	      }
	      n.f4.accept(this, procedureArgu);
	      currentTab--;
	      append("END");
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
	      n.f0.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> "NOOP"
	    */
	   public Object visit(NoOpStmt n, Object argu) {
	      n.f0.accept(this, argu);
	      append("NOOP");
	      return null;
	   }

	   /**
	    * f0 -> "ERROR"
	    */
	   public Object visit(ErrorStmt n, Object argu) {
	      n.f0.accept(this, argu);
	      append("ERROR");
	      return null;
	   }

	   /**
	    * f0 -> "CJUMP"
	    * f1 -> Temp()
	    * f2 -> Label()
	    */
	   public Object visit(CJumpStmt n, Object argu) {
		   ProcedureArgument procedureArgu=(ProcedureArgument)argu;
	      n.f0.accept(this, argu);
	      int opTempIndex=(Integer)n.f1.accept(this, argu);	      
	      String label=(String)n.f2.accept(this, argu);
	      String opTempStr=GetExpressionStringForTemp(procedureArgu,opTempIndex,"v1");
	      append(String.format("CJUMP %s %s",opTempStr, label));
	      return null;
	   }

	   /**
	    * f0 -> "JUMP"
	    * f1 -> Label()
	    */
	   public Object visit(JumpStmt n, Object argu) {	      
	      n.f0.accept(this, argu);
	      String label=(String)n.f1.accept(this, argu);
	      append(String.format("JUMP %s",label));
	      return null;
	   }

	   /**
	    * f0 -> "HSTORE"
	    * f1 -> Temp()
	    * f2 -> IntegerLiteral()
	    * f3 -> Temp()
	    */
	   public Object visit(HStoreStmt n, Object argu) {
		   ProcedureArgument procedureArgu=(ProcedureArgument)argu;
	      n.f0.accept(this, argu);
	      int addrTempIndex=(Integer)n.f1.accept(this, argu);
	      int offset=(Integer)n.f2.accept(this, argu);
	      int sourceTempIndex =(Integer)n.f3.accept(this, argu);
	      String addrTempStr= GetExpressionStringForTemp(procedureArgu,addrTempIndex,"v1");
	      String sourceTempStr=GetExpressionStringForTemp(procedureArgu,sourceTempIndex,"v0");
	      append(String.format("HSTORE %s %d %s",addrTempStr,offset,sourceTempStr));
	      return null;
	   }

	   /**
	    * f0 -> "HLOAD"
	    * f1 -> Temp()
	    * f2 -> Temp()
	    * f3 -> IntegerLiteral()
	    */
	   public Object visit(HLoadStmt n, Object argu) {
		   ProcedureArgument procedureArgu=(ProcedureArgument)argu;
	      n.f0.accept(this, argu);
	      int destTempIndex = (Integer)n.f1.accept(this, argu);
	      int addrTempIndex =(Integer)n.f2.accept(this, argu);
	      int offset =(Integer)n.f3.accept(this, argu);
	      String addrTempStr= GetExpressionStringForTemp(procedureArgu,addrTempIndex,"v1");	      
	      TempStorePosition storePosition=procedureArgu.procedure.GetStorePosition(destTempIndex,procedureArgu.currentStatementIndex); 
	  	  if(storePosition.type==StorePositionType.REGISTER)
	  		  append(String.format("HLOAD %s %s %d",storePosition.registerName,addrTempStr,offset));
	  	  else
	  	  {
	  		  append(String.format("HLOAD %s %s %d","v0",addrTempStr,offset));
	  		  append(String.format("ASTORE SPILLEDARG %d %s",storePosition.stackIndex,"v0" ));
	  	  }
	      return null;
	   }

	   /**
	    * f0 -> "MOVE"
	    * f1 -> Temp()
	    * f2 -> Exp()
	    */
	   public Object visit(MoveStmt n, Object argu) {
	      ProcedureArgument procedureArgu=(ProcedureArgument)argu;
	      n.f0.accept(this, argu);	      
	      int tempIndex=(Integer)n.f1.accept(this, argu);
	      String expStr=(String)n.f2.accept(this, argu);
	      
	      TempStorePosition storePosition=procedureArgu.procedure.GetStorePosition(tempIndex,procedureArgu.currentStatementIndex); 
	  	  if(storePosition.type==StorePositionType.REGISTER)
	  		  append(String.format("MOVE %s %s",storePosition.registerName,expStr));
	  	  else
	  	  {
	  		  append(String.format("MOVE %s %s","v1",expStr));
	  		  append(String.format("ASTORE SPILLEDARG %d %s",storePosition.stackIndex,"v1" ));
	  	  }
	      return null;
	   }

	   /**
	    * f0 -> "PRINT"
	    * f1 -> SimpleExp()
	    */
	   public Object visit(PrintStmt n, Object argu) {	      
	      n.f0.accept(this, argu);
	      String expStr=(String)n.f1.accept(this, argu);
	      append(String.format("PRINT %s",expStr));
	      return null;
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
	      n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	      n.f2.accept(this, argu);
	      String expStr =(String)n.f3.accept(this, argu);
	      n.f4.accept(this, argu);
	      append(String.format("MOVE v0 %s",expStr));
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
		   ProcedureArgument procedureArgu=(ProcedureArgument)argu;
	      n.f0.accept(this, argu);
	      String expStr=(String)n.f1.accept(this, argu);
	      MethodArgument methodArgu=new MethodArgument(procedureArgu);
	      n.f2.accept(this, argu);
	      n.f3.accept(this, methodArgu);
	      n.f4.accept(this, argu);
	      append("CALL "+expStr);	      
	      return "v0";
	   }

	   /**
	    * f0 -> "HALLOCATE"
	    * f1 -> SimpleExp()
	    */
	   public Object visit(HAllocate n, Object argu) {	      
	      n.f0.accept(this, argu);
	      String expStr=(String)n.f1.accept(this, argu);
	      return String.format("HALLOCATE %s",expStr);
	   }

	   /**
	    * f0 -> Operator()
	    * f1 -> Temp()
	    * f2 -> SimpleExp()
	    */
	   public Object visit(BinOp n, Object argu) {
	      
	      String operator = (String)n.f0.accept(this, argu);
	      int op1Index = (Integer)n.f1.accept(this, argu);
	      String op2Str = (String)n.f2.accept(this, argu);
	      String op1Str= GetExpressionStringForTemp((ProcedureArgument)argu,op1Index,"v0");	      
	      return String.format("%s %s %s",operator,op1Str,op2Str);
	   }

	   /**
	    * f0 -> "LT"
	    *       | "PLUS"
	    *       | "MINUS"
	    *       | "TIMES"
	    */
	   public Object visit(Operator n, Object argu) {
	      n.f0.accept(this, argu);
	      return n.f0.choice.toString();
	   }

	   /**
	    * f0 -> Temp()
	    *       | IntegerLiteral()
	    *       | Label()
	    */
	   public Object visit(SimpleExp n, Object argu) {	      
	      Object ret = n.f0.accept(this, argu);
	      ProcedureArgument procedureArgu=(ProcedureArgument)argu;
	      if(n.f0.choice instanceof Temp)
	      {
	    	  ret=GetExpressionStringForTemp(procedureArgu,(Integer)ret,"v1");
	      }
	      else if(n.f0.choice instanceof IntegerLiteral)
	      {
	    	  ret=ret.toString();
	      }
	      else if(n.f0.choice instanceof Label)
	      {
	    	  
	      }
	      return ret;
	   }

	   /**
	    * f0 -> "TEMP"
	    * f1 -> IntegerLiteral()
	    */
	   public Object visit(Temp n, Object argu) {	      
	      n.f0.accept(this, argu);
	      Integer index=(Integer)n.f1.accept(this, argu);
	      return index;
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

class ProcedureArgument
{
	SPigletProcedure procedure;
	int currentStatementIndex=0;
	
	public ProcedureArgument(SPigletProcedure _procedure)
	{
		procedure=_procedure;
	}
}

class MethodArgument
{
	ProcedureArgument procedureArgu;
	int currentParameterIndex=0;
	
	public MethodArgument(ProcedureArgument _procedureArgu)
	{
		procedureArgu=_procedureArgu;
	}
}
