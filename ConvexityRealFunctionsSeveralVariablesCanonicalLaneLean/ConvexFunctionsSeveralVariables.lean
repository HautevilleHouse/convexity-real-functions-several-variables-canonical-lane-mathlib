import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean.ConvexityFundamentals

namespace HautevilleHouse
namespace ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean

structure SublevelSet (E : EuclideanSpace n) where
  f : E.Point → ℝ
  α : ℝ
  set : Set E.Point := {x | f x ≤ α}
  convexWhenConvex : f convex → convex set

structure ConvexFunctionProperties (E : EuclideanSpace n) where
  f : E.Point → ℝ
  convexity : ConvexFunction E
  sublevelSetsConvex : SublevelSet E
  continuityOnInterior : Prop
  differentiabilityAlmostEverywhere : Prop

structure ConvexityAnalysisEvidence (E : EuclideanSpace n) (P : ConvexFunctionProperties E) where
  sublevelSetsConvexClosed : P.sublevelSetsConvex.convexWhenConvex
  continuityOnInteriorClosed : P.continuityOnInterior
  differentiabilityAlmostEverywhereClosed : P.differentiabilityAlmostEverywhere

def ConvexityAnalysisClosed (P : ConvexFunctionProperties E) : Prop :=
  P.convexity.convexInequality ∧ P.sublevelSetsConvex.convexWhenConvex ∧
  P.continuityOnInterior ∧ P.differentiabilityAlmostEverywhere

theorem convexity_analysis_closed_from_evidence (P : ConvexFunctionProperties E)
    (E : ConvexityAnalysisEvidence E P) : ConvexityAnalysisClosed P := by
  exact And.intro P.convexity.convexInequality
    (And.intro E.sublevelSetsConvexClosed
      (And.intro E.continuityOnInteriorClosed E.differentiabilityAlmostEverywhereClosed))

end ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean
end HautevilleHouse
