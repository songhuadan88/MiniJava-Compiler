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
		String s1="a_b";
		String s2=String.format("%1s", s1);
		
		// TODO Auto-generated method stub
		new MiniJavaParser(new java.io.FileInputStream(args[0]));
		Node root = MiniJavaParser.Goal();
		BuildSymbolTableVisitor visitor=new BuildSymbolTableVisitor();		
		root.accept(visitor,null);
				
		ToPigletVisitor visitor1=new ToPigletVisitor();
		root.accept(visitor1,null);
		System.out.println(visitor1.pigletString);		
	}

}
