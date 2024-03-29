//generated by abstract-syntax-gen
package minillvm.ast;
import java.util.*;

public interface StructField extends Element {
    void setType(Type type);
    Type getType();
    void setName(String name);
    String getName();
    Element getParent();
    StructField copy();
    StructField copyWithRefs();
    void clearAttributes();
    void clearAttributesLocal();
    /** */
    public abstract String toString();
}
