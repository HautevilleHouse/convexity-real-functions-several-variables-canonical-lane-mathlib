import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean

structure MinimizationPackage where
  objective : ConvexFunctionPackage
  feasibleSet : ConvexSetPackage
  existenceMinimizer : Prop
  uniquenessMinimizer : Prop
  optimalityCondition : Prop

structure MinimizationEvidence (M : MinimizationPackage) where
  existenceMinimizerClosed : M.existenceMinimizer
  uniquenessMinimizerClosed : M.uniquenessMinimizer
  optimalityConditionClosed : M.optimalityCondition

def MinimizationClosed (M : MinimizationPackage) : Prop :=
  M.existenceMinimizer ∧ M.uniquenessMinimizer ∧ M.optimalityCondition

theorem minimization_closed_from_evidence (M : MinimizationPackage)
    (E : MinimizationEvidence M) : MinimizationClosed M := by
  exact And.intro E.existenceMinimizerClosed
    (And.intro E.uniquenessMinimizerClosed E.optimalityConditionClosed)

end ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean
end HautevilleHouse