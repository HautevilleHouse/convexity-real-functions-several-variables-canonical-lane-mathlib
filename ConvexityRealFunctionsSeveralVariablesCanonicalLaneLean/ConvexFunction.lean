import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean

structure ConvexFunction (n : ℕ) (D : ConvexDomain n) where
  f : ℝ^n → ℝ
  convexOnD : ConvexOn ℝ D.carrier f
  continuousOnD : ContinuousOn f D.carrier

structure ConvexFunctionEvidence (n : ℕ) (D : ConvexDomain n) (F : ConvexFunction n D) where
  convexOnDClosed : F.convexOnD
  continuousOnDClosed : F.continuousOnD

def ConvexFunctionClosed (n : ℕ) (D : ConvexDomain n) (F : ConvexFunction n D) : Prop :=
  F.convexOnD ∧ F.continuousOnD

theorem convex_function_closed_from_evidence (n : ℕ) (D : ConvexDomain n) (F : ConvexFunction n D) (E : ConvexFunctionEvidence n D F) :
    ConvexFunctionClosed n D F := by
  exact And.intro E.convexOnDClosed E.continuousOnDClosed

end ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean
end HautevilleHouse