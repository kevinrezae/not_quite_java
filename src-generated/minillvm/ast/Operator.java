//generated by abstract-syntax-gen
package minillvm.ast;
import java.util.*;

public interface Operator extends Element{
    Element getParent();
    <T> T match(Matcher<T> s);
    void match(MatcherVoid s);
    public interface Matcher<T> {
        T case_Or(Or or);
        T case_Srem(Srem srem);
        T case_Sub(Sub sub);
        T case_And(And and);
        T case_Xor(Xor xor);
        T case_Add(Add add);
        T case_Sdiv(Sdiv sdiv);
        T case_Eq(Eq eq);
        T case_Slt(Slt slt);
        T case_Mul(Mul mul);
    }

    public interface MatcherVoid {
        void case_Or(Or or);
        void case_Srem(Srem srem);
        void case_Sub(Sub sub);
        void case_And(And and);
        void case_Xor(Xor xor);
        void case_Add(Add add);
        void case_Sdiv(Sdiv sdiv);
        void case_Eq(Eq eq);
        void case_Slt(Slt slt);
        void case_Mul(Mul mul);
    }

    Operator copy();
    Operator copyWithRefs();
    /** */
    public abstract String toString();
}
