%class.A = type { i8* }
%class.B = type { i8*, i32, %bool_array*, i1 }

declare i8* @calloc(i32, i32)
declare void @exit(i32)
declare i32 @printf(i8*, ...)
@.str = constant [4 x i8] c"%d\0A\00"

@.out = private unnamed_addr constant [15 x i8] c"Out of bounds\0A\00"

%bool_array = type { i32, i8* }

@A__vtable = global [3 x i8*] [
  i8* bitcast (%bool_array*(i8*)* @A__foo to i8*),
  i8* bitcast (i32(i8*, i1)* @A__bar to i8*),
  i8* bitcast (%bool_array*(i8*)* @A__another to i8*)
]

define %bool_array* @A__foo(i8* %v0) {
entry:
  ; Allocate stack space for all locals (params and vars).
  ; Initialize params to the passed argument and vars to 0.
  %v1 = alloca %bool_array*
  store %bool_array* null, %bool_array** %v1
  %v2 = icmp slt i32 200, 0
  br i1 %v2, label %neg_index, label %neg_index_end

neg_index:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

neg_index_end:
  %v3 = call i8* @calloc(i32 1, i32 12)
  %v4 = bitcast i8* %v3 to %bool_array*
  %v5 = call i8* @calloc(i32 1, i32 200)
  %v6 = getelementptr inbounds %bool_array, %bool_array* %v4, i32 0, i32 0
  store i32 200, i32* %v6
  %v7 = getelementptr inbounds %bool_array, %bool_array* %v4, i32 0, i32 1
  store i8* %v5, i8** %v7
  store %bool_array* %v4, %bool_array** %v1
  %v8 = load %bool_array*, %bool_array** %v1
  %v9 = bitcast %bool_array* %v8 to i32*
  %v10 = load i32, i32* %v9
  %v11 = icmp sge i32 2, %v10
  br i1 %v11, label %bounds, label %bounds_end

bounds:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

bounds_end:
  %v12 = icmp slt i32 2, 0
  br i1 %v12, label %neg_index1, label %neg_index_end1

neg_index1:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

neg_index_end1:
  %v13 = load %bool_array*, %bool_array** %v1
  %v14 = getelementptr inbounds %bool_array, %bool_array* %v13, i32 0, i32 1
  %v15 = load i8*, i8** %v14
  %v16 = getelementptr inbounds i8, i8* %v15, i32 2
  %v17 = zext i1 true to i8
  store i8 %v17, i8* %v16
  %v18 = load %bool_array*, %bool_array** %v1
  ret %bool_array* %v18
}

define i32 @A__bar(i8* %v0, i1 %v1) {
entry:
  ; Allocate stack space for all locals (params and vars).
  ; Initialize params to the passed argument and vars to 0.
  %v2 = alloca i1
  store i1 %v1, i1* %v2
  %v3 = alloca i32
  store i32 0, i32* %v3
  %v4 = load i1, i1* %v2
  br i1 %v4, label %if, label %else

if:
  store i32 1, i32* %v3
  br label %if_end

else:
  store i32 2, i32* %v3
  br label %if_end

if_end:
  %v5 = load i32, i32* %v3
  ret i32 %v5
}

define %bool_array* @A__another(i8* %v0) {
entry:
  ; Allocate stack space for all locals (params and vars).
  ; Initialize params to the passed argument and vars to 0.
  %v1 = bitcast i8* %v0 to i8***
  %v2 = load i8**, i8*** %v1
  %v3 = load i8*, i8** %v2
  %v4 = bitcast i8* %v3 to %bool_array*(i8*)*
  ; A__foo
  %v5 = call %bool_array* %v4(i8* %v0)
  ret %bool_array* %v5
}

@B__vtable = global [3 x i8*] [
  i8* bitcast (i32(i8*)* @B__fill_arr to i8*),
  i8* bitcast (i32(i8*)* @B__get_a to i8*),
  i8* bitcast (i1(i8*)* @B__get_c to i8*)
]

define i32 @B__fill_arr(i8* %v0) {
entry:
  ; Allocate stack space for all locals (params and vars).
  ; Initialize params to the passed argument and vars to 0.
  %v1 = alloca %bool_array*
  store %bool_array* null, %bool_array** %v1
  %v2 = alloca i32
  store i32 0, i32* %v2
  %v3 = alloca i32
  store i32 0, i32* %v3
  store i32 100, i32* %v3
  %v4 = load i32, i32* %v3
  %v5 = icmp slt i32 %v4, 0
  br i1 %v5, label %neg_index, label %neg_index_end

neg_index:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

neg_index_end:
  %v6 = call i8* @calloc(i32 1, i32 12)
  %v7 = bitcast i8* %v6 to %bool_array*
  %v8 = call i8* @calloc(i32 1, i32 %v4)
  %v9 = getelementptr inbounds %bool_array, %bool_array* %v7, i32 0, i32 0
  store i32 %v4, i32* %v9
  %v10 = getelementptr inbounds %bool_array, %bool_array* %v7, i32 0, i32 1
  store i8* %v8, i8** %v10
  store %bool_array* %v7, %bool_array** %v1
  store i32 0, i32* %v2
  br label %header

header:
  %v11 = load i32, i32* %v2
  %v12 = load i32, i32* %v3
  %v13 = icmp slt i32 %v11, %v12
  br i1 %v13, label %loop_body, label %exit_block

loop_body:
  %v14 = load i32, i32* %v2
  %v15 = load %bool_array*, %bool_array** %v1
  %v16 = bitcast %bool_array* %v15 to i32*
  %v17 = load i32, i32* %v16
  %v18 = icmp sge i32 %v14, %v17
  br i1 %v18, label %bounds, label %bounds_end

bounds:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

bounds_end:
  %v19 = icmp slt i32 %v14, 0
  br i1 %v19, label %neg_index1, label %neg_index_end1

neg_index1:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

neg_index_end1:
  %v20 = load %bool_array*, %bool_array** %v1
  %v21 = getelementptr inbounds %bool_array, %bool_array* %v20, i32 0, i32 1
  %v22 = load i8*, i8** %v21
  %v23 = getelementptr inbounds i8, i8* %v22, i32 %v14
  %v24 = zext i1 true to i8
  store i8 %v24, i8* %v23
  %v25 = load i32, i32* %v2
  %v26 = add i32 %v25, 1
  store i32 %v26, i32* %v2
  br label %header

exit_block:
  %v27 = load %bool_array*, %bool_array** %v1
  %v28 = getelementptr inbounds i8, i8* %v0, i32 12
  %v29 = bitcast i8* %v28 to %bool_array**
  store %bool_array* %v27, %bool_array** %v29
  ret i32 0
}

define i32 @B__get_a(i8* %v0) {
entry:
  ; Allocate stack space for all locals (params and vars).
  ; Initialize params to the passed argument and vars to 0.
  %v1 = getelementptr inbounds i8, i8* %v0, i32 8
  %v2 = bitcast i8* %v1 to i32*
  %v3 = load i32, i32* %v2
  ret i32 %v3
}

define i1 @B__get_c(i8* %v0) {
entry:
  ; Allocate stack space for all locals (params and vars).
  ; Initialize params to the passed argument and vars to 0.
  %v1 = getelementptr inbounds i8, i8* %v0, i32 20
  %v2 = bitcast i8* %v1 to i1*
  %v3 = load i1, i1* %v2
  ret i1 %v3
}

define i32 @main() {
entry:
  ; Allocate stack space for all locals (params and vars).
  ; Initialize params to the passed argument and vars to 0.
  %v0 = alloca %class.B*
  store %class.B* null, %class.B** %v0
  %v1 = alloca %bool_array*
  store %bool_array* null, %bool_array** %v1
  %v2 = alloca i32
  store i32 0, i32* %v2
  %v3 = alloca %class.A*
  store %class.A* null, %class.A** %v3
  %v4 = call i8* @calloc(i32 1, i32 8)
  %v5 = bitcast i8* %v4 to [3 x i8*]**
  store [3 x i8*]* @A__vtable, [3 x i8*]** %v5
  %v6 = bitcast i8* %v4 to %class.A*
  store %class.A* %v6, %class.A** %v3
  %v7 = icmp slt i32 2, 0
  br i1 %v7, label %neg_index, label %neg_index_end

neg_index:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

neg_index_end:
  %v8 = call i8* @calloc(i32 1, i32 12)
  %v9 = bitcast i8* %v8 to %bool_array*
  %v10 = call i8* @calloc(i32 1, i32 2)
  %v11 = getelementptr inbounds %bool_array, %bool_array* %v9, i32 0, i32 0
  store i32 2, i32* %v11
  %v12 = getelementptr inbounds %bool_array, %bool_array* %v9, i32 0, i32 1
  store i8* %v10, i8** %v12
  store %bool_array* %v9, %bool_array** %v1
  %v13 = load %bool_array*, %bool_array** %v1
  %v14 = bitcast %bool_array* %v13 to i32*
  %v15 = load i32, i32* %v14
  %v16 = icmp sge i32 1, %v15
  br i1 %v16, label %bounds, label %bounds_end

bounds:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

bounds_end:
  %v17 = icmp slt i32 1, 0
  br i1 %v17, label %neg_index1, label %neg_index_end1

neg_index1:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

neg_index_end1:
  %v18 = load %bool_array*, %bool_array** %v1
  %v19 = getelementptr inbounds %bool_array, %bool_array* %v18, i32 0, i32 1
  %v20 = load i8*, i8** %v19
  %v21 = getelementptr inbounds i8, i8* %v20, i32 1
  %v22 = zext i1 false to i8
  store i8 %v22, i8* %v21
  %v23 = load %bool_array*, %bool_array** %v1
  %v24 = bitcast %bool_array* %v23 to i32*
  %v25 = load i32, i32* %v24
  %v26 = icmp sge i32 1, %v25
  br i1 %v26, label %bounds1, label %bounds_end1

bounds1:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

bounds_end1:
  %v27 = icmp slt i32 1, 0
  br i1 %v27, label %neg_index2, label %neg_index_end2

neg_index2:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

neg_index_end2:
  %v28 = getelementptr inbounds %bool_array, %bool_array* %v23, i32 0, i32 1
  %v29 = load i8*, i8** %v28
  %v30 = getelementptr inbounds i8, i8* %v29, i32 1
  %v31 = load i8, i8* %v30
  %v32 = trunc i8 %v31 to i1
  br i1 %v32, label %if, label %else

if:
  %v33 = bitcast [4 x i8]* @.str to i8*
  call i32 (i8*, ...) @printf(i8* %v33, i32 1)
  br label %if_end

else:
  %v34 = load %class.A*, %class.A** %v3
  %v35 = bitcast %class.A* %v34 to i8***
  %v36 = load i8**, i8*** %v35
  %v37 = load i8*, i8** %v36
  %v38 = bitcast i8* %v37 to %bool_array*(i8*)*
  %v39 = bitcast %class.A* %v34 to i8*
  ; A__foo
  %v40 = call %bool_array* %v38(i8* %v39)
  %v41 = bitcast %bool_array* %v40 to i32*
  %v42 = load i32, i32* %v41
  %v43 = icmp sge i32 2, %v42
  br i1 %v43, label %bounds2, label %bounds_end2

bounds2:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

bounds_end2:
  %v44 = icmp slt i32 2, 0
  br i1 %v44, label %neg_index3, label %neg_index_end3

neg_index3:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

neg_index_end3:
  %v45 = getelementptr inbounds %bool_array, %bool_array* %v40, i32 0, i32 1
  %v46 = load i8*, i8** %v45
  %v47 = getelementptr inbounds i8, i8* %v46, i32 2
  %v48 = load i8, i8* %v47
  %v49 = trunc i8 %v48 to i1
  br i1 %v49, label %if1, label %else1

if1:
  %v50 = bitcast [4 x i8]* @.str to i8*
  call i32 (i8*, ...) @printf(i8* %v50, i32 10)
  br label %if_end1

else1:
  %v51 = bitcast [4 x i8]* @.str to i8*
  call i32 (i8*, ...) @printf(i8* %v51, i32 20)
  br label %if_end1

if_end1:
  br label %if_end

if_end:
  %v52 = load %class.A*, %class.A** %v3
  %v53 = load %bool_array*, %bool_array** %v1
  %v54 = bitcast %bool_array* %v53 to i32*
  %v55 = load i32, i32* %v54
  %v56 = icmp sge i32 1, %v55
  br i1 %v56, label %bounds3, label %bounds_end3

bounds3:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

bounds_end3:
  %v57 = icmp slt i32 1, 0
  br i1 %v57, label %neg_index4, label %neg_index_end4

neg_index4:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

neg_index_end4:
  %v58 = getelementptr inbounds %bool_array, %bool_array* %v53, i32 0, i32 1
  %v59 = load i8*, i8** %v58
  %v60 = getelementptr inbounds i8, i8* %v59, i32 1
  %v61 = load i8, i8* %v60
  %v62 = trunc i8 %v61 to i1
  %v63 = bitcast %class.A* %v52 to i8***
  %v64 = load i8**, i8*** %v63
  %v65 = getelementptr inbounds i8*, i8** %v64, i32 1
  %v66 = load i8*, i8** %v65
  %v67 = bitcast i8* %v66 to i32(i8*, i1)*
  %v68 = bitcast %class.A* %v52 to i8*
  ; A__bar
  %v69 = call i32 %v67(i8* %v68, i1 %v62)
  store i32 %v69, i32* %v2
  %v70 = load i32, i32* %v2
  %v71 = bitcast [4 x i8]* @.str to i8*
  call i32 (i8*, ...) @printf(i8* %v71, i32 %v70)
  %v72 = load %class.A*, %class.A** %v3
  %v73 = load %class.A*, %class.A** %v3
  %v74 = bitcast %class.A* %v73 to i8***
  %v75 = load i8**, i8*** %v74
  %v76 = load i8*, i8** %v75
  %v77 = bitcast i8* %v76 to %bool_array*(i8*)*
  %v78 = bitcast %class.A* %v73 to i8*
  ; A__foo
  %v79 = call %bool_array* %v77(i8* %v78)
  %v80 = bitcast %bool_array* %v79 to i32*
  %v81 = load i32, i32* %v80
  %v82 = icmp sge i32 2, %v81
  br i1 %v82, label %bounds4, label %bounds_end4

bounds4:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

bounds_end4:
  %v83 = icmp slt i32 2, 0
  br i1 %v83, label %neg_index5, label %neg_index_end5

neg_index5:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

neg_index_end5:
  %v84 = getelementptr inbounds %bool_array, %bool_array* %v79, i32 0, i32 1
  %v85 = load i8*, i8** %v84
  %v86 = getelementptr inbounds i8, i8* %v85, i32 2
  %v87 = load i8, i8* %v86
  %v88 = trunc i8 %v87 to i1
  %v89 = bitcast %class.A* %v72 to i8***
  %v90 = load i8**, i8*** %v89
  %v91 = getelementptr inbounds i8*, i8** %v90, i32 1
  %v92 = load i8*, i8** %v91
  %v93 = bitcast i8* %v92 to i32(i8*, i1)*
  %v94 = bitcast %class.A* %v72 to i8*
  ; A__bar
  %v95 = call i32 %v93(i8* %v94, i1 %v88)
  store i32 %v95, i32* %v2
  %v96 = load i32, i32* %v2
  %v97 = bitcast [4 x i8]* @.str to i8*
  call i32 (i8*, ...) @printf(i8* %v97, i32 %v96)
  %v98 = call i8* @calloc(i32 1, i32 21)
  %v99 = bitcast i8* %v98 to [3 x i8*]**
  store [3 x i8*]* @B__vtable, [3 x i8*]** %v99
  %v100 = bitcast i8* %v98 to %class.B*
  store %class.B* %v100, %class.B** %v0
  %v101 = load %class.B*, %class.B** %v0
  %v102 = bitcast %class.B* %v101 to i8***
  %v103 = load i8**, i8*** %v102
  %v104 = load i8*, i8** %v103
  %v105 = bitcast i8* %v104 to i32(i8*)*
  %v106 = bitcast %class.B* %v101 to i8*
  ; B__fill_arr
  %v107 = call i32 %v105(i8* %v106)
  %v108 = bitcast [4 x i8]* @.str to i8*
  call i32 (i8*, ...) @printf(i8* %v108, i32 %v107)
  %v109 = load %class.B*, %class.B** %v0
  %v110 = bitcast %class.B* %v109 to i8***
  %v111 = load i8**, i8*** %v110
  %v112 = getelementptr inbounds i8*, i8** %v111, i32 1
  %v113 = load i8*, i8** %v112
  %v114 = bitcast i8* %v113 to i32(i8*)*
  %v115 = bitcast %class.B* %v109 to i8*
  ; B__get_a
  %v116 = call i32 %v114(i8* %v115)
  %v117 = bitcast [4 x i8]* @.str to i8*
  call i32 (i8*, ...) @printf(i8* %v117, i32 %v116)
  %v118 = load %class.B*, %class.B** %v0
  %v119 = bitcast %class.B* %v118 to i8***
  %v120 = load i8**, i8*** %v119
  %v121 = getelementptr inbounds i8*, i8** %v120, i32 2
  %v122 = load i8*, i8** %v121
  %v123 = bitcast i8* %v122 to i1(i8*)*
  %v124 = bitcast %class.B* %v118 to i8*
  ; B__get_c
  %v125 = call i1 %v123(i8* %v124)
  br i1 %v125, label %if2, label %else2

if2:
  store i32 1, i32* %v2
  br label %if_end2

else2:
  store i32 0, i32* %v2
  br label %if_end2

if_end2:
  %v126 = load i32, i32* %v2
  %v127 = bitcast [4 x i8]* @.str to i8*
  call i32 (i8*, ...) @printf(i8* %v127, i32 %v126)
  %v128 = load %bool_array*, %bool_array** %v1
  %v129 = bitcast %bool_array* %v128 to i32*
  %v130 = load i32, i32* %v129
  %v131 = icmp sge i32 1, %v130
  br i1 %v131, label %bounds5, label %bounds_end5

bounds5:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

bounds_end5:
  %v132 = icmp slt i32 1, 0
  br i1 %v132, label %neg_index6, label %neg_index_end6

neg_index6:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

neg_index_end6:
  %v133 = getelementptr inbounds %bool_array, %bool_array* %v128, i32 0, i32 1
  %v134 = load i8*, i8** %v133
  %v135 = getelementptr inbounds i8, i8* %v134, i32 1
  %v136 = load i8, i8* %v135
  %v137 = trunc i8 %v136 to i1
  %v138 = load %bool_array*, %bool_array** %v1
  %v139 = bitcast %bool_array* %v138 to i32*
  %v140 = load i32, i32* %v139
  %v141 = icmp sge i32 2, %v140
  br i1 %v141, label %bounds6, label %bounds_end6

bounds6:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

bounds_end6:
  %v142 = icmp slt i32 2, 0
  br i1 %v142, label %neg_index7, label %neg_index_end7

neg_index7:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

neg_index_end7:
  %v143 = load %bool_array*, %bool_array** %v1
  %v144 = getelementptr inbounds %bool_array, %bool_array* %v143, i32 0, i32 1
  %v145 = load i8*, i8** %v144
  %v146 = getelementptr inbounds i8, i8* %v145, i32 2
  %v147 = zext i1 %v137 to i8
  store i8 %v147, i8* %v146
  ret i32 0
}

