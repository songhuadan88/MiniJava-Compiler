
import syntaxtree.*;
import visitor.GJDepthFirst;


public class ToMipsVisitor extends GJDepthFirst<Object,Object>
{
	int currentProcedureStack=0;
    String mipsString="";

    void append(String str)
    {
    	append(str,true);
    }
    void append(String str, boolean hasTab)
    {
        mipsString=(hasTab?"\t":"")+str+"\n";

    }

    void AssignSimpleExpToReg(SimpleExpRet simpleExp, String reg)
    {
    	if(simpleExp.type==SimpleExpType.Int)
    	{
    		append(String.format("li $%s %s", reg, simpleExp.str));
    	}
    	if(simpleExp.type==SimpleExpType.Reg)
    	{
    		append(String.format("move $%s $%s", reg, simpleExp.str));
    	}
    	if(simpleExp.type==SimpleExpType.Label)
    	{
    		append(String.format("la $%s %s", reg, simpleExp.str));
    	}
    }

   /**
    * f0 -> "MAIN"
    * f1 -> "["
    * f2 -> IntegerLiteral()
    * f3 -> "]"
    * f4 -> "["
    * f5 -> IntegerLiteral()
    * f6 -> "]"
    * f7 -> "["
    * f8 -> IntegerLiteral()
    * f9 -> "]"
    * f10 -> StmtList()
    * f11 -> "END"
    * f12 -> ( Procedure() )*
    * f13 -> <EOF>
    */
   public Object visit(Goal n, Object argu) {
      Object _ret=null;
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
    * f4 -> "["
    * f5 -> IntegerLiteral()
    * f6 -> "]"
    * f7 -> "["
    * f8 -> IntegerLiteral()
    * f9 -> "]"
    * f10 -> StmtList()
    * f11 -> "END"
    */
   public Object visit(Procedure n, Object argu) {
      Object _ret=null;
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
    *       | ALoadStmt()
    *       | AStoreStmt()
    *       | PassArgStmt()
    *       | CallStmt()
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
      Object _ret=null;
      n.f0.accept(this, argu);
      return _ret;
   }

   /**
    * f0 -> "ERROR"
    */
   public Object visit(ErrorStmt n, Object argu) {
      Object _ret=null;
      n.f0.accept(this, argu);
      return _ret;
   }

   /**
    * f0 -> "CJUMP"
    * f1 -> Reg()
    * f2 -> Label()
    */
   public Object visit(CJumpStmt n, Object argu) {
      Object _ret=null;
      n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      n.f2.accept(this, argu);
      return _ret;
   }

   /**
    * f0 -> "JUMP"
    * f1 -> Label()
    */
   public Object visit(JumpStmt n, Object argu) {
      Object _ret=null;
      n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      return _ret;
   }

   /**
    * f0 -> "HSTORE"
    * f1 -> Reg()
    * f2 -> IntegerLiteral()
    * f3 -> Reg()
    */
   public Object visit(HStoreStmt n, Object argu) {
      Object _ret=null;
      n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      n.f2.accept(this, argu);
      n.f3.accept(this, argu);
      return _ret;
   }

   /**
    * f0 -> "HLOAD"
    * f1 -> Reg()
    * f2 -> Reg()
    * f3 -> IntegerLiteral()
    */
   public Object visit(HLoadStmt n, Object argu) {
      Object _ret=null;
      n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      n.f2.accept(this, argu);
      n.f3.accept(this, argu);
      return _ret;
   }

   /**
    * f0 -> "MOVE"
    * f1 -> Reg()
    * f2 -> Exp()
    */
   public Object visit(MoveStmt n, Object argu) {
      Object _ret=null;
      n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      n.f2.accept(this, argu);
      return _ret;
   }

   /**
    * f0 -> "PRINT"
    * f1 -> SimpleExp()
    */
   public Object visit(PrintStmt n, Object argu) {
      Object _ret=null;
      n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      return _ret;
   }

   /**
    * f0 -> "ALOAD"
    * f1 -> Reg()
    * f2 -> SpilledArg()
    */
   public Object visit(ALoadStmt n, Object argu) {      
      n.f0.accept(this, argu);
      int addr=(Integer)n.f1.accept(this, argu);
      String reg=(String)n.f2.accept(this, argu);
      append(String.format("lw $%s, %d($sp)", reg, 4*currentProcedureStack-4-4*addr));          
      return null;
   }

   /**
    * f0 -> "ASTORE"
    * f1 -> SpilledArg()
    * f2 -> Reg()
    */
   public Object visit(AStoreStmt n, Object argu) {
      n.f0.accept(this, argu);
      int addr=(Integer)n.f1.accept(this, argu);
      String reg=(String)n.f2.accept(this, argu);
      append(String.format("sw $%s, %d($sp)", reg, 4*currentProcedureStack-4-4*addr));      
      return null;
   }

   /**
    * f0 -> "PASSARG"
    * f1 -> IntegerLiteral()
    * f2 -> Reg()
    */
   public Object visit(PassArgStmt n, Object argu) {      
      n.f0.accept(this, argu);
      int addr=(Integer)n.f1.accept(this, argu);
      String reg=(String) n.f2.accept(this, argu);
      append(String.format("sw $%s, %d($sp)", reg, -4*addr-8));
      return null;
   }

   /**
    * f0 -> "CALL"
    * f1 -> SimpleExp()
    */
   public Object visit(CallStmt n, Object argu) {      
      n.f0.accept(this, argu);
      SimpleExpRet simpleExp=(SimpleExpRet)n.f1.accept(this, argu);
      append(String.format("jalr %s%s",simpleExp.type==SimpleExpType.Reg?"$":"" ,simpleExp.str));      
      return null;
   }

   /**
    * f0 -> HAllocate()
    *       | BinOp()
    *       | SimpleExp()
    */
   public Object visit(Exp n, Object argu) {
      Object _ret=null;
      _ret= n.f0.accept(this, argu);
      ExpRet exp=new ExpRet();
      if(n.f0.choice instanceof HAllocate)
      {
    	  exp.type=ExpType.HAllocate;
      }
      if(n.f0.choice instanceof BinOp)
      {
    	  exp.type=ExpType.BinOp;
    	  exp.binOp=(BinOpRet)_ret;
      }
      if(n.f0.choice instanceof SimpleExp)
      {
    	  exp.type=ExpType.SimpleExp;
    	  exp.simpleExp=(SimpleExpRet)_ret;
      }
      return exp;
   }

   /**
    * f0 -> "HALLOCATE"
    * f1 -> SimpleExp()
    */
   public Object visit(HAllocate n, Object argu) {      
      n.f0.accept(this, argu);
      SimpleExpRet sizeExp=(SimpleExpRet) n.f1.accept(this, argu);
      AssignSimpleExpToReg(sizeExp,"a0");
      append("jal _halloc");
      return null;
   }

   /**
    * f0 -> Operator()
    * f1 -> Reg()
    * f2 -> SimpleExp()
    */
   public Object visit(BinOp n, Object argu) {      
      String opStr= (String)n.f0.accept(this, argu);
      String reg=(String)n.f1.accept(this, argu);
      SimpleExpRet exp=(SimpleExpRet)n.f2.accept(this, argu);
      BinOpRet ret=new BinOpRet();
      ret.operator=opStr;
      ret.reg=reg;
      ret.exp=exp;
      return ret;
   }

   /**
    * f0 -> "LT"
    *       | "PLUS"
    *       | "MINUS"
    *       | "TIMES"
    */
   public Object visit(Operator n, Object argu) {      
      n.f0.accept(this, argu);
      return n.f0.toString();
   }

   /**
    * f0 -> "SPILLEDARG"
    * f1 -> IntegerLiteral()
    */
   public Object visit(SpilledArg n, Object argu) {
      Object _ret=null;
      n.f0.accept(this, argu);
      _ret = n.f1.accept(this, argu);
      return _ret;
   }

   /**
    * f0 -> Reg()
    *       | IntegerLiteral()
    *       | Label()
    */
   public Object visit(SimpleExp n, Object argu) {
      Object _ret=null;
      _ret = n.f0.accept(this, argu);
      SimpleExpRet ret=new SimpleExpRet();
      if(n.f0.choice instanceof Reg)
      {
    	  ret.type=SimpleExpType.Reg;
    	  ret.str=(String)_ret;
      }
      if(n.f0.choice instanceof Reg)
      {
    	  ret.type=SimpleExpType.Label;
    	  ret.str=(String)_ret;
      }
      if(n.f0.choice instanceof IntegerLiteral)
      {
    	  ret.type=SimpleExpType.Int;
    	  ret.str=((Integer)_ret).toString();
      }
      return ret;
   }

   /**
    * f0 -> "a0"
    *       | "a1"
    *       | "a2"
    *       | "a3"
    *       | "t0"
    *       | "t1"
    *       | "t2"
    *       | "t3"
    *       | "t4"
    *       | "t5"
    *       | "t6"
    *       | "t7"
    *       | "s0"
    *       | "s1"
    *       | "s2"
    *       | "s3"
    *       | "s4"
    *       | "s5"
    *       | "s6"
    *       | "s7"
    *       | "t8"
    *       | "t9"
    *       | "v0"
    *       | "v1"
    */
   public Object visit(Reg n, Object argu) {
      n.f0.accept(this, argu);
      return n.f0.toString();
   }

   /**
    * f0 -> <INTEGER_LITERAL>
    */
   public Object visit(IntegerLiteral n, Object argu) {    
      n.f0.accept(this, argu);
      return Integer.parseInt(n.f0.toString());
   }

   /**
    * f0 -> <IDENTIFIER>
    */
   public Object visit(Label n, Object argu) {
      n.f0.accept(this, argu);
      return n.f0.toString();
   }

}

enum ExpType{HAllocate,BinOp,SimpleExp}
class ExpRet
{
	ExpType type;
	BinOpRet binOp;
	SimpleExpRet simpleExp;	
}

enum SimpleExpType{Reg,Int,Label}
class SimpleExpRet
{
	SimpleExpType type;
	String str;
}

class BinOpRet
{
	String operator;
	String reg;
	SimpleExpRet exp;
}