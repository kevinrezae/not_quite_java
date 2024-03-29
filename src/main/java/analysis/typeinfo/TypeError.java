package analysis.typeinfo;

import frontend.SourcePosition;
import notquitejava.ast.NQJElement;

/** 
 *.
 * TypeError class represent type error which contians line and column
 *
 * @author Albert  */
public class TypeError extends RuntimeException {
    private SourcePosition source;

    private static final long serialVersionUID = -5769042943398878482L;

    public TypeError(String message, int line, int column) {
        super(message);
        this.source = new SourcePosition("", line, column, line, column);
    }

    /**
     *.
     * Type error constructor for an AST class.
     *
     * @param element AST element
     *
     * @param message Error message
     */
    public TypeError(NQJElement element, String message) {
        super(message);
        while (element != null) {
            this.source = element.getSourcePosition();
            if (this.source != null) {
                break;
            }
            element = element.getParent();
        }
    }

    /**
     *. 
     * @return int int
     */
    public int getLine() {
        return source.getLine();
    }

    /**
     *. 
     * @return int int
     */
    public int getColumn() {
        return source.getColumn();
    }

    /**
     *. 
     * @return String String
     */
    @Override
    public String toString() {
        return "Error in line " + getLine() + ":" + getColumn() + ": " + getMessage();
    }

    /**
     *. 
     * @return SourcePosition SourcePosition
     */
    public SourcePosition getSource() {
        return source;
    }
}
