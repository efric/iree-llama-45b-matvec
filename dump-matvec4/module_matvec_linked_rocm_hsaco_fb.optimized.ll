
; To reproduce the .optimized.ll from the .linked.ll, run:
; opt -S -mtriple=amdgcn-amd-amdhsa -mcpu=gfx942 --passes='verify,annotation2metadata,forceattrs,inferattrs,coro-early,function<eager-inv>(ee-instrument<>,lower-expect,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;no-switch-range-to-icmp;no-switch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,sroa<modify-cfg>,early-cse<>),openmp-opt,amdgpu-printf-runtime-binding,amdgpu-unify-metadata,ipsccp,called-value-propagation,globalopt,function<eager-inv>(mem2reg,instcombine<max-iterations=1;no-verify-fixpoint>,amdgpu-usenative,amdgpu-simplifylib,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;no-switch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>),always-inline,require<globals-aa>,function(invalidate<aa>),require<profile-summary>,cgscc(devirt<4>(inline,function-attrs<skip-non-recursive-function-attrs>,openmp-opt-cgscc,function(amdgpu-promote-kernel-arguments,infer-address-spaces,amdgpu-lower-kernel-attributes,amdgpu-promote-alloca-to-vector),function<eager-inv;no-rerun>(sroa<modify-cfg>,early-cse<memssa>,speculative-execution<only-if-divergent-target>,jump-threading,correlated-propagation,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;no-switch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,instcombine<max-iterations=1;no-verify-fixpoint>,aggressive-instcombine,libcalls-shrinkwrap,amdgpu-usenative,amdgpu-simplifylib,tailcallelim,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;no-switch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,reassociate,constraint-elimination,loop-mssa(loop-instsimplify,loop-simplifycfg,licm<no-allowspeculation>,loop-rotate<header-duplication;no-prepare-for-lto>,licm<allowspeculation>,simple-loop-unswitch<no-nontrivial;trivial>),simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;no-switch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,instcombine<max-iterations=1;no-verify-fixpoint>,loop(loop-idiom,indvars,extra-simple-loop-unswitch-passes,loop-deletion,loop-unroll-full),sroa<modify-cfg>,vector-combine,mldst-motion<no-split-footer-bb>,gvn<>,sccp,bdce,instcombine<max-iterations=1;no-verify-fixpoint>,amdgpu-usenative,amdgpu-simplifylib,jump-threading,correlated-propagation,adce,memcpyopt,dse,move-auto-init,loop-mssa(licm<allowspeculation>),coro-elide,infer-address-spaces,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;no-switch-to-lookup;keep-loops;hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,instcombine<max-iterations=1;no-verify-fixpoint>,amdgpu-usenative,amdgpu-simplifylib),function-attrs,function(require<should-not-run-function-passes>),coro-split,coro-annotation-elide)),deadargelim,coro-cleanup,globalopt,globaldce,elim-avail-extern,rpo-function-attrs,recompute-globalsaa,function<eager-inv>(float2int,lower-constant-intrinsics,loop(loop-rotate<header-duplication;no-prepare-for-lto>,loop-deletion),loop-distribute,inject-tli-mappings,loop-vectorize<no-interleave-forced-only;no-vectorize-forced-only;>,infer-alignment,loop-load-elim,instcombine<max-iterations=1;no-verify-fixpoint>,simplifycfg<bonus-inst-threshold=1;forward-switch-cond;switch-range-to-icmp;switch-to-lookup;no-keep-loops;hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,slp-vectorizer,vector-combine,instcombine<max-iterations=1;no-verify-fixpoint>,loop-unroll<O2>,transform-warning,sroa<preserve-cfg>,infer-alignment,instcombine<max-iterations=1;no-verify-fixpoint>,loop-mssa(licm<allowspeculation>),alignment-from-assumptions,infer-address-spaces,loop-sink,instsimplify,div-rem-pairs,tailcallelim,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;no-switch-to-lookup;keep-loops;no-hoist-common-insts;hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;speculate-unpredictables>),amdgpu-attributor,globaldce,constmerge,cg-profile,rel-lookup-table-converter,function(annotation-remarks),verify'
; The flag '-S' to emit LLVMIR.
; The behavior of some passes depends on '-mtriple' and '-mcpu'

; ModuleID = 'matvec_linked'
source_filename = "matvec_linked"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"

@__shared_memory__ = private unnamed_addr addrspace(3) global [2 x [4 x float]] undef, align 16
@__shared_memory___0 = private unnamed_addr addrspace(3) global [2 x [10 x float]] undef, align 16
@__shared_memory___1 = private unnamed_addr addrspace(3) global [2 x [10 x float]] undef, align 16

; Function Attrs: alwaysinline mustprogress nofree norecurse nounwind willreturn
define amdgpu_kernel void @dispatch_131_dispatch_0_matmul_like_4x16384x6656_f16xf16xf32(ptr addrspace(1) inreg noalias noundef nonnull readonly align 16 %0, ptr addrspace(1) inreg noalias noundef nonnull readonly align 16 %1, ptr addrspace(1) inreg noalias noundef nonnull align 16 %2) local_unnamed_addr #0 !reqd_work_group_size !2 {
  %4 = tail call range(i32 0, 128) i32 @llvm.amdgcn.workitem.id.x()
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %0, i64 64) ]
  %5 = tail call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) nonnull %0, i16 0, i32 53248, i32 159744)
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %1, i64 64) ]
  %6 = tail call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) nonnull %1, i16 0, i32 218103808, i32 159744)
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %2, i64 64) ]
  %7 = tail call range(i32 0, 16384) i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call range(i32 0, 2) i32 @llvm.amdgcn.workgroup.id.y()
  %9 = shl nuw nsw i32 %8, 1
  %10 = lshr i32 %4, 6
  %11 = or disjoint i32 %9, 1
  %12 = shl nuw nsw i32 %10, 8
  %13 = shl nuw nsw i32 %4, 2
  %14 = and i32 %13, 252
  %15 = or disjoint i32 %12, %14
  %.idx3 = mul nuw nsw i32 %8, 26624
  %16 = getelementptr i8, ptr addrspace(7) %5, i32 %.idx3
  %.idx5 = mul nuw nsw i32 %11, 13312
  %17 = getelementptr i8, ptr addrspace(7) %5, i32 %.idx5
  %.idx7 = mul nuw nsw i32 %7, 13312
  %18 = getelementptr i8, ptr addrspace(7) %6, i32 %.idx7
  %19 = getelementptr half, ptr addrspace(7) %16, i32 %15
  %20 = load <4 x half>, ptr addrspace(7) %19, align 2
  %21 = getelementptr half, ptr addrspace(7) %17, i32 %15
  %22 = load <4 x half>, ptr addrspace(7) %21, align 2
  %23 = getelementptr half, ptr addrspace(7) %18, i32 %15
  %24 = load <4 x half>, ptr addrspace(7) %23, align 2
  %25 = fpext <4 x half> %20 to <4 x float>
  %26 = fpext <4 x half> %22 to <4 x float>
  %27 = fpext <4 x half> %24 to <4 x float>
  %28 = fmul <4 x float> %25, %27
  %29 = fmul <4 x float> %26, %27
  %30 = fadd <4 x float> %28, zeroinitializer
  %31 = fadd <4 x float> %29, zeroinitializer
  %32 = or disjoint i32 %15, 512
  %33 = getelementptr half, ptr addrspace(7) %16, i32 %32
  %34 = load <4 x half>, ptr addrspace(7) %33, align 2
  %35 = getelementptr half, ptr addrspace(7) %17, i32 %32
  %36 = load <4 x half>, ptr addrspace(7) %35, align 2
  %37 = getelementptr half, ptr addrspace(7) %18, i32 %32
  %38 = load <4 x half>, ptr addrspace(7) %37, align 2
  %39 = fpext <4 x half> %34 to <4 x float>
  %40 = fpext <4 x half> %36 to <4 x float>
  %41 = fpext <4 x half> %38 to <4 x float>
  %42 = fmul <4 x float> %39, %41
  %43 = fmul <4 x float> %40, %41
  %44 = fadd <4 x float> %30, %42
  %45 = fadd <4 x float> %31, %43
  %46 = or disjoint i32 %15, 1024
  %47 = getelementptr half, ptr addrspace(7) %16, i32 %46
  %48 = load <4 x half>, ptr addrspace(7) %47, align 2
  %49 = getelementptr half, ptr addrspace(7) %17, i32 %46
  %50 = load <4 x half>, ptr addrspace(7) %49, align 2
  %51 = getelementptr half, ptr addrspace(7) %18, i32 %46
  %52 = load <4 x half>, ptr addrspace(7) %51, align 2
  %53 = fpext <4 x half> %48 to <4 x float>
  %54 = fpext <4 x half> %50 to <4 x float>
  %55 = fpext <4 x half> %52 to <4 x float>
  %56 = fmul <4 x float> %53, %55
  %57 = fmul <4 x float> %54, %55
  %58 = fadd <4 x float> %44, %56
  %59 = fadd <4 x float> %45, %57
  %60 = or disjoint i32 %15, 1536
  %61 = getelementptr half, ptr addrspace(7) %16, i32 %60
  %62 = load <4 x half>, ptr addrspace(7) %61, align 2
  %63 = getelementptr half, ptr addrspace(7) %17, i32 %60
  %64 = load <4 x half>, ptr addrspace(7) %63, align 2
  %65 = getelementptr half, ptr addrspace(7) %18, i32 %60
  %66 = load <4 x half>, ptr addrspace(7) %65, align 2
  %67 = fpext <4 x half> %62 to <4 x float>
  %68 = fpext <4 x half> %64 to <4 x float>
  %69 = fpext <4 x half> %66 to <4 x float>
  %70 = fmul <4 x float> %67, %69
  %71 = fmul <4 x float> %68, %69
  %72 = fadd <4 x float> %58, %70
  %73 = fadd <4 x float> %59, %71
  %74 = or disjoint i32 %15, 2048
  %75 = getelementptr half, ptr addrspace(7) %16, i32 %74
  %76 = load <4 x half>, ptr addrspace(7) %75, align 2
  %77 = getelementptr half, ptr addrspace(7) %17, i32 %74
  %78 = load <4 x half>, ptr addrspace(7) %77, align 2
  %79 = getelementptr half, ptr addrspace(7) %18, i32 %74
  %80 = load <4 x half>, ptr addrspace(7) %79, align 2
  %81 = fpext <4 x half> %76 to <4 x float>
  %82 = fpext <4 x half> %78 to <4 x float>
  %83 = fpext <4 x half> %80 to <4 x float>
  %84 = fmul <4 x float> %81, %83
  %85 = fmul <4 x float> %82, %83
  %86 = fadd <4 x float> %72, %84
  %87 = fadd <4 x float> %73, %85
  %88 = or disjoint i32 %15, 2560
  %89 = getelementptr half, ptr addrspace(7) %16, i32 %88
  %90 = load <4 x half>, ptr addrspace(7) %89, align 2
  %91 = getelementptr half, ptr addrspace(7) %17, i32 %88
  %92 = load <4 x half>, ptr addrspace(7) %91, align 2
  %93 = getelementptr half, ptr addrspace(7) %18, i32 %88
  %94 = load <4 x half>, ptr addrspace(7) %93, align 2
  %95 = fpext <4 x half> %90 to <4 x float>
  %96 = fpext <4 x half> %92 to <4 x float>
  %97 = fpext <4 x half> %94 to <4 x float>
  %98 = fmul <4 x float> %95, %97
  %99 = fmul <4 x float> %96, %97
  %100 = fadd <4 x float> %86, %98
  %101 = fadd <4 x float> %87, %99
  %102 = or disjoint i32 %15, 3072
  %103 = getelementptr half, ptr addrspace(7) %16, i32 %102
  %104 = load <4 x half>, ptr addrspace(7) %103, align 2
  %105 = getelementptr half, ptr addrspace(7) %17, i32 %102
  %106 = load <4 x half>, ptr addrspace(7) %105, align 2
  %107 = getelementptr half, ptr addrspace(7) %18, i32 %102
  %108 = load <4 x half>, ptr addrspace(7) %107, align 2
  %109 = fpext <4 x half> %104 to <4 x float>
  %110 = fpext <4 x half> %106 to <4 x float>
  %111 = fpext <4 x half> %108 to <4 x float>
  %112 = fmul <4 x float> %109, %111
  %113 = fmul <4 x float> %110, %111
  %114 = fadd <4 x float> %100, %112
  %115 = fadd <4 x float> %101, %113
  %116 = or disjoint i32 %15, 3584
  %117 = getelementptr half, ptr addrspace(7) %16, i32 %116
  %118 = load <4 x half>, ptr addrspace(7) %117, align 2
  %119 = getelementptr half, ptr addrspace(7) %17, i32 %116
  %120 = load <4 x half>, ptr addrspace(7) %119, align 2
  %121 = getelementptr half, ptr addrspace(7) %18, i32 %116
  %122 = load <4 x half>, ptr addrspace(7) %121, align 2
  %123 = fpext <4 x half> %118 to <4 x float>
  %124 = fpext <4 x half> %120 to <4 x float>
  %125 = fpext <4 x half> %122 to <4 x float>
  %126 = fmul <4 x float> %123, %125
  %127 = fmul <4 x float> %124, %125
  %128 = fadd <4 x float> %114, %126
  %129 = fadd <4 x float> %115, %127
  %130 = or disjoint i32 %15, 4096
  %131 = getelementptr half, ptr addrspace(7) %16, i32 %130
  %132 = load <4 x half>, ptr addrspace(7) %131, align 2
  %133 = getelementptr half, ptr addrspace(7) %17, i32 %130
  %134 = load <4 x half>, ptr addrspace(7) %133, align 2
  %135 = getelementptr half, ptr addrspace(7) %18, i32 %130
  %136 = load <4 x half>, ptr addrspace(7) %135, align 2
  %137 = fpext <4 x half> %132 to <4 x float>
  %138 = fpext <4 x half> %134 to <4 x float>
  %139 = fpext <4 x half> %136 to <4 x float>
  %140 = fmul <4 x float> %137, %139
  %141 = fmul <4 x float> %138, %139
  %142 = fadd <4 x float> %128, %140
  %143 = fadd <4 x float> %129, %141
  %144 = or disjoint i32 %15, 4608
  %145 = getelementptr half, ptr addrspace(7) %16, i32 %144
  %146 = load <4 x half>, ptr addrspace(7) %145, align 2
  %147 = getelementptr half, ptr addrspace(7) %17, i32 %144
  %148 = load <4 x half>, ptr addrspace(7) %147, align 2
  %149 = getelementptr half, ptr addrspace(7) %18, i32 %144
  %150 = load <4 x half>, ptr addrspace(7) %149, align 2
  %151 = fpext <4 x half> %146 to <4 x float>
  %152 = fpext <4 x half> %148 to <4 x float>
  %153 = fpext <4 x half> %150 to <4 x float>
  %154 = fmul <4 x float> %151, %153
  %155 = fmul <4 x float> %152, %153
  %156 = fadd <4 x float> %142, %154
  %157 = fadd <4 x float> %143, %155
  %158 = or disjoint i32 %15, 5120
  %159 = getelementptr half, ptr addrspace(7) %16, i32 %158
  %160 = load <4 x half>, ptr addrspace(7) %159, align 2
  %161 = getelementptr half, ptr addrspace(7) %17, i32 %158
  %162 = load <4 x half>, ptr addrspace(7) %161, align 2
  %163 = getelementptr half, ptr addrspace(7) %18, i32 %158
  %164 = load <4 x half>, ptr addrspace(7) %163, align 2
  %165 = fpext <4 x half> %160 to <4 x float>
  %166 = fpext <4 x half> %162 to <4 x float>
  %167 = fpext <4 x half> %164 to <4 x float>
  %168 = fmul <4 x float> %165, %167
  %169 = fmul <4 x float> %166, %167
  %170 = fadd <4 x float> %156, %168
  %171 = fadd <4 x float> %157, %169
  %172 = or disjoint i32 %15, 5632
  %173 = getelementptr half, ptr addrspace(7) %16, i32 %172
  %174 = load <4 x half>, ptr addrspace(7) %173, align 2
  %175 = getelementptr half, ptr addrspace(7) %17, i32 %172
  %176 = load <4 x half>, ptr addrspace(7) %175, align 2
  %177 = getelementptr half, ptr addrspace(7) %18, i32 %172
  %178 = load <4 x half>, ptr addrspace(7) %177, align 2
  %179 = fpext <4 x half> %174 to <4 x float>
  %180 = fpext <4 x half> %176 to <4 x float>
  %181 = fpext <4 x half> %178 to <4 x float>
  %182 = fmul <4 x float> %179, %181
  %183 = fmul <4 x float> %180, %181
  %184 = fadd <4 x float> %170, %182
  %185 = fadd <4 x float> %171, %183
  %186 = or disjoint i32 %15, 6144
  %187 = getelementptr half, ptr addrspace(7) %16, i32 %186
  %188 = load <4 x half>, ptr addrspace(7) %187, align 2
  %189 = getelementptr half, ptr addrspace(7) %17, i32 %186
  %190 = load <4 x half>, ptr addrspace(7) %189, align 2
  %191 = getelementptr half, ptr addrspace(7) %18, i32 %186
  %192 = load <4 x half>, ptr addrspace(7) %191, align 2
  %193 = fpext <4 x half> %188 to <4 x float>
  %194 = fpext <4 x half> %190 to <4 x float>
  %195 = fpext <4 x half> %192 to <4 x float>
  %196 = fmul <4 x float> %193, %195
  %197 = fmul <4 x float> %194, %195
  %198 = fadd <4 x float> %184, %196
  %199 = fadd <4 x float> %185, %197
  %200 = tail call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) nonnull %2, i16 0, i32 131072, i32 159744)
  %201 = shufflevector <4 x float> %198, <4 x float> %199, <2 x i32> <i32 0, i32 4>
  %202 = shufflevector <4 x float> %198, <4 x float> %199, <2 x i32> <i32 1, i32 5>
  %203 = shufflevector <4 x float> %198, <4 x float> %199, <2 x i32> <i32 2, i32 6>
  %204 = shufflevector <4 x float> %198, <4 x float> %199, <2 x i32> <i32 3, i32 7>
  %205 = fadd <2 x float> %201, zeroinitializer
  %206 = fadd <2 x float> %202, %205
  %207 = fadd <2 x float> %203, %206
  %208 = fadd <2 x float> %204, %207
  %209 = extractelement <2 x float> %208, i64 0
  %210 = tail call float @llvm.amdgcn.update.dpp.f32(float poison, float %209, i32 177, i32 15, i32 15, i1 true)
  %211 = fadd float %209, %210
  %212 = tail call float @llvm.amdgcn.update.dpp.f32(float poison, float %211, i32 78, i32 15, i32 15, i1 true)
  %213 = fadd float %211, %212
  %214 = tail call float @llvm.amdgcn.update.dpp.f32(float poison, float %213, i32 321, i32 15, i32 15, i1 true)
  %215 = fadd float %213, %214
  %216 = tail call float @llvm.amdgcn.update.dpp.f32(float poison, float %215, i32 320, i32 15, i32 15, i1 true)
  %217 = fadd float %215, %216
  %218 = tail call float @llvm.amdgcn.update.dpp.f32(float %217, float %217, i32 322, i32 10, i32 15, i1 false)
  %219 = fadd float %217, %218
  %220 = tail call float @llvm.amdgcn.update.dpp.f32(float poison, float %219, i32 323, i32 15, i32 15, i1 true)
  %221 = fadd float %220, %219
  %222 = tail call float @llvm.amdgcn.readlane.f32(float %221, i32 63)
  %223 = extractelement <2 x float> %208, i64 1
  %224 = tail call float @llvm.amdgcn.update.dpp.f32(float poison, float %223, i32 177, i32 15, i32 15, i1 true)
  %225 = fadd float %223, %224
  %226 = tail call float @llvm.amdgcn.update.dpp.f32(float poison, float %225, i32 78, i32 15, i32 15, i1 true)
  %227 = fadd float %225, %226
  %228 = tail call float @llvm.amdgcn.update.dpp.f32(float poison, float %227, i32 321, i32 15, i32 15, i1 true)
  %229 = fadd float %227, %228
  %230 = tail call float @llvm.amdgcn.update.dpp.f32(float poison, float %229, i32 320, i32 15, i32 15, i1 true)
  %231 = fadd float %229, %230
  %232 = tail call float @llvm.amdgcn.update.dpp.f32(float %231, float %231, i32 322, i32 10, i32 15, i1 false)
  %233 = fadd float %231, %232
  %234 = tail call float @llvm.amdgcn.update.dpp.f32(float poison, float %233, i32 323, i32 15, i32 15, i1 true)
  %235 = fadd float %234, %233
  %236 = tail call float @llvm.amdgcn.readlane.f32(float %235, i32 63)
  %237 = insertelement <1 x float> poison, float %222, i64 0
  %238 = insertelement <1 x float> poison, float %236, i64 0
  tail call void @llvm.amdgcn.s.waitcnt(i32 -7937)
  tail call void @llvm.amdgcn.s.barrier()
  %239 = getelementptr float, ptr addrspace(3) @__shared_memory__, i32 %10
  store <1 x float> %237, ptr addrspace(3) %239, align 4
  %240 = getelementptr i8, ptr addrspace(3) %239, i32 16
  store <1 x float> %238, ptr addrspace(3) %240, align 4
  tail call void @llvm.amdgcn.s.waitcnt(i32 -7937)
  tail call void @llvm.amdgcn.s.barrier()
  %241 = and i32 %4, 1
  %242 = getelementptr float, ptr addrspace(3) @__shared_memory__, i32 %241
  %243 = load <1 x float>, ptr addrspace(3) %242, align 4
  %244 = getelementptr i8, ptr addrspace(3) %242, i32 16
  %245 = load <1 x float>, ptr addrspace(3) %244, align 4
  %246 = extractelement <1 x float> %243, i64 0
  %247 = fadd float %246, 0.000000e+00
  %248 = tail call float @llvm.amdgcn.update.dpp.f32(float poison, float %247, i32 177, i32 15, i32 15, i1 true)
  %249 = fadd float %247, %248
  %250 = extractelement <1 x float> %245, i64 0
  %251 = fadd float %250, 0.000000e+00
  %252 = tail call float @llvm.amdgcn.update.dpp.f32(float poison, float %251, i32 177, i32 15, i32 15, i1 true)
  %253 = fadd float %251, %252
  %254 = fptrunc float %249 to half
  %255 = insertelement <1 x half> poison, half %254, i64 0
  %256 = fptrunc float %253 to half
  %257 = insertelement <1 x half> poison, half %256, i64 0
  %.idx = shl nuw nsw i32 %8, 16
  %258 = getelementptr i8, ptr addrspace(7) %200, i32 %.idx
  %259 = getelementptr half, ptr addrspace(7) %258, i32 %7
  store <1 x half> %255, ptr addrspace(7) %259, align 2
  %.idx1 = shl nuw nsw i32 %11, 15
  %260 = getelementptr i8, ptr addrspace(7) %200, i32 %.idx1
  %261 = getelementptr half, ptr addrspace(7) %260, i32 %7
  store <1 x half> %257, ptr addrspace(7) %261, align 2
  ret void
}

; Function Attrs: alwaysinline mustprogress nofree norecurse nounwind willreturn
define amdgpu_kernel void @dispatch_115_dispatch_0_matmul_like_4x6656x16384_f16xf16xf32(ptr addrspace(1) inreg noalias noundef nonnull readonly align 16 %0, ptr addrspace(1) inreg noalias noundef nonnull readonly align 16 %1, ptr addrspace(1) inreg noalias noundef nonnull align 16 %2) local_unnamed_addr #1 !reqd_work_group_size !3 {
  %4 = tail call range(i32 0, 512) i32 @llvm.amdgcn.workitem.id.x()
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %0, i64 64) ]
  %5 = tail call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) nonnull %0, i16 0, i32 131072, i32 159744)
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %1, i64 64) ]
  %6 = tail call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) nonnull %1, i16 0, i32 218103808, i32 159744)
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %2, i64 64) ]
  %7 = tail call range(i32 0, 6656) i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call range(i32 0, 2) i32 @llvm.amdgcn.workgroup.id.y()
  %9 = shl nuw nsw i32 %8, 1
  %10 = lshr i32 %4, 6
  %11 = or disjoint i32 %9, 1
  %12 = shl nuw nsw i32 %10, 8
  %13 = shl nuw nsw i32 %4, 2
  %14 = and i32 %13, 252
  %15 = or disjoint i32 %12, %14
  %.idx2 = shl nuw nsw i32 %8, 16
  %16 = getelementptr i8, ptr addrspace(7) %5, i32 %.idx2
  %.idx3 = shl nuw nsw i32 %11, 15
  %17 = getelementptr i8, ptr addrspace(7) %5, i32 %.idx3
  %.idx4 = shl nuw nsw i32 %7, 15
  %18 = getelementptr i8, ptr addrspace(7) %6, i32 %.idx4
  %19 = getelementptr half, ptr addrspace(7) %16, i32 %15
  %20 = load <4 x half>, ptr addrspace(7) %19, align 2
  %21 = getelementptr half, ptr addrspace(7) %17, i32 %15
  %22 = load <4 x half>, ptr addrspace(7) %21, align 2
  %23 = getelementptr half, ptr addrspace(7) %18, i32 %15
  %24 = load <4 x half>, ptr addrspace(7) %23, align 2
  %25 = fpext <4 x half> %20 to <4 x float>
  %26 = fpext <4 x half> %22 to <4 x float>
  %27 = fpext <4 x half> %24 to <4 x float>
  %28 = fmul <4 x float> %25, %27
  %29 = fmul <4 x float> %26, %27
  %30 = fadd <4 x float> %28, zeroinitializer
  %31 = fadd <4 x float> %29, zeroinitializer
  %32 = or disjoint i32 %15, 2048
  %33 = getelementptr half, ptr addrspace(7) %16, i32 %32
  %34 = load <4 x half>, ptr addrspace(7) %33, align 2
  %35 = getelementptr half, ptr addrspace(7) %17, i32 %32
  %36 = load <4 x half>, ptr addrspace(7) %35, align 2
  %37 = getelementptr half, ptr addrspace(7) %18, i32 %32
  %38 = load <4 x half>, ptr addrspace(7) %37, align 2
  %39 = fpext <4 x half> %34 to <4 x float>
  %40 = fpext <4 x half> %36 to <4 x float>
  %41 = fpext <4 x half> %38 to <4 x float>
  %42 = fmul <4 x float> %39, %41
  %43 = fmul <4 x float> %40, %41
  %44 = fadd <4 x float> %30, %42
  %45 = fadd <4 x float> %31, %43
  %46 = or disjoint i32 %15, 4096
  %47 = getelementptr half, ptr addrspace(7) %16, i32 %46
  %48 = load <4 x half>, ptr addrspace(7) %47, align 2
  %49 = getelementptr half, ptr addrspace(7) %17, i32 %46
  %50 = load <4 x half>, ptr addrspace(7) %49, align 2
  %51 = getelementptr half, ptr addrspace(7) %18, i32 %46
  %52 = load <4 x half>, ptr addrspace(7) %51, align 2
  %53 = fpext <4 x half> %48 to <4 x float>
  %54 = fpext <4 x half> %50 to <4 x float>
  %55 = fpext <4 x half> %52 to <4 x float>
  %56 = fmul <4 x float> %53, %55
  %57 = fmul <4 x float> %54, %55
  %58 = fadd <4 x float> %44, %56
  %59 = fadd <4 x float> %45, %57
  %60 = or disjoint i32 %15, 6144
  %61 = getelementptr half, ptr addrspace(7) %16, i32 %60
  %62 = load <4 x half>, ptr addrspace(7) %61, align 2
  %63 = getelementptr half, ptr addrspace(7) %17, i32 %60
  %64 = load <4 x half>, ptr addrspace(7) %63, align 2
  %65 = getelementptr half, ptr addrspace(7) %18, i32 %60
  %66 = load <4 x half>, ptr addrspace(7) %65, align 2
  %67 = fpext <4 x half> %62 to <4 x float>
  %68 = fpext <4 x half> %64 to <4 x float>
  %69 = fpext <4 x half> %66 to <4 x float>
  %70 = fmul <4 x float> %67, %69
  %71 = fmul <4 x float> %68, %69
  %72 = fadd <4 x float> %58, %70
  %73 = fadd <4 x float> %59, %71
  %74 = or disjoint i32 %15, 8192
  %75 = getelementptr half, ptr addrspace(7) %16, i32 %74
  %76 = load <4 x half>, ptr addrspace(7) %75, align 2
  %77 = getelementptr half, ptr addrspace(7) %17, i32 %74
  %78 = load <4 x half>, ptr addrspace(7) %77, align 2
  %79 = getelementptr half, ptr addrspace(7) %18, i32 %74
  %80 = load <4 x half>, ptr addrspace(7) %79, align 2
  %81 = fpext <4 x half> %76 to <4 x float>
  %82 = fpext <4 x half> %78 to <4 x float>
  %83 = fpext <4 x half> %80 to <4 x float>
  %84 = fmul <4 x float> %81, %83
  %85 = fmul <4 x float> %82, %83
  %86 = fadd <4 x float> %72, %84
  %87 = fadd <4 x float> %73, %85
  %88 = or disjoint i32 %15, 10240
  %89 = getelementptr half, ptr addrspace(7) %16, i32 %88
  %90 = load <4 x half>, ptr addrspace(7) %89, align 2
  %91 = getelementptr half, ptr addrspace(7) %17, i32 %88
  %92 = load <4 x half>, ptr addrspace(7) %91, align 2
  %93 = getelementptr half, ptr addrspace(7) %18, i32 %88
  %94 = load <4 x half>, ptr addrspace(7) %93, align 2
  %95 = fpext <4 x half> %90 to <4 x float>
  %96 = fpext <4 x half> %92 to <4 x float>
  %97 = fpext <4 x half> %94 to <4 x float>
  %98 = fmul <4 x float> %95, %97
  %99 = fmul <4 x float> %96, %97
  %100 = fadd <4 x float> %86, %98
  %101 = fadd <4 x float> %87, %99
  %102 = or disjoint i32 %15, 12288
  %103 = getelementptr half, ptr addrspace(7) %16, i32 %102
  %104 = load <4 x half>, ptr addrspace(7) %103, align 2
  %105 = getelementptr half, ptr addrspace(7) %17, i32 %102
  %106 = load <4 x half>, ptr addrspace(7) %105, align 2
  %107 = getelementptr half, ptr addrspace(7) %18, i32 %102
  %108 = load <4 x half>, ptr addrspace(7) %107, align 2
  %109 = fpext <4 x half> %104 to <4 x float>
  %110 = fpext <4 x half> %106 to <4 x float>
  %111 = fpext <4 x half> %108 to <4 x float>
  %112 = fmul <4 x float> %109, %111
  %113 = fmul <4 x float> %110, %111
  %114 = fadd <4 x float> %100, %112
  %115 = fadd <4 x float> %101, %113
  %116 = or disjoint i32 %15, 14336
  %117 = getelementptr half, ptr addrspace(7) %16, i32 %116
  %118 = load <4 x half>, ptr addrspace(7) %117, align 2
  %119 = getelementptr half, ptr addrspace(7) %17, i32 %116
  %120 = load <4 x half>, ptr addrspace(7) %119, align 2
  %121 = getelementptr half, ptr addrspace(7) %18, i32 %116
  %122 = load <4 x half>, ptr addrspace(7) %121, align 2
  %123 = fpext <4 x half> %118 to <4 x float>
  %124 = fpext <4 x half> %120 to <4 x float>
  %125 = fpext <4 x half> %122 to <4 x float>
  %126 = fmul <4 x float> %123, %125
  %127 = fmul <4 x float> %124, %125
  %128 = fadd <4 x float> %114, %126
  %129 = fadd <4 x float> %115, %127
  %130 = tail call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) nonnull %2, i16 0, i32 106496, i32 159744)
  %131 = shufflevector <4 x float> %128, <4 x float> %129, <2 x i32> <i32 0, i32 4>
  %132 = shufflevector <4 x float> %128, <4 x float> %129, <2 x i32> <i32 1, i32 5>
  %133 = shufflevector <4 x float> %128, <4 x float> %129, <2 x i32> <i32 2, i32 6>
  %134 = shufflevector <4 x float> %128, <4 x float> %129, <2 x i32> <i32 3, i32 7>
  %135 = fadd <2 x float> %131, zeroinitializer
  %136 = fadd <2 x float> %132, %135
  %137 = fadd <2 x float> %133, %136
  %138 = fadd <2 x float> %134, %137
  %139 = extractelement <2 x float> %138, i64 0
  %140 = tail call float @llvm.amdgcn.update.dpp.f32(float poison, float %139, i32 177, i32 15, i32 15, i1 true)
  %141 = fadd float %139, %140
  %142 = tail call float @llvm.amdgcn.update.dpp.f32(float poison, float %141, i32 78, i32 15, i32 15, i1 true)
  %143 = fadd float %141, %142
  %144 = tail call float @llvm.amdgcn.update.dpp.f32(float poison, float %143, i32 321, i32 15, i32 15, i1 true)
  %145 = fadd float %143, %144
  %146 = tail call float @llvm.amdgcn.update.dpp.f32(float poison, float %145, i32 320, i32 15, i32 15, i1 true)
  %147 = fadd float %145, %146
  %148 = tail call float @llvm.amdgcn.update.dpp.f32(float %147, float %147, i32 322, i32 10, i32 15, i1 false)
  %149 = fadd float %147, %148
  %150 = tail call float @llvm.amdgcn.update.dpp.f32(float poison, float %149, i32 323, i32 15, i32 15, i1 true)
  %151 = fadd float %150, %149
  %152 = tail call float @llvm.amdgcn.readlane.f32(float %151, i32 63)
  %153 = extractelement <2 x float> %138, i64 1
  %154 = tail call float @llvm.amdgcn.update.dpp.f32(float poison, float %153, i32 177, i32 15, i32 15, i1 true)
  %155 = fadd float %153, %154
  %156 = tail call float @llvm.amdgcn.update.dpp.f32(float poison, float %155, i32 78, i32 15, i32 15, i1 true)
  %157 = fadd float %155, %156
  %158 = tail call float @llvm.amdgcn.update.dpp.f32(float poison, float %157, i32 321, i32 15, i32 15, i1 true)
  %159 = fadd float %157, %158
  %160 = tail call float @llvm.amdgcn.update.dpp.f32(float poison, float %159, i32 320, i32 15, i32 15, i1 true)
  %161 = fadd float %159, %160
  %162 = tail call float @llvm.amdgcn.update.dpp.f32(float %161, float %161, i32 322, i32 10, i32 15, i1 false)
  %163 = fadd float %161, %162
  %164 = tail call float @llvm.amdgcn.update.dpp.f32(float poison, float %163, i32 323, i32 15, i32 15, i1 true)
  %165 = fadd float %164, %163
  %166 = tail call float @llvm.amdgcn.readlane.f32(float %165, i32 63)
  %167 = insertelement <1 x float> poison, float %152, i64 0
  %168 = insertelement <1 x float> poison, float %166, i64 0
  tail call void @llvm.amdgcn.s.waitcnt(i32 -7937)
  tail call void @llvm.amdgcn.s.barrier()
  %169 = getelementptr float, ptr addrspace(3) @__shared_memory___0, i32 %10
  store <1 x float> %167, ptr addrspace(3) %169, align 4
  %170 = getelementptr i8, ptr addrspace(3) %169, i32 40
  store <1 x float> %168, ptr addrspace(3) %170, align 4
  tail call void @llvm.amdgcn.s.waitcnt(i32 -7937)
  tail call void @llvm.amdgcn.s.barrier()
  %171 = and i32 %4, 7
  %172 = getelementptr float, ptr addrspace(3) @__shared_memory___0, i32 %171
  %173 = load <1 x float>, ptr addrspace(3) %172, align 4
  %174 = getelementptr i8, ptr addrspace(3) %172, i32 40
  %175 = load <1 x float>, ptr addrspace(3) %174, align 4
  %176 = extractelement <1 x float> %173, i64 0
  %177 = fadd float %176, 0.000000e+00
  %178 = tail call float @llvm.amdgcn.update.dpp.f32(float poison, float %177, i32 177, i32 15, i32 15, i1 true)
  %179 = fadd float %177, %178
  %180 = tail call float @llvm.amdgcn.update.dpp.f32(float poison, float %179, i32 78, i32 15, i32 15, i1 true)
  %181 = fadd float %179, %180
  %182 = tail call float @llvm.amdgcn.update.dpp.f32(float poison, float %181, i32 321, i32 15, i32 15, i1 true)
  %183 = fadd float %181, %182
  %184 = extractelement <1 x float> %175, i64 0
  %185 = fadd float %184, 0.000000e+00
  %186 = tail call float @llvm.amdgcn.update.dpp.f32(float poison, float %185, i32 177, i32 15, i32 15, i1 true)
  %187 = fadd float %185, %186
  %188 = tail call float @llvm.amdgcn.update.dpp.f32(float poison, float %187, i32 78, i32 15, i32 15, i1 true)
  %189 = fadd float %187, %188
  %190 = tail call float @llvm.amdgcn.update.dpp.f32(float poison, float %189, i32 321, i32 15, i32 15, i1 true)
  %191 = fadd float %189, %190
  %192 = insertelement <1 x float> poison, float %183, i64 0
  %193 = insertelement <1 x float> poison, float %191, i64 0
  %.idx = mul nuw nsw i32 %8, 53248
  %194 = getelementptr i8, ptr addrspace(7) %130, i32 %.idx
  %195 = getelementptr float, ptr addrspace(7) %194, i32 %7
  store <1 x float> %192, ptr addrspace(7) %195, align 4
  %.idx1 = mul nuw nsw i32 %11, 26624
  %196 = getelementptr i8, ptr addrspace(7) %130, i32 %.idx1
  %197 = getelementptr float, ptr addrspace(7) %196, i32 %7
  store <1 x float> %193, ptr addrspace(7) %197, align 4
  ret void
}

; Function Attrs: alwaysinline mustprogress nofree norecurse nounwind willreturn
define amdgpu_kernel void @dispatch_116_dispatch_0_matmul_like_4x6656x16384_f16xf16xf32(ptr addrspace(1) inreg noalias noundef nonnull readonly align 16 %0, ptr addrspace(1) inreg noalias noundef nonnull readonly align 16 %1, ptr addrspace(1) inreg noalias noundef nonnull readonly align 16 %2, ptr addrspace(1) inreg noalias noundef nonnull align 16 %3) local_unnamed_addr #1 !reqd_work_group_size !3 {
  %5 = tail call range(i32 0, 512) i32 @llvm.amdgcn.workitem.id.x()
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %0, i64 64) ]
  %6 = tail call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) nonnull %0, i16 0, i32 131072, i32 159744)
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %1, i64 64) ]
  %7 = tail call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) nonnull %1, i16 0, i32 218103808, i32 159744)
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %2, i64 64) ]
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %3, i64 64) ]
  %8 = tail call range(i32 0, 6656) i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call range(i32 0, 2) i32 @llvm.amdgcn.workgroup.id.y()
  %10 = shl nuw nsw i32 %9, 1
  %11 = lshr i32 %5, 6
  %12 = or disjoint i32 %10, 1
  %13 = shl nuw nsw i32 %11, 8
  %14 = shl nuw nsw i32 %5, 2
  %15 = and i32 %14, 252
  %16 = or disjoint i32 %13, %15
  %.idx = shl nuw nsw i32 %9, 16
  %17 = getelementptr i8, ptr addrspace(7) %6, i32 %.idx
  %.idx4 = shl nuw nsw i32 %12, 15
  %18 = getelementptr i8, ptr addrspace(7) %6, i32 %.idx4
  %.idx5 = shl nuw nsw i32 %8, 15
  %19 = getelementptr i8, ptr addrspace(7) %7, i32 %.idx5
  %20 = getelementptr half, ptr addrspace(7) %17, i32 %16
  %21 = load <4 x half>, ptr addrspace(7) %20, align 2
  %22 = getelementptr half, ptr addrspace(7) %18, i32 %16
  %23 = load <4 x half>, ptr addrspace(7) %22, align 2
  %24 = getelementptr half, ptr addrspace(7) %19, i32 %16
  %25 = load <4 x half>, ptr addrspace(7) %24, align 2
  %26 = fpext <4 x half> %21 to <4 x float>
  %27 = fpext <4 x half> %23 to <4 x float>
  %28 = fpext <4 x half> %25 to <4 x float>
  %29 = fmul <4 x float> %26, %28
  %30 = fmul <4 x float> %27, %28
  %31 = fadd <4 x float> %29, zeroinitializer
  %32 = fadd <4 x float> %30, zeroinitializer
  %33 = or disjoint i32 %16, 2048
  %34 = getelementptr half, ptr addrspace(7) %17, i32 %33
  %35 = load <4 x half>, ptr addrspace(7) %34, align 2
  %36 = getelementptr half, ptr addrspace(7) %18, i32 %33
  %37 = load <4 x half>, ptr addrspace(7) %36, align 2
  %38 = getelementptr half, ptr addrspace(7) %19, i32 %33
  %39 = load <4 x half>, ptr addrspace(7) %38, align 2
  %40 = fpext <4 x half> %35 to <4 x float>
  %41 = fpext <4 x half> %37 to <4 x float>
  %42 = fpext <4 x half> %39 to <4 x float>
  %43 = fmul <4 x float> %40, %42
  %44 = fmul <4 x float> %41, %42
  %45 = fadd <4 x float> %31, %43
  %46 = fadd <4 x float> %32, %44
  %47 = or disjoint i32 %16, 4096
  %48 = getelementptr half, ptr addrspace(7) %17, i32 %47
  %49 = load <4 x half>, ptr addrspace(7) %48, align 2
  %50 = getelementptr half, ptr addrspace(7) %18, i32 %47
  %51 = load <4 x half>, ptr addrspace(7) %50, align 2
  %52 = getelementptr half, ptr addrspace(7) %19, i32 %47
  %53 = load <4 x half>, ptr addrspace(7) %52, align 2
  %54 = fpext <4 x half> %49 to <4 x float>
  %55 = fpext <4 x half> %51 to <4 x float>
  %56 = fpext <4 x half> %53 to <4 x float>
  %57 = fmul <4 x float> %54, %56
  %58 = fmul <4 x float> %55, %56
  %59 = fadd <4 x float> %45, %57
  %60 = fadd <4 x float> %46, %58
  %61 = or disjoint i32 %16, 6144
  %62 = getelementptr half, ptr addrspace(7) %17, i32 %61
  %63 = load <4 x half>, ptr addrspace(7) %62, align 2
  %64 = getelementptr half, ptr addrspace(7) %18, i32 %61
  %65 = load <4 x half>, ptr addrspace(7) %64, align 2
  %66 = getelementptr half, ptr addrspace(7) %19, i32 %61
  %67 = load <4 x half>, ptr addrspace(7) %66, align 2
  %68 = fpext <4 x half> %63 to <4 x float>
  %69 = fpext <4 x half> %65 to <4 x float>
  %70 = fpext <4 x half> %67 to <4 x float>
  %71 = fmul <4 x float> %68, %70
  %72 = fmul <4 x float> %69, %70
  %73 = fadd <4 x float> %59, %71
  %74 = fadd <4 x float> %60, %72
  %75 = or disjoint i32 %16, 8192
  %76 = getelementptr half, ptr addrspace(7) %17, i32 %75
  %77 = load <4 x half>, ptr addrspace(7) %76, align 2
  %78 = getelementptr half, ptr addrspace(7) %18, i32 %75
  %79 = load <4 x half>, ptr addrspace(7) %78, align 2
  %80 = getelementptr half, ptr addrspace(7) %19, i32 %75
  %81 = load <4 x half>, ptr addrspace(7) %80, align 2
  %82 = fpext <4 x half> %77 to <4 x float>
  %83 = fpext <4 x half> %79 to <4 x float>
  %84 = fpext <4 x half> %81 to <4 x float>
  %85 = fmul <4 x float> %82, %84
  %86 = fmul <4 x float> %83, %84
  %87 = fadd <4 x float> %73, %85
  %88 = fadd <4 x float> %74, %86
  %89 = or disjoint i32 %16, 10240
  %90 = getelementptr half, ptr addrspace(7) %17, i32 %89
  %91 = load <4 x half>, ptr addrspace(7) %90, align 2
  %92 = getelementptr half, ptr addrspace(7) %18, i32 %89
  %93 = load <4 x half>, ptr addrspace(7) %92, align 2
  %94 = getelementptr half, ptr addrspace(7) %19, i32 %89
  %95 = load <4 x half>, ptr addrspace(7) %94, align 2
  %96 = fpext <4 x half> %91 to <4 x float>
  %97 = fpext <4 x half> %93 to <4 x float>
  %98 = fpext <4 x half> %95 to <4 x float>
  %99 = fmul <4 x float> %96, %98
  %100 = fmul <4 x float> %97, %98
  %101 = fadd <4 x float> %87, %99
  %102 = fadd <4 x float> %88, %100
  %103 = or disjoint i32 %16, 12288
  %104 = getelementptr half, ptr addrspace(7) %17, i32 %103
  %105 = load <4 x half>, ptr addrspace(7) %104, align 2
  %106 = getelementptr half, ptr addrspace(7) %18, i32 %103
  %107 = load <4 x half>, ptr addrspace(7) %106, align 2
  %108 = getelementptr half, ptr addrspace(7) %19, i32 %103
  %109 = load <4 x half>, ptr addrspace(7) %108, align 2
  %110 = fpext <4 x half> %105 to <4 x float>
  %111 = fpext <4 x half> %107 to <4 x float>
  %112 = fpext <4 x half> %109 to <4 x float>
  %113 = fmul <4 x float> %110, %112
  %114 = fmul <4 x float> %111, %112
  %115 = fadd <4 x float> %101, %113
  %116 = fadd <4 x float> %102, %114
  %117 = or disjoint i32 %16, 14336
  %118 = getelementptr half, ptr addrspace(7) %17, i32 %117
  %119 = load <4 x half>, ptr addrspace(7) %118, align 2
  %120 = getelementptr half, ptr addrspace(7) %18, i32 %117
  %121 = load <4 x half>, ptr addrspace(7) %120, align 2
  %122 = getelementptr half, ptr addrspace(7) %19, i32 %117
  %123 = load <4 x half>, ptr addrspace(7) %122, align 2
  %124 = fpext <4 x half> %119 to <4 x float>
  %125 = fpext <4 x half> %121 to <4 x float>
  %126 = fpext <4 x half> %123 to <4 x float>
  %127 = fmul <4 x float> %124, %126
  %128 = fmul <4 x float> %125, %126
  %129 = fadd <4 x float> %115, %127
  %130 = fadd <4 x float> %116, %128
  %131 = tail call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) nonnull %3, i16 0, i32 53248, i32 159744)
  %132 = tail call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) nonnull %2, i16 0, i32 106496, i32 159744)
  %133 = shufflevector <4 x float> %129, <4 x float> %130, <2 x i32> <i32 0, i32 4>
  %134 = shufflevector <4 x float> %129, <4 x float> %130, <2 x i32> <i32 1, i32 5>
  %135 = shufflevector <4 x float> %129, <4 x float> %130, <2 x i32> <i32 2, i32 6>
  %136 = shufflevector <4 x float> %129, <4 x float> %130, <2 x i32> <i32 3, i32 7>
  %137 = fadd <2 x float> %133, zeroinitializer
  %138 = fadd <2 x float> %134, %137
  %139 = fadd <2 x float> %135, %138
  %140 = fadd <2 x float> %136, %139
  %141 = extractelement <2 x float> %140, i64 0
  %142 = tail call float @llvm.amdgcn.update.dpp.f32(float poison, float %141, i32 177, i32 15, i32 15, i1 true)
  %143 = fadd float %141, %142
  %144 = tail call float @llvm.amdgcn.update.dpp.f32(float poison, float %143, i32 78, i32 15, i32 15, i1 true)
  %145 = fadd float %143, %144
  %146 = tail call float @llvm.amdgcn.update.dpp.f32(float poison, float %145, i32 321, i32 15, i32 15, i1 true)
  %147 = fadd float %145, %146
  %148 = tail call float @llvm.amdgcn.update.dpp.f32(float poison, float %147, i32 320, i32 15, i32 15, i1 true)
  %149 = fadd float %147, %148
  %150 = tail call float @llvm.amdgcn.update.dpp.f32(float %149, float %149, i32 322, i32 10, i32 15, i1 false)
  %151 = fadd float %149, %150
  %152 = tail call float @llvm.amdgcn.update.dpp.f32(float poison, float %151, i32 323, i32 15, i32 15, i1 true)
  %153 = fadd float %152, %151
  %154 = tail call float @llvm.amdgcn.readlane.f32(float %153, i32 63)
  %155 = extractelement <2 x float> %140, i64 1
  %156 = tail call float @llvm.amdgcn.update.dpp.f32(float poison, float %155, i32 177, i32 15, i32 15, i1 true)
  %157 = fadd float %155, %156
  %158 = tail call float @llvm.amdgcn.update.dpp.f32(float poison, float %157, i32 78, i32 15, i32 15, i1 true)
  %159 = fadd float %157, %158
  %160 = tail call float @llvm.amdgcn.update.dpp.f32(float poison, float %159, i32 321, i32 15, i32 15, i1 true)
  %161 = fadd float %159, %160
  %162 = tail call float @llvm.amdgcn.update.dpp.f32(float poison, float %161, i32 320, i32 15, i32 15, i1 true)
  %163 = fadd float %161, %162
  %164 = tail call float @llvm.amdgcn.update.dpp.f32(float %163, float %163, i32 322, i32 10, i32 15, i1 false)
  %165 = fadd float %163, %164
  %166 = tail call float @llvm.amdgcn.update.dpp.f32(float poison, float %165, i32 323, i32 15, i32 15, i1 true)
  %167 = fadd float %166, %165
  %168 = tail call float @llvm.amdgcn.readlane.f32(float %167, i32 63)
  %169 = insertelement <1 x float> poison, float %154, i64 0
  %170 = insertelement <1 x float> poison, float %168, i64 0
  tail call void @llvm.amdgcn.s.waitcnt(i32 -7937)
  tail call void @llvm.amdgcn.s.barrier()
  %171 = getelementptr float, ptr addrspace(3) @__shared_memory___1, i32 %11
  store <1 x float> %169, ptr addrspace(3) %171, align 4
  %172 = getelementptr i8, ptr addrspace(3) %171, i32 40
  store <1 x float> %170, ptr addrspace(3) %172, align 4
  tail call void @llvm.amdgcn.s.waitcnt(i32 -7937)
  tail call void @llvm.amdgcn.s.barrier()
  %173 = and i32 %5, 7
  %174 = getelementptr float, ptr addrspace(3) @__shared_memory___1, i32 %173
  %175 = load <1 x float>, ptr addrspace(3) %174, align 4
  %176 = getelementptr i8, ptr addrspace(3) %174, i32 40
  %177 = load <1 x float>, ptr addrspace(3) %176, align 4
  %178 = extractelement <1 x float> %175, i64 0
  %179 = fadd float %178, 0.000000e+00
  %180 = tail call float @llvm.amdgcn.update.dpp.f32(float poison, float %179, i32 177, i32 15, i32 15, i1 true)
  %181 = fadd float %179, %180
  %182 = tail call float @llvm.amdgcn.update.dpp.f32(float poison, float %181, i32 78, i32 15, i32 15, i1 true)
  %183 = fadd float %181, %182
  %184 = tail call float @llvm.amdgcn.update.dpp.f32(float poison, float %183, i32 321, i32 15, i32 15, i1 true)
  %185 = fadd float %183, %184
  %186 = extractelement <1 x float> %177, i64 0
  %187 = fadd float %186, 0.000000e+00
  %188 = tail call float @llvm.amdgcn.update.dpp.f32(float poison, float %187, i32 177, i32 15, i32 15, i1 true)
  %189 = fadd float %187, %188
  %190 = tail call float @llvm.amdgcn.update.dpp.f32(float poison, float %189, i32 78, i32 15, i32 15, i1 true)
  %191 = fadd float %189, %190
  %192 = tail call float @llvm.amdgcn.update.dpp.f32(float poison, float %191, i32 321, i32 15, i32 15, i1 true)
  %193 = fadd float %191, %192
  %narrow = mul nuw nsw i32 %9, 13312
  %narrow1 = add nuw nsw i32 %narrow, %8
  %194 = getelementptr inbounds nuw float, ptr addrspace(7) %132, i32 %narrow1
  %195 = load float, ptr addrspace(7) %194, align 4
  %narrow2 = mul nuw nsw i32 %12, 6656
  %narrow3 = add nuw nsw i32 %narrow2, %8
  %196 = getelementptr inbounds nuw float, ptr addrspace(7) %132, i32 %narrow3
  %197 = load float, ptr addrspace(7) %196, align 4
  %198 = fptrunc float %185 to half
  %199 = fptrunc float %193 to half
  %200 = fneg half %198
  %201 = fpext half %200 to float
  %202 = tail call float @llvm.exp.f32(float %201)
  %203 = fneg half %199
  %204 = fpext half %203 to float
  %205 = tail call float @llvm.exp.f32(float %204)
  %206 = fptrunc float %202 to half
  %207 = fptrunc float %205 to half
  %.scalar = fadd half %206, 0xH3C00
  %.scalar7 = fadd half %207, 0xH3C00
  %.scalar8 = fdiv half 0xH3C00, %.scalar
  %.scalar9 = fdiv half 0xH3C00, %.scalar7
  %208 = fptrunc float %195 to half
  %209 = fptrunc float %197 to half
  %.scalar10 = fmul half %.scalar8, %198
  %.scalar11 = fmul half %.scalar9, %199
  %.scalar12 = fmul half %.scalar10, %208
  %210 = insertelement <1 x half> poison, half %.scalar12, i64 0
  %.scalar13 = fmul half %.scalar11, %209
  %211 = insertelement <1 x half> poison, half %.scalar13, i64 0
  %212 = getelementptr half, ptr addrspace(7) %131, i32 %narrow1
  store <1 x half> %210, ptr addrspace(7) %212, align 2
  %213 = getelementptr half, ptr addrspace(7) %131, i32 %narrow3
  store <1 x half> %211, ptr addrspace(7) %213, align 2
  ret void
}

; Function Attrs: alwaysinline mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: alwaysinline mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #3

; Function Attrs: alwaysinline mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) readnone, i16, i32, i32) #2

; Function Attrs: alwaysinline mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: alwaysinline mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: alwaysinline convergent mustprogress nocallback nofree nounwind willreturn memory(none)
declare float @llvm.amdgcn.update.dpp.f32(float, float, i32 immarg, i32 immarg, i32 immarg, i1 immarg) #4

; Function Attrs: alwaysinline convergent mustprogress nocallback nofree nounwind willreturn memory(none)
declare float @llvm.amdgcn.readlane.f32(float, i32) #4

; Function Attrs: alwaysinline mustprogress nocallback nofree nounwind willreturn
declare void @llvm.amdgcn.s.waitcnt(i32 immarg) #5

; Function Attrs: alwaysinline convergent mustprogress nocallback nofree nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #6

; Function Attrs: alwaysinline mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.exp.f32(float) #2

attributes #0 = { alwaysinline mustprogress nofree norecurse nounwind willreturn "amdgpu-agpr-alloc"="0" "amdgpu-flat-work-group-size"="128,128" "amdgpu-no-completion-action" "amdgpu-no-default-queue" "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-flat-scratch-init" "amdgpu-no-heap-ptr" "amdgpu-no-hostcall-ptr" "amdgpu-no-implicitarg-ptr" "amdgpu-no-lds-kernel-id" "amdgpu-no-multigrid-sync-arg" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-y" "amdgpu-no-workitem-id-z" "uniform-work-group-size"="true" }
attributes #1 = { alwaysinline mustprogress nofree norecurse nounwind willreturn "amdgpu-agpr-alloc"="0" "amdgpu-flat-work-group-size"="512,512" "amdgpu-no-completion-action" "amdgpu-no-default-queue" "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-flat-scratch-init" "amdgpu-no-heap-ptr" "amdgpu-no-hostcall-ptr" "amdgpu-no-implicitarg-ptr" "amdgpu-no-lds-kernel-id" "amdgpu-no-multigrid-sync-arg" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-y" "amdgpu-no-workitem-id-z" "amdgpu-waves-per-eu"="2,8" "uniform-work-group-size"="true" }
attributes #2 = { alwaysinline mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { alwaysinline mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #4 = { alwaysinline convergent mustprogress nocallback nofree nounwind willreturn memory(none) }
attributes #5 = { alwaysinline mustprogress nocallback nofree nounwind willreturn }
attributes #6 = { alwaysinline convergent mustprogress nocallback nofree nounwind willreturn }

!llvm.module.flags = !{!0, !1}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 1, !"amdhsa_code_object_version", i32 500}
!2 = !{i32 128, i32 1, i32 1}
!3 = !{i32 512, i32 1, i32 1}
