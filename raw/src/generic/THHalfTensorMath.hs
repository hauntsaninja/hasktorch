{-# LANGUAGE ForeignFunctionInterface #-}

module THHalfTensorMath
  ( c_fill
  , c_zero
  , c_maskedFill
  , c_maskedCopy
  , c_maskedSelect
  , c_nonzero
  , c_indexSelect
  , c_indexCopy
  , c_indexAdd
  , c_indexFill
  , c_take
  , c_put
  , c_gather
  , c_scatter
  , c_scatterAdd
  , c_scatterFill
  , c_dot
  , c_minall
  , c_maxall
  , c_medianall
  , c_sumall
  , c_prodall
  , c_add
  , c_sub
  , c_add_scaled
  , c_sub_scaled
  , c_mul
  , c_div
  , c_lshift
  , c_rshift
  , c_fmod
  , c_remainder
  , c_clamp
  , c_bitand
  , c_bitor
  , c_bitxor
  , c_cadd
  , c_csub
  , c_cmul
  , c_cpow
  , c_cdiv
  , c_clshift
  , c_crshift
  , c_cfmod
  , c_cremainder
  , c_cbitand
  , c_cbitor
  , c_cbitxor
  , c_addcmul
  , c_addcdiv
  , c_addmv
  , c_addmm
  , c_addr
  , c_addbmm
  , c_baddbmm
  , c_match
  , c_numel
  , c_max
  , c_min
  , c_kthvalue
  , c_mode
  , c_median
  , c_sum
  , c_prod
  , c_cumsum
  , c_cumprod
  , c_sign
  , c_trace
  , c_cross
  , c_cmax
  , c_cmin
  , c_cmaxValue
  , c_cminValue
  , c_zeros
  , c_zerosLike
  , c_ones
  , c_onesLike
  , c_diag
  , c_eye
  , c_arange
  , c_range
  , c_randperm
  , c_reshape
  , c_sort
  , c_topk
  , c_tril
  , c_triu
  , c_cat
  , c_catArray
  , c_equal
  , c_ltValue
  , c_leValue
  , c_gtValue
  , c_geValue
  , c_neValue
  , c_eqValue
  , c_ltValueT
  , c_leValueT
  , c_gtValueT
  , c_geValueT
  , c_neValueT
  , c_eqValueT
  , c_ltTensor
  , c_leTensor
  , c_gtTensor
  , c_geTensor
  , c_neTensor
  , c_eqTensor
  , c_ltTensorT
  , c_leTensorT
  , c_gtTensorT
  , c_geTensorT
  , c_neTensorT
  , c_eqTensorT
  , p_fill
  , p_zero
  , p_maskedFill
  , p_maskedCopy
  , p_maskedSelect
  , p_nonzero
  , p_indexSelect
  , p_indexCopy
  , p_indexAdd
  , p_indexFill
  , p_take
  , p_put
  , p_gather
  , p_scatter
  , p_scatterAdd
  , p_scatterFill
  , p_dot
  , p_minall
  , p_maxall
  , p_medianall
  , p_sumall
  , p_prodall
  , p_add
  , p_sub
  , p_add_scaled
  , p_sub_scaled
  , p_mul
  , p_div
  , p_lshift
  , p_rshift
  , p_fmod
  , p_remainder
  , p_clamp
  , p_bitand
  , p_bitor
  , p_bitxor
  , p_cadd
  , p_csub
  , p_cmul
  , p_cpow
  , p_cdiv
  , p_clshift
  , p_crshift
  , p_cfmod
  , p_cremainder
  , p_cbitand
  , p_cbitor
  , p_cbitxor
  , p_addcmul
  , p_addcdiv
  , p_addmv
  , p_addmm
  , p_addr
  , p_addbmm
  , p_baddbmm
  , p_match
  , p_numel
  , p_max
  , p_min
  , p_kthvalue
  , p_mode
  , p_median
  , p_sum
  , p_prod
  , p_cumsum
  , p_cumprod
  , p_sign
  , p_trace
  , p_cross
  , p_cmax
  , p_cmin
  , p_cmaxValue
  , p_cminValue
  , p_zeros
  , p_zerosLike
  , p_ones
  , p_onesLike
  , p_diag
  , p_eye
  , p_arange
  , p_range
  , p_randperm
  , p_reshape
  , p_sort
  , p_topk
  , p_tril
  , p_triu
  , p_cat
  , p_catArray
  , p_equal
  , p_ltValue
  , p_leValue
  , p_gtValue
  , p_geValue
  , p_neValue
  , p_eqValue
  , p_ltValueT
  , p_leValueT
  , p_gtValueT
  , p_geValueT
  , p_neValueT
  , p_eqValueT
  , p_ltTensor
  , p_leTensor
  , p_gtTensor
  , p_geTensor
  , p_neTensor
  , p_eqTensor
  , p_ltTensorT
  , p_leTensorT
  , p_gtTensorT
  , p_geTensorT
  , p_neTensorT
  , p_eqTensorT
  ) where

import Foreign
import Foreign.C.Types
import THTypes
import Data.Word
import Data.Int

-- | c_fill : r_ value -> void
foreign import ccall "THTensorMath.h fill"
  c_fill :: Ptr CTHHalfTensor -> THHalf -> IO ()

-- | c_zero : r_ -> void
foreign import ccall "THTensorMath.h zero"
  c_zero :: Ptr CTHHalfTensor -> IO ()

-- | c_maskedFill : tensor mask value -> void
foreign import ccall "THTensorMath.h maskedFill"
  c_maskedFill :: Ptr CTHHalfTensor -> Ptr CTHByteTensor -> THHalf -> IO ()

-- | c_maskedCopy : tensor mask src -> void
foreign import ccall "THTensorMath.h maskedCopy"
  c_maskedCopy :: Ptr CTHHalfTensor -> Ptr CTHByteTensor -> Ptr CTHHalfTensor -> IO ()

-- | c_maskedSelect : tensor src mask -> void
foreign import ccall "THTensorMath.h maskedSelect"
  c_maskedSelect :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> Ptr CTHByteTensor -> IO ()

-- | c_nonzero : subscript tensor -> void
foreign import ccall "THTensorMath.h nonzero"
  c_nonzero :: Ptr CTHLongTensor -> Ptr CTHHalfTensor -> IO ()

-- | c_indexSelect : tensor src dim index -> void
foreign import ccall "THTensorMath.h indexSelect"
  c_indexSelect :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> CInt -> Ptr CTHLongTensor -> IO ()

-- | c_indexCopy : tensor dim index src -> void
foreign import ccall "THTensorMath.h indexCopy"
  c_indexCopy :: Ptr CTHHalfTensor -> CInt -> Ptr CTHLongTensor -> Ptr CTHHalfTensor -> IO ()

-- | c_indexAdd : tensor dim index src -> void
foreign import ccall "THTensorMath.h indexAdd"
  c_indexAdd :: Ptr CTHHalfTensor -> CInt -> Ptr CTHLongTensor -> Ptr CTHHalfTensor -> IO ()

-- | c_indexFill : tensor dim index val -> void
foreign import ccall "THTensorMath.h indexFill"
  c_indexFill :: Ptr CTHHalfTensor -> CInt -> Ptr CTHLongTensor -> THHalf -> IO ()

-- | c_take : tensor src index -> void
foreign import ccall "THTensorMath.h take"
  c_take :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> Ptr CTHLongTensor -> IO ()

-- | c_put : tensor index src accumulate -> void
foreign import ccall "THTensorMath.h put"
  c_put :: Ptr CTHHalfTensor -> Ptr CTHLongTensor -> Ptr CTHHalfTensor -> CInt -> IO ()

-- | c_gather : tensor src dim index -> void
foreign import ccall "THTensorMath.h gather"
  c_gather :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> CInt -> Ptr CTHLongTensor -> IO ()

-- | c_scatter : tensor dim index src -> void
foreign import ccall "THTensorMath.h scatter"
  c_scatter :: Ptr CTHHalfTensor -> CInt -> Ptr CTHLongTensor -> Ptr CTHHalfTensor -> IO ()

-- | c_scatterAdd : tensor dim index src -> void
foreign import ccall "THTensorMath.h scatterAdd"
  c_scatterAdd :: Ptr CTHHalfTensor -> CInt -> Ptr CTHLongTensor -> Ptr CTHHalfTensor -> IO ()

-- | c_scatterFill : tensor dim index val -> void
foreign import ccall "THTensorMath.h scatterFill"
  c_scatterFill :: Ptr CTHHalfTensor -> CInt -> Ptr CTHLongTensor -> THHalf -> IO ()

-- | c_dot : t src -> accreal
foreign import ccall "THTensorMath.h dot"
  c_dot :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> CFloat

-- | c_minall : t -> real
foreign import ccall "THTensorMath.h minall"
  c_minall :: Ptr CTHHalfTensor -> THHalf

-- | c_maxall : t -> real
foreign import ccall "THTensorMath.h maxall"
  c_maxall :: Ptr CTHHalfTensor -> THHalf

-- | c_medianall : t -> real
foreign import ccall "THTensorMath.h medianall"
  c_medianall :: Ptr CTHHalfTensor -> THHalf

-- | c_sumall : t -> accreal
foreign import ccall "THTensorMath.h sumall"
  c_sumall :: Ptr CTHHalfTensor -> CFloat

-- | c_prodall : t -> accreal
foreign import ccall "THTensorMath.h prodall"
  c_prodall :: Ptr CTHHalfTensor -> CFloat

-- | c_add : r_ t value -> void
foreign import ccall "THTensorMath.h add"
  c_add :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> IO ()

-- | c_sub : r_ t value -> void
foreign import ccall "THTensorMath.h sub"
  c_sub :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> IO ()

-- | c_add_scaled : r_ t value alpha -> void
foreign import ccall "THTensorMath.h add_scaled"
  c_add_scaled :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> THHalf -> IO ()

-- | c_sub_scaled : r_ t value alpha -> void
foreign import ccall "THTensorMath.h sub_scaled"
  c_sub_scaled :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> THHalf -> IO ()

-- | c_mul : r_ t value -> void
foreign import ccall "THTensorMath.h mul"
  c_mul :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> IO ()

-- | c_div : r_ t value -> void
foreign import ccall "THTensorMath.h div"
  c_div :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> IO ()

-- | c_lshift : r_ t value -> void
foreign import ccall "THTensorMath.h lshift"
  c_lshift :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> IO ()

-- | c_rshift : r_ t value -> void
foreign import ccall "THTensorMath.h rshift"
  c_rshift :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> IO ()

-- | c_fmod : r_ t value -> void
foreign import ccall "THTensorMath.h fmod"
  c_fmod :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> IO ()

-- | c_remainder : r_ t value -> void
foreign import ccall "THTensorMath.h remainder"
  c_remainder :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> IO ()

-- | c_clamp : r_ t min_value max_value -> void
foreign import ccall "THTensorMath.h clamp"
  c_clamp :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> THHalf -> IO ()

-- | c_bitand : r_ t value -> void
foreign import ccall "THTensorMath.h bitand"
  c_bitand :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> IO ()

-- | c_bitor : r_ t value -> void
foreign import ccall "THTensorMath.h bitor"
  c_bitor :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> IO ()

-- | c_bitxor : r_ t value -> void
foreign import ccall "THTensorMath.h bitxor"
  c_bitxor :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> IO ()

-- | c_cadd : r_ t value src -> void
foreign import ccall "THTensorMath.h cadd"
  c_cadd :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> Ptr CTHHalfTensor -> IO ()

-- | c_csub : self src1 value src2 -> void
foreign import ccall "THTensorMath.h csub"
  c_csub :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> Ptr CTHHalfTensor -> IO ()

-- | c_cmul : r_ t src -> void
foreign import ccall "THTensorMath.h cmul"
  c_cmul :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ()

-- | c_cpow : r_ t src -> void
foreign import ccall "THTensorMath.h cpow"
  c_cpow :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ()

-- | c_cdiv : r_ t src -> void
foreign import ccall "THTensorMath.h cdiv"
  c_cdiv :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ()

-- | c_clshift : r_ t src -> void
foreign import ccall "THTensorMath.h clshift"
  c_clshift :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ()

-- | c_crshift : r_ t src -> void
foreign import ccall "THTensorMath.h crshift"
  c_crshift :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ()

-- | c_cfmod : r_ t src -> void
foreign import ccall "THTensorMath.h cfmod"
  c_cfmod :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ()

-- | c_cremainder : r_ t src -> void
foreign import ccall "THTensorMath.h cremainder"
  c_cremainder :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ()

-- | c_cbitand : r_ t src -> void
foreign import ccall "THTensorMath.h cbitand"
  c_cbitand :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ()

-- | c_cbitor : r_ t src -> void
foreign import ccall "THTensorMath.h cbitor"
  c_cbitor :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ()

-- | c_cbitxor : r_ t src -> void
foreign import ccall "THTensorMath.h cbitxor"
  c_cbitxor :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ()

-- | c_addcmul : r_ t value src1 src2 -> void
foreign import ccall "THTensorMath.h addcmul"
  c_addcmul :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ()

-- | c_addcdiv : r_ t value src1 src2 -> void
foreign import ccall "THTensorMath.h addcdiv"
  c_addcdiv :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ()

-- | c_addmv : r_ beta t alpha mat vec -> void
foreign import ccall "THTensorMath.h addmv"
  c_addmv :: Ptr CTHHalfTensor -> THHalf -> Ptr CTHHalfTensor -> THHalf -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ()

-- | c_addmm : r_ beta t alpha mat1 mat2 -> void
foreign import ccall "THTensorMath.h addmm"
  c_addmm :: Ptr CTHHalfTensor -> THHalf -> Ptr CTHHalfTensor -> THHalf -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ()

-- | c_addr : r_ beta t alpha vec1 vec2 -> void
foreign import ccall "THTensorMath.h addr"
  c_addr :: Ptr CTHHalfTensor -> THHalf -> Ptr CTHHalfTensor -> THHalf -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ()

-- | c_addbmm : r_ beta t alpha batch1 batch2 -> void
foreign import ccall "THTensorMath.h addbmm"
  c_addbmm :: Ptr CTHHalfTensor -> THHalf -> Ptr CTHHalfTensor -> THHalf -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ()

-- | c_baddbmm : r_ beta t alpha batch1 batch2 -> void
foreign import ccall "THTensorMath.h baddbmm"
  c_baddbmm :: Ptr CTHHalfTensor -> THHalf -> Ptr CTHHalfTensor -> THHalf -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ()

-- | c_match : r_ m1 m2 gain -> void
foreign import ccall "THTensorMath.h match"
  c_match :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> IO ()

-- | c_numel : t -> ptrdiff_t
foreign import ccall "THTensorMath.h numel"
  c_numel :: Ptr CTHHalfTensor -> CPtrdiff

-- | c_max : values_ indices_ t dimension keepdim -> void
foreign import ccall "THTensorMath.h max"
  c_max :: Ptr CTHHalfTensor -> Ptr CTHLongTensor -> Ptr CTHHalfTensor -> CInt -> CInt -> IO ()

-- | c_min : values_ indices_ t dimension keepdim -> void
foreign import ccall "THTensorMath.h min"
  c_min :: Ptr CTHHalfTensor -> Ptr CTHLongTensor -> Ptr CTHHalfTensor -> CInt -> CInt -> IO ()

-- | c_kthvalue : values_ indices_ t k dimension keepdim -> void
foreign import ccall "THTensorMath.h kthvalue"
  c_kthvalue :: Ptr CTHHalfTensor -> Ptr CTHLongTensor -> Ptr CTHHalfTensor -> CLLong -> CInt -> CInt -> IO ()

-- | c_mode : values_ indices_ t dimension keepdim -> void
foreign import ccall "THTensorMath.h mode"
  c_mode :: Ptr CTHHalfTensor -> Ptr CTHLongTensor -> Ptr CTHHalfTensor -> CInt -> CInt -> IO ()

-- | c_median : values_ indices_ t dimension keepdim -> void
foreign import ccall "THTensorMath.h median"
  c_median :: Ptr CTHHalfTensor -> Ptr CTHLongTensor -> Ptr CTHHalfTensor -> CInt -> CInt -> IO ()

-- | c_sum : r_ t dimension keepdim -> void
foreign import ccall "THTensorMath.h sum"
  c_sum :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> CInt -> CInt -> IO ()

-- | c_prod : r_ t dimension keepdim -> void
foreign import ccall "THTensorMath.h prod"
  c_prod :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> CInt -> CInt -> IO ()

-- | c_cumsum : r_ t dimension -> void
foreign import ccall "THTensorMath.h cumsum"
  c_cumsum :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> CInt -> IO ()

-- | c_cumprod : r_ t dimension -> void
foreign import ccall "THTensorMath.h cumprod"
  c_cumprod :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> CInt -> IO ()

-- | c_sign : r_ t -> void
foreign import ccall "THTensorMath.h sign"
  c_sign :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ()

-- | c_trace : t -> accreal
foreign import ccall "THTensorMath.h trace"
  c_trace :: Ptr CTHHalfTensor -> CFloat

-- | c_cross : r_ a b dimension -> void
foreign import ccall "THTensorMath.h cross"
  c_cross :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> CInt -> IO ()

-- | c_cmax : r t src -> void
foreign import ccall "THTensorMath.h cmax"
  c_cmax :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ()

-- | c_cmin : r t src -> void
foreign import ccall "THTensorMath.h cmin"
  c_cmin :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ()

-- | c_cmaxValue : r t value -> void
foreign import ccall "THTensorMath.h cmaxValue"
  c_cmaxValue :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> IO ()

-- | c_cminValue : r t value -> void
foreign import ccall "THTensorMath.h cminValue"
  c_cminValue :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> IO ()

-- | c_zeros : r_ size -> void
foreign import ccall "THTensorMath.h zeros"
  c_zeros :: Ptr CTHHalfTensor -> Ptr CTHLongStorage -> IO ()

-- | c_zerosLike : r_ input -> void
foreign import ccall "THTensorMath.h zerosLike"
  c_zerosLike :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ()

-- | c_ones : r_ size -> void
foreign import ccall "THTensorMath.h ones"
  c_ones :: Ptr CTHHalfTensor -> Ptr CTHLongStorage -> IO ()

-- | c_onesLike : r_ input -> void
foreign import ccall "THTensorMath.h onesLike"
  c_onesLike :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ()

-- | c_diag : r_ t k -> void
foreign import ccall "THTensorMath.h diag"
  c_diag :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> CInt -> IO ()

-- | c_eye : r_ n m -> void
foreign import ccall "THTensorMath.h eye"
  c_eye :: Ptr CTHHalfTensor -> CLLong -> CLLong -> IO ()

-- | c_arange : r_ xmin xmax step -> void
foreign import ccall "THTensorMath.h arange"
  c_arange :: Ptr CTHHalfTensor -> CFloat -> CFloat -> CFloat -> IO ()

-- | c_range : r_ xmin xmax step -> void
foreign import ccall "THTensorMath.h range"
  c_range :: Ptr CTHHalfTensor -> CFloat -> CFloat -> CFloat -> IO ()

-- | c_randperm : r_ _generator n -> void
foreign import ccall "THTensorMath.h randperm"
  c_randperm :: Ptr CTHHalfTensor -> Ptr CTHGenerator -> CLLong -> IO ()

-- | c_reshape : r_ t size -> void
foreign import ccall "THTensorMath.h reshape"
  c_reshape :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> Ptr CTHLongStorage -> IO ()

-- | c_sort : rt_ ri_ t dimension descendingOrder -> void
foreign import ccall "THTensorMath.h sort"
  c_sort :: Ptr CTHHalfTensor -> Ptr CTHLongTensor -> Ptr CTHHalfTensor -> CInt -> CInt -> IO ()

-- | c_topk : rt_ ri_ t k dim dir sorted -> void
foreign import ccall "THTensorMath.h topk"
  c_topk :: Ptr CTHHalfTensor -> Ptr CTHLongTensor -> Ptr CTHHalfTensor -> CLLong -> CInt -> CInt -> CInt -> IO ()

-- | c_tril : r_ t k -> void
foreign import ccall "THTensorMath.h tril"
  c_tril :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> CLLong -> IO ()

-- | c_triu : r_ t k -> void
foreign import ccall "THTensorMath.h triu"
  c_triu :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> CLLong -> IO ()

-- | c_cat : r_ ta tb dimension -> void
foreign import ccall "THTensorMath.h cat"
  c_cat :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> CInt -> IO ()

-- | c_catArray : result inputs numInputs dimension -> void
foreign import ccall "THTensorMath.h catArray"
  c_catArray :: Ptr CTHHalfTensor -> Ptr (Ptr CTHHalfTensor) -> CInt -> CInt -> IO ()

-- | c_equal : ta tb -> int
foreign import ccall "THTensorMath.h equal"
  c_equal :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> CInt

-- | c_ltValue : r_ t value -> void
foreign import ccall "THTensorMath.h ltValue"
  c_ltValue :: Ptr CTHByteTensor -> Ptr CTHHalfTensor -> THHalf -> IO ()

-- | c_leValue : r_ t value -> void
foreign import ccall "THTensorMath.h leValue"
  c_leValue :: Ptr CTHByteTensor -> Ptr CTHHalfTensor -> THHalf -> IO ()

-- | c_gtValue : r_ t value -> void
foreign import ccall "THTensorMath.h gtValue"
  c_gtValue :: Ptr CTHByteTensor -> Ptr CTHHalfTensor -> THHalf -> IO ()

-- | c_geValue : r_ t value -> void
foreign import ccall "THTensorMath.h geValue"
  c_geValue :: Ptr CTHByteTensor -> Ptr CTHHalfTensor -> THHalf -> IO ()

-- | c_neValue : r_ t value -> void
foreign import ccall "THTensorMath.h neValue"
  c_neValue :: Ptr CTHByteTensor -> Ptr CTHHalfTensor -> THHalf -> IO ()

-- | c_eqValue : r_ t value -> void
foreign import ccall "THTensorMath.h eqValue"
  c_eqValue :: Ptr CTHByteTensor -> Ptr CTHHalfTensor -> THHalf -> IO ()

-- | c_ltValueT : r_ t value -> void
foreign import ccall "THTensorMath.h ltValueT"
  c_ltValueT :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> IO ()

-- | c_leValueT : r_ t value -> void
foreign import ccall "THTensorMath.h leValueT"
  c_leValueT :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> IO ()

-- | c_gtValueT : r_ t value -> void
foreign import ccall "THTensorMath.h gtValueT"
  c_gtValueT :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> IO ()

-- | c_geValueT : r_ t value -> void
foreign import ccall "THTensorMath.h geValueT"
  c_geValueT :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> IO ()

-- | c_neValueT : r_ t value -> void
foreign import ccall "THTensorMath.h neValueT"
  c_neValueT :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> IO ()

-- | c_eqValueT : r_ t value -> void
foreign import ccall "THTensorMath.h eqValueT"
  c_eqValueT :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> IO ()

-- | c_ltTensor : r_ ta tb -> void
foreign import ccall "THTensorMath.h ltTensor"
  c_ltTensor :: Ptr CTHByteTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ()

-- | c_leTensor : r_ ta tb -> void
foreign import ccall "THTensorMath.h leTensor"
  c_leTensor :: Ptr CTHByteTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ()

-- | c_gtTensor : r_ ta tb -> void
foreign import ccall "THTensorMath.h gtTensor"
  c_gtTensor :: Ptr CTHByteTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ()

-- | c_geTensor : r_ ta tb -> void
foreign import ccall "THTensorMath.h geTensor"
  c_geTensor :: Ptr CTHByteTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ()

-- | c_neTensor : r_ ta tb -> void
foreign import ccall "THTensorMath.h neTensor"
  c_neTensor :: Ptr CTHByteTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ()

-- | c_eqTensor : r_ ta tb -> void
foreign import ccall "THTensorMath.h eqTensor"
  c_eqTensor :: Ptr CTHByteTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ()

-- | c_ltTensorT : r_ ta tb -> void
foreign import ccall "THTensorMath.h ltTensorT"
  c_ltTensorT :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ()

-- | c_leTensorT : r_ ta tb -> void
foreign import ccall "THTensorMath.h leTensorT"
  c_leTensorT :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ()

-- | c_gtTensorT : r_ ta tb -> void
foreign import ccall "THTensorMath.h gtTensorT"
  c_gtTensorT :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ()

-- | c_geTensorT : r_ ta tb -> void
foreign import ccall "THTensorMath.h geTensorT"
  c_geTensorT :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ()

-- | c_neTensorT : r_ ta tb -> void
foreign import ccall "THTensorMath.h neTensorT"
  c_neTensorT :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ()

-- | c_eqTensorT : r_ ta tb -> void
foreign import ccall "THTensorMath.h eqTensorT"
  c_eqTensorT :: Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ()

-- |p_fill : Pointer to function : r_ value -> void
foreign import ccall "THTensorMath.h &fill"
  p_fill :: FunPtr (Ptr CTHHalfTensor -> THHalf -> IO ())

-- |p_zero : Pointer to function : r_ -> void
foreign import ccall "THTensorMath.h &zero"
  p_zero :: FunPtr (Ptr CTHHalfTensor -> IO ())

-- |p_maskedFill : Pointer to function : tensor mask value -> void
foreign import ccall "THTensorMath.h &maskedFill"
  p_maskedFill :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHByteTensor -> THHalf -> IO ())

-- |p_maskedCopy : Pointer to function : tensor mask src -> void
foreign import ccall "THTensorMath.h &maskedCopy"
  p_maskedCopy :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHByteTensor -> Ptr CTHHalfTensor -> IO ())

-- |p_maskedSelect : Pointer to function : tensor src mask -> void
foreign import ccall "THTensorMath.h &maskedSelect"
  p_maskedSelect :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> Ptr CTHByteTensor -> IO ())

-- |p_nonzero : Pointer to function : subscript tensor -> void
foreign import ccall "THTensorMath.h &nonzero"
  p_nonzero :: FunPtr (Ptr CTHLongTensor -> Ptr CTHHalfTensor -> IO ())

-- |p_indexSelect : Pointer to function : tensor src dim index -> void
foreign import ccall "THTensorMath.h &indexSelect"
  p_indexSelect :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> CInt -> Ptr CTHLongTensor -> IO ())

-- |p_indexCopy : Pointer to function : tensor dim index src -> void
foreign import ccall "THTensorMath.h &indexCopy"
  p_indexCopy :: FunPtr (Ptr CTHHalfTensor -> CInt -> Ptr CTHLongTensor -> Ptr CTHHalfTensor -> IO ())

-- |p_indexAdd : Pointer to function : tensor dim index src -> void
foreign import ccall "THTensorMath.h &indexAdd"
  p_indexAdd :: FunPtr (Ptr CTHHalfTensor -> CInt -> Ptr CTHLongTensor -> Ptr CTHHalfTensor -> IO ())

-- |p_indexFill : Pointer to function : tensor dim index val -> void
foreign import ccall "THTensorMath.h &indexFill"
  p_indexFill :: FunPtr (Ptr CTHHalfTensor -> CInt -> Ptr CTHLongTensor -> THHalf -> IO ())

-- |p_take : Pointer to function : tensor src index -> void
foreign import ccall "THTensorMath.h &take"
  p_take :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> Ptr CTHLongTensor -> IO ())

-- |p_put : Pointer to function : tensor index src accumulate -> void
foreign import ccall "THTensorMath.h &put"
  p_put :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHLongTensor -> Ptr CTHHalfTensor -> CInt -> IO ())

-- |p_gather : Pointer to function : tensor src dim index -> void
foreign import ccall "THTensorMath.h &gather"
  p_gather :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> CInt -> Ptr CTHLongTensor -> IO ())

-- |p_scatter : Pointer to function : tensor dim index src -> void
foreign import ccall "THTensorMath.h &scatter"
  p_scatter :: FunPtr (Ptr CTHHalfTensor -> CInt -> Ptr CTHLongTensor -> Ptr CTHHalfTensor -> IO ())

-- |p_scatterAdd : Pointer to function : tensor dim index src -> void
foreign import ccall "THTensorMath.h &scatterAdd"
  p_scatterAdd :: FunPtr (Ptr CTHHalfTensor -> CInt -> Ptr CTHLongTensor -> Ptr CTHHalfTensor -> IO ())

-- |p_scatterFill : Pointer to function : tensor dim index val -> void
foreign import ccall "THTensorMath.h &scatterFill"
  p_scatterFill :: FunPtr (Ptr CTHHalfTensor -> CInt -> Ptr CTHLongTensor -> THHalf -> IO ())

-- |p_dot : Pointer to function : t src -> accreal
foreign import ccall "THTensorMath.h &dot"
  p_dot :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> CFloat)

-- |p_minall : Pointer to function : t -> real
foreign import ccall "THTensorMath.h &minall"
  p_minall :: FunPtr (Ptr CTHHalfTensor -> THHalf)

-- |p_maxall : Pointer to function : t -> real
foreign import ccall "THTensorMath.h &maxall"
  p_maxall :: FunPtr (Ptr CTHHalfTensor -> THHalf)

-- |p_medianall : Pointer to function : t -> real
foreign import ccall "THTensorMath.h &medianall"
  p_medianall :: FunPtr (Ptr CTHHalfTensor -> THHalf)

-- |p_sumall : Pointer to function : t -> accreal
foreign import ccall "THTensorMath.h &sumall"
  p_sumall :: FunPtr (Ptr CTHHalfTensor -> CFloat)

-- |p_prodall : Pointer to function : t -> accreal
foreign import ccall "THTensorMath.h &prodall"
  p_prodall :: FunPtr (Ptr CTHHalfTensor -> CFloat)

-- |p_add : Pointer to function : r_ t value -> void
foreign import ccall "THTensorMath.h &add"
  p_add :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> IO ())

-- |p_sub : Pointer to function : r_ t value -> void
foreign import ccall "THTensorMath.h &sub"
  p_sub :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> IO ())

-- |p_add_scaled : Pointer to function : r_ t value alpha -> void
foreign import ccall "THTensorMath.h &add_scaled"
  p_add_scaled :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> THHalf -> IO ())

-- |p_sub_scaled : Pointer to function : r_ t value alpha -> void
foreign import ccall "THTensorMath.h &sub_scaled"
  p_sub_scaled :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> THHalf -> IO ())

-- |p_mul : Pointer to function : r_ t value -> void
foreign import ccall "THTensorMath.h &mul"
  p_mul :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> IO ())

-- |p_div : Pointer to function : r_ t value -> void
foreign import ccall "THTensorMath.h &div"
  p_div :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> IO ())

-- |p_lshift : Pointer to function : r_ t value -> void
foreign import ccall "THTensorMath.h &lshift"
  p_lshift :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> IO ())

-- |p_rshift : Pointer to function : r_ t value -> void
foreign import ccall "THTensorMath.h &rshift"
  p_rshift :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> IO ())

-- |p_fmod : Pointer to function : r_ t value -> void
foreign import ccall "THTensorMath.h &fmod"
  p_fmod :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> IO ())

-- |p_remainder : Pointer to function : r_ t value -> void
foreign import ccall "THTensorMath.h &remainder"
  p_remainder :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> IO ())

-- |p_clamp : Pointer to function : r_ t min_value max_value -> void
foreign import ccall "THTensorMath.h &clamp"
  p_clamp :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> THHalf -> IO ())

-- |p_bitand : Pointer to function : r_ t value -> void
foreign import ccall "THTensorMath.h &bitand"
  p_bitand :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> IO ())

-- |p_bitor : Pointer to function : r_ t value -> void
foreign import ccall "THTensorMath.h &bitor"
  p_bitor :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> IO ())

-- |p_bitxor : Pointer to function : r_ t value -> void
foreign import ccall "THTensorMath.h &bitxor"
  p_bitxor :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> IO ())

-- |p_cadd : Pointer to function : r_ t value src -> void
foreign import ccall "THTensorMath.h &cadd"
  p_cadd :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> Ptr CTHHalfTensor -> IO ())

-- |p_csub : Pointer to function : self src1 value src2 -> void
foreign import ccall "THTensorMath.h &csub"
  p_csub :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> Ptr CTHHalfTensor -> IO ())

-- |p_cmul : Pointer to function : r_ t src -> void
foreign import ccall "THTensorMath.h &cmul"
  p_cmul :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ())

-- |p_cpow : Pointer to function : r_ t src -> void
foreign import ccall "THTensorMath.h &cpow"
  p_cpow :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ())

-- |p_cdiv : Pointer to function : r_ t src -> void
foreign import ccall "THTensorMath.h &cdiv"
  p_cdiv :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ())

-- |p_clshift : Pointer to function : r_ t src -> void
foreign import ccall "THTensorMath.h &clshift"
  p_clshift :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ())

-- |p_crshift : Pointer to function : r_ t src -> void
foreign import ccall "THTensorMath.h &crshift"
  p_crshift :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ())

-- |p_cfmod : Pointer to function : r_ t src -> void
foreign import ccall "THTensorMath.h &cfmod"
  p_cfmod :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ())

-- |p_cremainder : Pointer to function : r_ t src -> void
foreign import ccall "THTensorMath.h &cremainder"
  p_cremainder :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ())

-- |p_cbitand : Pointer to function : r_ t src -> void
foreign import ccall "THTensorMath.h &cbitand"
  p_cbitand :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ())

-- |p_cbitor : Pointer to function : r_ t src -> void
foreign import ccall "THTensorMath.h &cbitor"
  p_cbitor :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ())

-- |p_cbitxor : Pointer to function : r_ t src -> void
foreign import ccall "THTensorMath.h &cbitxor"
  p_cbitxor :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ())

-- |p_addcmul : Pointer to function : r_ t value src1 src2 -> void
foreign import ccall "THTensorMath.h &addcmul"
  p_addcmul :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ())

-- |p_addcdiv : Pointer to function : r_ t value src1 src2 -> void
foreign import ccall "THTensorMath.h &addcdiv"
  p_addcdiv :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ())

-- |p_addmv : Pointer to function : r_ beta t alpha mat vec -> void
foreign import ccall "THTensorMath.h &addmv"
  p_addmv :: FunPtr (Ptr CTHHalfTensor -> THHalf -> Ptr CTHHalfTensor -> THHalf -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ())

-- |p_addmm : Pointer to function : r_ beta t alpha mat1 mat2 -> void
foreign import ccall "THTensorMath.h &addmm"
  p_addmm :: FunPtr (Ptr CTHHalfTensor -> THHalf -> Ptr CTHHalfTensor -> THHalf -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ())

-- |p_addr : Pointer to function : r_ beta t alpha vec1 vec2 -> void
foreign import ccall "THTensorMath.h &addr"
  p_addr :: FunPtr (Ptr CTHHalfTensor -> THHalf -> Ptr CTHHalfTensor -> THHalf -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ())

-- |p_addbmm : Pointer to function : r_ beta t alpha batch1 batch2 -> void
foreign import ccall "THTensorMath.h &addbmm"
  p_addbmm :: FunPtr (Ptr CTHHalfTensor -> THHalf -> Ptr CTHHalfTensor -> THHalf -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ())

-- |p_baddbmm : Pointer to function : r_ beta t alpha batch1 batch2 -> void
foreign import ccall "THTensorMath.h &baddbmm"
  p_baddbmm :: FunPtr (Ptr CTHHalfTensor -> THHalf -> Ptr CTHHalfTensor -> THHalf -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ())

-- |p_match : Pointer to function : r_ m1 m2 gain -> void
foreign import ccall "THTensorMath.h &match"
  p_match :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> IO ())

-- |p_numel : Pointer to function : t -> ptrdiff_t
foreign import ccall "THTensorMath.h &numel"
  p_numel :: FunPtr (Ptr CTHHalfTensor -> CPtrdiff)

-- |p_max : Pointer to function : values_ indices_ t dimension keepdim -> void
foreign import ccall "THTensorMath.h &max"
  p_max :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHLongTensor -> Ptr CTHHalfTensor -> CInt -> CInt -> IO ())

-- |p_min : Pointer to function : values_ indices_ t dimension keepdim -> void
foreign import ccall "THTensorMath.h &min"
  p_min :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHLongTensor -> Ptr CTHHalfTensor -> CInt -> CInt -> IO ())

-- |p_kthvalue : Pointer to function : values_ indices_ t k dimension keepdim -> void
foreign import ccall "THTensorMath.h &kthvalue"
  p_kthvalue :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHLongTensor -> Ptr CTHHalfTensor -> CLLong -> CInt -> CInt -> IO ())

-- |p_mode : Pointer to function : values_ indices_ t dimension keepdim -> void
foreign import ccall "THTensorMath.h &mode"
  p_mode :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHLongTensor -> Ptr CTHHalfTensor -> CInt -> CInt -> IO ())

-- |p_median : Pointer to function : values_ indices_ t dimension keepdim -> void
foreign import ccall "THTensorMath.h &median"
  p_median :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHLongTensor -> Ptr CTHHalfTensor -> CInt -> CInt -> IO ())

-- |p_sum : Pointer to function : r_ t dimension keepdim -> void
foreign import ccall "THTensorMath.h &sum"
  p_sum :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> CInt -> CInt -> IO ())

-- |p_prod : Pointer to function : r_ t dimension keepdim -> void
foreign import ccall "THTensorMath.h &prod"
  p_prod :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> CInt -> CInt -> IO ())

-- |p_cumsum : Pointer to function : r_ t dimension -> void
foreign import ccall "THTensorMath.h &cumsum"
  p_cumsum :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> CInt -> IO ())

-- |p_cumprod : Pointer to function : r_ t dimension -> void
foreign import ccall "THTensorMath.h &cumprod"
  p_cumprod :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> CInt -> IO ())

-- |p_sign : Pointer to function : r_ t -> void
foreign import ccall "THTensorMath.h &sign"
  p_sign :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ())

-- |p_trace : Pointer to function : t -> accreal
foreign import ccall "THTensorMath.h &trace"
  p_trace :: FunPtr (Ptr CTHHalfTensor -> CFloat)

-- |p_cross : Pointer to function : r_ a b dimension -> void
foreign import ccall "THTensorMath.h &cross"
  p_cross :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> CInt -> IO ())

-- |p_cmax : Pointer to function : r t src -> void
foreign import ccall "THTensorMath.h &cmax"
  p_cmax :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ())

-- |p_cmin : Pointer to function : r t src -> void
foreign import ccall "THTensorMath.h &cmin"
  p_cmin :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ())

-- |p_cmaxValue : Pointer to function : r t value -> void
foreign import ccall "THTensorMath.h &cmaxValue"
  p_cmaxValue :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> IO ())

-- |p_cminValue : Pointer to function : r t value -> void
foreign import ccall "THTensorMath.h &cminValue"
  p_cminValue :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> IO ())

-- |p_zeros : Pointer to function : r_ size -> void
foreign import ccall "THTensorMath.h &zeros"
  p_zeros :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHLongStorage -> IO ())

-- |p_zerosLike : Pointer to function : r_ input -> void
foreign import ccall "THTensorMath.h &zerosLike"
  p_zerosLike :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ())

-- |p_ones : Pointer to function : r_ size -> void
foreign import ccall "THTensorMath.h &ones"
  p_ones :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHLongStorage -> IO ())

-- |p_onesLike : Pointer to function : r_ input -> void
foreign import ccall "THTensorMath.h &onesLike"
  p_onesLike :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ())

-- |p_diag : Pointer to function : r_ t k -> void
foreign import ccall "THTensorMath.h &diag"
  p_diag :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> CInt -> IO ())

-- |p_eye : Pointer to function : r_ n m -> void
foreign import ccall "THTensorMath.h &eye"
  p_eye :: FunPtr (Ptr CTHHalfTensor -> CLLong -> CLLong -> IO ())

-- |p_arange : Pointer to function : r_ xmin xmax step -> void
foreign import ccall "THTensorMath.h &arange"
  p_arange :: FunPtr (Ptr CTHHalfTensor -> CFloat -> CFloat -> CFloat -> IO ())

-- |p_range : Pointer to function : r_ xmin xmax step -> void
foreign import ccall "THTensorMath.h &range"
  p_range :: FunPtr (Ptr CTHHalfTensor -> CFloat -> CFloat -> CFloat -> IO ())

-- |p_randperm : Pointer to function : r_ _generator n -> void
foreign import ccall "THTensorMath.h &randperm"
  p_randperm :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHGenerator -> CLLong -> IO ())

-- |p_reshape : Pointer to function : r_ t size -> void
foreign import ccall "THTensorMath.h &reshape"
  p_reshape :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> Ptr CTHLongStorage -> IO ())

-- |p_sort : Pointer to function : rt_ ri_ t dimension descendingOrder -> void
foreign import ccall "THTensorMath.h &sort"
  p_sort :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHLongTensor -> Ptr CTHHalfTensor -> CInt -> CInt -> IO ())

-- |p_topk : Pointer to function : rt_ ri_ t k dim dir sorted -> void
foreign import ccall "THTensorMath.h &topk"
  p_topk :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHLongTensor -> Ptr CTHHalfTensor -> CLLong -> CInt -> CInt -> CInt -> IO ())

-- |p_tril : Pointer to function : r_ t k -> void
foreign import ccall "THTensorMath.h &tril"
  p_tril :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> CLLong -> IO ())

-- |p_triu : Pointer to function : r_ t k -> void
foreign import ccall "THTensorMath.h &triu"
  p_triu :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> CLLong -> IO ())

-- |p_cat : Pointer to function : r_ ta tb dimension -> void
foreign import ccall "THTensorMath.h &cat"
  p_cat :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> CInt -> IO ())

-- |p_catArray : Pointer to function : result inputs numInputs dimension -> void
foreign import ccall "THTensorMath.h &catArray"
  p_catArray :: FunPtr (Ptr CTHHalfTensor -> Ptr (Ptr CTHHalfTensor) -> CInt -> CInt -> IO ())

-- |p_equal : Pointer to function : ta tb -> int
foreign import ccall "THTensorMath.h &equal"
  p_equal :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> CInt)

-- |p_ltValue : Pointer to function : r_ t value -> void
foreign import ccall "THTensorMath.h &ltValue"
  p_ltValue :: FunPtr (Ptr CTHByteTensor -> Ptr CTHHalfTensor -> THHalf -> IO ())

-- |p_leValue : Pointer to function : r_ t value -> void
foreign import ccall "THTensorMath.h &leValue"
  p_leValue :: FunPtr (Ptr CTHByteTensor -> Ptr CTHHalfTensor -> THHalf -> IO ())

-- |p_gtValue : Pointer to function : r_ t value -> void
foreign import ccall "THTensorMath.h &gtValue"
  p_gtValue :: FunPtr (Ptr CTHByteTensor -> Ptr CTHHalfTensor -> THHalf -> IO ())

-- |p_geValue : Pointer to function : r_ t value -> void
foreign import ccall "THTensorMath.h &geValue"
  p_geValue :: FunPtr (Ptr CTHByteTensor -> Ptr CTHHalfTensor -> THHalf -> IO ())

-- |p_neValue : Pointer to function : r_ t value -> void
foreign import ccall "THTensorMath.h &neValue"
  p_neValue :: FunPtr (Ptr CTHByteTensor -> Ptr CTHHalfTensor -> THHalf -> IO ())

-- |p_eqValue : Pointer to function : r_ t value -> void
foreign import ccall "THTensorMath.h &eqValue"
  p_eqValue :: FunPtr (Ptr CTHByteTensor -> Ptr CTHHalfTensor -> THHalf -> IO ())

-- |p_ltValueT : Pointer to function : r_ t value -> void
foreign import ccall "THTensorMath.h &ltValueT"
  p_ltValueT :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> IO ())

-- |p_leValueT : Pointer to function : r_ t value -> void
foreign import ccall "THTensorMath.h &leValueT"
  p_leValueT :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> IO ())

-- |p_gtValueT : Pointer to function : r_ t value -> void
foreign import ccall "THTensorMath.h &gtValueT"
  p_gtValueT :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> IO ())

-- |p_geValueT : Pointer to function : r_ t value -> void
foreign import ccall "THTensorMath.h &geValueT"
  p_geValueT :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> IO ())

-- |p_neValueT : Pointer to function : r_ t value -> void
foreign import ccall "THTensorMath.h &neValueT"
  p_neValueT :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> IO ())

-- |p_eqValueT : Pointer to function : r_ t value -> void
foreign import ccall "THTensorMath.h &eqValueT"
  p_eqValueT :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> THHalf -> IO ())

-- |p_ltTensor : Pointer to function : r_ ta tb -> void
foreign import ccall "THTensorMath.h &ltTensor"
  p_ltTensor :: FunPtr (Ptr CTHByteTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ())

-- |p_leTensor : Pointer to function : r_ ta tb -> void
foreign import ccall "THTensorMath.h &leTensor"
  p_leTensor :: FunPtr (Ptr CTHByteTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ())

-- |p_gtTensor : Pointer to function : r_ ta tb -> void
foreign import ccall "THTensorMath.h &gtTensor"
  p_gtTensor :: FunPtr (Ptr CTHByteTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ())

-- |p_geTensor : Pointer to function : r_ ta tb -> void
foreign import ccall "THTensorMath.h &geTensor"
  p_geTensor :: FunPtr (Ptr CTHByteTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ())

-- |p_neTensor : Pointer to function : r_ ta tb -> void
foreign import ccall "THTensorMath.h &neTensor"
  p_neTensor :: FunPtr (Ptr CTHByteTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ())

-- |p_eqTensor : Pointer to function : r_ ta tb -> void
foreign import ccall "THTensorMath.h &eqTensor"
  p_eqTensor :: FunPtr (Ptr CTHByteTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ())

-- |p_ltTensorT : Pointer to function : r_ ta tb -> void
foreign import ccall "THTensorMath.h &ltTensorT"
  p_ltTensorT :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ())

-- |p_leTensorT : Pointer to function : r_ ta tb -> void
foreign import ccall "THTensorMath.h &leTensorT"
  p_leTensorT :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ())

-- |p_gtTensorT : Pointer to function : r_ ta tb -> void
foreign import ccall "THTensorMath.h &gtTensorT"
  p_gtTensorT :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ())

-- |p_geTensorT : Pointer to function : r_ ta tb -> void
foreign import ccall "THTensorMath.h &geTensorT"
  p_geTensorT :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ())

-- |p_neTensorT : Pointer to function : r_ ta tb -> void
foreign import ccall "THTensorMath.h &neTensorT"
  p_neTensorT :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ())

-- |p_eqTensorT : Pointer to function : r_ ta tb -> void
foreign import ccall "THTensorMath.h &eqTensorT"
  p_eqTensorT :: FunPtr (Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> Ptr CTHHalfTensor -> IO ())