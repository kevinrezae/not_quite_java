//generated by abstract-syntax-gen
package minillvm.ast;
import java.util.*;

@SuppressWarnings({"cast", "unused", "rawtypes"})
class TypePointerImpl implements TypePointer{
    TypePointerImpl(Type to) {
        if (to == null)
            throw new IllegalArgumentException("Element to must not be null.");
        this.to = to;
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

    private Type to;
    public void setTo(Type to) {
        if (to == null) throw new IllegalArgumentException();
        this.to = to;
    } 
    public Type getTo() { return to; }

    public Element get(int i) {
        switch (i) {
            default: throw new IllegalArgumentException("Index out of range: " + i);
        }
    }
    public Element set(int i, Element newElem) {
        Element oldElem;
        switch (i) {
            default: throw new IllegalArgumentException("Index out of range: " + i);
        }
    }

    @Override
    public void forEachElement(java.util.function.Consumer<? super Element> action) {
    }
    public int size() {
        return 0;
    }
    @Override public TypePointer copy() {
        TypePointer result = new TypePointerImpl(to);
        return result;
    }

    @Override public TypePointer copyWithRefs() {
        TypePointer res = copy();
        return res;
    }

    @Override public void clearAttributes() {
        clearAttributesLocal();
    }
    @Override public void clearAttributesLocal() {
    }
    @Override public void accept(Visitor v) {
        v.visit(this);
    }
    @Override public <T> T match(Element.Matcher<T> matcher) {
        return matcher.case_TypePointer(this);
    }
    @Override public void match(Element.MatcherVoid matcher) {
        matcher.case_TypePointer(this);
    }

    @Override public <T> T match(Type.Matcher<T> matcher) {
        return matcher.case_TypePointer(this);
    }
    @Override public void match(Type.MatcherVoid matcher) {
        matcher.case_TypePointer(this);
    }

    public boolean structuralEquals(Element e) {
        if (e instanceof TypePointer) {
            TypePointer o = (TypePointer) e;
            return this.to == o.getTo();
        } else {
            return false;
        }
    }
    /** */
    public String toString() {
        return minillvm.printer.PrettyPrinter.elementToString((TypePointer)this);
    }
    /** "checks, whether this type is equal to another type"*/
    public boolean equalsType(Type other) {
        return minillvm.analysis.Typechecker.equalsType((TypePointer)this, other);
    }
}
