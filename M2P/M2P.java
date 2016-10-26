import java.io.FileNotFoundException;
import java.io.FileWriter;

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
		BuildSymbolTableVisitor visitor=new BuildSymbolTableVisitor();		
		root.accept(visitor,null);
				
		ToPigletVisitor visitor1=new ToPigletVisitor();
		root.accept(visitor1,null);		
		java.io.PrintWriter fileWrite=new java.io.PrintWriter(args[1]);
		fileWrite.println(visitor1.pigletString);
		fileWrite.close();
	}

}
