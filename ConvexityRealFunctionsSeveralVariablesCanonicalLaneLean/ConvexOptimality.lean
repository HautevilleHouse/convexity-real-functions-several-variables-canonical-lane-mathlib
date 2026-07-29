import ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean.ConvexSublevelSets

namespace HautevilleHouse
namespace ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean

structure ConvexOptimalityPackage {A : AdmissibleClass}
    (P : ConvexSublevelSetPackage A) where
  uniqueMinimum : Prop
  gradientCondition : Prop
  subgradientCondition : Prop
  dualityGap : Prop

structure ConvexOptimalityEvidence {A : AdmissibleClass}
    {P : ConvexSublevelSetPackage A} (O : ConvexOptimalityPackage P) where
  uniqueMinimumClosed : O.uniqueMinimum
  gradientConditionClosed : O.gradientCondition
  subgradientConditionClosed : O.subgradientCondition
  dualityGapClosed : O.dualityGap

def ConvexOptimalityClosed {A : AdmissibleClass}
    {P : ConvexSublevelSetPackage A} (O : ConvexOptimalityPackage P) : Prop :=
  O.uniqueMinimum ∧ O.gradientCondition ∧ O.subgradientCondition ∧ O.dualityGap

theorem convex_optimality_closed_from_evidence {A : AdmissibleClass}
    {P : ConvexSublevelSetPackage A} (O : ConvexOptimalityPackage P)
    (E : ConvexOptimalityEvidence O) : ConvexOptimalityClosed O := by
  exact And.intro E.uniqueMinimumClosed
    (And.intro E.gradientConditionClosed
      (And.intro E.subgradientConditionClosed E.dualityGapClosed))

end ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean
end HautevilleHouse