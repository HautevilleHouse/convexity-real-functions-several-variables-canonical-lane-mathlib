import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean

structure SeparationPackage where
  C D : ConvexSetPackage
  disjointInterior : Prop
  separatingHyperplane : Prop
  strictSeparation : Prop

structure SeparationEvidence (S : SeparationPackage) where
  disjointInteriorClosed : S.disjointInterior
  separatingHyperplaneClosed : S.separatingHyperplane
  strictSeparationClosed : S.strictSeparation

def SeparationClosed (S : SeparationPackage) : Prop :=
  S.disjointInterior ∧ S.separatingHyperplane ∧ S.strictSeparation

theorem separation_closed_from_evidence (S : SeparationPackage)
    (E : SeparationEvidence S) : SeparationClosed S := by
  exact And.intro E.disjointInteriorClosed
    (And.intro E.separatingHyperplaneClosed E.strictSeparationClosed)

end ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean
end HautevilleHouse