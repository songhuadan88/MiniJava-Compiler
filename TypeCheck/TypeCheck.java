import java.io.FileNotFoundException;

import syntaxtree.*;
import visitor.*;

public class TypeCheck {

	/**
	 * @param args
	 * @throws ParseException 
	 * @throws FileNotFoundException 
	 */
	public static void main(String[] args) throws ParseException, FileNotFoundException {
		// TODO Auto-generated method stub
		System.out.println("GOOD!");
		
		new MiniJavaParser(new java.io.FileInputStream(args[0]));
		Node root = MiniJavaParser.Goal();
		System.out.println("GOOD!");
		GJVisitor<VariableType,SymbolInterface> visitor=new BuildSymbolTableVisitor();
		SymbolTable fullSymbolTable=new SymbolTable();
		root.accept(visitor,fullSymbolTable);
		
		System.out.println("GOOD!");

	}

}
