import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean

structure ConvexDomain (n : ℕ) where
  carrier : Set (ℝ^n)
  convex : Prop
  nonempty : Prop

structure ConvexDomainEvidence (D : ConvexDomain n) where
  convexClosed : D.convex
  nonemptyClosed : D.nonempty

def ConvexDomainClosed (D : ConvexDomain n) : Prop :=
  D.convex ∧ D.nonempty

theorem convex_domain_closed_from_evidence (D : ConvexDomain n) (E : ConvexDomainEvidence D) :
    ConvexDomainClosed D := by
  exact And.intro E.convexClosed E.nonemptyClosed

end ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean
end HautevilleHouse