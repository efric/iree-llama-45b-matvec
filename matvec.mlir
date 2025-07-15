// llama 45b matvec investigation dispatches

// matvec -> cast
func.func @dispatch_131(
%a: tensor<4x6656xf16>,
%b: tensor<16384x6656xf16>)
-> tensor<4x16384xf16> {

  %cst = arith.constant 0.000000e+00 : f32
  %output_f16 = tensor.empty() : tensor<4x16384xf16>
  %accumulator = tensor.empty() : tensor<4x16384xf32>
  %accumulator_init = linalg.fill ins(%cst : f32) 
  outs(%accumulator : tensor<4x16384xf32>) 
  -> tensor<4x16384xf32>

  %matmul_result = linalg.generic {
    indexing_maps = [
    affine_map<(d0, d1, d2) -> (d0, d2)>,   // [M, K]
    affine_map<(d0, d1, d2) -> (d1, d2)>,   // [N, K]
    affine_map<(d0, d1, d2) -> (d0, d1)>    // [M, N]
    ],
    iterator_types = ["parallel", "parallel", "reduction"]
  } ins(%a, %b : tensor<4x6656xf16>, tensor<16384x6656xf16>)
  outs(%accumulator_init : tensor<4x16384xf32>) {
  ^bb0(%in: f16, %in_0: f16, %out: f32):
    %0 = arith.extf %in : f16 to f32
    %1 = arith.extf %in_0 : f16 to f32
    %2 = arith.mulf %0, %1 : f32
    %3 = arith.addf %out, %2 : f32
    linalg.yield %3 : f32
  } -> tensor<4x16384xf32>

  %result = linalg.generic {
    indexing_maps = [
    affine_map<(d0, d1) -> (d0, d1)>,
    affine_map<(d0, d1) -> (d0, d1)>
    ],
    iterator_types = ["parallel", "parallel"]
  } ins(%matmul_result : tensor<4x16384xf32>)
  outs(%output_f16 : tensor<4x16384xf16>) {
  ^bb0(%in: f32, %out: f16):
    %0 = arith.truncf %in : f32 to f16
    linalg.yield %0 : f16
  } -> tensor<4x16384xf16>

  return %result : tensor<4x16384xf16>
}

// matvec
func.func @dispatch_115(
%a: tensor<4x16384xf16>,
%b: tensor<6656x16384xf16>)
-> tensor<4x6656xf32> {
  %cst = arith.constant 0.000000e+00 : f32
  %accumulator = tensor.empty() : tensor<4x6656xf32>
  %accumulator_init = linalg.fill ins(%cst : f32)
  outs(%accumulator : tensor<4x6656xf32>)
  -> tensor<4x6656xf32>

  %matmul_result = linalg.generic {
    indexing_maps = [
    affine_map<(d0, d1, d2) -> (d0, d2)>,
    affine_map<(d0, d1, d2) -> (d1, d2)>,
    affine_map<(d0, d1, d2) -> (d0, d1)> 
    ],
    iterator_types = ["parallel", "parallel", "reduction"]
  } ins(%a, %b : tensor<4x16384xf16>, tensor<6656x16384xf16>)
  outs(%accumulator_init : tensor<4x6656xf32>)  {
  ^bb0(%in: f16, %in_0: f16, %out: f32):
    %0 = arith.extf %in : f16 to f32
    %1 = arith.extf %in_0 : f16 to f32
    %2 = arith.mulf %0, %1 : f32
    %3 = arith.addf %out, %2 : f32
    linalg.yield %3 : f32
  } -> tensor<4x6656xf32>
  return %matmul_result : tensor<4x6656xf32>
}

func.func @dispatch_116(
%a: tensor<4x16384xf16>,
%b: tensor<6656x16384xf16>,
%c: tensor<4x6656xf32>)
-> tensor<4x6656xf16> {
  %cst = arith.constant 1.000000e+00 : f16
  %cst_0 = arith.constant 0.000000e+00 : f32
  %output = tensor.empty() : tensor<4x6656xf16>
  %accumulator = tensor.empty() : tensor<4x6656xf32>
  %accumulator_init = linalg.fill ins(%cst_0 : f32)
  outs(%accumulator : tensor<4x6656xf32>)
  -> tensor<4x6656xf32>

  %matmul_result = linalg.generic {
    indexing_maps = [
    affine_map<(d0, d1, d2) -> (d0, d2)>,
    affine_map<(d0, d1, d2) -> (d1, d2)>,
    affine_map<(d0, d1, d2) -> (d0, d1)> 
    ],
    iterator_types = ["parallel", "parallel", "reduction"]
  } ins(%a, %b : tensor<4x16384xf16>, tensor<6656x16384xf16>) 
  outs(%accumulator_init : tensor<4x6656xf32>)  {
    ^bb0(%in: f16, %in_1: f16, %out: f32): %0 = arith.extf %in : f16 to f32
    %1 = arith.extf %in_1 : f16 to f32
    %2 = arith.mulf %0, %1 : f32
    %3 = arith.addf %out, %2 : f32
    linalg.yield %3 : f32
  } -> tensor<4x6656xf32>

  %result = linalg.generic {
    indexing_maps = [
    affine_map<(d0, d1) -> (d0, d1)>,
    affine_map<(d0, d1) -> (d0, d1)>,  
    affine_map<(d0, d1) -> (d0, d1)>   
    ],
    iterator_types = ["parallel", "parallel"]
  } ins(%matmul_result, %c : tensor<4x6656xf32>, tensor<4x6656xf32>)
  outs(%output : tensor<4x6656xf16>) {
  ^bb0(%in: f32, %in_1: f32, %out: f16):
    %0 = arith.truncf %in : f32 to f16
    %1 = arith.negf %0 : f16
    %2 = math.exp %1 : f16
    %3 = arith.addf %2, %cst : f16
    %4 = arith.divf %cst, %3 : f16  
    %5 = arith.truncf %in_1 : f32 to f16
    %6 = arith.mulf %4, %0 : f16    
    %7 = arith.mulf %6, %5 : f16    
    linalg.yield %7 : f16
  } -> tensor<4x6656xf16>
  return %result : tensor<4x6656xf16>
}
