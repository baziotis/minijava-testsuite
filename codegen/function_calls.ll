%class.A = type { i8*, i32 }
%class.B = type { i8*, i32 }

declare i8* @calloc(i32, i32)
declare void @exit(i32)
declare i32 @printf(i8*, ...)
@.str = constant [4 x i8] c"%d\0A\00"

@.out = private unnamed_addr constant [15 x i8] c"Out of bounds\0A\00"

%bool_array = type { i32, i8* }

@A__vtable = global [6 x i8*] [
  i8* bitcast (i32(i8*, i32)* @A__func_int to i8*),
  i8* bitcast (i32*(i8*, i32*)* @A__func_int_array to i8*),
  i8* bitcast (i1(i8*, i1)* @A__func_boolean to i8*),
  i8* bitcast (%bool_array*(i8*, %bool_array*)* @A__func_boolean_array to i8*),
  i8* bitcast (i32(i8*, i32)* @A__decrease to i8*),
  i8* bitcast (i32(i8*, i32, i32*, i1, %bool_array*, %class.B*)* @A__func to i8*)
]

define i32 @A__func_int(i8* %v0, i32 %v1) {
entry:
  ; Allocate stack space for all locals (params and vars).
  ; Initialize params to the passed argument and vars to 0.
  %v2 = alloca i32
  store i32 %v1, i32* %v2
  %v3 = load i32, i32* %v2
  %v4 = getelementptr inbounds i8, i8* %v0, i32 8
  %v5 = bitcast i8* %v4 to i32*
  store i32 %v3, i32* %v5
  %v6 = load i32, i32* %v2
  ret i32 %v6
}

define i32* @A__func_int_array(i8* %v0, i32* %v1) {
entry:
  ; Allocate stack space for all locals (params and vars).
  ; Initialize params to the passed argument and vars to 0.
  %v2 = alloca i32*
  store i32* %v1, i32** %v2
  %v3 = load i32*, i32** %v2
  ret i32* %v3
}

define i1 @A__func_boolean(i8* %v0, i1 %v1) {
entry:
  ; Allocate stack space for all locals (params and vars).
  ; Initialize params to the passed argument and vars to 0.
  %v2 = alloca i1
  store i1 %v1, i1* %v2
  %v3 = load i1, i1* %v2
  ret i1 %v3
}

define %bool_array* @A__func_boolean_array(i8* %v0, %bool_array* %v1) {
entry:
  ; Allocate stack space for all locals (params and vars).
  ; Initialize params to the passed argument and vars to 0.
  %v2 = alloca %bool_array*
  store %bool_array* %v1, %bool_array** %v2
  %v3 = load %bool_array*, %bool_array** %v2
  ret %bool_array* %v3
}

define i32 @A__decrease(i8* %v0, i32 %v1) {
entry:
  ; Allocate stack space for all locals (params and vars).
  ; Initialize params to the passed argument and vars to 0.
  %v2 = alloca i32
  store i32 %v1, i32* %v2
  %v3 = load i32, i32* %v2
  %v4 = sub i32 %v3, 1
  store i32 %v4, i32* %v2
  %v5 = load i32, i32* %v2
  ret i32 %v5
}

define i32 @A__func(i8* %v0, i32 %v1, i32* %v2, i1 %v3, %bool_array* %v4, %class.B* %v5) {
entry:
  ; Allocate stack space for all locals (params and vars).
  ; Initialize params to the passed argument and vars to 0.
  %v6 = alloca i32
  store i32 %v1, i32* %v6
  %v7 = alloca i32*
  store i32* %v2, i32** %v7
  %v8 = alloca i1
  store i1 %v3, i1* %v8
  %v9 = alloca %bool_array*
  store %bool_array* %v4, %bool_array** %v9
  %v10 = alloca %class.B*
  store %class.B* %v5, %class.B** %v10
  %v11 = alloca i32
  store i32 0, i32* %v11
  %v12 = alloca i32
  store i32 0, i32* %v12
  %v13 = getelementptr inbounds i8, i8* %v0, i32 8
  %v14 = bitcast i8* %v13 to i32*
  %v15 = load i32, i32* %v14
  %v16 = bitcast [4 x i8]* @.str to i8*
  call i32 (i8*, ...) @printf(i8* %v16, i32 %v15)
  %v17 = load i32, i32* %v6
  %v18 = bitcast [4 x i8]* @.str to i8*
  call i32 (i8*, ...) @printf(i8* %v18, i32 %v17)
  %v19 = load i32*, i32** %v7
  %v20 = load i32, i32* %v19
  %v21 = bitcast [4 x i8]* @.str to i8*
  call i32 (i8*, ...) @printf(i8* %v21, i32 %v20)
  store i32 0, i32* %v11
  store i32 0, i32* %v12
  br label %header

header:
  %v22 = load i32, i32* %v11
  %v23 = load i32*, i32** %v7
  %v24 = load i32, i32* %v23
  %v25 = icmp slt i32 %v22, %v24
  br i1 %v25, label %loop_body, label %exit_block

loop_body:
  %v26 = load i32*, i32** %v7
  %v27 = load i32, i32* %v11
  %v28 = load i32, i32* %v26
  %v29 = icmp sge i32 %v27, %v28
  br i1 %v29, label %bounds, label %bounds_end

bounds:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

bounds_end:
  %v30 = icmp slt i32 %v27, 0
  br i1 %v30, label %neg_index, label %neg_index_end

neg_index:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

neg_index_end:
  %v31 = add i32 %v27, 1
  %v32 = getelementptr inbounds i32, i32* %v26, i32 %v31
  %v33 = load i32, i32* %v32
  %v34 = load i32, i32* %v12
  %v35 = add i32 %v33, %v34
  store i32 %v35, i32* %v12
  %v36 = load i32, i32* %v11
  %v37 = add i32 %v36, 1
  store i32 %v37, i32* %v11
  br label %header

exit_block:
  %v38 = load i32, i32* %v12
  %v39 = bitcast [4 x i8]* @.str to i8*
  call i32 (i8*, ...) @printf(i8* %v39, i32 %v38)
  %v40 = load i1, i1* %v8
  br i1 %v40, label %if, label %else

if:
  %v41 = bitcast [4 x i8]* @.str to i8*
  call i32 (i8*, ...) @printf(i8* %v41, i32 1)
  br label %if_end

else:
  %v42 = bitcast [4 x i8]* @.str to i8*
  call i32 (i8*, ...) @printf(i8* %v42, i32 0)
  br label %if_end

if_end:
  %v43 = load %bool_array*, %bool_array** %v9
  %v44 = bitcast %bool_array* %v43 to i32*
  %v45 = load i32, i32* %v44
  %v46 = bitcast [4 x i8]* @.str to i8*
  call i32 (i8*, ...) @printf(i8* %v46, i32 %v45)
  store i32 0, i32* %v11
  store i32 0, i32* %v12
  %v47 = load %bool_array*, %bool_array** %v9
  %v48 = load i32, i32* %v11
  %v49 = bitcast %bool_array* %v47 to i32*
  %v50 = load i32, i32* %v49
  %v51 = icmp sge i32 %v48, %v50
  br i1 %v51, label %bounds1, label %bounds_end1

bounds1:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

bounds_end1:
  %v52 = icmp slt i32 %v48, 0
  br i1 %v52, label %neg_index1, label %neg_index_end1

neg_index1:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

neg_index_end1:
  %v53 = getelementptr inbounds %bool_array, %bool_array* %v47, i32 0, i32 1
  %v54 = load i8*, i8** %v53
  %v55 = getelementptr inbounds i8, i8* %v54, i32 %v48
  %v56 = load i8, i8* %v55
  %v57 = trunc i8 %v56 to i1
  br i1 %v57, label %if1, label %else1

if1:
  %v58 = load i32, i32* %v12
  %v59 = add i32 %v58, 1
  store i32 %v59, i32* %v12
  br label %if_end1

else1:
  %v60 = load i32, i32* %v12
  %v61 = add i32 %v60, 10
  store i32 %v61, i32* %v12
  br label %if_end1

if_end1:
  %v62 = load i32, i32* %v12
  %v63 = bitcast [4 x i8]* @.str to i8*
  call i32 (i8*, ...) @printf(i8* %v63, i32 %v62)
  %v64 = load %class.B*, %class.B** %v10
  %v65 = bitcast %class.B* %v64 to i8***
  %v66 = load i8**, i8*** %v65
  %v67 = getelementptr inbounds i8*, i8** %v66, i32 1
  %v68 = load i8*, i8** %v67
  %v69 = bitcast i8* %v68 to i32(i8*)*
  %v70 = bitcast %class.B* %v64 to i8*
  ; B__Print
  %v71 = call i32 %v69(i8* %v70)
  store i32 %v71, i32* %v11
  %v72 = load i32, i32* %v11
  ret i32 %v72
}

@B__vtable = global [3 x i8*] [
  i8* bitcast (i32(i8*)* @B__Init to i8*),
  i8* bitcast (i32(i8*)* @B__Print to i8*),
  i8* bitcast (%class.B*(i8*, %class.B*)* @B__getB to i8*)
]

define i32 @B__Init(i8* %v0) {
entry:
  ; Allocate stack space for all locals (params and vars).
  ; Initialize params to the passed argument and vars to 0.
  %v1 = getelementptr inbounds i8, i8* %v0, i32 8
  %v2 = bitcast i8* %v1 to i32*
  store i32 1048576, i32* %v2
  ret i32 1
}

define i32 @B__Print(i8* %v0) {
entry:
  ; Allocate stack space for all locals (params and vars).
  ; Initialize params to the passed argument and vars to 0.
  %v1 = getelementptr inbounds i8, i8* %v0, i32 8
  %v2 = bitcast i8* %v1 to i32*
  %v3 = load i32, i32* %v2
  %v4 = bitcast [4 x i8]* @.str to i8*
  call i32 (i8*, ...) @printf(i8* %v4, i32 %v3)
  ret i32 1
}

define %class.B* @B__getB(i8* %v0, %class.B* %v1) {
entry:
  ; Allocate stack space for all locals (params and vars).
  ; Initialize params to the passed argument and vars to 0.
  %v2 = alloca %class.B*
  store %class.B* %v1, %class.B** %v2
  %v3 = load %class.B*, %class.B** %v2
  ret %class.B* %v3
}

define i32 @main() {
entry:
  ; Allocate stack space for all locals (params and vars).
  ; Initialize params to the passed argument and vars to 0.
  %v0 = alloca %class.A*
  store %class.A* null, %class.A** %v0
  %v1 = alloca %class.B*
  store %class.B* null, %class.B** %v1
  %v2 = alloca i32*
  store i32* null, i32** %v2
  %v3 = alloca %bool_array*
  store %bool_array* null, %bool_array** %v3
  %v4 = alloca i32
  store i32 0, i32* %v4
  %v5 = alloca i1
  store i1 false, i1* %v5
  %v6 = call i8* @calloc(i32 1, i32 12)
  %v7 = bitcast i8* %v6 to [6 x i8*]**
  store [6 x i8*]* @A__vtable, [6 x i8*]** %v7
  %v8 = bitcast i8* %v6 to %class.A*
  store %class.A* %v8, %class.A** %v0
  %v9 = call i8* @calloc(i32 1, i32 12)
  %v10 = bitcast i8* %v9 to [3 x i8*]**
  store [3 x i8*]* @B__vtable, [3 x i8*]** %v10
  %v11 = bitcast i8* %v9 to %class.B*
  store %class.B* %v11, %class.B** %v1
  %v12 = load %class.B*, %class.B** %v1
  %v13 = bitcast %class.B* %v12 to i8***
  %v14 = load i8**, i8*** %v13
  %v15 = load i8*, i8** %v14
  %v16 = bitcast i8* %v15 to i32(i8*)*
  %v17 = bitcast %class.B* %v12 to i8*
  ; B__Init
  %v18 = call i32 %v16(i8* %v17)
  store i32 %v18, i32* %v4
  %v19 = icmp slt i32 1000, 0
  br i1 %v19, label %neg_index, label %neg_index_end

neg_index:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

neg_index_end:
  %v20 = add i32 1000, 1
  %v21 = mul i32 %v20, 4
  %v22 = call i8* @calloc(i32 1, i32 %v21)
  %v23 = bitcast i8* %v22 to i32*
  store i32 1000, i32* %v23
  store i32* %v23, i32** %v2
  %v24 = icmp slt i32 1000, 0
  br i1 %v24, label %neg_index1, label %neg_index_end1

neg_index1:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

neg_index_end1:
  %v25 = call i8* @calloc(i32 1, i32 12)
  %v26 = bitcast i8* %v25 to %bool_array*
  %v27 = call i8* @calloc(i32 1, i32 1000)
  %v28 = getelementptr inbounds %bool_array, %bool_array* %v26, i32 0, i32 0
  store i32 1000, i32* %v28
  %v29 = getelementptr inbounds %bool_array, %bool_array* %v26, i32 0, i32 1
  store i8* %v27, i8** %v29
  store %bool_array* %v26, %bool_array** %v3
  store i32 0, i32* %v4
  br label %header

header:
  %v30 = load i32, i32* %v4
  %v31 = load i32*, i32** %v2
  %v32 = load i32, i32* %v31
  %v33 = icmp slt i32 %v30, %v32
  br i1 %v33, label %loop_body, label %exit_block

loop_body:
  %v34 = load i32, i32* %v4
  %v35 = load i32, i32* %v4
  %v36 = mul i32 %v35, 2
  %v37 = load i32*, i32** %v2
  %v38 = load i32, i32* %v37
  %v39 = icmp sge i32 %v34, %v38
  br i1 %v39, label %bounds, label %bounds_end

bounds:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

bounds_end:
  %v40 = icmp slt i32 %v34, 0
  br i1 %v40, label %neg_index2, label %neg_index_end2

neg_index2:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

neg_index_end2:
  %v41 = load i32*, i32** %v2
  %v42 = add i32 %v34, 1
  %v43 = getelementptr inbounds i32, i32* %v41, i32 %v42
  store i32 %v36, i32* %v43
  %v44 = load i32, i32* %v4
  %v45 = add i32 %v44, 1
  store i32 %v45, i32* %v4
  br label %header

exit_block:
  store i32 0, i32* %v4
  store i1 true, i1* %v5
  br label %header1

header1:
  %v46 = load i32, i32* %v4
  %v47 = load %bool_array*, %bool_array** %v3
  %v48 = bitcast %bool_array* %v47 to i32*
  %v49 = load i32, i32* %v48
  %v50 = icmp slt i32 %v46, %v49
  br i1 %v50, label %loop_body1, label %exit_block1

loop_body1:
  %v51 = load i32, i32* %v4
  %v52 = load i1, i1* %v5
  %v53 = load %bool_array*, %bool_array** %v3
  %v54 = bitcast %bool_array* %v53 to i32*
  %v55 = load i32, i32* %v54
  %v56 = icmp sge i32 %v51, %v55
  br i1 %v56, label %bounds1, label %bounds_end1

bounds1:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

bounds_end1:
  %v57 = icmp slt i32 %v51, 0
  br i1 %v57, label %neg_index3, label %neg_index_end3

neg_index3:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

neg_index_end3:
  %v58 = load %bool_array*, %bool_array** %v3
  %v59 = getelementptr inbounds %bool_array, %bool_array* %v58, i32 0, i32 1
  %v60 = load i8*, i8** %v59
  %v61 = getelementptr inbounds i8, i8* %v60, i32 %v51
  %v62 = zext i1 %v52 to i8
  store i8 %v62, i8* %v61
  %v63 = load i1, i1* %v5
  %v64 = icmp eq i1 %v63, false
  store i1 %v64, i1* %v5
  %v65 = load i32, i32* %v4
  %v66 = add i32 %v65, 1
  store i32 %v66, i32* %v4
  br label %header1

exit_block1:
  %v67 = load %class.A*, %class.A** %v0
  %v68 = load %class.A*, %class.A** %v0
  %v69 = load %class.A*, %class.A** %v0
  %v70 = load %class.A*, %class.A** %v0
  %v71 = load %class.A*, %class.A** %v0
  %v72 = load %class.A*, %class.A** %v0
  %v73 = load %class.A*, %class.A** %v0
  %v74 = load %class.A*, %class.A** %v0
  %v75 = bitcast %class.A* %v74 to i8***
  %v76 = load i8**, i8*** %v75
  %v77 = load i8*, i8** %v76
  %v78 = bitcast i8* %v77 to i32(i8*, i32)*
  %v79 = bitcast %class.A* %v74 to i8*
  ; A__func_int
  %v80 = call i32 %v78(i8* %v79, i32 1024)
  %v81 = bitcast %class.A* %v73 to i8***
  %v82 = load i8**, i8*** %v81
  %v83 = load i8*, i8** %v82
  %v84 = bitcast i8* %v83 to i32(i8*, i32)*
  %v85 = bitcast %class.A* %v73 to i8*
  ; A__func_int
  %v86 = call i32 %v84(i8* %v85, i32 %v80)
  %v87 = bitcast %class.A* %v72 to i8***
  %v88 = load i8**, i8*** %v87
  %v89 = load i8*, i8** %v88
  %v90 = bitcast i8* %v89 to i32(i8*, i32)*
  %v91 = bitcast %class.A* %v72 to i8*
  ; A__func_int
  %v92 = call i32 %v90(i8* %v91, i32 %v86)
  %v93 = bitcast %class.A* %v71 to i8***
  %v94 = load i8**, i8*** %v93
  %v95 = load i8*, i8** %v94
  %v96 = bitcast i8* %v95 to i32(i8*, i32)*
  %v97 = bitcast %class.A* %v71 to i8*
  ; A__func_int
  %v98 = call i32 %v96(i8* %v97, i32 %v92)
  %v99 = bitcast %class.A* %v70 to i8***
  %v100 = load i8**, i8*** %v99
  %v101 = load i8*, i8** %v100
  %v102 = bitcast i8* %v101 to i32(i8*, i32)*
  %v103 = bitcast %class.A* %v70 to i8*
  ; A__func_int
  %v104 = call i32 %v102(i8* %v103, i32 %v98)
  %v105 = bitcast %class.A* %v69 to i8***
  %v106 = load i8**, i8*** %v105
  %v107 = load i8*, i8** %v106
  %v108 = bitcast i8* %v107 to i32(i8*, i32)*
  %v109 = bitcast %class.A* %v69 to i8*
  ; A__func_int
  %v110 = call i32 %v108(i8* %v109, i32 %v104)
  %v111 = bitcast %class.A* %v68 to i8***
  %v112 = load i8**, i8*** %v111
  %v113 = load i8*, i8** %v112
  %v114 = bitcast i8* %v113 to i32(i8*, i32)*
  %v115 = bitcast %class.A* %v68 to i8*
  ; A__func_int
  %v116 = call i32 %v114(i8* %v115, i32 %v110)
  %v117 = load %class.A*, %class.A** %v0
  %v118 = load %class.A*, %class.A** %v0
  %v119 = load %class.A*, %class.A** %v0
  %v120 = load %class.A*, %class.A** %v0
  %v121 = load %class.A*, %class.A** %v0
  %v122 = load %class.A*, %class.A** %v0
  %v123 = load i32*, i32** %v2
  %v124 = bitcast %class.A* %v122 to i8***
  %v125 = load i8**, i8*** %v124
  %v126 = getelementptr inbounds i8*, i8** %v125, i32 1
  %v127 = load i8*, i8** %v126
  %v128 = bitcast i8* %v127 to i32*(i8*, i32*)*
  %v129 = bitcast %class.A* %v122 to i8*
  ; A__func_int_array
  %v130 = call i32* %v128(i8* %v129, i32* %v123)
  %v131 = bitcast %class.A* %v121 to i8***
  %v132 = load i8**, i8*** %v131
  %v133 = getelementptr inbounds i8*, i8** %v132, i32 1
  %v134 = load i8*, i8** %v133
  %v135 = bitcast i8* %v134 to i32*(i8*, i32*)*
  %v136 = bitcast %class.A* %v121 to i8*
  ; A__func_int_array
  %v137 = call i32* %v135(i8* %v136, i32* %v130)
  %v138 = bitcast %class.A* %v120 to i8***
  %v139 = load i8**, i8*** %v138
  %v140 = getelementptr inbounds i8*, i8** %v139, i32 1
  %v141 = load i8*, i8** %v140
  %v142 = bitcast i8* %v141 to i32*(i8*, i32*)*
  %v143 = bitcast %class.A* %v120 to i8*
  ; A__func_int_array
  %v144 = call i32* %v142(i8* %v143, i32* %v137)
  %v145 = bitcast %class.A* %v119 to i8***
  %v146 = load i8**, i8*** %v145
  %v147 = getelementptr inbounds i8*, i8** %v146, i32 1
  %v148 = load i8*, i8** %v147
  %v149 = bitcast i8* %v148 to i32*(i8*, i32*)*
  %v150 = bitcast %class.A* %v119 to i8*
  ; A__func_int_array
  %v151 = call i32* %v149(i8* %v150, i32* %v144)
  %v152 = bitcast %class.A* %v118 to i8***
  %v153 = load i8**, i8*** %v152
  %v154 = getelementptr inbounds i8*, i8** %v153, i32 1
  %v155 = load i8*, i8** %v154
  %v156 = bitcast i8* %v155 to i32*(i8*, i32*)*
  %v157 = bitcast %class.A* %v118 to i8*
  ; A__func_int_array
  %v158 = call i32* %v156(i8* %v157, i32* %v151)
  %v159 = bitcast %class.A* %v117 to i8***
  %v160 = load i8**, i8*** %v159
  %v161 = getelementptr inbounds i8*, i8** %v160, i32 1
  %v162 = load i8*, i8** %v161
  %v163 = bitcast i8* %v162 to i32*(i8*, i32*)*
  %v164 = bitcast %class.A* %v117 to i8*
  ; A__func_int_array
  %v165 = call i32* %v163(i8* %v164, i32* %v158)
  %v166 = load %class.A*, %class.A** %v0
  %v167 = load %class.A*, %class.A** %v0
  %v168 = load %class.A*, %class.A** %v0
  %v169 = load %class.A*, %class.A** %v0
  %v170 = load %class.A*, %class.A** %v0
  %v171 = load %class.A*, %class.A** %v0
  %v172 = load %class.A*, %class.A** %v0
  %v173 = bitcast %class.A* %v172 to i8***
  %v174 = load i8**, i8*** %v173
  %v175 = getelementptr inbounds i8*, i8** %v174, i32 2
  %v176 = load i8*, i8** %v175
  %v177 = bitcast i8* %v176 to i1(i8*, i1)*
  %v178 = bitcast %class.A* %v172 to i8*
  ; A__func_boolean
  %v179 = call i1 %v177(i8* %v178, i1 true)
  %v180 = bitcast %class.A* %v171 to i8***
  %v181 = load i8**, i8*** %v180
  %v182 = getelementptr inbounds i8*, i8** %v181, i32 2
  %v183 = load i8*, i8** %v182
  %v184 = bitcast i8* %v183 to i1(i8*, i1)*
  %v185 = bitcast %class.A* %v171 to i8*
  ; A__func_boolean
  %v186 = call i1 %v184(i8* %v185, i1 %v179)
  %v187 = bitcast %class.A* %v170 to i8***
  %v188 = load i8**, i8*** %v187
  %v189 = getelementptr inbounds i8*, i8** %v188, i32 2
  %v190 = load i8*, i8** %v189
  %v191 = bitcast i8* %v190 to i1(i8*, i1)*
  %v192 = bitcast %class.A* %v170 to i8*
  ; A__func_boolean
  %v193 = call i1 %v191(i8* %v192, i1 %v186)
  %v194 = bitcast %class.A* %v169 to i8***
  %v195 = load i8**, i8*** %v194
  %v196 = getelementptr inbounds i8*, i8** %v195, i32 2
  %v197 = load i8*, i8** %v196
  %v198 = bitcast i8* %v197 to i1(i8*, i1)*
  %v199 = bitcast %class.A* %v169 to i8*
  ; A__func_boolean
  %v200 = call i1 %v198(i8* %v199, i1 %v193)
  %v201 = bitcast %class.A* %v168 to i8***
  %v202 = load i8**, i8*** %v201
  %v203 = getelementptr inbounds i8*, i8** %v202, i32 2
  %v204 = load i8*, i8** %v203
  %v205 = bitcast i8* %v204 to i1(i8*, i1)*
  %v206 = bitcast %class.A* %v168 to i8*
  ; A__func_boolean
  %v207 = call i1 %v205(i8* %v206, i1 %v200)
  %v208 = bitcast %class.A* %v167 to i8***
  %v209 = load i8**, i8*** %v208
  %v210 = getelementptr inbounds i8*, i8** %v209, i32 2
  %v211 = load i8*, i8** %v210
  %v212 = bitcast i8* %v211 to i1(i8*, i1)*
  %v213 = bitcast %class.A* %v167 to i8*
  ; A__func_boolean
  %v214 = call i1 %v212(i8* %v213, i1 %v207)
  %v215 = bitcast %class.A* %v166 to i8***
  %v216 = load i8**, i8*** %v215
  %v217 = getelementptr inbounds i8*, i8** %v216, i32 2
  %v218 = load i8*, i8** %v217
  %v219 = bitcast i8* %v218 to i1(i8*, i1)*
  %v220 = bitcast %class.A* %v166 to i8*
  ; A__func_boolean
  %v221 = call i1 %v219(i8* %v220, i1 %v214)
  %v222 = load %class.A*, %class.A** %v0
  %v223 = load %class.A*, %class.A** %v0
  %v224 = load %class.A*, %class.A** %v0
  %v225 = load %class.A*, %class.A** %v0
  %v226 = load %class.A*, %class.A** %v0
  %v227 = load %bool_array*, %bool_array** %v3
  %v228 = bitcast %class.A* %v226 to i8***
  %v229 = load i8**, i8*** %v228
  %v230 = getelementptr inbounds i8*, i8** %v229, i32 3
  %v231 = load i8*, i8** %v230
  %v232 = bitcast i8* %v231 to %bool_array*(i8*, %bool_array*)*
  %v233 = bitcast %class.A* %v226 to i8*
  ; A__func_boolean_array
  %v234 = call %bool_array* %v232(i8* %v233, %bool_array* %v227)
  %v235 = bitcast %class.A* %v225 to i8***
  %v236 = load i8**, i8*** %v235
  %v237 = getelementptr inbounds i8*, i8** %v236, i32 3
  %v238 = load i8*, i8** %v237
  %v239 = bitcast i8* %v238 to %bool_array*(i8*, %bool_array*)*
  %v240 = bitcast %class.A* %v225 to i8*
  ; A__func_boolean_array
  %v241 = call %bool_array* %v239(i8* %v240, %bool_array* %v234)
  %v242 = bitcast %class.A* %v224 to i8***
  %v243 = load i8**, i8*** %v242
  %v244 = getelementptr inbounds i8*, i8** %v243, i32 3
  %v245 = load i8*, i8** %v244
  %v246 = bitcast i8* %v245 to %bool_array*(i8*, %bool_array*)*
  %v247 = bitcast %class.A* %v224 to i8*
  ; A__func_boolean_array
  %v248 = call %bool_array* %v246(i8* %v247, %bool_array* %v241)
  %v249 = bitcast %class.A* %v223 to i8***
  %v250 = load i8**, i8*** %v249
  %v251 = getelementptr inbounds i8*, i8** %v250, i32 3
  %v252 = load i8*, i8** %v251
  %v253 = bitcast i8* %v252 to %bool_array*(i8*, %bool_array*)*
  %v254 = bitcast %class.A* %v223 to i8*
  ; A__func_boolean_array
  %v255 = call %bool_array* %v253(i8* %v254, %bool_array* %v248)
  %v256 = bitcast %class.A* %v222 to i8***
  %v257 = load i8**, i8*** %v256
  %v258 = getelementptr inbounds i8*, i8** %v257, i32 3
  %v259 = load i8*, i8** %v258
  %v260 = bitcast i8* %v259 to %bool_array*(i8*, %bool_array*)*
  %v261 = bitcast %class.A* %v222 to i8*
  ; A__func_boolean_array
  %v262 = call %bool_array* %v260(i8* %v261, %bool_array* %v255)
  %v263 = load %class.B*, %class.B** %v1
  %v264 = load %class.B*, %class.B** %v1
  %v265 = load %class.B*, %class.B** %v1
  %v266 = load %class.B*, %class.B** %v1
  %v267 = load %class.B*, %class.B** %v1
  %v268 = load %class.B*, %class.B** %v1
  %v269 = bitcast %class.B* %v267 to i8***
  %v270 = load i8**, i8*** %v269
  %v271 = getelementptr inbounds i8*, i8** %v270, i32 2
  %v272 = load i8*, i8** %v271
  %v273 = bitcast i8* %v272 to %class.B*(i8*, %class.B*)*
  %v274 = bitcast %class.B* %v267 to i8*
  ; B__getB
  %v275 = call %class.B* %v273(i8* %v274, %class.B* %v268)
  %v276 = bitcast %class.B* %v266 to i8***
  %v277 = load i8**, i8*** %v276
  %v278 = getelementptr inbounds i8*, i8** %v277, i32 2
  %v279 = load i8*, i8** %v278
  %v280 = bitcast i8* %v279 to %class.B*(i8*, %class.B*)*
  %v281 = bitcast %class.B* %v266 to i8*
  ; B__getB
  %v282 = call %class.B* %v280(i8* %v281, %class.B* %v275)
  %v283 = bitcast %class.B* %v265 to i8***
  %v284 = load i8**, i8*** %v283
  %v285 = getelementptr inbounds i8*, i8** %v284, i32 2
  %v286 = load i8*, i8** %v285
  %v287 = bitcast i8* %v286 to %class.B*(i8*, %class.B*)*
  %v288 = bitcast %class.B* %v265 to i8*
  ; B__getB
  %v289 = call %class.B* %v287(i8* %v288, %class.B* %v282)
  %v290 = bitcast %class.B* %v264 to i8***
  %v291 = load i8**, i8*** %v290
  %v292 = getelementptr inbounds i8*, i8** %v291, i32 2
  %v293 = load i8*, i8** %v292
  %v294 = bitcast i8* %v293 to %class.B*(i8*, %class.B*)*
  %v295 = bitcast %class.B* %v264 to i8*
  ; B__getB
  %v296 = call %class.B* %v294(i8* %v295, %class.B* %v289)
  %v297 = bitcast %class.B* %v263 to i8***
  %v298 = load i8**, i8*** %v297
  %v299 = getelementptr inbounds i8*, i8** %v298, i32 2
  %v300 = load i8*, i8** %v299
  %v301 = bitcast i8* %v300 to %class.B*(i8*, %class.B*)*
  %v302 = bitcast %class.B* %v263 to i8*
  ; B__getB
  %v303 = call %class.B* %v301(i8* %v302, %class.B* %v296)
  %v304 = bitcast %class.A* %v67 to i8***
  %v305 = load i8**, i8*** %v304
  %v306 = getelementptr inbounds i8*, i8** %v305, i32 5
  %v307 = load i8*, i8** %v306
  %v308 = bitcast i8* %v307 to i32(i8*, i32, i32*, i1, %bool_array*, %class.B*)*
  %v309 = bitcast %class.A* %v67 to i8*
  ; A__func
  %v310 = call i32 %v308(i8* %v309, i32 %v116, i32* %v165, i1 %v221, %bool_array* %v262, %class.B* %v303)
  store i32 %v310, i32* %v4
  ret i32 0
}

