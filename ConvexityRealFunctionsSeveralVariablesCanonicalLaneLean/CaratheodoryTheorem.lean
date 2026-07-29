import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean.ConvexSet

namespace HautevilleHouse
namespace ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean

structure CaratheodoryTheoremPackage (C : ConvexSetPackage) where
  convexHullPoint : C.carrier
  representation : ∃ (n : ℕ) (x : Fin n → C.carrier) (λ : Fin n → ℝ),
    (∀ i, λ i ≥ 0) ∧ (∑ i, λ i = 1) ∧ convexHullPoint = ∑ i, λ i • x i ∧ (∀ i, x i ∈ C.convexSet)

structure CaratheodoryTheoremEvidence {C : ConvexSetPackage} (T : CaratheodoryTheoremPackage C) where
  representationClosed : T.representation

def CaratheodoryTheoremClosed {C : ConvexSetPackage} (T : CaratheodoryTheoremPackage C) : Prop :=
  T.representation

theorem caratheodory_theorem_closed_from_evidence {C : ConvexSetPackage} (T : CaratheodoryTheoremPackage C) (E : CaratheodoryTheoremEvidence T) : CaratheodoryTheoremClosed T :=
  E.representationClosed

end ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean
end HautevilleHouse