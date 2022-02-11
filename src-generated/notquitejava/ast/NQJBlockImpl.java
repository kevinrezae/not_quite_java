//generated by abstract-syntax-gen
package notquitejava.ast;
import java.util.*;

@SuppressWarnings({"cast", "unused", "rawtypes"})
class NQJBlockImpl extends NQJBlock {
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

    protected void other_setParentToThis(NQJStatement t) {
        t.setParent(this);
    }

    protected void other_clearParent(NQJStatement t) {
        t.setParent(null);
    }

    @Override
    public NQJElement set(int i, NQJElement newElement) {
        return ((AsgList<NQJStatement>) this).set(i, (NQJStatement) newElement);
    }

    @Override public <T> T match(NQJStatement.Matcher<T> matcher) {
        return matcher.case_Block(this);
    }
    @Override public void match(NQJStatement.MatcherVoid matcher) {
        matcher.case_Block(this);
    }

    @Override public <T> T match(NQJElement.Matcher<T> matcher) {
        return matcher.case_Block(this);
    }
    @Override public void match(NQJElement.MatcherVoid matcher) {
        matcher.case_Block(this);
    }

    @Override public void accept(Visitor v) {
        v.visit(this);
    }
    @Override public void clearAttributes() {
        for (NQJStatement child : this) {
            child.clearAttributes();
        }
        clearAttributesLocal();
    }
    @Override public void clearAttributesLocal() {
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
    @Override public String toString() {
        StringBuilder result = new StringBuilder("Block(");
        boolean first = true;
        for (NQJStatement i : this ) {
            if (!first) { result.append(", "); }
            if (result.length() > 1000) { result.append("..."); break; }
            result.append(i);
            first = false;
        }
        result.append(")");
        return result.toString();
    }
}
