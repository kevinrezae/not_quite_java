@.print_message_1 = private unnamed_addr constant [60 x i8] c"Nullpointer exception when reading array length in line 70\0A\00", align 1
@.print_message_2 = private unnamed_addr constant [34 x i8] c"Nullpointer exception in line 78\0A\00", align 1
@.print_message_3 = private unnamed_addr constant [38 x i8] c"Index out of bounds error in line 78\0A\00", align 1
@.print_message_4 = private unnamed_addr constant [35 x i8] c"Nullpointer exception in line 141\0A\00", align 1
@.print_message_5 = private unnamed_addr constant [39 x i8] c"Index out of bounds error in line 141\0A\00", align 1
@.print_message_6 = private unnamed_addr constant [35 x i8] c"Nullpointer exception in line 163\0A\00", align 1
@.print_message_7 = private unnamed_addr constant [39 x i8] c"Index out of bounds error in line 163\0A\00", align 1
@.print_message_8 = private unnamed_addr constant [29 x i8] c"Array Size must be positive\0A\00", align 1


%array_i32 = type {
     i32  ; length
    ,[0 x i32]  ; data
}

%class_BS = type {
     %vfTableStructBS*  ; procs_pointer
    ,%array_i32*  ; number
    ,i32  ; size
}

%vfTableStructBS = type {
     i32(%class_BS*, i32)*  ; Start
    ,i1(%class_BS*, i32)*  ; Search
    ,i32(%class_BS*, i32)*  ; Div
    ,i1(%class_BS*, i32, i32)*  ; Compare
    ,i32(%class_BS*)*  ; Print
    ,i32(%class_BS*, i32)*  ; Init
}

@vtableGVarBS = global %vfTableStructBS  {
    i32(%class_BS*, i32)* @Start,
    i1(%class_BS*, i32)* @Search,
    i32(%class_BS*, i32)* @Div,
    i1(%class_BS*, i32, i32)* @Compare,
    i32(%class_BS*)* @Print,
    i32(%class_BS*, i32)* @Init
}


define i32 @Start(%class_BS* %this, i32 %sz) {
init:
    %sz1 = alloca i32
    store i32 %sz, i32* %sz1
    %aux01 = alloca i32
    %aux02 = alloca i32
    ;16 start statement : {
    ;17 start statement : int aux01
    ;17 end statement: int aux01
    ;18 start statement : int aux02
    ;18 end statement: int aux02
    ;19 start statement : aux01 = this.Init(sz);
    %t = load i32, i32* %sz1
    %vtableAddr = getelementptr %class_BS, %class_BS* %this, i32 0, i32 0
    %vtablePointer = load %vfTableStructBS*, %vfTableStructBS** %vtableAddr
    %procAddr = getelementptr %vfTableStructBS, %vfTableStructBS* %vtablePointer, i32 0, i32 5
    %procPointer = load i32(%class_BS*, i32)*, i32(%class_BS*, i32)** %procAddr
    %Init_result = call i32 %procPointer(%class_BS* %this, i32 %t)
    store i32 %Init_result, i32* %aux01
    ;19 end statement: aux01 = this.Init(sz);
    ;20 start statement : aux02 = this.Print();
    %vtableAddr1 = getelementptr %class_BS, %class_BS* %this, i32 0, i32 0
    %vtablePointer1 = load %vfTableStructBS*, %vfTableStructBS** %vtableAddr1
    %procAddr1 = getelementptr %vfTableStructBS, %vfTableStructBS* %vtablePointer1, i32 0, i32 4
    %procPointer1 = load i32(%class_BS*)*, i32(%class_BS*)** %procAddr1
    %Print_result = call i32 %procPointer1(%class_BS* %this)
    store i32 %Print_result, i32* %aux02
    ;20 end statement: aux02 = this.Print();
    ;21 start statement : if (this.Search(8)) printInt(1);
    %vtableAddr2 = getelementptr %class_BS, %class_BS* %this, i32 0, i32 0
    %vtablePointer2 = load %vfTableStructBS*, %vfTableStructBS** %vtableAddr2
    %procAddr2 = getelementptr %vfTableStructBS, %vfTableStructBS* %vtablePointer2, i32 0, i32 1
    %procPointer2 = load i1(%class_BS*, i32)*, i1(%class_BS*, i32)** %procAddr2
    %Search_result = call i1 %procPointer2(%class_BS* %this, i32 8)
    br i1 %Search_result, label %ifTrue, label %ifFalse
    
ifTrue:
    ;22 start statement : printInt(1);
    call void @print(i32 1)
    ;22 end statement: printInt(1);
    br label %endif
    
ifFalse:
    ;24 start statement : printInt(0);
    call void @print(i32 0)
    ;24 end statement: printInt(0);
    br label %endif
    
endif:
    ;21 end statement: if (this.Search(8)) printInt(1);
    ;25 start statement : if (this.Search(19)) printInt(1);
    %vtableAddr3 = getelementptr %class_BS, %class_BS* %this, i32 0, i32 0
    %vtablePointer3 = load %vfTableStructBS*, %vfTableStructBS** %vtableAddr3
    %procAddr3 = getelementptr %vfTableStructBS, %vfTableStructBS* %vtablePointer3, i32 0, i32 1
    %procPointer3 = load i1(%class_BS*, i32)*, i1(%class_BS*, i32)** %procAddr3
    %Search_result1 = call i1 %procPointer3(%class_BS* %this, i32 19)
    br i1 %Search_result1, label %ifTrue1, label %ifFalse1
    
ifTrue1:
    ;26 start statement : printInt(1);
    call void @print(i32 1)
    ;26 end statement: printInt(1);
    br label %endif1
    
ifFalse1:
    ;28 start statement : printInt(0);
    call void @print(i32 0)
    ;28 end statement: printInt(0);
    br label %endif1
    
endif1:
    ;25 end statement: if (this.Search(19)) printInt(1);
    ;29 start statement : if (this.Search(20)) printInt(1);
    %vtableAddr4 = getelementptr %class_BS, %class_BS* %this, i32 0, i32 0
    %vtablePointer4 = load %vfTableStructBS*, %vfTableStructBS** %vtableAddr4
    %procAddr4 = getelementptr %vfTableStructBS, %vfTableStructBS* %vtablePointer4, i32 0, i32 1
    %procPointer4 = load i1(%class_BS*, i32)*, i1(%class_BS*, i32)** %procAddr4
    %Search_result2 = call i1 %procPointer4(%class_BS* %this, i32 20)
    br i1 %Search_result2, label %ifTrue2, label %ifFalse2
    
ifTrue2:
    ;30 start statement : printInt(1);
    call void @print(i32 1)
    ;30 end statement: printInt(1);
    br label %endif2
    
ifFalse2:
    ;32 start statement : printInt(0);
    call void @print(i32 0)
    ;32 end statement: printInt(0);
    br label %endif2
    
endif2:
    ;29 end statement: if (this.Search(20)) printInt(1);
    ;33 start statement : if (this.Search(21)) printInt(1);
    %vtableAddr5 = getelementptr %class_BS, %class_BS* %this, i32 0, i32 0
    %vtablePointer5 = load %vfTableStructBS*, %vfTableStructBS** %vtableAddr5
    %procAddr5 = getelementptr %vfTableStructBS, %vfTableStructBS* %vtablePointer5, i32 0, i32 1
    %procPointer5 = load i1(%class_BS*, i32)*, i1(%class_BS*, i32)** %procAddr5
    %Search_result3 = call i1 %procPointer5(%class_BS* %this, i32 21)
    br i1 %Search_result3, label %ifTrue3, label %ifFalse3
    
ifTrue3:
    ;34 start statement : printInt(1);
    call void @print(i32 1)
    ;34 end statement: printInt(1);
    br label %endif3
    
ifFalse3:
    ;36 start statement : printInt(0);
    call void @print(i32 0)
    ;36 end statement: printInt(0);
    br label %endif3
    
endif3:
    ;33 end statement: if (this.Search(21)) printInt(1);
    ;37 start statement : if (this.Search(37)) printInt(1);
    %vtableAddr6 = getelementptr %class_BS, %class_BS* %this, i32 0, i32 0
    %vtablePointer6 = load %vfTableStructBS*, %vfTableStructBS** %vtableAddr6
    %procAddr6 = getelementptr %vfTableStructBS, %vfTableStructBS* %vtablePointer6, i32 0, i32 1
    %procPointer6 = load i1(%class_BS*, i32)*, i1(%class_BS*, i32)** %procAddr6
    %Search_result4 = call i1 %procPointer6(%class_BS* %this, i32 37)
    br i1 %Search_result4, label %ifTrue4, label %ifFalse4
    
ifTrue4:
    ;38 start statement : printInt(1);
    call void @print(i32 1)
    ;38 end statement: printInt(1);
    br label %endif4
    
ifFalse4:
    ;40 start statement : printInt(0);
    call void @print(i32 0)
    ;40 end statement: printInt(0);
    br label %endif4
    
endif4:
    ;37 end statement: if (this.Search(37)) printInt(1);
    ;41 start statement : if (this.Search(38)) printInt(1);
    %vtableAddr7 = getelementptr %class_BS, %class_BS* %this, i32 0, i32 0
    %vtablePointer7 = load %vfTableStructBS*, %vfTableStructBS** %vtableAddr7
    %procAddr7 = getelementptr %vfTableStructBS, %vfTableStructBS* %vtablePointer7, i32 0, i32 1
    %procPointer7 = load i1(%class_BS*, i32)*, i1(%class_BS*, i32)** %procAddr7
    %Search_result5 = call i1 %procPointer7(%class_BS* %this, i32 38)
    br i1 %Search_result5, label %ifTrue5, label %ifFalse5
    
ifTrue5:
    ;42 start statement : printInt(1);
    call void @print(i32 1)
    ;42 end statement: printInt(1);
    br label %endif5
    
ifFalse5:
    ;44 start statement : printInt(0);
    call void @print(i32 0)
    ;44 end statement: printInt(0);
    br label %endif5
    
endif5:
    ;41 end statement: if (this.Search(38)) printInt(1);
    ;45 start statement : if (this.Search(39)) printInt(1);
    %vtableAddr8 = getelementptr %class_BS, %class_BS* %this, i32 0, i32 0
    %vtablePointer8 = load %vfTableStructBS*, %vfTableStructBS** %vtableAddr8
    %procAddr8 = getelementptr %vfTableStructBS, %vfTableStructBS* %vtablePointer8, i32 0, i32 1
    %procPointer8 = load i1(%class_BS*, i32)*, i1(%class_BS*, i32)** %procAddr8
    %Search_result6 = call i1 %procPointer8(%class_BS* %this, i32 39)
    br i1 %Search_result6, label %ifTrue6, label %ifFalse6
    
ifTrue6:
    ;46 start statement : printInt(1);
    call void @print(i32 1)
    ;46 end statement: printInt(1);
    br label %endif6
    
ifFalse6:
    ;48 start statement : printInt(0);
    call void @print(i32 0)
    ;48 end statement: printInt(0);
    br label %endif6
    
endif6:
    ;45 end statement: if (this.Search(39)) printInt(1);
    ;49 start statement : if (this.Search(50)) printInt(1);
    %vtableAddr9 = getelementptr %class_BS, %class_BS* %this, i32 0, i32 0
    %vtablePointer9 = load %vfTableStructBS*, %vfTableStructBS** %vtableAddr9
    %procAddr9 = getelementptr %vfTableStructBS, %vfTableStructBS* %vtablePointer9, i32 0, i32 1
    %procPointer9 = load i1(%class_BS*, i32)*, i1(%class_BS*, i32)** %procAddr9
    %Search_result7 = call i1 %procPointer9(%class_BS* %this, i32 50)
    br i1 %Search_result7, label %ifTrue7, label %ifFalse7
    
ifTrue7:
    ;50 start statement : printInt(1);
    call void @print(i32 1)
    ;50 end statement: printInt(1);
    br label %endif7
    
ifFalse7:
    ;52 start statement : printInt(0);
    call void @print(i32 0)
    ;52 end statement: printInt(0);
    br label %endif7
    
endif7:
    ;49 end statement: if (this.Search(50)) printInt(1);
    ;54 start statement : return 999;
    ret i32 999
    

}

define i1 @Search(%class_BS* %this, i32 %num) {
init:
    %num1 = alloca i32
    store i32 %num, i32* %num1
    %bs01 = alloca i1
    %right = alloca i32
    %left = alloca i32
    %var_cont = alloca i1
    %medium = alloca i32
    %aux01 = alloca i32
    %nt = alloca i32
    ;59 start statement : {
    ;60 start statement : boolean bs01
    ;60 end statement: boolean bs01
    ;61 start statement : int right
    ;61 end statement: int right
    ;62 start statement : int left
    ;62 end statement: int left
    ;63 start statement : boolean var_cont
    ;63 end statement: boolean var_cont
    ;64 start statement : int medium
    ;64 end statement: int medium
    ;65 start statement : int aux01
    ;65 end statement: int aux01
    ;66 start statement : int nt
    ;66 end statement: int nt
    ;68 start statement : aux01 = 0;
    store i32 0, i32* %aux01
    ;68 end statement: aux01 = 0;
    ;69 start statement : bs01 = false;
    store i1 0, i1* %bs01
    ;69 end statement: bs01 = false;
    ;70 start statement : right = number.length;
    %iAddr = getelementptr %class_BS, %class_BS* %this, i32 0, i32 1
    %t = load %array_i32*, %array_i32** %iAddr
    %isNull = icmp eq %array_i32* %t, null
    br i1 %isNull, label %whenIsNull, label %notNull
    
whenIsNull:
    ; ERROR: Nullpointer exception when reading array length in line 70
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.print_message_1, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
notNull:
    %length_addr = getelementptr %array_i32, %array_i32* %t, i32 0, i32 0
    %len = load i32, i32* %length_addr
    store i32 %len, i32* %right
    ;70 end statement: right = number.length;
    ;71 start statement : right = (right - 1);
    %t1 = load i32, i32* %right
    %resSubImpl = sub i32 %t1, 1
    store i32 %resSubImpl, i32* %right
    ;71 end statement: right = (right - 1);
    ;73 start statement : left = 1;
    store i32 1, i32* %left
    ;73 end statement: left = 1;
    ;74 start statement : var_cont = true;
    store i1 1, i1* %var_cont
    ;74 end statement: var_cont = true;
    ;75 start statement : while (var_cont) {
    br label %whileStart
    
whileStart:
    %t2 = load i1, i1* %var_cont
    br i1 %t2, label %loopBodyStart, label %endloop
    
loopBodyStart:
    ;75 start statement : {
    ;76 start statement : medium = (left + right);
    %t3 = load i32, i32* %left
    %t4 = load i32, i32* %right
    %resAddImpl = add i32 %t3, %t4
    store i32 %resAddImpl, i32* %medium
    ;76 end statement: medium = (left + right);
    ;77 start statement : medium = this.Div(medium);
    %t5 = load i32, i32* %medium
    %vtableAddr = getelementptr %class_BS, %class_BS* %this, i32 0, i32 0
    %vtablePointer = load %vfTableStructBS*, %vfTableStructBS** %vtableAddr
    %procAddr = getelementptr %vfTableStructBS, %vfTableStructBS* %vtablePointer, i32 0, i32 2
    %procPointer = load i32(%class_BS*, i32)*, i32(%class_BS*, i32)** %procAddr
    %Div_result = call i32 %procPointer(%class_BS* %this, i32 %t5)
    store i32 %Div_result, i32* %medium
    ;77 end statement: medium = this.Div(medium);
    ;78 start statement : aux01 = number[medium];
    %iAddr1 = getelementptr %class_BS, %class_BS* %this, i32 0, i32 1
    %t6 = load %array_i32*, %array_i32** %iAddr1
    %isNull1 = icmp eq %array_i32* %t6, null
    br i1 %isNull1, label %whenIsNull1, label %notNull1
    
whenIsNull1:
    ; ERROR: Nullpointer exception in line 78
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.print_message_2, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
notNull1:
    %t7 = load i32, i32* %medium
    %length_addr1 = getelementptr %array_i32, %array_i32* %t6, i32 0, i32 0
    %len1 = load i32, i32* %length_addr1
    %smallerZero = icmp slt i32 %t7, 0
    %lenMinusOne = sub i32 %len1, 1
    %greaterEqualLen = icmp slt i32 %lenMinusOne, %t7
    %outOfBounds = or i1 %smallerZero, %greaterEqualLen
    br i1 %outOfBounds, label %outOfBounds1, label %indexInRange
    
outOfBounds1:
    ; ERROR: Index out of bounds error in line 78
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.print_message_3, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
indexInRange:
    %indexAddr = getelementptr %array_i32, %array_i32* %t6, i32 0, i32 1, i32 %t7
    %t8 = load i32, i32* %indexAddr
    store i32 %t8, i32* %aux01
    ;78 end statement: aux01 = number[medium];
    ;79 start statement : if ((num < aux01)) right = (medium - 1);
    %t9 = load i32, i32* %num1
    %t10 = load i32, i32* %aux01
    %resSltImpl = icmp slt i32 %t9, %t10
    br i1 %resSltImpl, label %ifTrue, label %ifFalse
    
ifTrue:
    ;80 start statement : right = (medium - 1);
    %t11 = load i32, i32* %medium
    %resSubImpl1 = sub i32 %t11, 1
    store i32 %resSubImpl1, i32* %right
    ;80 end statement: right = (medium - 1);
    br label %endif
    
ifFalse:
    ;82 start statement : left = (medium + 1);
    %t12 = load i32, i32* %medium
    %resAddImpl1 = add i32 %t12, 1
    store i32 %resAddImpl1, i32* %left
    ;82 end statement: left = (medium + 1);
    br label %endif
    
endif:
    ;79 end statement: if ((num < aux01)) right = (medium - 1);
    ;83 start statement : if (this.Compare(aux01, num)) var_cont = false;
    %t13 = load i32, i32* %aux01
    %t14 = load i32, i32* %num1
    %vtableAddr1 = getelementptr %class_BS, %class_BS* %this, i32 0, i32 0
    %vtablePointer1 = load %vfTableStructBS*, %vfTableStructBS** %vtableAddr1
    %procAddr1 = getelementptr %vfTableStructBS, %vfTableStructBS* %vtablePointer1, i32 0, i32 3
    %procPointer1 = load i1(%class_BS*, i32, i32)*, i1(%class_BS*, i32, i32)** %procAddr1
    %Compare_result = call i1 %procPointer1(%class_BS* %this, i32 %t13, i32 %t14)
    br i1 %Compare_result, label %ifTrue1, label %ifFalse1
    
ifTrue1:
    ;84 start statement : var_cont = false;
    store i1 0, i1* %var_cont
    ;84 end statement: var_cont = false;
    br label %endif1
    
ifFalse1:
    ;86 start statement : var_cont = true;
    store i1 1, i1* %var_cont
    ;86 end statement: var_cont = true;
    br label %endif1
    
endif1:
    ;83 end statement: if (this.Compare(aux01, num)) var_cont = false;
    ;87 start statement : if ((right < left)) var_cont = false;
    %t15 = load i32, i32* %right
    %t16 = load i32, i32* %left
    %resSltImpl1 = icmp slt i32 %t15, %t16
    br i1 %resSltImpl1, label %ifTrue2, label %ifFalse2
    
ifTrue2:
    ;88 start statement : var_cont = false;
    store i1 0, i1* %var_cont
    ;88 end statement: var_cont = false;
    br label %endif2
    
ifFalse2:
    ;90 start statement : nt = 0;
    store i32 0, i32* %nt
    ;90 end statement: nt = 0;
    br label %endif2
    
endif2:
    ;87 end statement: if ((right < left)) var_cont = false;
    ;75 end statement: {
    br label %whileStart
    
endloop:
    ;75 end statement: while (var_cont) {
    ;93 start statement : if (this.Compare(aux01, num)) bs01 = true;
    %t17 = load i32, i32* %aux01
    %t18 = load i32, i32* %num1
    %vtableAddr2 = getelementptr %class_BS, %class_BS* %this, i32 0, i32 0
    %vtablePointer2 = load %vfTableStructBS*, %vfTableStructBS** %vtableAddr2
    %procAddr2 = getelementptr %vfTableStructBS, %vfTableStructBS* %vtablePointer2, i32 0, i32 3
    %procPointer2 = load i1(%class_BS*, i32, i32)*, i1(%class_BS*, i32, i32)** %procAddr2
    %Compare_result1 = call i1 %procPointer2(%class_BS* %this, i32 %t17, i32 %t18)
    br i1 %Compare_result1, label %ifTrue3, label %ifFalse3
    
ifTrue3:
    ;94 start statement : bs01 = true;
    store i1 1, i1* %bs01
    ;94 end statement: bs01 = true;
    br label %endif3
    
ifFalse3:
    ;96 start statement : bs01 = false;
    store i1 0, i1* %bs01
    ;96 end statement: bs01 = false;
    br label %endif3
    
endif3:
    ;93 end statement: if (this.Compare(aux01, num)) bs01 = true;
    ;97 start statement : return bs01;
    %t19 = load i1, i1* %bs01
    ret i1 %t19
    

}

define i32 @Div(%class_BS* %this, i32 %num) {
init:
    %num1 = alloca i32
    store i32 %num, i32* %num1
    %count01 = alloca i32
    %count02 = alloca i32
    %aux03 = alloca i32
    ;102 start statement : {
    ;103 start statement : int count01
    ;103 end statement: int count01
    ;104 start statement : int count02
    ;104 end statement: int count02
    ;105 start statement : int aux03
    ;105 end statement: int aux03
    ;107 start statement : count01 = 0;
    store i32 0, i32* %count01
    ;107 end statement: count01 = 0;
    ;108 start statement : count02 = 0;
    store i32 0, i32* %count02
    ;108 end statement: count02 = 0;
    ;109 start statement : aux03 = (num - 1);
    %t = load i32, i32* %num1
    %resSubImpl = sub i32 %t, 1
    store i32 %resSubImpl, i32* %aux03
    ;109 end statement: aux03 = (num - 1);
    ;110 start statement : while ((count02 < aux03)) {
    br label %whileStart
    
whileStart:
    %t1 = load i32, i32* %count02
    %t2 = load i32, i32* %aux03
    %resSltImpl = icmp slt i32 %t1, %t2
    br i1 %resSltImpl, label %loopBodyStart, label %endloop
    
loopBodyStart:
    ;110 start statement : {
    ;111 start statement : count01 = (count01 + 1);
    %t3 = load i32, i32* %count01
    %resAddImpl = add i32 %t3, 1
    store i32 %resAddImpl, i32* %count01
    ;111 end statement: count01 = (count01 + 1);
    ;112 start statement : count02 = (count02 + 2);
    %t4 = load i32, i32* %count02
    %resAddImpl1 = add i32 %t4, 2
    store i32 %resAddImpl1, i32* %count02
    ;112 end statement: count02 = (count02 + 2);
    ;110 end statement: {
    br label %whileStart
    
endloop:
    ;110 end statement: while ((count02 < aux03)) {
    ;114 start statement : return count01;
    %t5 = load i32, i32* %count01
    ret i32 %t5
    

}

define i1 @Compare(%class_BS* %this, i32 %num1, i32 %num2) {
init:
    %num11 = alloca i32
    store i32 %num1, i32* %num11
    %num21 = alloca i32
    store i32 %num2, i32* %num21
    %retval = alloca i1
    %aux02 = alloca i32
    ;120 start statement : {
    ;121 start statement : boolean retval
    ;121 end statement: boolean retval
    ;122 start statement : int aux02
    ;122 end statement: int aux02
    ;124 start statement : retval = false;
    store i1 0, i1* %retval
    ;124 end statement: retval = false;
    ;125 start statement : aux02 = (num2 + 1);
    %t = load i32, i32* %num21
    %resAddImpl = add i32 %t, 1
    store i32 %resAddImpl, i32* %aux02
    ;125 end statement: aux02 = (num2 + 1);
    ;126 start statement : if ((num1 < num2)) retval = false;
    %t1 = load i32, i32* %num11
    %t2 = load i32, i32* %num21
    %resSltImpl = icmp slt i32 %t1, %t2
    br i1 %resSltImpl, label %ifTrue, label %ifFalse
    
ifTrue:
    ;127 start statement : retval = false;
    store i1 0, i1* %retval
    ;127 end statement: retval = false;
    br label %endif1
    
ifFalse:
    ;128 start statement : if ((! (num1 < aux02))) retval = false;
    %t3 = load i32, i32* %num11
    %t4 = load i32, i32* %aux02
    %resSltImpl1 = icmp slt i32 %t3, %t4
    %neg_res = icmp eq i1 0, %resSltImpl1
    br i1 %neg_res, label %ifTrue1, label %ifFalse1
    
ifTrue1:
    ;129 start statement : retval = false;
    store i1 0, i1* %retval
    ;129 end statement: retval = false;
    br label %endif
    
ifFalse1:
    ;131 start statement : retval = true;
    store i1 1, i1* %retval
    ;131 end statement: retval = true;
    br label %endif
    
endif:
    ;128 end statement: if ((! (num1 < aux02))) retval = false;
    br label %endif1
    
endif1:
    ;126 end statement: if ((num1 < num2)) retval = false;
    ;132 start statement : return retval;
    %t5 = load i1, i1* %retval
    ret i1 %t5
    

}

define i32 @Print(%class_BS* %this) {
init:
    %j = alloca i32
    ;136 start statement : {
    ;137 start statement : int j
    ;137 end statement: int j
    ;139 start statement : j = 1;
    store i32 1, i32* %j
    ;139 end statement: j = 1;
    ;140 start statement : while ((j < size)) {
    br label %whileStart
    
whileStart:
    %t = load i32, i32* %j
    %iAddr = getelementptr %class_BS, %class_BS* %this, i32 0, i32 2
    %t1 = load i32, i32* %iAddr
    %resSltImpl = icmp slt i32 %t, %t1
    br i1 %resSltImpl, label %loopBodyStart, label %endloop
    
loopBodyStart:
    ;140 start statement : {
    ;141 start statement : printInt(number[j]);
    %iAddr1 = getelementptr %class_BS, %class_BS* %this, i32 0, i32 1
    %t2 = load %array_i32*, %array_i32** %iAddr1
    %isNull = icmp eq %array_i32* %t2, null
    br i1 %isNull, label %whenIsNull, label %notNull
    
whenIsNull:
    ; ERROR: Nullpointer exception in line 141
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.print_message_4, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
notNull:
    %t3 = load i32, i32* %j
    %length_addr = getelementptr %array_i32, %array_i32* %t2, i32 0, i32 0
    %len = load i32, i32* %length_addr
    %smallerZero = icmp slt i32 %t3, 0
    %lenMinusOne = sub i32 %len, 1
    %greaterEqualLen = icmp slt i32 %lenMinusOne, %t3
    %outOfBounds = or i1 %smallerZero, %greaterEqualLen
    br i1 %outOfBounds, label %outOfBounds1, label %indexInRange
    
outOfBounds1:
    ; ERROR: Index out of bounds error in line 141
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.print_message_5, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
indexInRange:
    %indexAddr = getelementptr %array_i32, %array_i32* %t2, i32 0, i32 1, i32 %t3
    %t4 = load i32, i32* %indexAddr
    call void @print(i32 %t4)
    ;141 end statement: printInt(number[j]);
    ;142 start statement : j = (j + 1);
    %t5 = load i32, i32* %j
    %resAddImpl = add i32 %t5, 1
    store i32 %resAddImpl, i32* %j
    ;142 end statement: j = (j + 1);
    ;140 end statement: {
    br label %whileStart
    
endloop:
    ;140 end statement: while ((j < size)) {
    ;144 start statement : printInt(99999);
    call void @print(i32 99999)
    ;144 end statement: printInt(99999);
    ;145 start statement : return 0;
    ret i32 0
    

}

define i32 @Init(%class_BS* %this, i32 %sz) {
init:
    %sz1 = alloca i32
    store i32 %sz, i32* %sz1
    %j = alloca i32
    %k = alloca i32
    %aux02 = alloca i32
    %aux01 = alloca i32
    ;149 start statement : {
    ;150 start statement : int j
    ;150 end statement: int j
    ;151 start statement : int k
    ;151 end statement: int k
    ;152 start statement : int aux02
    ;152 end statement: int aux02
    ;153 start statement : int aux01
    ;153 end statement: int aux01
    ;155 start statement : size = sz;
    %iAddr = getelementptr %class_BS, %class_BS* %this, i32 0, i32 2
    %t = load i32, i32* %sz1
    store i32 %t, i32* %iAddr
    ;155 end statement: size = sz;
    ;156 start statement : number = (new int[sz]);
    %iAddr1 = getelementptr %class_BS, %class_BS* %this, i32 0, i32 1
    %t1 = load i32, i32* %sz1
    %newArray1 = call %array_i32* @newArray(i32 %t1)
    store %array_i32* %newArray1, %array_i32** %iAddr1
    ;156 end statement: number = (new int[sz]);
    ;158 start statement : j = 1;
    store i32 1, i32* %j
    ;158 end statement: j = 1;
    ;159 start statement : k = (size + 1);
    %iAddr2 = getelementptr %class_BS, %class_BS* %this, i32 0, i32 2
    %t2 = load i32, i32* %iAddr2
    %resAddImpl = add i32 %t2, 1
    store i32 %resAddImpl, i32* %k
    ;159 end statement: k = (size + 1);
    ;160 start statement : while ((j < size)) {
    br label %whileStart
    
whileStart:
    %t3 = load i32, i32* %j
    %iAddr3 = getelementptr %class_BS, %class_BS* %this, i32 0, i32 2
    %t4 = load i32, i32* %iAddr3
    %resSltImpl = icmp slt i32 %t3, %t4
    br i1 %resSltImpl, label %loopBodyStart, label %endloop
    
loopBodyStart:
    ;160 start statement : {
    ;161 start statement : aux01 = (2 * j);
    %t5 = load i32, i32* %j
    %resMulImpl = mul i32 2, %t5
    store i32 %resMulImpl, i32* %aux01
    ;161 end statement: aux01 = (2 * j);
    ;162 start statement : aux02 = (k - 3);
    %t6 = load i32, i32* %k
    %resSubImpl = sub i32 %t6, 3
    store i32 %resSubImpl, i32* %aux02
    ;162 end statement: aux02 = (k - 3);
    ;163 start statement : number[j] = (aux01 + aux02);
    %iAddr4 = getelementptr %class_BS, %class_BS* %this, i32 0, i32 1
    %t7 = load %array_i32*, %array_i32** %iAddr4
    %isNull = icmp eq %array_i32* %t7, null
    br i1 %isNull, label %whenIsNull, label %notNull
    
whenIsNull:
    ; ERROR: Nullpointer exception in line 163
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.print_message_6, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
notNull:
    %t8 = load i32, i32* %j
    %length_addr = getelementptr %array_i32, %array_i32* %t7, i32 0, i32 0
    %len = load i32, i32* %length_addr
    %smallerZero = icmp slt i32 %t8, 0
    %lenMinusOne = sub i32 %len, 1
    %greaterEqualLen = icmp slt i32 %lenMinusOne, %t8
    %outOfBounds = or i1 %smallerZero, %greaterEqualLen
    br i1 %outOfBounds, label %outOfBounds1, label %indexInRange
    
outOfBounds1:
    ; ERROR: Index out of bounds error in line 163
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.print_message_7, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
indexInRange:
    %indexAddr = getelementptr %array_i32, %array_i32* %t7, i32 0, i32 1, i32 %t8
    %t9 = load i32, i32* %aux01
    %t10 = load i32, i32* %aux02
    %resAddImpl1 = add i32 %t9, %t10
    store i32 %resAddImpl1, i32* %indexAddr
    ;163 end statement: number[j] = (aux01 + aux02);
    ;164 start statement : j = (j + 1);
    %t11 = load i32, i32* %j
    %resAddImpl2 = add i32 %t11, 1
    store i32 %resAddImpl2, i32* %j
    ;164 end statement: j = (j + 1);
    ;165 start statement : k = (k - 1);
    %t12 = load i32, i32* %k
    %resSubImpl1 = sub i32 %t12, 1
    store i32 %resSubImpl1, i32* %k
    ;165 end statement: k = (k - 1);
    ;160 end statement: {
    br label %whileStart
    
endloop:
    ;160 end statement: while ((j < size)) {
    ;167 start statement : return 0;
    ret i32 0
    

}

define %class_BS* @newClassBS() {
init:
    %sizeOfStruct = add i32 0, 24
    %mallocRes = call i8* @malloc(i32 %sizeOfStruct)
    %newObject = bitcast i8* %mallocRes to %class_BS*
    %iAddr = getelementptr %class_BS, %class_BS* %newObject, i32 0, i32 0
    store %vfTableStructBS* @vtableGVarBS, %vfTableStructBS** %iAddr
    ret %class_BS* %newObject
    

}

define i32 @main() {
init:
    ;1 start statement : {
    ;2 start statement : printInt(new BS().Start(20));
    %NewObjectBS = call %class_BS* @newClassBS()
    %vtableAddr = getelementptr %class_BS, %class_BS* %NewObjectBS, i32 0, i32 0
    %vtablePointer = load %vfTableStructBS*, %vfTableStructBS** %vtableAddr
    %procAddr = getelementptr %vfTableStructBS, %vfTableStructBS* %vtablePointer, i32 0, i32 0
    %procPointer = load i32(%class_BS*, i32)*, i32(%class_BS*, i32)** %procAddr
    %Start_result = call i32 %procPointer(%class_BS* %NewObjectBS, i32 20)
    call void @print(i32 %Start_result)
    ;2 end statement: printInt(new BS().Start(20));
    ;3 start statement : return 0;
    ret i32 0
    

}

define %array_i32* @newArray(i32 %size) {
init:
    %sizeLessThanZero = icmp slt i32 %size, 0
    br i1 %sizeLessThanZero, label %negativeSize, label %goodSize
    
negativeSize:
    ; ERROR: Array Size must be positive
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.print_message_8, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
goodSize:
    %arraySizeInBytes = mul i32 %size, 4
    %arraySizeWitLen = add i32 %arraySizeInBytes, 4
    %mallocRes = call i8* @malloc(i32 %arraySizeWitLen)
    %newArray1 = bitcast i8* %mallocRes to %array_i32*
    %sizeAddr = getelementptr %array_i32, %array_i32* %newArray1, i32 0, i32 0
    store i32 %size, i32* %sizeAddr
    %iVar = alloca i32
    store i32 0, i32* %iVar
    br label %loopStart
    
loopStart:
    %i = load i32, i32* %iVar
    %smallerSize = icmp slt i32 %i, %size
    br i1 %smallerSize, label %loopBody, label %loopEnd
    
loopBody:
    %iAddr = getelementptr %array_i32, %array_i32* %newArray1, i32 0, i32 1, i32 %i
    store i32 0, i32* %iAddr
    %nextI = add i32 %i, 1
    store i32 %nextI, i32* %iVar
    br label %loopStart
    
loopEnd:
    ret %array_i32* %newArray1
    

}


declare noalias i8* @malloc(i32)

declare i32 @printf(i8*, ...)

declare void @exit(i32)

@.printstr = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
define void @print(i32 %i) {
	%temp = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.printstr, i32 0, i32 0), i32 %i)
	ret void
}
