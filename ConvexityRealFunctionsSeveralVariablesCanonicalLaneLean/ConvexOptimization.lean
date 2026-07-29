import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean

structure ConvexOptimization (n : ℕ) (D : ConvexDomain n) (F : ConvexFunction n D) where
  optimumPoint : ℝ^n
  optimumValue : ℝ
  optimalityCondition : F.f optimumPoint = optimumValue
  globalMinimizer : ∀ y : ℝ^n, y ∈ D.carrier → F.f y ≥ optimumValue

structure ConvexOptimizationEvidence (n : ℕ) (D : ConvexDomain n) (F : ConvexFunction n D) (O : ConvexOptimization n D F) where
  optimalityConditionClosed : O.optimalityCondition
  globalMinimizerClosed : O.globalMinimizer

def ConvexOptimizationClosed (n : ℕ) (D : ConvexDomain n) (F : ConvexFunction n D) (O : ConvexOptimization n D F) : Prop :=
  O.optimalityCondition ∧ O.globalMinimizer

theorem convex_optimization_closed_from_evidence (n : ℕ) (D : ConvexDomain n) (F : ConvexFunction n D) (O : ConvexOptimization n D F) (E : ConvexOptimizationEvidence n D F O) :
    ConvexOptimizationClosed n D F O := by
  exact And.intro E.optimalityConditionClosed E.globalMinimizerClosed

end ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean
end HautevilleHouse