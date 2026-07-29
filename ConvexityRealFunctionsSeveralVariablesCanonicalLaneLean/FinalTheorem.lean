import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean.ConvexityDefinitions
import HautevilleHouse.ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean.KarushKuhnTuckerConditions
import HautevilleHouse.ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean.LegendreFenchelDuality
import HautevilleHouse.ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean.SubgradientAndMonotonicity
import HautevilleHouse.ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean.SmoothAndStronglyConvex

namespace HautevilleHouse
namespace ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ConvexFunctionWitnessClosed (A.object)

def gateClosed (A : AdmissibleClass) : Prop :=
  A.remainder ∨ A.constraintSatisfied

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  unfold bridgeClosed
  -- A.object is ConvexFunctionAdmittedObject, so we need to extract proof
  -- Assume A.object.constraintSatisfied and A.object.obj.isConvex are given
  exact And.intro A.object.constraintSatisfied A.object.obj.isConvex

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  unfold gateClosed
  -- gateWitness gives A.constraintSatisfied ∨ A.remainder
  exact A.gateWitness

def ConstrainedConvexityClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem convexity_endgame (A : AdmissibleClass) : ConstrainedConvexityClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean
end HautevilleHouse