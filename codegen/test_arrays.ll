
declare i8* @calloc(i32, i32)
declare void @exit(i32)
declare i32 @printf(i8*, ...)
@.str = constant [4 x i8] c"%d\0A\00"

@.out = private unnamed_addr constant [15 x i8] c"Out of bounds\0A\00"

%bool_array = type { i32, i8* }

define i32 @main() {
entry:
  ; Allocate stack space for all locals (params and vars).
  ; Initialize params to the passed argument and vars to 0.
  %v0 = alloca i32
  store i32 0, i32* %v0
  %v1 = alloca i32
  store i32 0, i32* %v1
  %v2 = alloca i32
  store i32 0, i32* %v2
  %v3 = alloca i32*
  store i32* null, i32** %v3
  %v4 = alloca i32*
  store i32* null, i32** %v4
  %v5 = alloca %bool_array*
  store %bool_array* null, %bool_array** %v5
  %v6 = alloca i1
  store i1 false, i1* %v6
  store i32 1024, i32* %v0
  %v7 = load i32, i32* %v0
  %v8 = add i32 %v7, 1
  %v9 = sub i32 %v8, 1
  %v10 = icmp slt i32 %v9, 0
  br i1 %v10, label %neg_index, label %neg_index_end

neg_index:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

neg_index_end:
  %v11 = add i32 %v9, 1
  %v12 = mul i32 %v11, 4
  %v13 = call i8* @calloc(i32 1, i32 %v12)
  %v14 = bitcast i8* %v13 to i32*
  store i32 %v9, i32* %v14
  store i32* %v14, i32** %v3
  %v15 = load i32*, i32** %v3
  %v16 = load i32, i32* %v15
  %v17 = load i32, i32* %v0
  %v18 = icmp slt i32 %v16, %v17
  %v19 = icmp eq i1 %v18, false
  br i1 %v19, label %and, label %and_end

and:
  %v20 = load i32, i32* %v0
  %v21 = load i32*, i32** %v3
  %v22 = load i32, i32* %v21
  %v23 = icmp slt i32 %v20, %v22
  %v24 = icmp eq i1 %v23, false
  br label %and_end

and_end:
  %v25 = phi i1 [ false, %neg_index_end ], [ %v24, %and ]
  br i1 %v25, label %if, label %else

if:
  %v26 = load i32*, i32** %v3
  %v27 = load i32, i32* %v26
  %v28 = bitcast [4 x i8]* @.str to i8*
  call i32 (i8*, ...) @printf(i8* %v28, i32 %v27)
  br label %if_end

else:
  %v29 = bitcast [4 x i8]* @.str to i8*
  call i32 (i8*, ...) @printf(i8* %v29, i32 2020)
  br label %if_end

if_end:
  %v30 = load i32, i32* %v0
  %v31 = add i32 %v30, 1
  %v32 = sub i32 %v31, 1
  %v33 = icmp slt i32 %v32, 0
  br i1 %v33, label %neg_index1, label %neg_index_end1

neg_index1:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

neg_index_end1:
  %v34 = call i8* @calloc(i32 1, i32 12)
  %v35 = bitcast i8* %v34 to %bool_array*
  %v36 = call i8* @calloc(i32 1, i32 %v32)
  %v37 = getelementptr inbounds %bool_array, %bool_array* %v35, i32 0, i32 0
  store i32 %v32, i32* %v37
  %v38 = getelementptr inbounds %bool_array, %bool_array* %v35, i32 0, i32 1
  store i8* %v36, i8** %v38
  store %bool_array* %v35, %bool_array** %v5
  %v39 = load %bool_array*, %bool_array** %v5
  %v40 = bitcast %bool_array* %v39 to i32*
  %v41 = load i32, i32* %v40
  %v42 = load i32, i32* %v0
  %v43 = icmp slt i32 %v41, %v42
  %v44 = icmp eq i1 %v43, false
  br i1 %v44, label %and1, label %and_end1

and1:
  %v45 = load i32, i32* %v0
  %v46 = load %bool_array*, %bool_array** %v5
  %v47 = bitcast %bool_array* %v46 to i32*
  %v48 = load i32, i32* %v47
  %v49 = icmp slt i32 %v45, %v48
  %v50 = icmp eq i1 %v49, false
  br label %and_end1

and_end1:
  %v51 = phi i1 [ false, %neg_index_end1 ], [ %v50, %and1 ]
  br i1 %v51, label %if1, label %else1

if1:
  %v52 = load %bool_array*, %bool_array** %v5
  %v53 = bitcast %bool_array* %v52 to i32*
  %v54 = load i32, i32* %v53
  %v55 = bitcast [4 x i8]* @.str to i8*
  call i32 (i8*, ...) @printf(i8* %v55, i32 %v54)
  br label %if_end1

else1:
  %v56 = bitcast [4 x i8]* @.str to i8*
  call i32 (i8*, ...) @printf(i8* %v56, i32 2020)
  br label %if_end1

if_end1:
  store i32 0, i32* %v1
  br label %header

header:
  %v57 = load i32, i32* %v1
  %v58 = load i32*, i32** %v3
  %v59 = load i32, i32* %v58
  %v60 = icmp slt i32 %v57, %v59
  br i1 %v60, label %loop_body, label %exit_block

loop_body:
  %v61 = load i32, i32* %v1
  %v62 = load i32, i32* %v1
  %v63 = mul i32 %v62, 2
  %v64 = load i32*, i32** %v3
  %v65 = load i32, i32* %v64
  %v66 = icmp sge i32 %v61, %v65
  br i1 %v66, label %bounds, label %bounds_end

bounds:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

bounds_end:
  %v67 = icmp slt i32 %v61, 0
  br i1 %v67, label %neg_index2, label %neg_index_end2

neg_index2:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

neg_index_end2:
  %v68 = load i32*, i32** %v3
  %v69 = add i32 %v61, 1
  %v70 = getelementptr inbounds i32, i32* %v68, i32 %v69
  store i32 %v63, i32* %v70
  %v71 = load i32, i32* %v1
  %v72 = add i32 %v71, 1
  store i32 %v72, i32* %v1
  br label %header

exit_block:
  store i32 0, i32* %v1
  %v73 = load i32*, i32** %v3
  store i32* %v73, i32** %v4
  store i32 0, i32* %v2
  br label %header1

header1:
  %v74 = load i32, i32* %v1
  %v75 = load i32*, i32** %v4
  %v76 = load i32, i32* %v75
  %v77 = icmp slt i32 %v74, %v76
  br i1 %v77, label %loop_body1, label %exit_block1

loop_body1:
  %v78 = load i32*, i32** %v4
  %v79 = load i32, i32* %v1
  %v80 = load i32, i32* %v78
  %v81 = icmp sge i32 %v79, %v80
  br i1 %v81, label %bounds1, label %bounds_end1

bounds1:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

bounds_end1:
  %v82 = icmp slt i32 %v79, 0
  br i1 %v82, label %neg_index3, label %neg_index_end3

neg_index3:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

neg_index_end3:
  %v83 = add i32 %v79, 1
  %v84 = getelementptr inbounds i32, i32* %v78, i32 %v83
  %v85 = load i32, i32* %v84
  %v86 = load i32, i32* %v2
  %v87 = add i32 %v85, %v86
  store i32 %v87, i32* %v2
  %v88 = load i32, i32* %v1
  %v89 = add i32 %v88, 1
  store i32 %v89, i32* %v1
  br label %header1

exit_block1:
  %v90 = load i32, i32* %v2
  %v91 = bitcast [4 x i8]* @.str to i8*
  call i32 (i8*, ...) @printf(i8* %v91, i32 %v90)
  store i32 0, i32* %v1
  store i1 true, i1* %v6
  br label %header2

header2:
  %v92 = load i32, i32* %v1
  %v93 = load %bool_array*, %bool_array** %v5
  %v94 = bitcast %bool_array* %v93 to i32*
  %v95 = load i32, i32* %v94
  %v96 = icmp slt i32 %v92, %v95
  br i1 %v96, label %loop_body2, label %exit_block2

loop_body2:
  %v97 = load i32, i32* %v1
  %v98 = load i1, i1* %v6
  %v99 = load %bool_array*, %bool_array** %v5
  %v100 = bitcast %bool_array* %v99 to i32*
  %v101 = load i32, i32* %v100
  %v102 = icmp sge i32 %v97, %v101
  br i1 %v102, label %bounds2, label %bounds_end2

bounds2:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

bounds_end2:
  %v103 = icmp slt i32 %v97, 0
  br i1 %v103, label %neg_index4, label %neg_index_end4

neg_index4:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

neg_index_end4:
  %v104 = load %bool_array*, %bool_array** %v5
  %v105 = getelementptr inbounds %bool_array, %bool_array* %v104, i32 0, i32 1
  %v106 = load i8*, i8** %v105
  %v107 = getelementptr inbounds i8, i8* %v106, i32 %v97
  %v108 = zext i1 %v98 to i8
  store i8 %v108, i8* %v107
  %v109 = load i1, i1* %v6
  %v110 = icmp eq i1 %v109, false
  store i1 %v110, i1* %v6
  %v111 = load i32, i32* %v1
  %v112 = add i32 %v111, 1
  store i32 %v112, i32* %v1
  br label %header2

exit_block2:
  store i32 0, i32* %v1
  store i32 0, i32* %v2
  br label %header3

header3:
  %v113 = load i32, i32* %v1
  %v114 = load %bool_array*, %bool_array** %v5
  %v115 = bitcast %bool_array* %v114 to i32*
  %v116 = load i32, i32* %v115
  %v117 = icmp slt i32 %v113, %v116
  br i1 %v117, label %loop_body3, label %exit_block3

loop_body3:
  %v118 = load %bool_array*, %bool_array** %v5
  %v119 = load i32, i32* %v1
  %v120 = bitcast %bool_array* %v118 to i32*
  %v121 = load i32, i32* %v120
  %v122 = icmp sge i32 %v119, %v121
  br i1 %v122, label %bounds3, label %bounds_end3

bounds3:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

bounds_end3:
  %v123 = icmp slt i32 %v119, 0
  br i1 %v123, label %neg_index5, label %neg_index_end5

neg_index5:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

neg_index_end5:
  %v124 = getelementptr inbounds %bool_array, %bool_array* %v118, i32 0, i32 1
  %v125 = load i8*, i8** %v124
  %v126 = getelementptr inbounds i8, i8* %v125, i32 %v119
  %v127 = load i8, i8* %v126
  %v128 = trunc i8 %v127 to i1
  br i1 %v128, label %if2, label %else2

if2:
  %v129 = load i32, i32* %v2
  %v130 = add i32 %v129, 1
  store i32 %v130, i32* %v2
  br label %if_end2

else2:
  %v131 = load i32, i32* %v2
  %v132 = add i32 %v131, 10
  store i32 %v132, i32* %v2
  br label %if_end2

if_end2:
  %v133 = load i32, i32* %v1
  %v134 = add i32 %v133, 1
  store i32 %v134, i32* %v1
  br label %header3

exit_block3:
  %v135 = load i32, i32* %v2
  %v136 = bitcast [4 x i8]* @.str to i8*
  call i32 (i8*, ...) @printf(i8* %v136, i32 %v135)
  ret i32 0
}

