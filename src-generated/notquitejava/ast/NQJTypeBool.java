//generated by abstract-syntax-gen
package notquitejava.ast;
import java.util.*;

public interface NQJTypeBool extends NQJBaseType, NQJElement {
    NQJElement getParent();
    NQJTypeBool copy();
    NQJTypeBool copyWithRefs();
    void clearAttributes();
    void clearAttributesLocal();
    /** "information about the source code"*/
    public abstract frontend.SourcePosition getSourcePosition();
    /** "information about the source code"*/
    public abstract void setSourcePosition(frontend.SourcePosition sourcePosition);
    /** null*/
    public abstract analysis.typeinfo.Type getType();
    /** null*/
    public abstract void setType(analysis.typeinfo.Type type);
}
