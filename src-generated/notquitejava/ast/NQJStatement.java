//generated by abstract-syntax-gen
package notquitejava.ast;
import java.util.*;

public interface NQJStatement extends NQJElement{
    NQJElement getParent();
    <T> T match(Matcher<T> s);
    void match(MatcherVoid s);
    public interface Matcher<T> {
        T case_StmtAssign(NQJStmtAssign stmtAssign);
        T case_StmtReturn(NQJStmtReturn stmtReturn);
        T case_Block(NQJBlock block);
        T case_VarDecl(NQJVarDecl varDecl);
        T case_StmtExpr(NQJStmtExpr stmtExpr);
        T case_StmtWhile(NQJStmtWhile stmtWhile);
        T case_StmtIf(NQJStmtIf stmtIf);
    }

    public interface MatcherVoid {
        void case_StmtAssign(NQJStmtAssign stmtAssign);
        void case_StmtReturn(NQJStmtReturn stmtReturn);
        void case_Block(NQJBlock block);
        void case_VarDecl(NQJVarDecl varDecl);
        void case_StmtExpr(NQJStmtExpr stmtExpr);
        void case_StmtWhile(NQJStmtWhile stmtWhile);
        void case_StmtIf(NQJStmtIf stmtIf);
    }

    NQJStatement copy();
    NQJStatement copyWithRefs();
    /** "information about the source code"*/
    public abstract frontend.SourcePosition getSourcePosition();
    /** "information about the source code"*/
    public abstract void setSourcePosition(frontend.SourcePosition sourcePosition);
}
