import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean.ConvexityDefinitions

namespace HautevilleHouse
namespace ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean

structure ConvexConjugatePackage where
  primalObject : ConvexFunctionObject
  dualObject : ConvexFunctionObject
  conjugateRelation : ∀ x ∈ primalObject.domain.carrier,
    dualObject.f x = sup (fun y => (inner product x y - primalObject.f y))
  fenchelYoungInequality : Prop
  biconjugateTheorem : Prop

structure ConvexConjugateEvidence (P : ConvexConjugatePackage) where
  conjugateRelationClosed : P.conjugateRelation
  fenchelYoungInequalityClosed : P.fenchelYoungInequality
  biconjugateTheoremClosed : P.biconjugateTheorem

def ConvexConjugateClosed (P : ConvexConjugatePackage) : Prop :=
  P.fenchelYoungInequality ∧ P.biconjugateTheorem

theorem conjugate_closed_from_evidence (P : ConvexConjugatePackage) (E : ConvexConjugateEvidence P) : ConvexConjugateClosed P := by
  exact And.intro E.fenchelYoungInequalityClosed E.biconjugateTheoremClosed

end ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean
end HautevilleHouse