//generated by abstract-syntax-gen
package minillvm.ast;
import java.util.*;

public interface GetElementPtr extends Element, Assign {
    void setVar(TemporaryVar var);
    TemporaryVar getVar();
    void setBaseAddress(Operand baseAddress);
    Operand getBaseAddress();
    void setIndices(OperandList indices);
    OperandList getIndices();
    Element getParent();
    GetElementPtr copy();
    GetElementPtr copyWithRefs();
    void clearAttributes();
    void clearAttributesLocal();
    /** */
    public abstract String toString();
}
