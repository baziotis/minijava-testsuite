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
  %v2 = call i8* @calloc(i32 1, i32 12)
  %v3 = bitcast i8* %v2 to %bool_array*
  %v4 = call i8* @calloc(i32 1, i32 200)
  %v5 = getelementptr inbounds %bool_array, %bool_array* %v3, i32 0, i32 0
  store i32 200, i32* %v5
  %v6 = getelementptr inbounds %bool_array, %bool_array* %v3, i32 0, i32 1
  store i8* %v4, i8** %v6
  store %bool_array* %v3, %bool_array** %v1
  %v7 = load %bool_array*, %bool_array** %v1
  %v8 = bitcast %bool_array* %v7 to i32*
  %v9 = load i32, i32* %v8
  %v10 = icmp sge i32 2, %v9
  br i1 %v10, label %bounds, label %bounds_end

bounds:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

bounds_end:
  %v11 = icmp slt i32 2, 0
  br i1 %v11, label %neg_index, label %neg_index_end

neg_index:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

neg_index_end:
  %v12 = load %bool_array*, %bool_array** %v1
  %v13 = getelementptr inbounds %bool_array, %bool_array* %v12, i32 0, i32 1
  %v14 = load i8*, i8** %v13
  %v15 = getelementptr inbounds i8, i8* %v14, i32 2
  %v16 = zext i1 true to i8
  store i8 %v16, i8* %v15
  %v17 = load %bool_array*, %bool_array** %v1
  ret %bool_array* %v17
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
  %v5 = call i8* @calloc(i32 1, i32 12)
  %v6 = bitcast i8* %v5 to %bool_array*
  %v7 = call i8* @calloc(i32 1, i32 %v4)
  %v8 = getelementptr inbounds %bool_array, %bool_array* %v6, i32 0, i32 0
  store i32 %v4, i32* %v8
  %v9 = getelementptr inbounds %bool_array, %bool_array* %v6, i32 0, i32 1
  store i8* %v7, i8** %v9
  store %bool_array* %v6, %bool_array** %v1
  store i32 0, i32* %v2
  br label %header

header:
  %v10 = load i32, i32* %v2
  %v11 = load i32, i32* %v3
  %v12 = icmp slt i32 %v10, %v11
  br i1 %v12, label %loop_body, label %exit_block

loop_body:
  %v13 = load i32, i32* %v2
  %v14 = load %bool_array*, %bool_array** %v1
  %v15 = bitcast %bool_array* %v14 to i32*
  %v16 = load i32, i32* %v15
  %v17 = icmp sge i32 %v13, %v16
  br i1 %v17, label %bounds, label %bounds_end

bounds:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

bounds_end:
  %v18 = icmp slt i32 %v13, 0
  br i1 %v18, label %neg_index, label %neg_index_end

neg_index:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

neg_index_end:
  %v19 = load %bool_array*, %bool_array** %v1
  %v20 = getelementptr inbounds %bool_array, %bool_array* %v19, i32 0, i32 1
  %v21 = load i8*, i8** %v20
  %v22 = getelementptr inbounds i8, i8* %v21, i32 %v13
  %v23 = zext i1 true to i8
  store i8 %v23, i8* %v22
  %v24 = load i32, i32* %v2
  %v25 = add i32 %v24, 1
  store i32 %v25, i32* %v2
  br label %header

exit_block:
  %v26 = load %bool_array*, %bool_array** %v1
  %v27 = getelementptr inbounds i8, i8* %v0, i32 12
  %v28 = bitcast i8* %v27 to %bool_array**
  store %bool_array* %v26, %bool_array** %v28
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
  %v7 = call i8* @calloc(i32 1, i32 12)
  %v8 = bitcast i8* %v7 to %bool_array*
  %v9 = call i8* @calloc(i32 1, i32 2)
  %v10 = getelementptr inbounds %bool_array, %bool_array* %v8, i32 0, i32 0
  store i32 2, i32* %v10
  %v11 = getelementptr inbounds %bool_array, %bool_array* %v8, i32 0, i32 1
  store i8* %v9, i8** %v11
  store %bool_array* %v8, %bool_array** %v1
  %v12 = load %bool_array*, %bool_array** %v1
  %v13 = bitcast %bool_array* %v12 to i32*
  %v14 = load i32, i32* %v13
  %v15 = icmp sge i32 1, %v14
  br i1 %v15, label %bounds, label %bounds_end

bounds:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

bounds_end:
  %v16 = icmp slt i32 1, 0
  br i1 %v16, label %neg_index, label %neg_index_end

neg_index:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

neg_index_end:
  %v17 = load %bool_array*, %bool_array** %v1
  %v18 = getelementptr inbounds %bool_array, %bool_array* %v17, i32 0, i32 1
  %v19 = load i8*, i8** %v18
  %v20 = getelementptr inbounds i8, i8* %v19, i32 1
  %v21 = zext i1 false to i8
  store i8 %v21, i8* %v20
  %v22 = load %bool_array*, %bool_array** %v1
  %v23 = bitcast %bool_array* %v22 to i32*
  %v24 = load i32, i32* %v23
  %v25 = icmp sge i32 1, %v24
  br i1 %v25, label %bounds1, label %bounds_end1

bounds1:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

bounds_end1:
  %v26 = icmp slt i32 1, 0
  br i1 %v26, label %neg_index1, label %neg_index_end1

neg_index1:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

neg_index_end1:
  %v27 = getelementptr inbounds %bool_array, %bool_array* %v22, i32 0, i32 1
  %v28 = load i8*, i8** %v27
  %v29 = getelementptr inbounds i8, i8* %v28, i32 1
  %v30 = load i8, i8* %v29
  %v31 = trunc i8 %v30 to i1
  br i1 %v31, label %if, label %else

if:
  %v32 = bitcast [4 x i8]* @.str to i8*
  call i32 (i8*, ...) @printf(i8* %v32, i32 1)
  br label %if_end

else:
  %v33 = load %class.A*, %class.A** %v3
  %v34 = bitcast %class.A* %v33 to i8***
  %v35 = load i8**, i8*** %v34
  %v36 = load i8*, i8** %v35
  %v37 = bitcast i8* %v36 to %bool_array*(i8*)*
  %v38 = bitcast %class.A* %v33 to i8*
  ; A__foo
  %v39 = call %bool_array* %v37(i8* %v38)
  %v40 = bitcast %bool_array* %v39 to i32*
  %v41 = load i32, i32* %v40
  %v42 = icmp sge i32 2, %v41
  br i1 %v42, label %bounds2, label %bounds_end2

bounds2:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

bounds_end2:
  %v43 = icmp slt i32 2, 0
  br i1 %v43, label %neg_index2, label %neg_index_end2

neg_index2:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

neg_index_end2:
  %v44 = getelementptr inbounds %bool_array, %bool_array* %v39, i32 0, i32 1
  %v45 = load i8*, i8** %v44
  %v46 = getelementptr inbounds i8, i8* %v45, i32 2
  %v47 = load i8, i8* %v46
  %v48 = trunc i8 %v47 to i1
  br i1 %v48, label %if1, label %else1

if1:
  %v49 = bitcast [4 x i8]* @.str to i8*
  call i32 (i8*, ...) @printf(i8* %v49, i32 10)
  br label %if_end1

else1:
  %v50 = bitcast [4 x i8]* @.str to i8*
  call i32 (i8*, ...) @printf(i8* %v50, i32 20)
  br label %if_end1

if_end1:
  br label %if_end

if_end:
  %v51 = load %class.A*, %class.A** %v3
  %v52 = load %bool_array*, %bool_array** %v1
  %v53 = bitcast %bool_array* %v52 to i32*
  %v54 = load i32, i32* %v53
  %v55 = icmp sge i32 1, %v54
  br i1 %v55, label %bounds3, label %bounds_end3

bounds3:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

bounds_end3:
  %v56 = icmp slt i32 1, 0
  br i1 %v56, label %neg_index3, label %neg_index_end3

neg_index3:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

neg_index_end3:
  %v57 = getelementptr inbounds %bool_array, %bool_array* %v52, i32 0, i32 1
  %v58 = load i8*, i8** %v57
  %v59 = getelementptr inbounds i8, i8* %v58, i32 1
  %v60 = load i8, i8* %v59
  %v61 = trunc i8 %v60 to i1
  %v62 = bitcast %class.A* %v51 to i8***
  %v63 = load i8**, i8*** %v62
  %v64 = getelementptr inbounds i8*, i8** %v63, i32 1
  %v65 = load i8*, i8** %v64
  %v66 = bitcast i8* %v65 to i32(i8*, i1)*
  %v67 = bitcast %class.A* %v51 to i8*
  ; A__bar
  %v68 = call i32 %v66(i8* %v67, i1 %v61)
  store i32 %v68, i32* %v2
  %v69 = load i32, i32* %v2
  %v70 = bitcast [4 x i8]* @.str to i8*
  call i32 (i8*, ...) @printf(i8* %v70, i32 %v69)
  %v71 = load %class.A*, %class.A** %v3
  %v72 = load %class.A*, %class.A** %v3
  %v73 = bitcast %class.A* %v72 to i8***
  %v74 = load i8**, i8*** %v73
  %v75 = load i8*, i8** %v74
  %v76 = bitcast i8* %v75 to %bool_array*(i8*)*
  %v77 = bitcast %class.A* %v72 to i8*
  ; A__foo
  %v78 = call %bool_array* %v76(i8* %v77)
  %v79 = bitcast %bool_array* %v78 to i32*
  %v80 = load i32, i32* %v79
  %v81 = icmp sge i32 2, %v80
  br i1 %v81, label %bounds4, label %bounds_end4

bounds4:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

bounds_end4:
  %v82 = icmp slt i32 2, 0
  br i1 %v82, label %neg_index4, label %neg_index_end4

neg_index4:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

neg_index_end4:
  %v83 = getelementptr inbounds %bool_array, %bool_array* %v78, i32 0, i32 1
  %v84 = load i8*, i8** %v83
  %v85 = getelementptr inbounds i8, i8* %v84, i32 2
  %v86 = load i8, i8* %v85
  %v87 = trunc i8 %v86 to i1
  %v88 = bitcast %class.A* %v71 to i8***
  %v89 = load i8**, i8*** %v88
  %v90 = getelementptr inbounds i8*, i8** %v89, i32 1
  %v91 = load i8*, i8** %v90
  %v92 = bitcast i8* %v91 to i32(i8*, i1)*
  %v93 = bitcast %class.A* %v71 to i8*
  ; A__bar
  %v94 = call i32 %v92(i8* %v93, i1 %v87)
  store i32 %v94, i32* %v2
  %v95 = load i32, i32* %v2
  %v96 = bitcast [4 x i8]* @.str to i8*
  call i32 (i8*, ...) @printf(i8* %v96, i32 %v95)
  %v97 = call i8* @calloc(i32 1, i32 21)
  %v98 = bitcast i8* %v97 to [3 x i8*]**
  store [3 x i8*]* @B__vtable, [3 x i8*]** %v98
  %v99 = bitcast i8* %v97 to %class.B*
  store %class.B* %v99, %class.B** %v0
  %v100 = load %class.B*, %class.B** %v0
  %v101 = bitcast %class.B* %v100 to i8***
  %v102 = load i8**, i8*** %v101
  %v103 = load i8*, i8** %v102
  %v104 = bitcast i8* %v103 to i32(i8*)*
  %v105 = bitcast %class.B* %v100 to i8*
  ; B__fill_arr
  %v106 = call i32 %v104(i8* %v105)
  %v107 = bitcast [4 x i8]* @.str to i8*
  call i32 (i8*, ...) @printf(i8* %v107, i32 %v106)
  %v108 = load %class.B*, %class.B** %v0
  %v109 = bitcast %class.B* %v108 to i8***
  %v110 = load i8**, i8*** %v109
  %v111 = getelementptr inbounds i8*, i8** %v110, i32 1
  %v112 = load i8*, i8** %v111
  %v113 = bitcast i8* %v112 to i32(i8*)*
  %v114 = bitcast %class.B* %v108 to i8*
  ; B__get_a
  %v115 = call i32 %v113(i8* %v114)
  %v116 = bitcast [4 x i8]* @.str to i8*
  call i32 (i8*, ...) @printf(i8* %v116, i32 %v115)
  %v117 = load %class.B*, %class.B** %v0
  %v118 = bitcast %class.B* %v117 to i8***
  %v119 = load i8**, i8*** %v118
  %v120 = getelementptr inbounds i8*, i8** %v119, i32 2
  %v121 = load i8*, i8** %v120
  %v122 = bitcast i8* %v121 to i1(i8*)*
  %v123 = bitcast %class.B* %v117 to i8*
  ; B__get_c
  %v124 = call i1 %v122(i8* %v123)
  br i1 %v124, label %if2, label %else2

if2:
  store i32 1, i32* %v2
  br label %if_end2

else2:
  store i32 0, i32* %v2
  br label %if_end2

if_end2:
  %v125 = load i32, i32* %v2
  %v126 = bitcast [4 x i8]* @.str to i8*
  call i32 (i8*, ...) @printf(i8* %v126, i32 %v125)
  %v127 = load %bool_array*, %bool_array** %v1
  %v128 = bitcast %bool_array* %v127 to i32*
  %v129 = load i32, i32* %v128
  %v130 = icmp sge i32 1, %v129
  br i1 %v130, label %bounds5, label %bounds_end5

bounds5:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

bounds_end5:
  %v131 = icmp slt i32 1, 0
  br i1 %v131, label %neg_index5, label %neg_index_end5

neg_index5:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

neg_index_end5:
  %v132 = getelementptr inbounds %bool_array, %bool_array* %v127, i32 0, i32 1
  %v133 = load i8*, i8** %v132
  %v134 = getelementptr inbounds i8, i8* %v133, i32 1
  %v135 = load i8, i8* %v134
  %v136 = trunc i8 %v135 to i1
  %v137 = load %bool_array*, %bool_array** %v1
  %v138 = bitcast %bool_array* %v137 to i32*
  %v139 = load i32, i32* %v138
  %v140 = icmp sge i32 2, %v139
  br i1 %v140, label %bounds6, label %bounds_end6

bounds6:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

bounds_end6:
  %v141 = icmp slt i32 2, 0
  br i1 %v141, label %neg_index6, label %neg_index_end6

neg_index6:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

neg_index_end6:
  %v142 = load %bool_array*, %bool_array** %v1
  %v143 = getelementptr inbounds %bool_array, %bool_array* %v142, i32 0, i32 1
  %v144 = load i8*, i8** %v143
  %v145 = getelementptr inbounds i8, i8* %v144, i32 2
  %v146 = zext i1 %v136 to i8
  store i8 %v146, i8* %v145
  ret i32 0
}

