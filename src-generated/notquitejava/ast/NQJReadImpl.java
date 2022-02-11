//generated by abstract-syntax-gen
package notquitejava.ast;
import java.util.*;

@SuppressWarnings({"cast", "unused", "rawtypes"})
class NQJReadImpl implements NQJRead{
    NQJReadImpl(NQJExprL address) {
        if (address == null)
            throw new IllegalArgumentException("Element address must not be null.");
        this.address = address;
        address.setParent(this);
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

    private NQJExprL address;
    public void setAddress(NQJExprL address) {
        if (address == null) throw new IllegalArgumentException();
        this.address.setParent(null);
        address.setParent(this);
        this.address = address;
    } 
    public NQJExprL getAddress() { return address; }

    public NQJElement get(int i) {
        switch (i) {
            case 0: return address;
            default: throw new IllegalArgumentException("Index out of range: " + i);
        }
    }
    public NQJElement set(int i, NQJElement newElem) {
        NQJElement oldElem;
        switch (i) {
            case 0: oldElem = address; setAddress((NQJExprL) newElem); return oldElem;
            default: throw new IllegalArgumentException("Index out of range: " + i);
        }
    }

    @Override
    public void forEachElement(java.util.function.Consumer<? super NQJElement> action) {
        action.accept(this.address);
    }
    public int size() {
        return 1;
    }
    @Override public NQJRead copy() {
        NQJRead result = new NQJReadImpl((NQJExprL) this.address.copy());
result.setSourcePosition(getSourcePosition());
        return result;
    }

    @Override public NQJRead copyWithRefs() {
        NQJRead res = copy();
        return res;
    }

    @Override public void clearAttributes() {
        address.clearAttributes();
        clearAttributesLocal();
    }
    @Override public void clearAttributesLocal() {
    }
    @Override public void accept(Visitor v) {
        v.visit(this);
    }
    @Override public <T> T match(NQJExpr.Matcher<T> matcher) {
        return matcher.case_Read(this);
    }
    @Override public void match(NQJExpr.MatcherVoid matcher) {
        matcher.case_Read(this);
    }

    @Override public <T> T match(NQJElement.Matcher<T> matcher) {
        return matcher.case_Read(this);
    }
    @Override public void match(NQJElement.MatcherVoid matcher) {
        matcher.case_Read(this);
    }

    @Override public String toString() {
        return "Read(" + address+")";
    }
    public boolean structuralEquals(NQJElement e) {
        if (e instanceof NQJRead) {
            NQJRead o = (NQJRead) e;
            return this.address.structuralEquals(o.getAddress());
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
