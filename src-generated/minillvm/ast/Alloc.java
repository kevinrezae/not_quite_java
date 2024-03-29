//generated by abstract-syntax-gen
package minillvm.ast;
import java.util.*;

public interface Alloc extends Element, Assign {
    void setVar(TemporaryVar var);
    TemporaryVar getVar();
    void setSizeInBytes(Operand sizeInBytes);
    Operand getSizeInBytes();
    Element getParent();
    Alloc copy();
    Alloc copyWithRefs();
    void clearAttributes();
    void clearAttributesLocal();
    /** */
    public abstract String toString();
}
