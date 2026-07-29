import ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean

structure ConvexSublevelSetPackage (A : AdmissibleClass) where
  sublevelSet : Set A.object.space.carrier
  convexityOfSublevel : Prop
  closureOfSublevel : Prop
  sublevelContainsMinimum : Prop

structure ConvexSublevelSetEvidence {A : AdmissibleClass}
    (P : ConvexSublevelSetPackage A) where
  convexityOfSublevelClosed : P.convexityOfSublevel
  closureOfSublevelClosed : P.closureOfSublevel
  sublevelContainsMinimumClosed : P.sublevelContainsMinimum

def ConvexSublevelSetClosed {A : AdmissibleClass} (P : ConvexSublevelSetPackage A) : Prop :=
  P.convexityOfSublevel ∧ P.closureOfSublevel ∧ P.sublevelContainsMinimum

theorem convex_sublevel_set_closed_from_evidence {A : AdmissibleClass}
    (P : ConvexSublevelSetPackage A) (E : ConvexSublevelSetEvidence P) :
    ConvexSublevelSetClosed P := by
  exact And.intro E.convexityOfSublevelClosed
    (And.intro E.closureOfSublevelClosed E.sublevelContainsMinimumClosed)

end ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean
end HautevilleHouse