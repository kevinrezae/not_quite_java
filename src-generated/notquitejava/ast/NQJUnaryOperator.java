//generated by abstract-syntax-gen
package notquitejava.ast;
import java.util.*;

public interface NQJUnaryOperator extends NQJElement{
    NQJElement getParent();
    <T> T match(Matcher<T> s);
    void match(MatcherVoid s);
    public interface Matcher<T> {
        T case_Negate(NQJNegate negate);
        T case_UnaryMinus(NQJUnaryMinus unaryMinus);
    }

    public interface MatcherVoid {
        void case_Negate(NQJNegate negate);
        void case_UnaryMinus(NQJUnaryMinus unaryMinus);
    }

    NQJUnaryOperator copy();
    NQJUnaryOperator copyWithRefs();
    /** "information about the source code"*/
    public abstract frontend.SourcePosition getSourcePosition();
    /** "information about the source code"*/
    public abstract void setSourcePosition(frontend.SourcePosition sourcePosition);
}
