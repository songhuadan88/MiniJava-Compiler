import java.io.FileNotFoundException;

import syntaxtree.Node;


public class S2K {

	/**
	 * @param args
	 * @throws FileNotFoundException 
	 * @throws ParseException 
	 */
	public static void main(String[] args) throws FileNotFoundException, ParseException {
		
		// TODO Auto-generated method stub
		new SpigletParser(new java.io.FileInputStream(args[0]));
		Node root = SpigletParser.Goal();
		BuildSymbolTableVisitor visitor=new BuildSymbolTableVisitor();		
		root.accept(visitor,null);
						
		//SPigletTable.Print();
		ToKangaVisitor visitor1=new ToKangaVisitor();
		root.accept(visitor1,null);		
		java.io.PrintWriter fileWrite=new java.io.PrintWriter(args[1]);
		fileWrite.println(visitor1.kangaString);
		fileWrite.close();
				

	}

}
