%class.A = type { i8* }
%class.C = type { i8* }
%class.B = type { %class.C }

declare i8* @calloc(i32, i32)
declare void @exit(i32)
declare i32 @printf(i8*, ...)
@.str = constant [4 x i8] c"%d\0A\00"

@.out = private unnamed_addr constant [15 x i8] c"Out of bounds\0A\00"

%bool_array = type { i32, i8* }

@A__vtable = global [7 x i8*] [
  i8* bitcast (i1(i8*)* @A__t to i8*),
  i8* bitcast (i32(i8*)* @A__t2 to i8*),
  i8* bitcast (i32(i8*, i32*)* @A__lispy to i8*),
  i8* bitcast (i1(i8*)* @A__t3 to i8*),
  i8* bitcast (i1(i8*, i32, i32*)* @A__t4 to i8*),
  i8* bitcast (i32(i8*, i32*)* @A__t5 to i8*),
  i8* bitcast (i1(i8*, i1, i32*)* @A__t6 to i8*)
]

define i1 @A__t(i8* %v0) {
entry:
  ; Allocate stack space for all locals (params and vars).
  ; Initialize params to the passed argument and vars to 0.
  %v1 = icmp slt i32 1, 2
  %v2 = icmp eq i1 %v1, false
  br i1 %v2, label %and, label %and_end

and:
  br i1 true, label %and1, label %and_end1

and1:
  br label %and_end1

and_end1:
  %v3 = phi i1 [ false, %and ], [ false, %and1 ]
  br label %and_end

and_end:
  %v4 = phi i1 [ false, %entry ], [ %v3, %and_end1 ]
  ret i1 %v4
}

define i32 @A__t2(i8* %v0) {
entry:
  ; Allocate stack space for all locals (params and vars).
  ; Initialize params to the passed argument and vars to 0.
  %v1 = add i32 1, 2
  %v2 = add i32 %v1, 3
  %v3 = add i32 %v2, 4
  ret i32 %v3
}

define i32 @A__lispy(i8* %v0, i32* %v1) {
entry:
  ; Allocate stack space for all locals (params and vars).
  ; Initialize params to the passed argument and vars to 0.
  %v2 = alloca i32*
  store i32* %v1, i32** %v2
  %v3 = add i32 1, 2
  %v4 = load i32*, i32** %v2
  %v5 = load i32, i32* %v4
  %v6 = icmp sge i32 3, %v5
  br i1 %v6, label %bounds, label %bounds_end

bounds:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

bounds_end:
  %v7 = icmp slt i32 3, 0
  br i1 %v7, label %neg_index, label %neg_index_end

neg_index:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

neg_index_end:
  %v8 = add i32 3, 1
  %v9 = getelementptr inbounds i32, i32* %v4, i32 %v8
  %v10 = load i32, i32* %v9
  %v11 = add i32 %v3, %v10
  ret i32 %v11
}

define i1 @A__t3(i8* %v0) {
entry:
  ; Allocate stack space for all locals (params and vars).
  ; Initialize params to the passed argument and vars to 0.
  %v1 = alloca i32
  store i32 0, i32* %v1
  %v2 = alloca i32
  store i32 0, i32* %v2
  store i32 2, i32* %v1
  store i32 2, i32* %v2
  %v3 = add i32 349, 908
  %v4 = load i32, i32* %v1
  %v5 = load i32, i32* %v2
  %v6 = sub i32 %v5, 2
  %v7 = sub i32 %v4, %v6
  %v8 = icmp slt i32 %v3, %v7
  ret i1 %v8
}

define i1 @A__t4(i8* %v0, i32 %v1, i32* %v2) {
entry:
  ; Allocate stack space for all locals (params and vars).
  ; Initialize params to the passed argument and vars to 0.
  %v3 = alloca i32
  store i32 %v1, i32* %v3
  %v4 = alloca i32*
  store i32* %v2, i32** %v4
  %v5 = alloca i32*
  store i32* null, i32** %v5
  %v6 = add i32 10, 1
  %v7 = mul i32 %v6, 4
  %v8 = call i8* @calloc(i32 1, i32 %v7)
  %v9 = bitcast i8* %v8 to i32*
  store i32* %v9, i32** %v5
  %v10 = bitcast i8* %v0 to i8***
  %v11 = load i8**, i8*** %v10
  %v12 = getelementptr inbounds i8*, i8** %v11, i32 1
  %v13 = load i8*, i8** %v12
  %v14 = bitcast i8* %v13 to i32(i8*)*
  ; A__t2
  %v15 = call i32 %v14(i8* %v0)
  %v16 = add i32 29347, %v15
  %v17 = icmp slt i32 %v16, 12
  br i1 %v17, label %and, label %and_end

and:
  %v18 = load i32, i32* %v3
  %v19 = load i32*, i32** %v5
  %v20 = load i32, i32* %v19
  %v21 = icmp sge i32 0, %v20
  br i1 %v21, label %bounds, label %bounds_end

bounds:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

bounds_end:
  %v22 = icmp slt i32 0, 0
  br i1 %v22, label %neg_index, label %neg_index_end

neg_index:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

neg_index_end:
  %v23 = add i32 0, 1
  %v24 = getelementptr inbounds i32, i32* %v19, i32 %v23
  %v25 = load i32, i32* %v24
  %v26 = icmp slt i32 %v18, %v25
  br i1 %v26, label %and1, label %and_end1

and1:
  %v27 = bitcast i8* %v0 to i8***
  %v28 = load i8**, i8*** %v27
  %v29 = getelementptr inbounds i8*, i8** %v28, i32 3
  %v30 = load i8*, i8** %v29
  %v31 = bitcast i8* %v30 to i1(i8*)*
  ; A__t3
  %v32 = call i1 %v31(i8* %v0)
  br label %and_end1

and_end1:
  %v33 = phi i1 [ false, %neg_index_end ], [ %v32, %and1 ]
  br i1 %v33, label %and2, label %and_end2

and2:
  %v34 = bitcast i8* %v0 to i8***
  %v35 = load i8**, i8*** %v34
  %v36 = getelementptr inbounds i8*, i8** %v35, i32 1
  %v37 = load i8*, i8** %v36
  %v38 = bitcast i8* %v37 to i32(i8*)*
  ; A__t2
  %v39 = call i32 %v38(i8* %v0)
  %v40 = load i32*, i32** %v5
  %v41 = bitcast i8* %v0 to i8***
  %v42 = load i8**, i8*** %v41
  %v43 = getelementptr inbounds i8*, i8** %v42, i32 4
  %v44 = load i8*, i8** %v43
  %v45 = bitcast i8* %v44 to i1(i8*, i32, i32*)*
  ; A__t4
  %v46 = call i1 %v45(i8* %v0, i32 %v39, i32* %v40)
  br label %and_end2

and_end2:
  %v47 = phi i1 [ false, %and_end1 ], [ %v46, %and2 ]
  br label %and_end

and_end:
  %v48 = phi i1 [ false, %entry ], [ %v47, %and_end2 ]
  ret i1 %v48
}

define i32 @A__t5(i8* %v0, i32* %v1) {
entry:
  ; Allocate stack space for all locals (params and vars).
  ; Initialize params to the passed argument and vars to 0.
  %v2 = alloca i32*
  store i32* %v1, i32** %v2
  %v3 = alloca i32
  store i32 0, i32* %v3
  %v4 = bitcast i8* %v0 to i8***
  %v5 = load i8**, i8*** %v4
  %v6 = getelementptr inbounds i8*, i8** %v5, i32 1
  %v7 = load i8*, i8** %v6
  %v8 = bitcast i8* %v7 to i32(i8*)*
  ; A__t2
  %v9 = call i32 %v8(i8* %v0)
  %v10 = load i32*, i32** %v2
  %v11 = load i32, i32* %v10
  %v12 = icmp sge i32 0, %v11
  br i1 %v12, label %bounds, label %bounds_end

bounds:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

bounds_end:
  %v13 = icmp slt i32 0, 0
  br i1 %v13, label %neg_index, label %neg_index_end

neg_index:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

neg_index_end:
  %v14 = add i32 0, 1
  %v15 = getelementptr inbounds i32, i32* %v10, i32 %v14
  %v16 = load i32, i32* %v15
  %v17 = add i32 %v16, 1
  %v18 = mul i32 %v17, 4
  %v19 = call i8* @calloc(i32 1, i32 %v18)
  %v20 = bitcast i8* %v19 to i32*
  %v21 = bitcast i8* %v0 to i8***
  %v22 = load i8**, i8*** %v21
  %v23 = getelementptr inbounds i8*, i8** %v22, i32 2
  %v24 = load i8*, i8** %v23
  %v25 = bitcast i8* %v24 to i32(i8*, i32*)*
  ; A__lispy
  %v26 = call i32 %v25(i8* %v0, i32* %v20)
  %v27 = add i32 %v9, %v26
  %v28 = add i32 %v27, 1
  %v29 = mul i32 %v28, 4
  %v30 = call i8* @calloc(i32 1, i32 %v29)
  %v31 = bitcast i8* %v30 to i32*
  %v32 = load i32, i32* %v31
  %v33 = icmp sge i32 0, %v32
  br i1 %v33, label %bounds1, label %bounds_end1

bounds1:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

bounds_end1:
  %v34 = icmp slt i32 0, 0
  br i1 %v34, label %neg_index1, label %neg_index_end1

neg_index1:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

neg_index_end1:
  %v35 = add i32 0, 1
  %v36 = getelementptr inbounds i32, i32* %v31, i32 %v35
  %v37 = load i32, i32* %v36
  %v38 = add i32 %v37, 10
  %v39 = add i32 %v38, 1
  %v40 = mul i32 %v39, 4
  %v41 = call i8* @calloc(i32 1, i32 %v40)
  %v42 = bitcast i8* %v41 to i32*
  %v43 = load i32, i32* %v42
  %v44 = icmp sge i32 2, %v43
  br i1 %v44, label %bounds2, label %bounds_end2

bounds2:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

bounds_end2:
  %v45 = icmp slt i32 2, 0
  br i1 %v45, label %neg_index2, label %neg_index_end2

neg_index2:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

neg_index_end2:
  %v46 = add i32 2, 1
  %v47 = getelementptr inbounds i32, i32* %v42, i32 %v46
  %v48 = load i32, i32* %v47
  store i32 %v48, i32* %v3
  %v49 = load i32*, i32** %v2
  %v50 = load i32, i32* %v3
  %v51 = load i32, i32* %v49
  %v52 = icmp sge i32 %v50, %v51
  br i1 %v52, label %bounds3, label %bounds_end3

bounds3:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

bounds_end3:
  %v53 = icmp slt i32 %v50, 0
  br i1 %v53, label %neg_index3, label %neg_index_end3

neg_index3:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

neg_index_end3:
  %v54 = add i32 %v50, 1
  %v55 = getelementptr inbounds i32, i32* %v49, i32 %v54
  %v56 = load i32, i32* %v55
  ret i32 %v56
}

define i1 @A__t6(i8* %v0, i1 %v1, i32* %v2) {
entry:
  ; Allocate stack space for all locals (params and vars).
  ; Initialize params to the passed argument and vars to 0.
  %v3 = alloca i1
  store i1 %v1, i1* %v3
  %v4 = alloca i32*
  store i32* %v2, i32** %v4
  %v5 = alloca i32
  store i32 0, i32* %v5
  %v6 = alloca %class.C*
  store %class.C* null, %class.C** %v6
  store i32 2, i32* %v5
  %v7 = call i8* @calloc(i32 1, i32 8)
  %v8 = bitcast i8* %v7 to [1 x i8*]**
  store [1 x i8*]* @C__vtable, [1 x i8*]** %v8
  %v9 = bitcast i8* %v7 to %class.C*
  store %class.C* %v9, %class.C** %v6
  %v10 = bitcast i8* %v0 to i8***
  %v11 = load i8**, i8*** %v10
  %v12 = getelementptr inbounds i8*, i8** %v11, i32 1
  %v13 = load i8*, i8** %v12
  %v14 = bitcast i8* %v13 to i32(i8*)*
  ; A__t2
  %v15 = call i32 %v14(i8* %v0)
  %v16 = add i32 29347, %v15
  %v17 = icmp slt i32 %v16, 12
  br i1 %v17, label %and, label %and_end

and:
  %v18 = load i32, i32* %v5
  %v19 = load i32*, i32** %v4
  %v20 = load i32, i32* %v19
  %v21 = icmp sge i32 0, %v20
  br i1 %v21, label %bounds, label %bounds_end

bounds:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

bounds_end:
  %v22 = icmp slt i32 0, 0
  br i1 %v22, label %neg_index, label %neg_index_end

neg_index:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

neg_index_end:
  %v23 = add i32 0, 1
  %v24 = getelementptr inbounds i32, i32* %v19, i32 %v23
  %v25 = load i32, i32* %v24
  %v26 = icmp slt i32 %v18, %v25
  br i1 %v26, label %and1, label %and_end1

and1:
  %v27 = bitcast i8* %v0 to i8***
  %v28 = load i8**, i8*** %v27
  %v29 = getelementptr inbounds i8*, i8** %v28, i32 3
  %v30 = load i8*, i8** %v29
  %v31 = bitcast i8* %v30 to i1(i8*)*
  ; A__t3
  %v32 = call i1 %v31(i8* %v0)
  br label %and_end1

and_end1:
  %v33 = phi i1 [ false, %neg_index_end ], [ %v32, %and1 ]
  br i1 %v33, label %and2, label %and_end2

and2:
  %v34 = call i8* @calloc(i32 1, i32 8)
  %v35 = bitcast i8* %v34 to [2 x i8*]**
  store [2 x i8*]* @B__vtable, [2 x i8*]** %v35
  %v36 = bitcast i8* %v34 to %class.B*
  %v37 = bitcast %class.B* %v36 to i8***
  %v38 = load i8**, i8*** %v37
  %v39 = load i8*, i8** %v38
  %v40 = bitcast i8* %v39 to i32*(i8*, i1)*
  %v41 = bitcast %class.B* %v36 to i8*
  ; B__test
  %v42 = call i32* %v40(i8* %v41, i1 true)
  %v43 = load i32, i32* %v42
  %v44 = icmp sge i32 0, %v43
  br i1 %v44, label %bounds1, label %bounds_end1

bounds1:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

bounds_end1:
  %v45 = icmp slt i32 0, 0
  br i1 %v45, label %neg_index1, label %neg_index_end1

neg_index1:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

neg_index_end1:
  %v46 = add i32 0, 1
  %v47 = getelementptr inbounds i32, i32* %v42, i32 %v46
  %v48 = load i32, i32* %v47
  %v49 = load i32*, i32** %v4
  %v50 = bitcast i8* %v0 to i8***
  %v51 = load i8**, i8*** %v50
  %v52 = getelementptr inbounds i8*, i8** %v51, i32 4
  %v53 = load i8*, i8** %v52
  %v54 = bitcast i8* %v53 to i1(i8*, i32, i32*)*
  ; A__t4
  %v55 = call i1 %v54(i8* %v0, i32 %v48, i32* %v49)
  %v56 = load i32*, i32** %v4
  %v57 = load i32, i32* %v56
  %v58 = icmp sge i32 0, %v57
  br i1 %v58, label %bounds2, label %bounds_end2

bounds2:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

bounds_end2:
  %v59 = icmp slt i32 0, 0
  br i1 %v59, label %neg_index2, label %neg_index_end2

neg_index2:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

neg_index_end2:
  %v60 = add i32 0, 1
  %v61 = getelementptr inbounds i32, i32* %v56, i32 %v60
  %v62 = load i32, i32* %v61
  %v63 = add i32 %v62, 1
  %v64 = mul i32 %v63, 4
  %v65 = call i8* @calloc(i32 1, i32 %v64)
  %v66 = bitcast i8* %v65 to i32*
  %v67 = bitcast i8* %v0 to i8***
  %v68 = load i8**, i8*** %v67
  %v69 = getelementptr inbounds i8*, i8** %v68, i32 6
  %v70 = load i8*, i8** %v69
  %v71 = bitcast i8* %v70 to i1(i8*, i1, i32*)*
  ; A__t6
  %v72 = call i1 %v71(i8* %v0, i1 %v55, i32* %v66)
  br label %and_end2

and_end2:
  %v73 = phi i1 [ false, %and_end1 ], [ %v72, %neg_index_end2 ]
  br label %and_end

and_end:
  %v74 = phi i1 [ false, %entry ], [ %v73, %and_end2 ]
  ret i1 %v74
}

@B__vtable = global [2 x i8*] [
  i8* bitcast (i32*(i8*, i1)* @C__test to i8*),
  i8* bitcast (i32*(i8*, i32)* @B__test2 to i8*)
]

define i32* @B__test2(i8* %v0, i32 %v1) {
entry:
  ; Allocate stack space for all locals (params and vars).
  ; Initialize params to the passed argument and vars to 0.
  %v2 = alloca i32
  store i32 %v1, i32* %v2
  %v3 = load i32, i32* %v2
  %v4 = add i32 %v3, 1
  %v5 = mul i32 %v4, 4
  %v6 = call i8* @calloc(i32 1, i32 %v5)
  %v7 = bitcast i8* %v6 to i32*
  ret i32* %v7
}

@C__vtable = global [1 x i8*] [
  i8* bitcast (i32*(i8*, i1)* @C__test to i8*)
]

define i32* @C__test(i8* %v0, i1 %v1) {
entry:
  ; Allocate stack space for all locals (params and vars).
  ; Initialize params to the passed argument and vars to 0.
  %v2 = alloca i1
  store i1 %v1, i1* %v2
  %v3 = add i32 10, 1
  %v4 = mul i32 %v3, 4
  %v5 = call i8* @calloc(i32 1, i32 %v4)
  %v6 = bitcast i8* %v5 to i32*
  ret i32* %v6
}

define i32 @main() {
entry:
  ; Allocate stack space for all locals (params and vars).
  ; Initialize params to the passed argument and vars to 0.
  ret i32 0
}

