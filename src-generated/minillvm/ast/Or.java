//generated by abstract-syntax-gen
package minillvm.ast;
import java.util.*;

public interface Or extends Operator, Element {
    Element getParent();
    Or copy();
    Or copyWithRefs();
    void clearAttributes();
    void clearAttributesLocal();
    /** */
    public abstract String toString();
}
