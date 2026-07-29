import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean.ConvexSet

namespace HautevilleHouse
namespace ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ConvexSetClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  A.object.conclusion

end ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean
end HautevilleHouse