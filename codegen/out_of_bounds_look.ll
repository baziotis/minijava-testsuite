
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
  %v0 = alloca %bool_array*
  store %bool_array* null, %bool_array** %v0
  %v1 = icmp slt i32 2, 0
  br i1 %v1, label %neg_index, label %neg_index_end

neg_index:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

neg_index_end:
  %v2 = call i8* @calloc(i32 1, i32 12)
  %v3 = bitcast i8* %v2 to %bool_array*
  %v4 = call i8* @calloc(i32 1, i32 2)
  %v5 = getelementptr inbounds %bool_array, %bool_array* %v3, i32 0, i32 0
  store i32 2, i32* %v5
  %v6 = getelementptr inbounds %bool_array, %bool_array* %v3, i32 0, i32 1
  store i8* %v4, i8** %v6
  store %bool_array* %v3, %bool_array** %v0
  %v7 = load %bool_array*, %bool_array** %v0
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
  br i1 %v11, label %neg_index1, label %neg_index_end1

neg_index1:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

neg_index_end1:
  %v12 = getelementptr inbounds %bool_array, %bool_array* %v7, i32 0, i32 1
  %v13 = load i8*, i8** %v12
  %v14 = getelementptr inbounds i8, i8* %v13, i32 2
  %v15 = load i8, i8* %v14
  %v16 = trunc i8 %v15 to i1
  br i1 %v16, label %if, label %else

if:
  %v17 = bitcast [4 x i8]* @.str to i8*
  call i32 (i8*, ...) @printf(i8* %v17, i32 1)
  br label %if_end

else:
  %v18 = bitcast [4 x i8]* @.str to i8*
  call i32 (i8*, ...) @printf(i8* %v18, i32 0)
  br label %if_end

if_end:
  ret i32 0
}

