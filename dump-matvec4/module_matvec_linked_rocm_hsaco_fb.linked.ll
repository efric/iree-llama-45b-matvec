; ModuleID = 'matvec_linked'
source_filename = "matvec_linked"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"

@__shared_memory__ = private addrspace(3) global [2 x [4 x float]] undef, align 16
@__shared_memory___0 = private addrspace(3) global [2 x [10 x float]] undef, align 16
@__shared_memory___1 = private addrspace(3) global [2 x [10 x float]] undef, align 16

; Function Attrs: alwaysinline
define amdgpu_kernel void @dispatch_131_dispatch_0_matmul_like_4x16384x6656_f16xf16xf32(ptr addrspace(1) inreg noalias noundef nonnull readonly align 16 %0, ptr addrspace(1) inreg noalias noundef nonnull readonly align 16 %1, ptr addrspace(1) inreg noalias noundef nonnull align 16 %2) #0 !reqd_work_group_size !2 {
  %4 = call range(i32 0, 128) i32 @llvm.amdgcn.workitem.id.x()
  %5 = sext i32 %4 to i64
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %0, i64 64) ]
  %6 = call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) %0, i16 0, i32 53248, i32 159744)
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %1, i64 64) ]
  %7 = call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) %1, i16 0, i32 218103808, i32 159744)
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %2, i64 64) ]
  %8 = call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) %2, i16 0, i32 131072, i32 159744)
  %9 = call range(i32 0, 16384) i32 @llvm.amdgcn.workgroup.id.x()
  %10 = sext i32 %9 to i64
  %11 = call range(i32 0, 2) i32 @llvm.amdgcn.workgroup.id.y()
  %12 = sext i32 %11 to i64
  %13 = trunc i64 %12 to i32
  %14 = mul nsw i32 %13, 2
  %15 = zext i32 %14 to i64
  %16 = trunc i64 %5 to i32
  %17 = udiv i32 %16, 64
  %18 = zext i32 %17 to i64
  %19 = urem i32 %16, 64
  %20 = add nsw i32 %14, 1
  %21 = zext i32 %20 to i64
  %22 = mul nsw i32 %17, 256
  %23 = mul nsw i32 %19, 4
  %24 = add nsw i32 %22, %23
  br label %25

25:                                               ; preds = %29, %3
  %26 = phi i32 [ %55, %29 ], [ 0, %3 ]
  %27 = phi [2 x [1 x [1 x [1 x [1 x <4 x float>]]]]] [ %54, %29 ], [ zeroinitializer, %3 ]
  %28 = icmp slt i32 %26, 6656
  br i1 %28, label %29, label %56

29:                                               ; preds = %25
  %30 = add nsw i32 %24, %26
  %31 = zext i32 %30 to i64
  %32 = mul i64 %15, 6656
  %33 = add i64 %32, %31
  %34 = getelementptr half, ptr addrspace(7) %6, i64 %33
  %35 = load <4 x half>, ptr addrspace(7) %34, align 2
  %36 = mul i64 %21, 6656
  %37 = add i64 %36, %31
  %38 = getelementptr half, ptr addrspace(7) %6, i64 %37
  %39 = load <4 x half>, ptr addrspace(7) %38, align 2
  %40 = mul i64 %10, 6656
  %41 = add i64 %40, %31
  %42 = getelementptr half, ptr addrspace(7) %7, i64 %41
  %43 = load <4 x half>, ptr addrspace(7) %42, align 2
  %44 = fpext <4 x half> %35 to <4 x float>
  %45 = fpext <4 x half> %39 to <4 x float>
  %46 = fpext <4 x half> %43 to <4 x float>
  %47 = fmul <4 x float> %44, %46
  %48 = fmul <4 x float> %45, %46
  %49 = extractvalue [2 x [1 x [1 x [1 x [1 x <4 x float>]]]]] %27, 0, 0, 0, 0, 0
  %50 = fadd <4 x float> %49, %47
  %51 = insertvalue [2 x [1 x [1 x [1 x [1 x <4 x float>]]]]] poison, <4 x float> %50, 0, 0, 0, 0, 0
  %52 = extractvalue [2 x [1 x [1 x [1 x [1 x <4 x float>]]]]] %27, 1, 0, 0, 0, 0
  %53 = fadd <4 x float> %52, %48
  %54 = insertvalue [2 x [1 x [1 x [1 x [1 x <4 x float>]]]]] %51, <4 x float> %53, 1, 0, 0, 0, 0
  %55 = add i32 %26, 512
  br label %25

56:                                               ; preds = %25
  %57 = extractvalue [2 x [1 x [1 x [1 x [1 x <4 x float>]]]]] %27, 0, 0, 0, 0, 0
  %58 = extractelement <4 x float> %57, i64 0
  %59 = insertelement <2 x float> poison, float %58, i64 0
  %60 = extractvalue [2 x [1 x [1 x [1 x [1 x <4 x float>]]]]] %27, 1, 0, 0, 0, 0
  %61 = extractelement <4 x float> %60, i64 0
  %62 = insertelement <2 x float> %59, float %61, i64 1
  %63 = extractvalue [2 x [1 x [1 x [1 x [1 x <4 x float>]]]]] %27, 0, 0, 0, 0, 0
  %64 = extractelement <4 x float> %63, i64 1
  %65 = insertelement <2 x float> poison, float %64, i64 0
  %66 = extractvalue [2 x [1 x [1 x [1 x [1 x <4 x float>]]]]] %27, 1, 0, 0, 0, 0
  %67 = extractelement <4 x float> %66, i64 1
  %68 = insertelement <2 x float> %65, float %67, i64 1
  %69 = extractvalue [2 x [1 x [1 x [1 x [1 x <4 x float>]]]]] %27, 0, 0, 0, 0, 0
  %70 = extractelement <4 x float> %69, i64 2
  %71 = insertelement <2 x float> poison, float %70, i64 0
  %72 = extractvalue [2 x [1 x [1 x [1 x [1 x <4 x float>]]]]] %27, 1, 0, 0, 0, 0
  %73 = extractelement <4 x float> %72, i64 2
  %74 = insertelement <2 x float> %71, float %73, i64 1
  %75 = extractvalue [2 x [1 x [1 x [1 x [1 x <4 x float>]]]]] %27, 0, 0, 0, 0, 0
  %76 = extractelement <4 x float> %75, i64 3
  %77 = insertelement <2 x float> poison, float %76, i64 0
  %78 = extractvalue [2 x [1 x [1 x [1 x [1 x <4 x float>]]]]] %27, 1, 0, 0, 0, 0
  %79 = extractelement <4 x float> %78, i64 3
  %80 = insertelement <2 x float> %77, float %79, i64 1
  %81 = fadd <2 x float> %62, zeroinitializer
  %82 = fadd <2 x float> %68, %81
  %83 = fadd <2 x float> %74, %82
  %84 = fadd <2 x float> %80, %83
  %85 = extractelement <2 x float> %84, i64 0
  %86 = call float @llvm.amdgcn.update.dpp.f32(float %85, float %85, i32 177, i32 15, i32 15, i1 true)
  %87 = fadd float %85, %86
  %88 = call float @llvm.amdgcn.update.dpp.f32(float %87, float %87, i32 78, i32 15, i32 15, i1 true)
  %89 = fadd float %87, %88
  %90 = call float @llvm.amdgcn.update.dpp.f32(float %89, float %89, i32 321, i32 15, i32 15, i1 true)
  %91 = fadd float %89, %90
  %92 = call float @llvm.amdgcn.update.dpp.f32(float %91, float %91, i32 320, i32 15, i32 15, i1 true)
  %93 = fadd float %91, %92
  %94 = call float @llvm.amdgcn.update.dpp.f32(float %93, float %93, i32 322, i32 10, i32 15, i1 false)
  %95 = fadd float %93, %94
  %96 = call float @llvm.amdgcn.update.dpp.f32(float %95, float %95, i32 323, i32 15, i32 15, i1 true)
  %97 = fadd float %96, %95
  %98 = call float @llvm.amdgcn.readlane.f32(float %97, i32 63)
  %99 = extractelement <2 x float> %84, i64 1
  %100 = call float @llvm.amdgcn.update.dpp.f32(float %99, float %99, i32 177, i32 15, i32 15, i1 true)
  %101 = fadd float %99, %100
  %102 = call float @llvm.amdgcn.update.dpp.f32(float %101, float %101, i32 78, i32 15, i32 15, i1 true)
  %103 = fadd float %101, %102
  %104 = call float @llvm.amdgcn.update.dpp.f32(float %103, float %103, i32 321, i32 15, i32 15, i1 true)
  %105 = fadd float %103, %104
  %106 = call float @llvm.amdgcn.update.dpp.f32(float %105, float %105, i32 320, i32 15, i32 15, i1 true)
  %107 = fadd float %105, %106
  %108 = call float @llvm.amdgcn.update.dpp.f32(float %107, float %107, i32 322, i32 10, i32 15, i1 false)
  %109 = fadd float %107, %108
  %110 = call float @llvm.amdgcn.update.dpp.f32(float %109, float %109, i32 323, i32 15, i32 15, i1 true)
  %111 = fadd float %110, %109
  %112 = call float @llvm.amdgcn.readlane.f32(float %111, i32 63)
  %113 = insertelement <1 x float> poison, float %98, i64 0
  %114 = insertelement <1 x float> poison, float %112, i64 0
  call void @llvm.amdgcn.s.waitcnt(i32 -7937)
  call void @llvm.amdgcn.s.barrier()
  %115 = add i64 0, %18
  %116 = getelementptr float, ptr addrspace(3) @__shared_memory__, i64 %115
  store <1 x float> %113, ptr addrspace(3) %116, align 4
  %117 = add i64 4, %18
  %118 = getelementptr float, ptr addrspace(3) @__shared_memory__, i64 %117
  store <1 x float> %114, ptr addrspace(3) %118, align 4
  call void @llvm.amdgcn.s.waitcnt(i32 -7937)
  call void @llvm.amdgcn.s.barrier()
  %119 = urem i32 %16, 2
  %120 = zext i32 %119 to i64
  %121 = add i64 0, %120
  %122 = getelementptr float, ptr addrspace(3) @__shared_memory__, i64 %121
  %123 = load <1 x float>, ptr addrspace(3) %122, align 4
  %124 = add i64 4, %120
  %125 = getelementptr float, ptr addrspace(3) @__shared_memory__, i64 %124
  %126 = load <1 x float>, ptr addrspace(3) %125, align 4
  %127 = fadd <1 x float> %123, zeroinitializer
  %128 = fadd <1 x float> %126, zeroinitializer
  %129 = extractelement <1 x float> %127, i64 0
  %130 = call float @llvm.amdgcn.update.dpp.f32(float %129, float %129, i32 177, i32 15, i32 15, i1 true)
  %131 = fadd float %129, %130
  %132 = extractelement <1 x float> %128, i64 0
  %133 = call float @llvm.amdgcn.update.dpp.f32(float %132, float %132, i32 177, i32 15, i32 15, i1 true)
  %134 = fadd float %132, %133
  %135 = insertelement <1 x float> poison, float %131, i64 0
  %136 = insertelement <1 x float> poison, float %134, i64 0
  %137 = fadd <1 x float> %135, zeroinitializer
  %138 = fadd <1 x float> %136, zeroinitializer
  %139 = fptrunc <1 x float> %137 to <1 x half>
  %140 = fptrunc <1 x float> %138 to <1 x half>
  %141 = mul i64 %15, 16384
  %142 = add i64 %141, %10
  %143 = getelementptr half, ptr addrspace(7) %8, i64 %142
  store <1 x half> %139, ptr addrspace(7) %143, align 2
  %144 = mul i64 %21, 16384
  %145 = add i64 %144, %10
  %146 = getelementptr half, ptr addrspace(7) %8, i64 %145
  store <1 x half> %140, ptr addrspace(7) %146, align 2
  ret void
}

; Function Attrs: alwaysinline
define amdgpu_kernel void @dispatch_115_dispatch_0_matmul_like_4x6656x16384_f16xf16xf32(ptr addrspace(1) inreg noalias noundef nonnull readonly align 16 %0, ptr addrspace(1) inreg noalias noundef nonnull readonly align 16 %1, ptr addrspace(1) inreg noalias noundef nonnull align 16 %2) #1 !reqd_work_group_size !3 {
  %4 = call range(i32 0, 512) i32 @llvm.amdgcn.workitem.id.x()
  %5 = sext i32 %4 to i64
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %0, i64 64) ]
  %6 = call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) %0, i16 0, i32 131072, i32 159744)
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %1, i64 64) ]
  %7 = call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) %1, i16 0, i32 218103808, i32 159744)
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %2, i64 64) ]
  %8 = call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) %2, i16 0, i32 106496, i32 159744)
  %9 = call range(i32 0, 6656) i32 @llvm.amdgcn.workgroup.id.x()
  %10 = sext i32 %9 to i64
  %11 = call range(i32 0, 2) i32 @llvm.amdgcn.workgroup.id.y()
  %12 = sext i32 %11 to i64
  %13 = trunc i64 %12 to i32
  %14 = mul nsw i32 %13, 2
  %15 = zext i32 %14 to i64
  %16 = trunc i64 %5 to i32
  %17 = udiv i32 %16, 64
  %18 = zext i32 %17 to i64
  %19 = urem i32 %16, 64
  %20 = add nsw i32 %14, 1
  %21 = zext i32 %20 to i64
  %22 = mul nsw i32 %17, 256
  %23 = mul nsw i32 %19, 4
  %24 = add nsw i32 %22, %23
  br label %25

25:                                               ; preds = %29, %3
  %26 = phi i32 [ %55, %29 ], [ 0, %3 ]
  %27 = phi [2 x [1 x [1 x [1 x [1 x <4 x float>]]]]] [ %54, %29 ], [ zeroinitializer, %3 ]
  %28 = icmp slt i32 %26, 16384
  br i1 %28, label %29, label %56

29:                                               ; preds = %25
  %30 = add nsw i32 %24, %26
  %31 = zext i32 %30 to i64
  %32 = mul i64 %15, 16384
  %33 = add i64 %32, %31
  %34 = getelementptr half, ptr addrspace(7) %6, i64 %33
  %35 = load <4 x half>, ptr addrspace(7) %34, align 2
  %36 = mul i64 %21, 16384
  %37 = add i64 %36, %31
  %38 = getelementptr half, ptr addrspace(7) %6, i64 %37
  %39 = load <4 x half>, ptr addrspace(7) %38, align 2
  %40 = mul i64 %10, 16384
  %41 = add i64 %40, %31
  %42 = getelementptr half, ptr addrspace(7) %7, i64 %41
  %43 = load <4 x half>, ptr addrspace(7) %42, align 2
  %44 = fpext <4 x half> %35 to <4 x float>
  %45 = fpext <4 x half> %39 to <4 x float>
  %46 = fpext <4 x half> %43 to <4 x float>
  %47 = fmul <4 x float> %44, %46
  %48 = fmul <4 x float> %45, %46
  %49 = extractvalue [2 x [1 x [1 x [1 x [1 x <4 x float>]]]]] %27, 0, 0, 0, 0, 0
  %50 = fadd <4 x float> %49, %47
  %51 = insertvalue [2 x [1 x [1 x [1 x [1 x <4 x float>]]]]] poison, <4 x float> %50, 0, 0, 0, 0, 0
  %52 = extractvalue [2 x [1 x [1 x [1 x [1 x <4 x float>]]]]] %27, 1, 0, 0, 0, 0
  %53 = fadd <4 x float> %52, %48
  %54 = insertvalue [2 x [1 x [1 x [1 x [1 x <4 x float>]]]]] %51, <4 x float> %53, 1, 0, 0, 0, 0
  %55 = add i32 %26, 2048
  br label %25

56:                                               ; preds = %25
  %57 = extractvalue [2 x [1 x [1 x [1 x [1 x <4 x float>]]]]] %27, 0, 0, 0, 0, 0
  %58 = extractelement <4 x float> %57, i64 0
  %59 = insertelement <2 x float> poison, float %58, i64 0
  %60 = extractvalue [2 x [1 x [1 x [1 x [1 x <4 x float>]]]]] %27, 1, 0, 0, 0, 0
  %61 = extractelement <4 x float> %60, i64 0
  %62 = insertelement <2 x float> %59, float %61, i64 1
  %63 = extractvalue [2 x [1 x [1 x [1 x [1 x <4 x float>]]]]] %27, 0, 0, 0, 0, 0
  %64 = extractelement <4 x float> %63, i64 1
  %65 = insertelement <2 x float> poison, float %64, i64 0
  %66 = extractvalue [2 x [1 x [1 x [1 x [1 x <4 x float>]]]]] %27, 1, 0, 0, 0, 0
  %67 = extractelement <4 x float> %66, i64 1
  %68 = insertelement <2 x float> %65, float %67, i64 1
  %69 = extractvalue [2 x [1 x [1 x [1 x [1 x <4 x float>]]]]] %27, 0, 0, 0, 0, 0
  %70 = extractelement <4 x float> %69, i64 2
  %71 = insertelement <2 x float> poison, float %70, i64 0
  %72 = extractvalue [2 x [1 x [1 x [1 x [1 x <4 x float>]]]]] %27, 1, 0, 0, 0, 0
  %73 = extractelement <4 x float> %72, i64 2
  %74 = insertelement <2 x float> %71, float %73, i64 1
  %75 = extractvalue [2 x [1 x [1 x [1 x [1 x <4 x float>]]]]] %27, 0, 0, 0, 0, 0
  %76 = extractelement <4 x float> %75, i64 3
  %77 = insertelement <2 x float> poison, float %76, i64 0
  %78 = extractvalue [2 x [1 x [1 x [1 x [1 x <4 x float>]]]]] %27, 1, 0, 0, 0, 0
  %79 = extractelement <4 x float> %78, i64 3
  %80 = insertelement <2 x float> %77, float %79, i64 1
  %81 = fadd <2 x float> %62, zeroinitializer
  %82 = fadd <2 x float> %68, %81
  %83 = fadd <2 x float> %74, %82
  %84 = fadd <2 x float> %80, %83
  %85 = extractelement <2 x float> %84, i64 0
  %86 = call float @llvm.amdgcn.update.dpp.f32(float %85, float %85, i32 177, i32 15, i32 15, i1 true)
  %87 = fadd float %85, %86
  %88 = call float @llvm.amdgcn.update.dpp.f32(float %87, float %87, i32 78, i32 15, i32 15, i1 true)
  %89 = fadd float %87, %88
  %90 = call float @llvm.amdgcn.update.dpp.f32(float %89, float %89, i32 321, i32 15, i32 15, i1 true)
  %91 = fadd float %89, %90
  %92 = call float @llvm.amdgcn.update.dpp.f32(float %91, float %91, i32 320, i32 15, i32 15, i1 true)
  %93 = fadd float %91, %92
  %94 = call float @llvm.amdgcn.update.dpp.f32(float %93, float %93, i32 322, i32 10, i32 15, i1 false)
  %95 = fadd float %93, %94
  %96 = call float @llvm.amdgcn.update.dpp.f32(float %95, float %95, i32 323, i32 15, i32 15, i1 true)
  %97 = fadd float %96, %95
  %98 = call float @llvm.amdgcn.readlane.f32(float %97, i32 63)
  %99 = extractelement <2 x float> %84, i64 1
  %100 = call float @llvm.amdgcn.update.dpp.f32(float %99, float %99, i32 177, i32 15, i32 15, i1 true)
  %101 = fadd float %99, %100
  %102 = call float @llvm.amdgcn.update.dpp.f32(float %101, float %101, i32 78, i32 15, i32 15, i1 true)
  %103 = fadd float %101, %102
  %104 = call float @llvm.amdgcn.update.dpp.f32(float %103, float %103, i32 321, i32 15, i32 15, i1 true)
  %105 = fadd float %103, %104
  %106 = call float @llvm.amdgcn.update.dpp.f32(float %105, float %105, i32 320, i32 15, i32 15, i1 true)
  %107 = fadd float %105, %106
  %108 = call float @llvm.amdgcn.update.dpp.f32(float %107, float %107, i32 322, i32 10, i32 15, i1 false)
  %109 = fadd float %107, %108
  %110 = call float @llvm.amdgcn.update.dpp.f32(float %109, float %109, i32 323, i32 15, i32 15, i1 true)
  %111 = fadd float %110, %109
  %112 = call float @llvm.amdgcn.readlane.f32(float %111, i32 63)
  %113 = insertelement <1 x float> poison, float %98, i64 0
  %114 = insertelement <1 x float> poison, float %112, i64 0
  call void @llvm.amdgcn.s.waitcnt(i32 -7937)
  call void @llvm.amdgcn.s.barrier()
  %115 = add i64 0, %18
  %116 = getelementptr float, ptr addrspace(3) @__shared_memory___0, i64 %115
  store <1 x float> %113, ptr addrspace(3) %116, align 4
  %117 = add i64 10, %18
  %118 = getelementptr float, ptr addrspace(3) @__shared_memory___0, i64 %117
  store <1 x float> %114, ptr addrspace(3) %118, align 4
  call void @llvm.amdgcn.s.waitcnt(i32 -7937)
  call void @llvm.amdgcn.s.barrier()
  %119 = urem i32 %16, 8
  %120 = zext i32 %119 to i64
  %121 = add i64 0, %120
  %122 = getelementptr float, ptr addrspace(3) @__shared_memory___0, i64 %121
  %123 = load <1 x float>, ptr addrspace(3) %122, align 4
  %124 = add i64 10, %120
  %125 = getelementptr float, ptr addrspace(3) @__shared_memory___0, i64 %124
  %126 = load <1 x float>, ptr addrspace(3) %125, align 4
  %127 = fadd <1 x float> %123, zeroinitializer
  %128 = fadd <1 x float> %126, zeroinitializer
  %129 = extractelement <1 x float> %127, i64 0
  %130 = call float @llvm.amdgcn.update.dpp.f32(float %129, float %129, i32 177, i32 15, i32 15, i1 true)
  %131 = fadd float %129, %130
  %132 = call float @llvm.amdgcn.update.dpp.f32(float %131, float %131, i32 78, i32 15, i32 15, i1 true)
  %133 = fadd float %131, %132
  %134 = call float @llvm.amdgcn.update.dpp.f32(float %133, float %133, i32 321, i32 15, i32 15, i1 true)
  %135 = fadd float %133, %134
  %136 = extractelement <1 x float> %128, i64 0
  %137 = call float @llvm.amdgcn.update.dpp.f32(float %136, float %136, i32 177, i32 15, i32 15, i1 true)
  %138 = fadd float %136, %137
  %139 = call float @llvm.amdgcn.update.dpp.f32(float %138, float %138, i32 78, i32 15, i32 15, i1 true)
  %140 = fadd float %138, %139
  %141 = call float @llvm.amdgcn.update.dpp.f32(float %140, float %140, i32 321, i32 15, i32 15, i1 true)
  %142 = fadd float %140, %141
  %143 = insertelement <1 x float> poison, float %135, i64 0
  %144 = insertelement <1 x float> poison, float %142, i64 0
  %145 = fadd <1 x float> %143, zeroinitializer
  %146 = fadd <1 x float> %144, zeroinitializer
  %147 = mul i64 %15, 6656
  %148 = add i64 %147, %10
  %149 = getelementptr float, ptr addrspace(7) %8, i64 %148
  store <1 x float> %145, ptr addrspace(7) %149, align 4
  %150 = mul i64 %21, 6656
  %151 = add i64 %150, %10
  %152 = getelementptr float, ptr addrspace(7) %8, i64 %151
  store <1 x float> %146, ptr addrspace(7) %152, align 4
  ret void
}

; Function Attrs: alwaysinline
define amdgpu_kernel void @dispatch_116_dispatch_0_matmul_like_4x6656x16384_f16xf16xf32(ptr addrspace(1) inreg noalias noundef nonnull readonly align 16 %0, ptr addrspace(1) inreg noalias noundef nonnull readonly align 16 %1, ptr addrspace(1) inreg noalias noundef nonnull readonly align 16 %2, ptr addrspace(1) inreg noalias noundef nonnull align 16 %3) #1 !reqd_work_group_size !3 {
  %5 = call range(i32 0, 512) i32 @llvm.amdgcn.workitem.id.x()
  %6 = sext i32 %5 to i64
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %0, i64 64) ]
  %7 = call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) %0, i16 0, i32 131072, i32 159744)
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %1, i64 64) ]
  %8 = call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) %1, i16 0, i32 218103808, i32 159744)
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %2, i64 64) ]
  %9 = call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) %2, i16 0, i32 106496, i32 159744)
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %3, i64 64) ]
  %10 = call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) %3, i16 0, i32 53248, i32 159744)
  %11 = call range(i32 0, 6656) i32 @llvm.amdgcn.workgroup.id.x()
  %12 = sext i32 %11 to i64
  %13 = call range(i32 0, 2) i32 @llvm.amdgcn.workgroup.id.y()
  %14 = sext i32 %13 to i64
  %15 = trunc i64 %14 to i32
  %16 = mul nsw i32 %15, 2
  %17 = zext i32 %16 to i64
  %18 = trunc i64 %6 to i32
  %19 = udiv i32 %18, 64
  %20 = zext i32 %19 to i64
  %21 = urem i32 %18, 64
  %22 = add nsw i32 %16, 1
  %23 = zext i32 %22 to i64
  %24 = mul nsw i32 %19, 256
  %25 = mul nsw i32 %21, 4
  %26 = add nsw i32 %24, %25
  br label %27

27:                                               ; preds = %31, %4
  %28 = phi i32 [ %57, %31 ], [ 0, %4 ]
  %29 = phi [2 x [1 x [1 x [1 x [1 x <4 x float>]]]]] [ %56, %31 ], [ zeroinitializer, %4 ]
  %30 = icmp slt i32 %28, 16384
  br i1 %30, label %31, label %58

31:                                               ; preds = %27
  %32 = add nsw i32 %26, %28
  %33 = zext i32 %32 to i64
  %34 = mul i64 %17, 16384
  %35 = add i64 %34, %33
  %36 = getelementptr half, ptr addrspace(7) %7, i64 %35
  %37 = load <4 x half>, ptr addrspace(7) %36, align 2
  %38 = mul i64 %23, 16384
  %39 = add i64 %38, %33
  %40 = getelementptr half, ptr addrspace(7) %7, i64 %39
  %41 = load <4 x half>, ptr addrspace(7) %40, align 2
  %42 = mul i64 %12, 16384
  %43 = add i64 %42, %33
  %44 = getelementptr half, ptr addrspace(7) %8, i64 %43
  %45 = load <4 x half>, ptr addrspace(7) %44, align 2
  %46 = fpext <4 x half> %37 to <4 x float>
  %47 = fpext <4 x half> %41 to <4 x float>
  %48 = fpext <4 x half> %45 to <4 x float>
  %49 = fmul <4 x float> %46, %48
  %50 = fmul <4 x float> %47, %48
  %51 = extractvalue [2 x [1 x [1 x [1 x [1 x <4 x float>]]]]] %29, 0, 0, 0, 0, 0
  %52 = fadd <4 x float> %51, %49
  %53 = insertvalue [2 x [1 x [1 x [1 x [1 x <4 x float>]]]]] poison, <4 x float> %52, 0, 0, 0, 0, 0
  %54 = extractvalue [2 x [1 x [1 x [1 x [1 x <4 x float>]]]]] %29, 1, 0, 0, 0, 0
  %55 = fadd <4 x float> %54, %50
  %56 = insertvalue [2 x [1 x [1 x [1 x [1 x <4 x float>]]]]] %53, <4 x float> %55, 1, 0, 0, 0, 0
  %57 = add i32 %28, 2048
  br label %27

58:                                               ; preds = %27
  %59 = extractvalue [2 x [1 x [1 x [1 x [1 x <4 x float>]]]]] %29, 0, 0, 0, 0, 0
  %60 = extractelement <4 x float> %59, i64 0
  %61 = insertelement <2 x float> poison, float %60, i64 0
  %62 = extractvalue [2 x [1 x [1 x [1 x [1 x <4 x float>]]]]] %29, 1, 0, 0, 0, 0
  %63 = extractelement <4 x float> %62, i64 0
  %64 = insertelement <2 x float> %61, float %63, i64 1
  %65 = extractvalue [2 x [1 x [1 x [1 x [1 x <4 x float>]]]]] %29, 0, 0, 0, 0, 0
  %66 = extractelement <4 x float> %65, i64 1
  %67 = insertelement <2 x float> poison, float %66, i64 0
  %68 = extractvalue [2 x [1 x [1 x [1 x [1 x <4 x float>]]]]] %29, 1, 0, 0, 0, 0
  %69 = extractelement <4 x float> %68, i64 1
  %70 = insertelement <2 x float> %67, float %69, i64 1
  %71 = extractvalue [2 x [1 x [1 x [1 x [1 x <4 x float>]]]]] %29, 0, 0, 0, 0, 0
  %72 = extractelement <4 x float> %71, i64 2
  %73 = insertelement <2 x float> poison, float %72, i64 0
  %74 = extractvalue [2 x [1 x [1 x [1 x [1 x <4 x float>]]]]] %29, 1, 0, 0, 0, 0
  %75 = extractelement <4 x float> %74, i64 2
  %76 = insertelement <2 x float> %73, float %75, i64 1
  %77 = extractvalue [2 x [1 x [1 x [1 x [1 x <4 x float>]]]]] %29, 0, 0, 0, 0, 0
  %78 = extractelement <4 x float> %77, i64 3
  %79 = insertelement <2 x float> poison, float %78, i64 0
  %80 = extractvalue [2 x [1 x [1 x [1 x [1 x <4 x float>]]]]] %29, 1, 0, 0, 0, 0
  %81 = extractelement <4 x float> %80, i64 3
  %82 = insertelement <2 x float> %79, float %81, i64 1
  %83 = fadd <2 x float> %64, zeroinitializer
  %84 = fadd <2 x float> %70, %83
  %85 = fadd <2 x float> %76, %84
  %86 = fadd <2 x float> %82, %85
  %87 = extractelement <2 x float> %86, i64 0
  %88 = call float @llvm.amdgcn.update.dpp.f32(float %87, float %87, i32 177, i32 15, i32 15, i1 true)
  %89 = fadd float %87, %88
  %90 = call float @llvm.amdgcn.update.dpp.f32(float %89, float %89, i32 78, i32 15, i32 15, i1 true)
  %91 = fadd float %89, %90
  %92 = call float @llvm.amdgcn.update.dpp.f32(float %91, float %91, i32 321, i32 15, i32 15, i1 true)
  %93 = fadd float %91, %92
  %94 = call float @llvm.amdgcn.update.dpp.f32(float %93, float %93, i32 320, i32 15, i32 15, i1 true)
  %95 = fadd float %93, %94
  %96 = call float @llvm.amdgcn.update.dpp.f32(float %95, float %95, i32 322, i32 10, i32 15, i1 false)
  %97 = fadd float %95, %96
  %98 = call float @llvm.amdgcn.update.dpp.f32(float %97, float %97, i32 323, i32 15, i32 15, i1 true)
  %99 = fadd float %98, %97
  %100 = call float @llvm.amdgcn.readlane.f32(float %99, i32 63)
  %101 = extractelement <2 x float> %86, i64 1
  %102 = call float @llvm.amdgcn.update.dpp.f32(float %101, float %101, i32 177, i32 15, i32 15, i1 true)
  %103 = fadd float %101, %102
  %104 = call float @llvm.amdgcn.update.dpp.f32(float %103, float %103, i32 78, i32 15, i32 15, i1 true)
  %105 = fadd float %103, %104
  %106 = call float @llvm.amdgcn.update.dpp.f32(float %105, float %105, i32 321, i32 15, i32 15, i1 true)
  %107 = fadd float %105, %106
  %108 = call float @llvm.amdgcn.update.dpp.f32(float %107, float %107, i32 320, i32 15, i32 15, i1 true)
  %109 = fadd float %107, %108
  %110 = call float @llvm.amdgcn.update.dpp.f32(float %109, float %109, i32 322, i32 10, i32 15, i1 false)
  %111 = fadd float %109, %110
  %112 = call float @llvm.amdgcn.update.dpp.f32(float %111, float %111, i32 323, i32 15, i32 15, i1 true)
  %113 = fadd float %112, %111
  %114 = call float @llvm.amdgcn.readlane.f32(float %113, i32 63)
  %115 = insertelement <1 x float> poison, float %100, i64 0
  %116 = insertelement <1 x float> poison, float %114, i64 0
  call void @llvm.amdgcn.s.waitcnt(i32 -7937)
  call void @llvm.amdgcn.s.barrier()
  %117 = add i64 0, %20
  %118 = getelementptr float, ptr addrspace(3) @__shared_memory___1, i64 %117
  store <1 x float> %115, ptr addrspace(3) %118, align 4
  %119 = add i64 10, %20
  %120 = getelementptr float, ptr addrspace(3) @__shared_memory___1, i64 %119
  store <1 x float> %116, ptr addrspace(3) %120, align 4
  call void @llvm.amdgcn.s.waitcnt(i32 -7937)
  call void @llvm.amdgcn.s.barrier()
  %121 = urem i32 %18, 8
  %122 = zext i32 %121 to i64
  %123 = add i64 0, %122
  %124 = getelementptr float, ptr addrspace(3) @__shared_memory___1, i64 %123
  %125 = load <1 x float>, ptr addrspace(3) %124, align 4
  %126 = add i64 10, %122
  %127 = getelementptr float, ptr addrspace(3) @__shared_memory___1, i64 %126
  %128 = load <1 x float>, ptr addrspace(3) %127, align 4
  %129 = fadd <1 x float> %125, zeroinitializer
  %130 = fadd <1 x float> %128, zeroinitializer
  %131 = extractelement <1 x float> %129, i64 0
  %132 = call float @llvm.amdgcn.update.dpp.f32(float %131, float %131, i32 177, i32 15, i32 15, i1 true)
  %133 = fadd float %131, %132
  %134 = call float @llvm.amdgcn.update.dpp.f32(float %133, float %133, i32 78, i32 15, i32 15, i1 true)
  %135 = fadd float %133, %134
  %136 = call float @llvm.amdgcn.update.dpp.f32(float %135, float %135, i32 321, i32 15, i32 15, i1 true)
  %137 = fadd float %135, %136
  %138 = extractelement <1 x float> %130, i64 0
  %139 = call float @llvm.amdgcn.update.dpp.f32(float %138, float %138, i32 177, i32 15, i32 15, i1 true)
  %140 = fadd float %138, %139
  %141 = call float @llvm.amdgcn.update.dpp.f32(float %140, float %140, i32 78, i32 15, i32 15, i1 true)
  %142 = fadd float %140, %141
  %143 = call float @llvm.amdgcn.update.dpp.f32(float %142, float %142, i32 321, i32 15, i32 15, i1 true)
  %144 = fadd float %142, %143
  %145 = insertelement <1 x float> poison, float %137, i64 0
  %146 = insertelement <1 x float> poison, float %144, i64 0
  %147 = fadd <1 x float> %145, zeroinitializer
  %148 = fadd <1 x float> %146, zeroinitializer
  %149 = mul nuw nsw i64 %17, 6656
  %150 = add nuw nsw i64 %149, %12
  %151 = getelementptr inbounds nuw float, ptr addrspace(7) %9, i64 %150
  %152 = load float, ptr addrspace(7) %151, align 4
  %153 = insertelement <1 x float> poison, float %152, i64 0
  %154 = mul nuw nsw i64 %23, 6656
  %155 = add nuw nsw i64 %154, %12
  %156 = getelementptr inbounds nuw float, ptr addrspace(7) %9, i64 %155
  %157 = load float, ptr addrspace(7) %156, align 4
  %158 = insertelement <1 x float> poison, float %157, i64 0
  %159 = fptrunc <1 x float> %147 to <1 x half>
  %160 = fptrunc <1 x float> %148 to <1 x half>
  %161 = fneg <1 x half> %159
  %162 = fneg <1 x half> %160
  %163 = fpext <1 x half> %161 to <1 x float>
  %164 = fpext <1 x half> %162 to <1 x float>
  %165 = extractelement <1 x float> %163, i64 0
  %166 = call float @llvm.exp.f32(float %165)
  %167 = insertelement <1 x float> zeroinitializer, float %166, i64 0
  %168 = extractelement <1 x float> %164, i64 0
  %169 = call float @llvm.exp.f32(float %168)
  %170 = insertelement <1 x float> zeroinitializer, float %169, i64 0
  %171 = fptrunc <1 x float> %167 to <1 x half>
  %172 = fptrunc <1 x float> %170 to <1 x half>
  %173 = fadd <1 x half> %171, splat (half 0xH3C00)
  %174 = fadd <1 x half> %172, splat (half 0xH3C00)
  %175 = fdiv <1 x half> splat (half 0xH3C00), %173
  %176 = fdiv <1 x half> splat (half 0xH3C00), %174
  %177 = fptrunc <1 x float> %153 to <1 x half>
  %178 = fptrunc <1 x float> %158 to <1 x half>
  %179 = fmul <1 x half> %175, %159
  %180 = fmul <1 x half> %176, %160
  %181 = fmul <1 x half> %179, %177
  %182 = fmul <1 x half> %180, %178
  %183 = mul i64 %17, 6656
  %184 = add i64 %183, %12
  %185 = getelementptr half, ptr addrspace(7) %10, i64 %184
  store <1 x half> %181, ptr addrspace(7) %185, align 2
  %186 = mul i64 %23, 6656
  %187 = add i64 %186, %12
  %188 = getelementptr half, ptr addrspace(7) %10, i64 %187
  store <1 x half> %182, ptr addrspace(7) %188, align 2
  ret void
}

; Function Attrs: alwaysinline nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: alwaysinline nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #3

; Function Attrs: alwaysinline nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) readnone, i16, i32, i32) #2

; Function Attrs: alwaysinline nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: alwaysinline nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: alwaysinline convergent nocallback nofree nounwind willreturn memory(none)
declare float @llvm.amdgcn.update.dpp.f32(float, float, i32 immarg, i32 immarg, i32 immarg, i1 immarg) #4

; Function Attrs: alwaysinline convergent nocallback nofree nounwind willreturn memory(none)
declare float @llvm.amdgcn.readlane.f32(float, i32) #4

; Function Attrs: alwaysinline nocallback nofree nounwind willreturn
declare void @llvm.amdgcn.s.waitcnt(i32 immarg) #5

; Function Attrs: alwaysinline convergent nocallback nofree nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #6

; Function Attrs: alwaysinline nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.exp.f32(float) #2

attributes #0 = { alwaysinline "amdgpu-flat-work-group-size"="128,128" "uniform-work-group-size"="true" }
attributes #1 = { alwaysinline "amdgpu-flat-work-group-size"="512,512" "uniform-work-group-size"="true" }
attributes #2 = { alwaysinline nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { alwaysinline nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #4 = { alwaysinline convergent nocallback nofree nounwind willreturn memory(none) }
attributes #5 = { alwaysinline nocallback nofree nounwind willreturn }
attributes #6 = { alwaysinline convergent nocallback nofree nounwind willreturn }

!llvm.module.flags = !{!0, !1}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 1, !"amdhsa_code_object_version", i32 500}
!2 = !{i32 128, i32 1, i32 1}
!3 = !{i32 512, i32 1, i32 1}
