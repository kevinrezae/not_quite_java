//generated by abstract-syntax-gen
package minillvm.ast;
import java.util.*;

public interface Xor extends Operator, Element {
    Element getParent();
    Xor copy();
    Xor copyWithRefs();
    void clearAttributes();
    void clearAttributesLocal();
    /** */
    public abstract String toString();
}