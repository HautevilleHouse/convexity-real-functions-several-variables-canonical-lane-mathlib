import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean

structure ConvexFunctionPackage where
  domain : Set ℝⁿ
  codomain : ℝ
  function : domain → ℝ
  epigraphConvex : Prop
  jensenInequality : Prop

structure ConvexFunctionEvidence (F : ConvexFunctionPackage) where
  epigraphConvexClosed : F.epigraphConvex
  jensenInequalityClosed : F.jensenInequality

def ConvexFunctionClosed (F : ConvexFunctionPackage) : Prop :=
  F.epigraphConvex ∧ F.jensenInequality

theorem convex_function_closed_from_evidence (F : ConvexFunctionPackage)
    (E : ConvexFunctionEvidence F) : ConvexFunctionClosed F := by
  exact And.intro E.epigraphConvexClosed E.jensenInequalityClosed

end ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean
end HautevilleHouse