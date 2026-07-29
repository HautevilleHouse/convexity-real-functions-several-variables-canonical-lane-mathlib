import ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean.ConvexOptimality

namespace HautevilleHouse
namespace ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean

structure LegendreFenchelPackage {A : AdmissibleClass}
    {P : ConvexSublevelSetPackage A} {O : ConvexOptimalityPackage P} where
  conjugateFunction : Type
  supremumDefined : Prop
  closureOfConjugate : Prop
  biconjugateRecovery : Prop

structure LegendreFenchelEvidence {A : AdmissibleClass}
    {P : ConvexSublevelSetPackage A} {O : ConvexOptimalityPackage P}
    (L : LegendreFenchelPackage O) where
  supremumDefinedClosed : L.supremumDefined
  closureOfConjugateClosed : L.closureOfConjugate
  biconjugateRecoveryClosed : L.biconjugateRecovery

def LegendreFenchelClosed {A : AdmissibleClass}
    {P : ConvexSublevelSetPackage A} {O : ConvexOptimalityPackage P}
    (L : LegendreFenchelPackage O) : Prop :=
  L.supremumDefined ∧ L.closureOfConjugate ∧ L.biconjugateRecovery

theorem legendre_fenchel_closed_from_evidence {A : AdmissibleClass}
    {P : ConvexSublevelSetPackage A} {O : ConvexOptimalityPackage P}
    (L : LegendreFenchelPackage O) (E : LegendreFenchelEvidence L) :
    LegendreFenchelClosed L := by
  exact And.intro E.supremumDefinedClosed
    (And.intro E.closureOfConjugateClosed E.biconjugateRecoveryClosed)

end ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean
end HautevilleHouse