//generated by abstract-syntax-gen
package minillvm.ast;
import java.util.*;

public interface Slt extends Operator, Element {
    Element getParent();
    Slt copy();
    Slt copyWithRefs();
    void clearAttributes();
    void clearAttributesLocal();
    /** */
    public abstract String toString();
}
