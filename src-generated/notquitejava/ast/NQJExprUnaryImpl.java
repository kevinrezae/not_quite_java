//generated by abstract-syntax-gen
package notquitejava.ast;
import java.util.*;

@SuppressWarnings({"cast", "unused", "rawtypes"})
class NQJExprUnaryImpl implements NQJExprUnary{
    NQJExprUnaryImpl(NQJUnaryOperator unaryOperator, NQJExpr expr) {
        if (unaryOperator == null)
            throw new IllegalArgumentException("Element unaryOperator must not be null.");
        if (expr == null)
            throw new IllegalArgumentException("Element expr must not be null.");
        this.unaryOperator = unaryOperator;
        this.expr = expr;
        unaryOperator.setParent(this);
        expr.setParent(this);
    }

    private NQJElement parent;
    public NQJElement getParent() { return parent; }
    public void setParent(NQJElement parent) {
        if (parent != null && this.parent != null) {
            throw new Error("Cannot change parent of element " + this.getClass().getSimpleName() + ", as it is already used in another tree."
                + "Use the copy method to create a new tree or remove the tree from its old parent or set the parent to null before moving the tree. ");
        }
        this.parent = parent;
    }

    public void replaceBy(NQJElement other) {
        if (parent == null)
            throw new RuntimeException("Node not attached to tree.");
        for (int i=0; i<parent.size(); i++) {
            if (parent.get(i) == this) {
                parent.set(i, other);
                return;
            }
        }
    }

    private NQJUnaryOperator unaryOperator;
    public void setUnaryOperator(NQJUnaryOperator unaryOperator) {
        if (unaryOperator == null) throw new IllegalArgumentException();
        this.unaryOperator.setParent(null);
        unaryOperator.setParent(this);
        this.unaryOperator = unaryOperator;
    } 
    public NQJUnaryOperator getUnaryOperator() { return unaryOperator; }

    private NQJExpr expr;
    public void setExpr(NQJExpr expr) {
        if (expr == null) throw new IllegalArgumentException();
        this.expr.setParent(null);
        expr.setParent(this);
        this.expr = expr;
    } 
    public NQJExpr getExpr() { return expr; }

    public NQJElement get(int i) {
        switch (i) {
            case 0: return unaryOperator;
            case 1: return expr;
            default: throw new IllegalArgumentException("Index out of range: " + i);
        }
    }
    public NQJElement set(int i, NQJElement newElem) {
        NQJElement oldElem;
        switch (i) {
            case 0: oldElem = unaryOperator; setUnaryOperator((NQJUnaryOperator) newElem); return oldElem;
            case 1: oldElem = expr; setExpr((NQJExpr) newElem); return oldElem;
            default: throw new IllegalArgumentException("Index out of range: " + i);
        }
    }

    @Override
    public void forEachElement(java.util.function.Consumer<? super NQJElement> action) {
        action.accept(this.unaryOperator);
        action.accept(this.expr);
    }
    public int size() {
        return 2;
    }
    @Override public NQJExprUnary copy() {
        NQJExprUnary result = new NQJExprUnaryImpl((NQJUnaryOperator) this.unaryOperator.copy(), (NQJExpr) this.expr.copy());
result.setSourcePosition(getSourcePosition());
        return result;
    }

    @Override public NQJExprUnary copyWithRefs() {
        NQJExprUnary res = copy();
        return res;
    }

    @Override public void clearAttributes() {
        unaryOperator.clearAttributes();
        expr.clearAttributes();
        clearAttributesLocal();
    }
    @Override public void clearAttributesLocal() {
    }
    @Override public void accept(Visitor v) {
        v.visit(this);
    }
    @Override public <T> T match(NQJExpr.Matcher<T> matcher) {
        return matcher.case_ExprUnary(this);
    }
    @Override public void match(NQJExpr.MatcherVoid matcher) {
        matcher.case_ExprUnary(this);
    }

    @Override public <T> T match(NQJElement.Matcher<T> matcher) {
        return matcher.case_ExprUnary(this);
    }
    @Override public void match(NQJElement.MatcherVoid matcher) {
        matcher.case_ExprUnary(this);
    }

    @Override public String toString() {
        return "ExprUnary(" + unaryOperator + ", " +expr+")";
    }
    public boolean structuralEquals(NQJElement e) {
        if (e instanceof NQJExprUnary) {
            NQJExprUnary o = (NQJExprUnary) e;
            return this.unaryOperator.structuralEquals(o.getUnaryOperator())
                && this.expr.structuralEquals(o.getExpr());
        } else {
            return false;
        }
    }
    private frontend.SourcePosition sourcePosition;
    /** "information about the source code"*/
    public frontend.SourcePosition getSourcePosition() {
        return sourcePosition;
    }
    /** "information about the source code"*/
    public void setSourcePosition(frontend.SourcePosition sourcePosition) {
        this.sourcePosition = sourcePosition;
    }
}
