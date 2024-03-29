//generated by abstract-syntax-gen
package notquitejava.ast;
import java.util.*;

public interface NQJExprUnary extends NQJExpr, NQJElement {
    void setUnaryOperator(NQJUnaryOperator unaryOperator);
    NQJUnaryOperator getUnaryOperator();
    void setExpr(NQJExpr expr);
    NQJExpr getExpr();
    NQJElement getParent();
    NQJExprUnary copy();
    NQJExprUnary copyWithRefs();
    void clearAttributes();
    void clearAttributesLocal();
    /** "information about the source code"*/
    public abstract frontend.SourcePosition getSourcePosition();
    /** "information about the source code"*/
    public abstract void setSourcePosition(frontend.SourcePosition sourcePosition);
}
