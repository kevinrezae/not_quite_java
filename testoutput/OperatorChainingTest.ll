

define i32 @main() {
init:
    %a = alloca i32
    %b = alloca i1
    ;1 start statement : {
    ;2 start statement : int a
    ;2 end statement: int a
    ;3 start statement : boolean b
    ;3 end statement: boolean b
    ;4 start statement : a = 1;
    store i32 1, i32* %a
    ;4 end statement: a = 1;
    ;5 start statement : b = false;
    store i1 0, i1* %b
    ;5 end statement: b = false;
    ;6 start statement : a = ((a + a) + a);
    %t = load i32, i32* %a
    %t1 = load i32, i32* %a
    %resAddImpl = add i32 %t, %t1
    %t2 = load i32, i32* %a
    %resAddImpl1 = add i32 %resAddImpl, %t2
    store i32 %resAddImpl1, i32* %a
    ;6 end statement: a = ((a + a) + a);
    ;7 start statement : a = ((a * a) * a);
    %t3 = load i32, i32* %a
    %t4 = load i32, i32* %a
    %resMulImpl = mul i32 %t3, %t4
    %t5 = load i32, i32* %a
    %resMulImpl1 = mul i32 %resMulImpl, %t5
    store i32 %resMulImpl1, i32* %a
    ;7 end statement: a = ((a * a) * a);
    ;8 start statement : b = (! (! b));
    %t6 = load i1, i1* %b
    %neg_res = icmp eq i1 0, %t6
    %neg_res1 = icmp eq i1 0, %neg_res
    store i1 %neg_res1, i1* %b
    ;8 end statement: b = (! (! b));
    ;9 start statement : b = ((b && b) && b);
    %t7 = load i1, i1* %b
    %andResVar = alloca i1
    store i1 %t7, i1* %andResVar
    br i1 %t7, label %and_first_true, label %and_end
    
and_first_true:
    %t8 = load i1, i1* %b
    store i1 %t8, i1* %andResVar
    br label %and_end
    
and_end:
    %andRes = load i1, i1* %andResVar
    %andResVar1 = alloca i1
    store i1 %andRes, i1* %andResVar1
    br i1 %andRes, label %and_first_true1, label %and_end1
    
and_first_true1:
    %t9 = load i1, i1* %b
    store i1 %t9, i1* %andResVar1
    br label %and_end1
    
and_end1:
    %andRes1 = load i1, i1* %andResVar1
    store i1 %andRes1, i1* %b
    ;9 end statement: b = ((b && b) && b);
    ;10 start statement : return 0;
    ret i32 0
    

}


declare noalias i8* @malloc(i32)

declare i32 @printf(i8*, ...)

declare void @exit(i32)

@.printstr = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
define void @print(i32 %i) {
	%temp = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.printstr, i32 0, i32 0), i32 %i)
	ret void
}
