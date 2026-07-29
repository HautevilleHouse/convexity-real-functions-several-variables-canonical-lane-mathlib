import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean

structure ConvexitySpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure ConvexityAdmittedObject where
  space : ConvexitySpace
  convexFunction : Type
  domainOpen : Prop
  hessianPositiveSemidefinite : Prop
  conclusion : hessianPositiveSemidefinite

def ConvexityWitnessClosed (O : ConvexityAdmittedObject) : Prop :=
  O.hessianPositiveSemidefinite

end ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean
end HautevilleHouse