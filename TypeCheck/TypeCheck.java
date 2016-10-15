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
		new MiniJavaParser(new java.io.FileInputStream(args[0]));
		Node root = MiniJavaParser.Goal();		
		GJVisitor<VariableType,SymbolInterface> visitor=new BuildSymbolTableVisitor();
		SymbolTable fullSymbolTable=new SymbolTable();
		root.accept(visitor,fullSymbolTable);
		TypeCheckVisitor visitor1=new TypeCheckVisitor();
		root.accept(visitor1,fullSymbolTable);
		
		if(visitor1.hasError)
			System.out.println(visitor1.errorInfo);
		else
			System.out.println("No error found!");

	}

}
