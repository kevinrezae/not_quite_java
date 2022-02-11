//generated by abstract-syntax-gen
package minillvm.ast;
import java.util.*;

@SuppressWarnings({"cast", "unused", "rawtypes"})
class AllocaImpl implements Alloca{
    AllocaImpl(TemporaryVar var, Type type) {
        if (var == null)
            throw new IllegalArgumentException("Element var must not be null.");
        if (type == null)
            throw new IllegalArgumentException("Element type must not be null.");
        this.var = var;
        this.type = type;
        var.setParent(this);
    }

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

    private TemporaryVar var;
    public void setVar(TemporaryVar var) {
        if (var == null) throw new IllegalArgumentException();
        this.var.setParent(null);
        var.setParent(this);
        this.var = var;
    } 
    public TemporaryVar getVar() { return var; }

    private Type type;
    public void setType(Type type) {
        if (type == null) throw new IllegalArgumentException();
        this.type = type;
    } 
    public Type getType() { return type; }

    public Element get(int i) {
        switch (i) {
            case 0: return var;
            default: throw new IllegalArgumentException("Index out of range: " + i);
        }
    }
    public Element set(int i, Element newElem) {
        Element oldElem;
        switch (i) {
            case 0: oldElem = var; setVar((TemporaryVar) newElem); return oldElem;
            default: throw new IllegalArgumentException("Index out of range: " + i);
        }
    }

    @Override
    public void forEachElement(java.util.function.Consumer<? super Element> action) {
        action.accept(this.var);
    }
    public int size() {
        return 1;
    }
    @Override public Alloca copy() {
        Alloca result = new AllocaImpl((TemporaryVar) this.var.copy(), type);
        return result;
    }

    @Override public Alloca copyWithRefs() {
        Alloca res = copy();
        return res;
    }

    @Override public void clearAttributes() {
        var.clearAttributes();
        clearAttributesLocal();
    }
    @Override public void clearAttributesLocal() {
    }
    @Override public void accept(Visitor v) {
        v.visit(this);
    }
    @Override public <T> T match(Instruction.Matcher<T> matcher) {
        return matcher.case_Alloca(this);
    }
    @Override public void match(Instruction.MatcherVoid matcher) {
        matcher.case_Alloca(this);
    }

    @Override public <T> T match(Element.Matcher<T> matcher) {
        return matcher.case_Alloca(this);
    }
    @Override public void match(Element.MatcherVoid matcher) {
        matcher.case_Alloca(this);
    }

    @Override public <T> T match(Assign.Matcher<T> matcher) {
        return matcher.case_Alloca(this);
    }
    @Override public void match(Assign.MatcherVoid matcher) {
        matcher.case_Alloca(this);
    }

    public boolean structuralEquals(Element e) {
        if (e instanceof Alloca) {
            Alloca o = (Alloca) e;
            return this.var.structuralEquals(o.getVar())
                && this.type == o.getType();
        } else {
            return false;
        }
    }
    /** */
    public String toString() {
        return minillvm.printer.PrettyPrinter.elementToString((Alloca)this);
    }
}