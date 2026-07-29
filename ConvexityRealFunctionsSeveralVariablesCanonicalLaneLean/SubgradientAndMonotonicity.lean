import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean.ConvexityDefinitions

namespace HautevilleHouse
namespace ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean

structure SubgradientStructure where
  object : ConvexFunctionObject
  subgradientSet : object.domain.carrier -> Set (DualSpace object.domain.carrier)
  subgradientCondition : ∀ x : object.domain.carrier, ∀ g ∈ subgradientSet x,
    ∀ y : object.domain.carrier, object.f y ≥ object.f x + g • (y - x)
  maximalMonotone : Prop

structure SubgradientEvidence (S : SubgradientStructure) where
  subgradientConditionClosed : S.subgradientCondition
  maximalMonotoneClosed : S.maximalMonotone

def SubgradientClosed (S : SubgradientStructure) : Prop :=
  S.subgradientCondition ∧ S.maximalMonotone

theorem subgradient_closed_from_evidence (S : SubgradientStructure) (E : SubgradientEvidence S) : SubgradientClosed S := by
  exact And.intro E.subgradientConditionClosed E.maximalMonotoneClosed

end ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean
end HautevilleHouse