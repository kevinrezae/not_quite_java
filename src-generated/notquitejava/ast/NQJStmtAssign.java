//generated by abstract-syntax-gen
package notquitejava.ast;
import java.util.*;

public interface NQJStmtAssign extends NQJStatement, NQJElement {
    void setAddress(NQJExprL address);
    NQJExprL getAddress();
    void setValue(NQJExpr value);
    NQJExpr getValue();
    NQJElement getParent();
    NQJStmtAssign copy();
    NQJStmtAssign copyWithRefs();
    void clearAttributes();
    void clearAttributesLocal();
    /** "information about the source code"*/
    public abstract frontend.SourcePosition getSourcePosition();
    /** "information about the source code"*/
    public abstract void setSourcePosition(frontend.SourcePosition sourcePosition);
}
