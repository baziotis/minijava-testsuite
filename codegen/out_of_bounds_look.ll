
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
  %v1 = call i8* @calloc(i32 1, i32 12)
  %v2 = bitcast i8* %v1 to %bool_array*
  %v3 = call i8* @calloc(i32 1, i32 2)
  %v4 = getelementptr inbounds %bool_array, %bool_array* %v2, i32 0, i32 0
  store i32 2, i32* %v4
  %v5 = getelementptr inbounds %bool_array, %bool_array* %v2, i32 0, i32 1
  store i8* %v3, i8** %v5
  store %bool_array* %v2, %bool_array** %v0
  %v6 = load %bool_array*, %bool_array** %v0
  %v7 = bitcast %bool_array* %v6 to i32*
  %v8 = load i32, i32* %v7
  %v9 = icmp sge i32 2, %v8
  br i1 %v9, label %bounds, label %bounds_end

bounds:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

bounds_end:
  %v10 = icmp slt i32 2, 0
  br i1 %v10, label %neg_index, label %neg_index_end

neg_index:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

neg_index_end:
  %v11 = getelementptr inbounds %bool_array, %bool_array* %v6, i32 0, i32 1
  %v12 = load i8*, i8** %v11
  %v13 = getelementptr inbounds i8, i8* %v12, i32 2
  %v14 = load i8, i8* %v13
  %v15 = trunc i8 %v14 to i1
  br i1 %v15, label %if, label %else

if:
  %v16 = bitcast [4 x i8]* @.str to i8*
  call i32 (i8*, ...) @printf(i8* %v16, i32 1)
  br label %if_end

else:
  %v17 = bitcast [4 x i8]* @.str to i8*
  call i32 (i8*, ...) @printf(i8* %v17, i32 0)
  br label %if_end

if_end:
  ret i32 0
}

