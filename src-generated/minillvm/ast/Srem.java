//generated by abstract-syntax-gen
package minillvm.ast;
import java.util.*;

public interface Srem extends Operator, Element {
    Element getParent();
    Srem copy();
    Srem copyWithRefs();
    void clearAttributes();
    void clearAttributesLocal();
    /** */
    public abstract String toString();
}