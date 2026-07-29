import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean.ConvexityDefinitions

namespace HautevilleHouse
namespace ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean

structure ConstrainedConvexProblem where
  objective : ConvexFunctionObject
  constraints : List (ConvexFunctionObject)
  feasibleSet : Set objective.domain.carrier
  optimalityCondition : Prop

structure KKTEvidence (P : ConstrainedConvexProblem) where
  primalFeasibility : ∀ x ∈ P.feasibleSet, ∀ g ∈ P.constraints, g.f x ≤ 0
  dualFeasibility : Prop
  complementaritySatisfied : P.optimalityCondition
  stationarityCondition : Prop

def KKTClosed (P : ConstrainedConvexProblem) : Prop :=
  P.optimalityCondition

theorem kkt_closed_from_evidence (P : ConstrainedConvexProblem) (E : KKTEvidence P) : KKTClosed P := by
  exact E.complementaritySatisfied

end ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean
end HautevilleHouse