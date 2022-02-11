//generated by abstract-syntax-gen
package minillvm.ast;
import java.util.*;

public interface BinaryOperation extends Element, Assign {
    void setVar(TemporaryVar var);
    TemporaryVar getVar();
    void setLeft(Operand left);
    Operand getLeft();
    void setOperator(Operator operator);
    Operator getOperator();
    void setRight(Operand right);
    Operand getRight();
    Element getParent();
    BinaryOperation copy();
    BinaryOperation copyWithRefs();
    void clearAttributes();
    void clearAttributesLocal();
    /** */
    public abstract String toString();
}
