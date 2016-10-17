import java.io.FileNotFoundException;

import syntaxtree.Node;
import visitor.GJVisitor;

public class M2P {

	/**
	 * @param args
	 * @throws FileNotFoundException 
	 * @throws ParseException 
	 */
	public static void main(String[] args) throws FileNotFoundException, ParseException {
		// TODO Auto-generated method stub
		new MiniJavaParser(new java.io.FileInputStream(args[0]));
		Node root = MiniJavaParser.Goal();
		GJVisitor<VariableType,SymbolInterface> visitor=new BuildSymbolTableVisitor();
		SymbolTable fullSymbolTable=new SymbolTable();
		root.accept(visitor,fullSymbolTable);
		
		fullSymbolTable.MakeOrder();
		ToPigletVisitor visitor1=new ToPigletVisitor();
		root.accept(visitor1,fullSymbolTable);
		System.out.println(visitor1.pigletString);
		//System.out.println("End");
	}

}
