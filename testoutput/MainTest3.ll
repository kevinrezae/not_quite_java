

define i32 @main() {
init:
    %a = alloca i32
    %b = alloca i32
    ;1 start statement : {
    ;2 start statement : int a
    ;2 end statement: int a
    ;3 start statement : int b
    ;3 end statement: int b
    ;4 start statement : return 0;
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
