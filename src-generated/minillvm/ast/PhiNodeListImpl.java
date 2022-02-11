//generated by abstract-syntax-gen
package minillvm.ast;
import java.util.*;

@SuppressWarnings({"cast", "unused", "rawtypes"})
class PhiNodeListImpl extends PhiNodeList {
     private Element parent;
    public Element getParent() { return parent; }
    public void setParent(Element parent) {
        if (parent != null && this.parent != null) {
            throw new Error("Cannot change parent of element " + this.getClass().getSimpleName() + ", as it is already used in another tree."
                + "Use the copy method to create a new tree or remove the tree from its old parent or set the parent to null before moving the tree. ");
        }
        this.parent = parent;
    }

    public void replaceBy(Element other) {
        if (parent == null)
            throw new RuntimeException("Node not attached to tree.");
        for (int i=0; i<parent.size(); i++) {
            if (parent.get(i) == this) {
                parent.set(i, other);
                return;
            }
        }
    }

    protected void other_setParentToThis(PhiNode t) {
        t.setParent(this);
    }

    protected void other_clearParent(PhiNode t) {
        t.setParent(null);
    }

    @Override
    public Element set(int i, Element newElement) {
        return ((AsgList<PhiNode>) this).set(i, (PhiNode) newElement);
    }

    @Override public <T> T match(Element.Matcher<T> matcher) {
        return matcher.case_PhiNodeList(this);
    }
    @Override public void match(Element.MatcherVoid matcher) {
        matcher.case_PhiNodeList(this);
    }

    @Override public void accept(Visitor v) {
        v.visit(this);
    }
    @Override public void clearAttributes() {
        for (PhiNode child : this) {
            child.clearAttributes();
        }
        clearAttributesLocal();
    }
    @Override public void clearAttributesLocal() {
    }
    /** */
    public String toString() {
        return minillvm.printer.PrettyPrinter.elementToString((PhiNodeList)this);
    }
}
