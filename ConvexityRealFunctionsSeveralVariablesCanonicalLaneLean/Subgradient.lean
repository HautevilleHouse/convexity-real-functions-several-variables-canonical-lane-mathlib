import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean

structure Subgradient (n : ℕ) (D : ConvexDomain n) (F : ConvexFunction n D) where
  x : ℝ^n
  g : ℝ^n
  subgradCondition : ∀ y : ℝ^n, y ∈ D.carrier → F.f y ≥ F.f x + g • (y - x)

structure SubgradientEvidence (n : ℕ) (D : ConvexDomain n) (F : ConvexFunction n D) (S : Subgradient n D F) where
  subgradConditionClosed : S.subgradCondition

def SubgradientClosed (n : ℕ) (D : ConvexDomain n) (F : ConvexFunction n D) (S : Subgradient n D F) : Prop :=
  S.subgradCondition

theorem subgradient_closed_from_evidence (n : ℕ) (D : ConvexDomain n) (F : ConvexFunction n D) (S : Subgradient n D F) (E : SubgradientEvidence n D F S) :
    SubgradientClosed n D F S := by
  exact E.subgradConditionClosed

end ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean
end HautevilleHouse