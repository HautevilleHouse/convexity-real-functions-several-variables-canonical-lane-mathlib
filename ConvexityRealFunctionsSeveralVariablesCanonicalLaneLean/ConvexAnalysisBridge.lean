import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean.ConvexityFundamentals

namespace HautevilleHouse
namespace ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ConvexityWitnessClosed (A.object : ConvexityAdmittedObject (EuclideanSpace 3))

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean
end HautevilleHouse
