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
		
		MiniJavaParser parser=new MiniJavaParser(new java.io.FileInputStream("Factorial.java"));
		Node root = parser.Goal();
		System.out.println("GOOD!");
		DepthFirstVisitor visitor=new DepthFirstVisitor();
		root.accept(visitor);
		
		System.out.println("GOOD!");

	}

}
