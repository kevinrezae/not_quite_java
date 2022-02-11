//generated by abstract-syntax-gen
package notquitejava.ast;
import java.util.*;

public interface NQJExprBinary extends NQJExpr, NQJElement {
    void setLeft(NQJExpr left);
    NQJExpr getLeft();
    void setOperator(NQJOperator operator);
    NQJOperator getOperator();
    void setRight(NQJExpr right);
    NQJExpr getRight();
    NQJElement getParent();
    NQJExprBinary copy();
    NQJExprBinary copyWithRefs();
    void clearAttributes();
    void clearAttributesLocal();
    /** "information about the source code"*/
    public abstract frontend.SourcePosition getSourcePosition();
    /** "information about the source code"*/
    public abstract void setSourcePosition(frontend.SourcePosition sourcePosition);
}