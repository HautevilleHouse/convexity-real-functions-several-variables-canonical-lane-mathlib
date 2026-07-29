import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean

structure DualityPackage where
  primal : ConvexSetPackage
  dual : ConvexSetPackage
  pairingDefined : Prop
  fenchelYoungInequality : Prop
  biconjugateRecovery : Prop

structure DualityEvidence (D : DualityPackage) where
  pairingDefinedClosed : D.pairingDefined
  fenchelYoungInequalityClosed : D.fenchelYoungInequality
  biconjugateRecoveryClosed : D.biconjugateRecovery

def DualityClosed (D : DualityPackage) : Prop :=
  D.pairingDefined ∧ D.fenchelYoungInequality ∧ D.biconjugateRecovery

theorem duality_closed_from_evidence (D : DualityPackage)
    (E : DualityEvidence D) : DualityClosed D := by
  exact And.intro E.pairingDefinedClosed
    (And.intro E.fenchelYoungInequalityClosed E.biconjugateRecoveryClosed)

end ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean
end HautevilleHouse