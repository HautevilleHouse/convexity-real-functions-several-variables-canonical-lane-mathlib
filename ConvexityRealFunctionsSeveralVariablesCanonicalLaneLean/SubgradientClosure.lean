import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean

structure SubgradientPackage where
  function : ConvexFunctionPackage
  point : function.domain
  subgradient : Set (ℝⁿ → ℝ)
  subgradientInequality : Prop
  nonemptySubgradient : Prop

structure SubgradientEvidence (S : SubgradientPackage) where
  subgradientInequalityClosed : S.subgradientInequality
  nonemptySubgradientClosed : S.nonemptySubgradient

def SubgradientClosed (S : SubgradientPackage) : Prop :=
  S.subgradientInequality ∧ S.nonemptySubgradient

theorem subgradient_closed_from_evidence (S : SubgradientPackage)
    (E : SubgradientEvidence S) : SubgradientClosed S := by
  exact And.intro E.subgradientInequalityClosed E.nonemptySubgradientClosed

end ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean
end HautevilleHouse