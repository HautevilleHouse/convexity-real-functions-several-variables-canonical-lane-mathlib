import ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore

namespace HautevilleHouse
namespace ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure ConvexSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure ConvexAdmittedObject where
  space : ConvexSpace
  convexDomain : Prop
  convexFunction : Prop
  severalVariables : Prop
  closureModel : Type
  closureTopology : TopologicalSpace closureModel
  convexEnvelopeModel : Prop
  conclusion : convexEnvelopeModel

structure ConvexEndgameState where
  object : ConvexAdmittedObject

def ConvexWitnessClosed (O : ConvexAdmittedObject) : Prop :=
  O.convexEnvelopeModel

end ConvexityRealFunctionsSeveralVariablesCanonicalLaneLean
end HautevilleHouse