import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean.ConvexFunction

namespace HautevilleHouse
namespace ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean

structure LegendreTransformPackage {C : ConvexSetPackage} (F : ConvexFunctionPackage C) where
  conjugateDomain : Set (C.carrier → ℝ)
  conjugateFunction : conjugateDomain → ℝ
  legendreFormula : ∀ (y : conjugateDomain), conjugateFunction y = sup (fun x : C.carrier => (y x - F.functionOnDomain ⟨x, sorry⟩))

structure LegendreTransformEvidence {C : ConvexSetPackage} {F : ConvexFunctionPackage C} (L : LegendreTransformPackage F) where
  legendreFormulaClosed : L.legendreFormula

def LegendreTransformClosed {C : ConvexSetPackage} {F : ConvexFunctionPackage C} (L : LegendreTransformPackage F) : Prop :=
  L.legendreFormula

theorem legendre_transform_closed_from_evidence {C : ConvexSetPackage} {F : ConvexFunctionPackage C} (L : LegendreTransformPackage F) (E : LegendreTransformEvidence L) : LegendreTransformClosed L :=
  E.legendreFormulaClosed

end ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean
end HautevilleHouse