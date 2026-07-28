import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure BifurcationAdmittedObject where
  system : PhaseSpace → HamiltonianSystem
  equilibrium : EquilibriumPoint
  eigenvalueCrossingDetected : Prop
  conclusion : eigenvalueCrossingDetected

structure BifurcationAdmissibleClass where
  object : BifurcationAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def BifurcationWitnessClosed (O : BifurcationAdmittedObject) : Prop :=
  O.eigenvalueCrossingDetected

end BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean
end HautevilleHouse