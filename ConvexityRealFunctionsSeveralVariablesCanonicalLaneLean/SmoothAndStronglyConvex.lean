import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean.ConvexityDefinitions

namespace HautevilleHouse
namespace ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean

structure SmoothConvexFunction where
  obj : ConvexFunctionObject
  gradientLipschitz : ∃ L : ℝ, ∀ x y : obj.domain.carrier,
    ‖gradient obj.f x - gradient obj.f y‖ ≤ L * ‖x - y‖

structure StronglyConvexFunction where
  obj : ConvexFunctionObject
  strongConvexityModulus : μ > 0 ∧ ∀ x y : obj.domain.carrier, ∀ t ∈ Set.Icc (0 : ℝ) 1,
    obj.f (t • x + (1 - t) • y) ≤ t • obj.f x + (1 - t) • obj.f y
    - (μ / 2) * t * (1 - t) * ‖x - y‖²

structure SmoothStronglyConvexEvidence (S : SmoothConvexFunction) (T : StronglyConvexFunction) where
  gradientLipschitzClosed : S.gradientLipschitz
  strongConvexityModulusClosed : T.strongConvexityModulus

def SmoothStronglyConvexClosed (S : SmoothConvexFunction) (T : StronglyConvexFunction) : Prop :=
  S.gradientLipschitz ∧ T.strongConvexityModulus

theorem smooth_strongly_convex_closed_from_evidence (S : SmoothConvexFunction) (T : StronglyConvexFunction) (E : SmoothStronglyConvexEvidence S T) : SmoothStronglyConvexClosed S T := by
  exact And.intro E.gradientLipschitzClosed E.strongConvexityModulusClosed

end ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean
end HautevilleHouse