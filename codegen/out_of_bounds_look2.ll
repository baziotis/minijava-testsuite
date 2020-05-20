
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
  %v1 = alloca i32
  store i32 0, i32* %v1
  %v2 = icmp slt i32 2, 0
  br i1 %v2, label %neg_index, label %neg_index_end

neg_index:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

neg_index_end:
  %v3 = call i8* @calloc(i32 1, i32 12)
  %v4 = bitcast i8* %v3 to %bool_array*
  %v5 = call i8* @calloc(i32 1, i32 2)
  %v6 = getelementptr inbounds %bool_array, %bool_array* %v4, i32 0, i32 0
  store i32 2, i32* %v6
  %v7 = getelementptr inbounds %bool_array, %bool_array* %v4, i32 0, i32 1
  store i8* %v5, i8** %v7
  store %bool_array* %v4, %bool_array** %v0
  %v8 = sub i32 0, 1
  store i32 %v8, i32* %v1
  %v9 = load %bool_array*, %bool_array** %v0
  %v10 = load i32, i32* %v1
  %v11 = bitcast %bool_array* %v9 to i32*
  %v12 = load i32, i32* %v11
  %v13 = icmp sge i32 %v10, %v12
  br i1 %v13, label %bounds, label %bounds_end

bounds:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

bounds_end:
  %v14 = icmp slt i32 %v10, 0
  br i1 %v14, label %neg_index1, label %neg_index_end1

neg_index1:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

neg_index_end1:
  %v15 = getelementptr inbounds %bool_array, %bool_array* %v9, i32 0, i32 1
  %v16 = load i8*, i8** %v15
  %v17 = getelementptr inbounds i8, i8* %v16, i32 %v10
  %v18 = load i8, i8* %v17
  %v19 = trunc i8 %v18 to i1
  br i1 %v19, label %if, label %else

if:
  %v20 = bitcast [4 x i8]* @.str to i8*
  call i32 (i8*, ...) @printf(i8* %v20, i32 1)
  br label %if_end

else:
  %v21 = bitcast [4 x i8]* @.str to i8*
  call i32 (i8*, ...) @printf(i8* %v21, i32 0)
  br label %if_end

if_end:
  ret i32 0
}

