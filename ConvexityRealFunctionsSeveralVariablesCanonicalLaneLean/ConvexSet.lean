import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean

structure ConvexSetPackage where
  carrier : Type u
  vectorSpaceStructure : AddCommGroup carrier
  moduleStructure : Module ℝ carrier
  convexSet : Set carrier
  convexProperty : ∀ (x y : convexSet) (t : ℝ), 0 ≤ t → t ≤ 1 → t • x + (1 - t) • y ∈ convexSet

structure ConvexSetEvidence (C : ConvexSetPackage) where
  convexPropertyClosed : C.convexProperty

def ConvexSetClosed (C : ConvexSetPackage) : Prop :=
  C.convexProperty

theorem convex_set_closed_from_evidence (C : ConvexSetPackage) (E : ConvexSetEvidence C) : ConvexSetClosed C :=
  E.convexPropertyClosed

end ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean
end HautevilleHouse