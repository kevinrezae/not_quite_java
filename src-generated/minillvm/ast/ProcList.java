//generated by abstract-syntax-gen
package minillvm.ast;
import java.util.*;

@SuppressWarnings({"cast", "unused", "rawtypes"})
public abstract class ProcList extends AsgList<Proc> implements Element{
    public ProcList copy() {
        ProcList result = new ProcListImpl();
        for (Proc elem : this) {
            result.add((Proc) elem.copy());
        }
        return result;
    }

    @Override public ProcList copyWithRefs() {
        ProcList res = copy();
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

    /** */
    public abstract String toString();
}
