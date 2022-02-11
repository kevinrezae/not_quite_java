

%class_B = type {
     %vfTableStructB*  ; procs_pointer
    ,i32  ; y
}

%vfTableStructB = type {
     i32(%class_A*, i32)*  ; show
    ,i32(%class_A*, i1)*  ; show
    ,i32(%class_B*, i32)*  ; give
    ,i32(%class_B*, i1)*  ; give
}

%class_A = type {
     %vfTableStructA*  ; procs_pointer
}

%vfTableStructA = type {
     i32(%class_A*, i32)*  ; show
    ,i32(%class_A*, i1)*  ; show
}

@vtableGVarB = global %vfTableStructB  {
    i32(%class_A*, i32)* @show,
    i32(%class_A*, i1)* @show1,
    i32(%class_B*, i32)* @give,
    i32(%class_B*, i1)* @give1
}


@vtableGVarA = global %vfTableStructA  {
    i32(%class_A*, i32)* @show,
    i32(%class_A*, i1)* @show1
}


define i32 @show(%class_A* %this, i32 %x) {
init:
    %x1 = alloca i32
    store i32 %x, i32* %x1
    ;29 start statement : {
    ;30 start statement : printInt(100);
    call void @print(i32 100)
    ;30 end statement: printInt(100);
    ;31 start statement : return 0;
    ret i32 0
    

}

define i32 @show1(%class_A* %this, i1 %x) {
init:
    %x1 = alloca i1
    store i1 %x, i1* %x1
    ;34 start statement : {
    ;35 start statement : printInt(100);
    call void @print(i32 100)
    ;35 end statement: printInt(100);
    ;36 start statement : return 0;
    ret i32 0
    

}

define i32 @give(%class_B* %this, i32 %x) {
init:
    %x1 = alloca i32
    store i32 %x, i32* %x1
    ;17 start statement : {
    ;18 start statement : this.y = x;
    %iAddr = getelementptr %class_B, %class_B* %this, i32 0, i32 1
    %t = load i32, i32* %x1
    store i32 %t, i32* %iAddr
    ;18 end statement: this.y = x;
    ;19 start statement : return this.y;
    %iAddr1 = getelementptr %class_B, %class_B* %this, i32 0, i32 1
    %t1 = load i32, i32* %iAddr1
    ret i32 %t1
    

}

define i32 @give1(%class_B* %this, i1 %x) {
init:
    %x1 = alloca i1
    store i1 %x, i1* %x1
    ;22 start statement : {
    ;23 start statement : this.y = 10;
    %iAddr = getelementptr %class_B, %class_B* %this, i32 0, i32 1
    store i32 10, i32* %iAddr
    ;23 end statement: this.y = 10;
    ;24 start statement : return this.y;
    %iAddr1 = getelementptr %class_B, %class_B* %this, i32 0, i32 1
    %t = load i32, i32* %iAddr1
    ret i32 %t
    

}

define %class_B* @newClassB() {
init:
    %sizeOfStruct = add i32 0, 16
    %mallocRes = call i8* @malloc(i32 %sizeOfStruct)
    %newObject = bitcast i8* %mallocRes to %class_B*
    %iAddr = getelementptr %class_B, %class_B* %newObject, i32 0, i32 0
    store %vfTableStructB* @vtableGVarB, %vfTableStructB** %iAddr
    ret %class_B* %newObject
    

}

define %class_A* @newClassA() {
init:
    %sizeOfStruct = add i32 0, 8
    %mallocRes = call i8* @malloc(i32 %sizeOfStruct)
    %newObject = bitcast i8* %mallocRes to %class_A*
    %iAddr = getelementptr %class_A, %class_A* %newObject, i32 0, i32 0
    store %vfTableStructA* @vtableGVarA, %vfTableStructA** %iAddr
    ret %class_A* %newObject
    

}

define i32 @main() {
init:
    %a = alloca %class_B*
    %x = alloca i32
    ;1 start statement : {
    ;2 start statement : B a
    ;2 end statement: B a
    ;3 start statement : a = new B();
    %NewObjectB = call %class_B* @newClassB()
    store %class_B* %NewObjectB, %class_B** %a
    ;3 end statement: a = new B();
    ;4 start statement : int x
    ;4 end statement: int x
    ;5 start statement : x = a.give(20);
    %t = load %class_B*, %class_B** %a
    %vtableAddr = getelementptr %class_B, %class_B* %t, i32 0, i32 0
    %vtablePointer = load %vfTableStructB*, %vfTableStructB** %vtableAddr
    %procAddr = getelementptr %vfTableStructB, %vfTableStructB* %vtablePointer, i32 0, i32 2
    %procPointer = load i32(%class_B*, i32)*, i32(%class_B*, i32)** %procAddr
    %give_result = call i32 %procPointer(%class_B* %t, i32 20)
    store i32 %give_result, i32* %x
    ;5 end statement: x = a.give(20);
    ;6 start statement : printInt(x);
    %t1 = load i32, i32* %x
    call void @print(i32 %t1)
    ;6 end statement: printInt(x);
    ;8 start statement : x = a.give(true);
    %t2 = load %class_B*, %class_B** %a
    %vtableAddr1 = getelementptr %class_B, %class_B* %t2, i32 0, i32 0
    %vtablePointer1 = load %vfTableStructB*, %vfTableStructB** %vtableAddr1
    %procAddr1 = getelementptr %vfTableStructB, %vfTableStructB* %vtablePointer1, i32 0, i32 3
    %procPointer1 = load i32(%class_B*, i1)*, i32(%class_B*, i1)** %procAddr1
    %give_result1 = call i32 %procPointer1(%class_B* %t2, i1 1)
    store i32 %give_result1, i32* %x
    ;8 end statement: x = a.give(true);
    ;9 start statement : printInt(x);
    %t3 = load i32, i32* %x
    call void @print(i32 %t3)
    ;9 end statement: printInt(x);
    ;11 start statement : printInt(a.show(2));
    %t4 = load %class_B*, %class_B** %a
    %castValue = bitcast %class_B* %t4 to %class_A*
    %vtableAddr2 = getelementptr %class_A, %class_A* %castValue, i32 0, i32 0
    %vtablePointer2 = load %vfTableStructA*, %vfTableStructA** %vtableAddr2
    %procAddr2 = getelementptr %vfTableStructA, %vfTableStructA* %vtablePointer2, i32 0, i32 0
    %procPointer2 = load i32(%class_A*, i32)*, i32(%class_A*, i32)** %procAddr2
    %show_result = call i32 %procPointer2(%class_A* %castValue, i32 2)
    call void @print(i32 %show_result)
    ;11 end statement: printInt(a.show(2));
    ;12 start statement : return 0;
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
