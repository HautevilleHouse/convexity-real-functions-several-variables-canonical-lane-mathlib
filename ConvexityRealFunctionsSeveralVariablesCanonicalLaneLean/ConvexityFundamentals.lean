import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean

structure EuclideanSpace (n : ℕ) where
  Point : Type
  vectorSpace : AddCommGroup Point
  innerProduct : InnerProduct ℝ Point
  dimension : Fintype.card (Basis.ofVectorSpace ℝ Point) = n

structure ConvexSet (E : EuclideanSpace n) where
  subset : Set E.Point
  convexCondition : ∀ x y ∈ subset, ∀ t : ℝ, 0 ≤ t ∧ t ≤ 1 → t • x + (1 - t) • y ∈ subset

structure ConvexFunction (E : EuclideanSpace n) where
  domain : ConvexSet E
  f : E.Point → ℝ
  convexInequality : ∀ x y ∈ domain.subset, ∀ t : ℝ, 0 ≤ t ∧ t ≤ 1 →
    f (t • x + (1 - t) • y) ≤ t * f x + (1 - t) * f y

structure ConvexityAdmittedObject (E : EuclideanSpace n) where
  space : E
  convexSet : ConvexSet E
  convexFunction : ConvexFunction E
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def ConvexityWitnessClosed (O : ConvexityAdmittedObject E) : Prop :=
  O.convexFunction.convexInequality

end ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean
end HautevilleHouse
