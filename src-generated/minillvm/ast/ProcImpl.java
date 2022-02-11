//generated by abstract-syntax-gen
package minillvm.ast;
import java.util.*;

@SuppressWarnings({"cast", "unused", "rawtypes"})
class ProcImpl implements Proc{
    ProcImpl(String name, Type returnType, ParameterList parameters, BasicBlockList basicBlocks) {
        if (name == null)
            throw new IllegalArgumentException("Element name must not be null.");
        if (returnType == null)
            throw new IllegalArgumentException("Element returnType must not be null.");
        if (parameters == null)
            throw new IllegalArgumentException("Element parameters must not be null.");
        if (basicBlocks == null)
            throw new IllegalArgumentException("Element basicBlocks must not be null.");
        this.name = name;
        this.returnType = returnType;
        this.parameters = parameters;
        this.basicBlocks = basicBlocks;
        parameters.setParent(this);
        basicBlocks.setParent(this);
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

    private String name;
    public void setName(String name) {
        if (name == null) throw new IllegalArgumentException();
        this.name = name;
    } 
    public String getName() { return name; }

    private Type returnType;
    public void setReturnType(Type returnType) {
        if (returnType == null) throw new IllegalArgumentException();
        this.returnType = returnType;
    } 
    public Type getReturnType() { return returnType; }

    private ParameterList parameters;
    public void setParameters(ParameterList parameters) {
        if (parameters == null) throw new IllegalArgumentException();
        this.parameters.setParent(null);
        parameters.setParent(this);
        this.parameters = parameters;
    } 
    public ParameterList getParameters() { return parameters; }

    private BasicBlockList basicBlocks;
    public void setBasicBlocks(BasicBlockList basicBlocks) {
        if (basicBlocks == null) throw new IllegalArgumentException();
        this.basicBlocks.setParent(null);
        basicBlocks.setParent(this);
        this.basicBlocks = basicBlocks;
    } 
    public BasicBlockList getBasicBlocks() { return basicBlocks; }

    public Element get(int i) {
        switch (i) {
            case 0: return parameters;
            case 1: return basicBlocks;
            default: throw new IllegalArgumentException("Index out of range: " + i);
        }
    }
    public Element set(int i, Element newElem) {
        Element oldElem;
        switch (i) {
            case 0: oldElem = parameters; setParameters((ParameterList) newElem); return oldElem;
            case 1: oldElem = basicBlocks; setBasicBlocks((BasicBlockList) newElem); return oldElem;
            default: throw new IllegalArgumentException("Index out of range: " + i);
        }
    }

    @Override
    public void forEachElement(java.util.function.Consumer<? super Element> action) {
        action.accept(this.parameters);
        action.accept(this.basicBlocks);
    }
    public int size() {
        return 2;
    }
    @Override public Proc copy() {
        Proc result = new ProcImpl(name, returnType, (ParameterList) this.parameters.copy(), (BasicBlockList) this.basicBlocks.copy());
        return result;
    }

    @Override public Proc copyWithRefs() {
        Proc res = copy();
        Element self = this;
        res.accept(new Element.DefaultVisitor() {
            @Override public void visit(PhiNodeChoice e) {
                super.visit(e);
                // check reference label
                {
                    Element elem = e.getLabel();
                    while (elem != self && elem != null) {
                        elem = elem.getParent();
                    }
                    if (elem == self) {
                        e.setLabel((BasicBlock) res.followPath(self.pathTo(e.getLabel())));
                    }
                }
            }
            @Override public void visit(ProcedureRef e) {
                super.visit(e);
                // check reference procedure
                {
                    Element elem = e.getProcedure();
                    while (elem != self && elem != null) {
                        elem = elem.getParent();
                    }
                    if (elem == self) {
                        e.setProcedure((Proc) res.followPath(self.pathTo(e.getProcedure())));
                    }
                }
            }
            @Override public void visit(Branch e) {
                super.visit(e);
                // check reference ifTrueLabel
                {
                    Element elem = e.getIfTrueLabel();
                    while (elem != self && elem != null) {
                        elem = elem.getParent();
                    }
                    if (elem == self) {
                        e.setIfTrueLabel((BasicBlock) res.followPath(self.pathTo(e.getIfTrueLabel())));
                    }
                }
                // check reference ifFalseLabel
                {
                    Element elem = e.getIfFalseLabel();
                    while (elem != self && elem != null) {
                        elem = elem.getParent();
                    }
                    if (elem == self) {
                        e.setIfFalseLabel((BasicBlock) res.followPath(self.pathTo(e.getIfFalseLabel())));
                    }
                }
            }
            @Override public void visit(Jump e) {
                super.visit(e);
                // check reference label
                {
                    Element elem = e.getLabel();
                    while (elem != self && elem != null) {
                        elem = elem.getParent();
                    }
                    if (elem == self) {
                        e.setLabel((BasicBlock) res.followPath(self.pathTo(e.getLabel())));
                    }
                }
            }
        });
        return res;
    }

    @Override public void clearAttributes() {
        parameters.clearAttributes();
        basicBlocks.clearAttributes();
        clearAttributesLocal();
    }
    @Override public void clearAttributesLocal() {
    }
    @Override public void accept(Visitor v) {
        v.visit(this);
    }
    @Override public <T> T match(Element.Matcher<T> matcher) {
        return matcher.case_Proc(this);
    }
    @Override public void match(Element.MatcherVoid matcher) {
        matcher.case_Proc(this);
    }

    @Override public <T> T match(ElementWithName.Matcher<T> matcher) {
        return matcher.case_Proc(this);
    }
    @Override public void match(ElementWithName.MatcherVoid matcher) {
        matcher.case_Proc(this);
    }

    public boolean structuralEquals(Element e) {
        if (e instanceof Proc) {
            Proc o = (Proc) e;
            return java.util.Objects.equals(name, o.getName())
                && this.returnType == o.getReturnType()
                && this.parameters.structuralEquals(o.getParameters())
                && this.basicBlocks.structuralEquals(o.getBasicBlocks());
        } else {
            return false;
        }
    }
    /** */
    public String toString() {
        return minillvm.printer.PrettyPrinter.elementToString((Proc)this);
    }
}
