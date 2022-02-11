//generated by abstract-syntax-gen
package minillvm.ast;
import java.util.*;

public interface PhiNode extends Element, Assign {
    void setVar(TemporaryVar var);
    TemporaryVar getVar();
    void setType(Type type);
    Type getType();
    void setChoices(PhiNodeChoiceList choices);
    PhiNodeChoiceList getChoices();
    Element getParent();
    PhiNode copy();
    PhiNode copyWithRefs();
    void clearAttributes();
    void clearAttributesLocal();
    /** */
    public abstract String toString();
}