import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean.ConvexSet

namespace HautevilleHouse
namespace ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean

structure SeparatingHyperplanePackage (C : ConvexSetPackage) where
  disjointConvexSets : Set C.carrier × Set C.carrier
  hyperplaneExists : Prop
  separatingInequality : ∀ (x ∈ disjointConvexSets.1) (y ∈ disjointConvexSets.2), ∃ (a : C.carrier → ℝ) (b : ℝ), a x ≤ b ∧ a y ≥ b

structure SeparatingHyperplaneEvidence {C : ConvexSetPackage} (H : SeparatingHyperplanePackage C) where
  hyperplaneExistsClosed : H.hyperplaneExists
  separatingInequalityClosed : H.separatingInequality

def SeparatingHyperplaneClosed {C : ConvexSetPackage} (H : SeparatingHyperplanePackage C) : Prop :=
  H.hyperplaneExists ∧ H.separatingInequality

theorem separating_hyperplane_closed_from_evidence {C : ConvexSetPackage} (H : SeparatingHyperplanePackage C) (E : SeparatingHyperplaneEvidence H) : SeparatingHyperplaneClosed H :=
  And.intro E.hyperplaneExistsClosed E.separatingInequalityClosed

end ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean
end HautevilleHouse