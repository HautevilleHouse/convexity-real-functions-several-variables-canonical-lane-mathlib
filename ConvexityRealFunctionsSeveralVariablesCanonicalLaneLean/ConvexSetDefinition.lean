import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean

structure ConvexSetPackage where
  space : Type u
  topology : TopologicalSpace space
  vectorSpace : TopologicalVectorSpace ℝ space
  set : Set space
  convexCondition : Prop
  containsLineSegments : Prop

structure ConvexSetEvidence (C : ConvexSetPackage) where
  convexConditionClosed : C.convexCondition
  containsLineSegmentsClosed : C.containsLineSegments

def ConvexSetClosed (C : ConvexSetPackage) : Prop :=
  C.convexCondition ∧ C.containsLineSegments

theorem convex_set_closed_from_evidence (C : ConvexSetPackage)
    (E : ConvexSetEvidence C) : ConvexSetClosed C := by
  exact And.intro E.convexConditionClosed E.containsLineSegmentsClosed

end ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean
end HautevilleHouse