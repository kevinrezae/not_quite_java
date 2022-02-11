//generated by abstract-syntax-gen
package minillvm.ast;
import java.util.*;

@SuppressWarnings({"cast", "unused", "rawtypes"})
public abstract class GlobalList extends AsgList<Global> implements Element{
    public GlobalList copy() {
        GlobalList result = new GlobalListImpl();
        for (Global elem : this) {
            result.add((Global) elem.copy());
        }
        return result;
    }

    @Override public GlobalList copyWithRefs() {
        GlobalList res = copy();
        Element self = this;
        res.accept(new Element.DefaultVisitor() {
            @Override public void visit(GlobalRef e) {
                super.visit(e);
                // check reference global
                {
                    Element elem = e.getGlobal();
                    while (elem != self && elem != null) {
                        elem = elem.getParent();
                    }
                    if (elem == self) {
                        e.setGlobal((Global) res.followPath(self.pathTo(e.getGlobal())));
                    }
                }
            }
        });
        return res;
    }

    /** */
    public abstract String toString();
}