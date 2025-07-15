module {
  util.global private @__device_0 = #hal.device.target<"hip", [#hal.executable.target<"rocm", "rocm-hsaco-fb", {abi = "hip", iree.gpu.target = #iree_gpu.target<arch = "gfx942", features = "", wgp = <compute =  fp64|fp32|fp16|int64|int32|int16|int8, storage =  b64|b32|b16|b8, subgroup =  shuffle|arithmetic, dot =  dp4xi8toi32, mma = [<MFMA_F32_16x16x16_BF16>, <MFMA_F32_32x32x8_BF16>, <MFMA_F32_16x16x32_F8E5M2FNUZ>, <MFMA_F32_16x16x32_F8E5M2FNUZ_F8E4M3FNUZ>, <MFMA_F32_16x16x32_F8E4M3FNUZ>, <MFMA_F32_16x16x32_F8E4M3FNUZ_F8E5M2FNUZ>, <MFMA_F32_32x32x16_F8E5M2FNUZ>, <MFMA_F32_32x32x16_F8E5M2FNUZ_F8E4M3FNUZ>, <MFMA_F32_32x32x16_F8E4M3FNUZ>, <MFMA_F32_32x32x16_F8E4M3FNUZ_F8E5M2FNUZ>, <MFMA_I32_16x16x32_I8>, <MFMA_I32_32x32x16_I8>, <MFMA_F64_16x16x4_F64>, <MFMA_F32_16x16x4_F32>, <MFMA_F32_16x16x16_F16>, <MFMA_F32_32x32x8_F16>], subgroup_size_choices = [64], max_workgroup_sizes = [1024, 1024, 1024], max_thread_count_per_workgroup = 1024, max_workgroup_memory_bytes = 65536, max_workgroup_counts = [2147483647, 2147483647, 2147483647], max_load_instruction_bits = 128, simds_per_wgp = 4, vgpr_space_bits = 16384>>, iree_codegen.default_tuning_spec = #rocm.builtin.tuning_module<"iree_default_tuning_spec_gfx942.mlir">, ukernels = "none"}>]> : !hal.device
  hal.executable private @dispatch_116_dispatch_0 {
    hal.executable.variant public @rocm_hsaco_fb target(<"rocm", "rocm-hsaco-fb", {abi = "hip", iree.gpu.target = #iree_gpu.target<arch = "gfx942", features = "", wgp = <compute =  fp64|fp32|fp16|int64|int32|int16|int8, storage =  b64|b32|b16|b8, subgroup =  shuffle|arithmetic, dot =  dp4xi8toi32, mma = [<MFMA_F32_16x16x16_BF16>, <MFMA_F32_32x32x8_BF16>, <MFMA_F32_16x16x32_F8E5M2FNUZ>, <MFMA_F32_16x16x32_F8E5M2FNUZ_F8E4M3FNUZ>, <MFMA_F32_16x16x32_F8E4M3FNUZ>, <MFMA_F32_16x16x32_F8E4M3FNUZ_F8E5M2FNUZ>, <MFMA_F32_32x32x16_F8E5M2FNUZ>, <MFMA_F32_32x32x16_F8E5M2FNUZ_F8E4M3FNUZ>, <MFMA_F32_32x32x16_F8E4M3FNUZ>, <MFMA_F32_32x32x16_F8E4M3FNUZ_F8E5M2FNUZ>, <MFMA_I32_16x16x32_I8>, <MFMA_I32_32x32x16_I8>, <MFMA_F64_16x16x4_F64>, <MFMA_F32_16x16x4_F32>, <MFMA_F32_16x16x16_F16>, <MFMA_F32_32x32x8_F16>], subgroup_size_choices = [64], max_workgroup_sizes = [1024, 1024, 1024], max_thread_count_per_workgroup = 1024, max_workgroup_memory_bytes = 65536, max_workgroup_counts = [2147483647, 2147483647, 2147483647], max_load_instruction_bits = 128, simds_per_wgp = 4, vgpr_space_bits = 16384>>, iree_codegen.default_tuning_spec = #rocm.builtin.tuning_module<"iree_default_tuning_spec_gfx942.mlir">, ukernels = "none"}>) {
      hal.executable.export public @dispatch_116_dispatch_0_matmul_like_4x6656x16384_f16xf16xf32 ordinal(0) layout(#hal.pipeline.layout<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) count(%arg0: !hal.device) -> (index, index, index) {
        %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice
        hal.return %x, %y, %z : index, index, index
      }
      builtin.module {
        func.func @dispatch_116_dispatch_0_matmul_like_4x6656x16384_f16xf16xf32() attributes {translation_info = #iree_codegen.translation_info<pipeline = LLVMGPUVectorDistribute workgroup_size = [64, 1, 1] subgroup_size = 64, {gpu_pipeline_options = #iree_gpu.pipeline_options<prefetch_shared_memory = false, no_reduce_shared_memory_bank_conflicts = false, use_igemm_convolution = false>}>} {
          %cst = arith.constant 0.000000e+00 : f32
          %cst_0 = arith.constant 1.000000e+00 : f16
          %c0 = arith.constant 0 : index
          %0 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%c0) flags("ReadOnly|Indirect") {iree_gpu.use_rocdl_buffer_instructions} : !iree_tensor_ext.dispatch.tensor<readonly:tensor<4x16384xf16>>
          %1 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%c0) flags("ReadOnly|Indirect") {iree_gpu.use_rocdl_buffer_instructions} : !iree_tensor_ext.dispatch.tensor<readonly:tensor<6656x16384xf16>>
          %2 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(2) alignment(64) offset(%c0) flags("ReadOnly|Indirect") {iree_gpu.use_rocdl_buffer_instructions} : !iree_tensor_ext.dispatch.tensor<readonly:tensor<4x6656xf32>>
          %3 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(3) alignment(64) offset(%c0) flags(Indirect) {iree_gpu.use_rocdl_buffer_instructions} : !iree_tensor_ext.dispatch.tensor<writeonly:tensor<4x6656xf16>>
          %4 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0], sizes = [4, 16384], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<4x16384xf16>> -> tensor<4x16384xf16>
          %5 = iree_tensor_ext.dispatch.tensor.load %1, offsets = [0, 0], sizes = [6656, 16384], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<6656x16384xf16>> -> tensor<6656x16384xf16>
          %6 = iree_tensor_ext.dispatch.tensor.load %2, offsets = [0, 0], sizes = [4, 6656], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<4x6656xf32>> -> tensor<4x6656xf32>
          %7 = tensor.empty() : tensor<4x6656xf16>
          %8 = tensor.empty() : tensor<4x6656xf32>
          %9 = linalg.fill ins(%cst : f32) outs(%8 : tensor<4x6656xf32>) -> tensor<4x6656xf32>
          %10 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = ["parallel", "parallel", "reduction"]} ins(%4, %5 : tensor<4x16384xf16>, tensor<6656x16384xf16>) outs(%9 : tensor<4x6656xf32>) attrs =  {lowering_config = #iree_gpu.lowering_config<{partial_reduction = [0, 0, 512], subgroup_basis = [[1, 1, 1], [0, 1, 2]], thread = [0, 0, 8], thread_basis = [[1, 1, 64], [0, 1, 2]], workgroup = [4, 1, 0]}>} {
          ^bb0(%in: f16, %in_1: f16, %out: f32):
            %12 = arith.extf %in : f16 to f32
            %13 = arith.extf %in_1 : f16 to f32
            %14 = arith.mulf %12, %13 : f32
            %15 = arith.addf %out, %14 : f32
            linalg.yield %15 : f32
          } -> tensor<4x6656xf32>
          %11 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%10, %6 : tensor<4x6656xf32>, tensor<4x6656xf32>) outs(%7 : tensor<4x6656xf16>) {
          ^bb0(%in: f32, %in_1: f32, %out: f16):
            %12 = arith.truncf %in : f32 to f16
            %13 = arith.negf %12 : f16
            %14 = math.exp %13 : f16
            %15 = arith.addf %14, %cst_0 : f16
            %16 = arith.divf %cst_0, %15 : f16
            %17 = arith.truncf %in_1 : f32 to f16
            %18 = arith.mulf %16, %12 : f16
            %19 = arith.mulf %18, %17 : f16
            linalg.yield %19 : f16
          } -> tensor<4x6656xf16>
          iree_tensor_ext.dispatch.tensor.store %11, %3, offsets = [0, 0], sizes = [4, 6656], strides = [1, 1] : tensor<4x6656xf16> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<4x6656xf16>>
          return
        }
      }
    }
  }
  util.global private mutable @dispatch_116_dispatch_0_rocm_hsaco_fb_dispatch_116_dispatch_0_matmul_like_4x6656x16384_f16xf16xf32_buffer : !hal.buffer
  util.initializer {
    %device, %queue_affinity = hal.device.resolve on(#hal.device.affinity<@__device_0>) : !hal.device, i64
    %allocator = hal.device.allocator<%device : !hal.device> : !hal.allocator
    %memory_type = hal.memory_type<"DeviceVisible|DeviceLocal"> : i32
    %buffer_usage = hal.buffer_usage<"TransferSource|TransferTarget|Transfer|DispatchStorageRead|DispatchStorageWrite|DispatchStorage"> : i32
    %c218394624 = arith.constant 218394624 : index
    %buffer = hal.allocator.allocate<%allocator : !hal.allocator> affinity(%queue_affinity) type(%memory_type) usage(%buffer_usage) : !hal.buffer{%c218394624}
    util.global.store %buffer, @dispatch_116_dispatch_0_rocm_hsaco_fb_dispatch_116_dispatch_0_matmul_like_4x6656x16384_f16xf16xf32_buffer : !hal.buffer
    util.return
  }
  util.func public @dispatch_116_dispatch_0_rocm_hsaco_fb_dispatch_116_dispatch_0_matmul_like_4x6656x16384_f16xf16xf32(%arg0: i32) attributes {iree.abi.stub, iree.reflection = {iree.benchmark = "dispatch"}} {
    %0 = arith.index_cast %arg0 : i32 to index
    %device, %queue_affinity = hal.device.resolve on(#hal.device.affinity<@__device_0>) : !hal.device, i64
    %cmd = hal.command_buffer.create device(%device : !hal.device) mode("OneShot|AllowInlineExecution") categories(Dispatch) affinity(%queue_affinity) : !hal.command_buffer
    %dispatch_116_dispatch_0_rocm_hsaco_fb_dispatch_116_dispatch_0_matmul_like_4x6656x16384_f16xf16xf32_buffer = util.global.load @dispatch_116_dispatch_0_rocm_hsaco_fb_dispatch_116_dispatch_0_matmul_like_4x6656x16384_f16xf16xf32_buffer : !hal.buffer
    %c0 = arith.constant 0 : index
    %c131072 = arith.constant 131072 : index
    %c218103808 = arith.constant 218103808 : index
    %c218234880 = arith.constant 218234880 : index
    %c106496 = arith.constant 106496 : index
    %c218341376 = arith.constant 218341376 : index
    %c53248 = arith.constant 53248 : index
    %workgroup_x, %workgroup_y, %workgroup_z = hal.executable.calculate_workgroups device(%device : !hal.device) target(@dispatch_116_dispatch_0::@rocm_hsaco_fb::@dispatch_116_dispatch_0_matmul_like_4x6656x16384_f16xf16xf32) : index, index, index
    %exe = hal.executable.lookup device(%device : !hal.device) executable(@dispatch_116_dispatch_0) : !hal.executable
    %ordinal = hal.executable.export.ordinal target(@dispatch_116_dispatch_0::@rocm_hsaco_fb::@dispatch_116_dispatch_0_matmul_like_4x6656x16384_f16xf16xf32) : index
    %c1 = arith.constant 1 : index
    scf.for %arg1 = %c0 to %0 step %c1 {
      hal.command_buffer.dispatch<%cmd : !hal.command_buffer> target(%exe : !hal.executable)[%ordinal] workgroups([%workgroup_x, %workgroup_y, %workgroup_z]) bindings([
        (%dispatch_116_dispatch_0_rocm_hsaco_fb_dispatch_116_dispatch_0_matmul_like_4x6656x16384_f16xf16xf32_buffer : !hal.buffer)[%c0, %c131072], 
        (%dispatch_116_dispatch_0_rocm_hsaco_fb_dispatch_116_dispatch_0_matmul_like_4x6656x16384_f16xf16xf32_buffer : !hal.buffer)[%c131072, %c218103808], 
        (%dispatch_116_dispatch_0_rocm_hsaco_fb_dispatch_116_dispatch_0_matmul_like_4x6656x16384_f16xf16xf32_buffer : !hal.buffer)[%c218234880, %c106496], 
        (%dispatch_116_dispatch_0_rocm_hsaco_fb_dispatch_116_dispatch_0_matmul_like_4x6656x16384_f16xf16xf32_buffer : !hal.buffer)[%c218341376, %c53248]
      ]) flags("None")
      hal.command_buffer.execution_barrier<%cmd : !hal.command_buffer> source("Dispatch|CommandRetire") target("CommandIssue|Dispatch") flags("None")
    }
    hal.command_buffer.finalize<%cmd : !hal.command_buffer>
    %1 = util.null : !hal.fence
    %fence = hal.fence.create device(%device : !hal.device) flags("None") : !hal.fence
    hal.device.queue.execute<%device : !hal.device> affinity(%queue_affinity) wait(%1) signal(%fence) commands(%cmd) flags("None")
    %c-1_i32 = arith.constant -1 : i32
    %status = hal.fence.await until([%fence]) timeout_millis(%c-1_i32) flags("None") : i32
    util.status.check_ok %status, "failed to wait on timepoint"
    util.return
  }
}
