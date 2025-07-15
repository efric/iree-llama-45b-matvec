hal.executable public @dispatch_131_dispatch_0 {
  hal.executable.variant public @rocm_hsaco_fb target(<"rocm", "rocm-hsaco-fb", {abi = "hip", iree.gpu.target = #iree_gpu.target<arch = "gfx942", features = "", wgp = <compute =  fp64|fp32|fp16|int64|int32|int16|int8, storage =  b64|b32|b16|b8, subgroup =  shuffle|arithmetic, dot =  dp4xi8toi32, mma = [<MFMA_F32_16x16x16_BF16>, <MFMA_F32_32x32x8_BF16>, <MFMA_F32_16x16x32_F8E5M2FNUZ>, <MFMA_F32_16x16x32_F8E5M2FNUZ_F8E4M3FNUZ>, <MFMA_F32_16x16x32_F8E4M3FNUZ>, <MFMA_F32_16x16x32_F8E4M3FNUZ_F8E5M2FNUZ>, <MFMA_F32_32x32x16_F8E5M2FNUZ>, <MFMA_F32_32x32x16_F8E5M2FNUZ_F8E4M3FNUZ>, <MFMA_F32_32x32x16_F8E4M3FNUZ>, <MFMA_F32_32x32x16_F8E4M3FNUZ_F8E5M2FNUZ>, <MFMA_I32_16x16x32_I8>, <MFMA_I32_32x32x16_I8>, <MFMA_F64_16x16x4_F64>, <MFMA_F32_16x16x4_F32>, <MFMA_F32_16x16x16_F16>, <MFMA_F32_32x32x8_F16>], subgroup_size_choices = [64], max_workgroup_sizes = [1024, 1024, 1024], max_thread_count_per_workgroup = 1024, max_workgroup_memory_bytes = 65536, max_workgroup_counts = [2147483647, 2147483647, 2147483647], max_load_instruction_bits = 128, simds_per_wgp = 4, vgpr_space_bits = 16384>>, iree_codegen.default_tuning_spec = #rocm.builtin.tuning_module<"iree_default_tuning_spec_gfx942.mlir">, ukernels = "none"}>) {
    hal.executable.export public @dispatch_131_dispatch_0_matmul_like_4x16384x6656_f16xf16xf32 ordinal(0) layout(#hal.pipeline.layout<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) count(%arg0: !hal.device) -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice
      hal.return %x, %y, %z : index, index, index
    }
    builtin.module {
      func.func @dispatch_131_dispatch_0_matmul_like_4x16384x6656_f16xf16xf32() attributes {translation_info = #iree_codegen.translation_info<pipeline = LLVMGPUVectorDistribute workgroup_size = [128, 1, 1] subgroup_size = 64, {gpu_pipeline_options = #iree_gpu.pipeline_options<prefetch_shared_memory = false, no_reduce_shared_memory_bank_conflicts = false, use_igemm_convolution = false>}>} {
        %cst = arith.constant 0.000000e+00 : f32
        %c0 = arith.constant 0 : index
        %0 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%c0) flags("ReadOnly|Indirect") {iree_gpu.use_rocdl_buffer_instructions} : !iree_tensor_ext.dispatch.tensor<readonly:tensor<4x6656xf16>>
        %1 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%c0) flags("ReadOnly|Indirect") {iree_gpu.use_rocdl_buffer_instructions} : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16384x6656xf16>>
        %2 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(2) alignment(64) offset(%c0) flags(Indirect) {iree_gpu.use_rocdl_buffer_instructions} : !iree_tensor_ext.dispatch.tensor<writeonly:tensor<4x16384xf16>>
        %3 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0], sizes = [4, 6656], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<4x6656xf16>> -> tensor<4x6656xf16>
        %4 = iree_tensor_ext.dispatch.tensor.load %1, offsets = [0, 0], sizes = [16384, 6656], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16384x6656xf16>> -> tensor<16384x6656xf16>
        %5 = tensor.empty() : tensor<4x16384xf16>
        %6 = tensor.empty() : tensor<4x16384xf32>
        %7 = linalg.fill ins(%cst : f32) outs(%6 : tensor<4x16384xf32>) -> tensor<4x16384xf32>
        %8 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = ["parallel", "parallel", "reduction"]} ins(%3, %4 : tensor<4x6656xf16>, tensor<16384x6656xf16>) outs(%7 : tensor<4x16384xf32>) attrs =  {lowering_config = #iree_gpu.lowering_config<{partial_reduction = [0, 0, 512], subgroup_basis = [[1, 1, 2], [0, 1, 2]], thread = [0, 0, 4], thread_basis = [[1, 1, 64], [0, 1, 2]], workgroup = [2, 1, 0]}>} {
        ^bb0(%in: f16, %in_0: f16, %out: f32):
          %10 = arith.extf %in : f16 to f32
          %11 = arith.extf %in_0 : f16 to f32
          %12 = arith.mulf %10, %11 : f32
          %13 = arith.addf %out, %12 : f32
          linalg.yield %13 : f32
        } -> tensor<4x16384xf32>
        %9 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%8 : tensor<4x16384xf32>) outs(%5 : tensor<4x16384xf16>) {
        ^bb0(%in: f32, %out: f16):
          %10 = arith.truncf %in : f32 to f16
          linalg.yield %10 : f16
        } -> tensor<4x16384xf16>
        iree_tensor_ext.dispatch.tensor.store %9, %2, offsets = [0, 0], sizes = [4, 16384], strides = [1, 1] : tensor<4x16384xf16> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<4x16384xf16>>
        return
      }
    }
  }
}
