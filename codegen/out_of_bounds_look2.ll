
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
  %v2 = call i8* @calloc(i32 1, i32 12)
  %v3 = bitcast i8* %v2 to %bool_array*
  %v4 = call i8* @calloc(i32 1, i32 2)
  %v5 = getelementptr inbounds %bool_array, %bool_array* %v3, i32 0, i32 0
  store i32 2, i32* %v5
  %v6 = getelementptr inbounds %bool_array, %bool_array* %v3, i32 0, i32 1
  store i8* %v4, i8** %v6
  store %bool_array* %v3, %bool_array** %v0
  %v7 = sub i32 0, 1
  store i32 %v7, i32* %v1
  %v8 = load %bool_array*, %bool_array** %v0
  %v9 = load i32, i32* %v1
  %v10 = bitcast %bool_array* %v8 to i32*
  %v11 = load i32, i32* %v10
  %v12 = icmp sge i32 %v9, %v11
  br i1 %v12, label %bounds, label %bounds_end

bounds:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

bounds_end:
  %v13 = icmp slt i32 %v9, 0
  br i1 %v13, label %neg_index, label %neg_index_end

neg_index:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.out, i64 0, i64 0))
  call void @exit(i32 1)
  unreachable

neg_index_end:
  %v14 = getelementptr inbounds %bool_array, %bool_array* %v8, i32 0, i32 1
  %v15 = load i8*, i8** %v14
  %v16 = getelementptr inbounds i8, i8* %v15, i32 %v9
  %v17 = load i8, i8* %v16
  %v18 = trunc i8 %v17 to i1
  br i1 %v18, label %if, label %else

if:
  %v19 = bitcast [4 x i8]* @.str to i8*
  call i32 (i8*, ...) @printf(i8* %v19, i32 1)
  br label %if_end

else:
  %v20 = bitcast [4 x i8]* @.str to i8*
  call i32 (i8*, ...) @printf(i8* %v20, i32 0)
  br label %if_end

if_end:
  ret i32 0
}

