import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean

structure EuclideanDomain where
  carrier : Type
  norm : carrier -> ℝ
  dimension : ℕ
  locallyConvex : Prop
  innerProductDefined : Prop

structure ConvexFunctionObject where
  domain : EuclideanDomain
  f : domain.carrier -> ℝ
  convexCondition : ∀ x y ∈ domain.carrier, ∀ t ∈ Set.Icc (0 : ℝ) 1,
    f (t • x + (1 - t) • y) ≤ t • f x + (1 - t) • f y
  isConvex : convexCondition

structure ConvexFunctionAdmittedObject where
  obj : ConvexFunctionObject
  constraintSatisfied : Prop
  remainder : Prop
  bridgeWitness : constraintSatisfied ∨ remainder

def ConvexFunctionWitnessClosed (O : ConvexFunctionAdmittedObject) : Prop :=
  O.constraintSatisfied ∧ O.obj.isConvex

end ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean
end HautevilleHouse