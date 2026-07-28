import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure HamiltonianPhaseSpace where
  carrier : Type
  symplecticForm : Type
  dimension : ℕ

structure HamiltonianAdmittedObject where
  phaseSpace : HamiltonianPhaseSpace
  hamiltonianFunction : Type
  equilibriumPoint : Prop
  stabilityProperty : Prop
  bifurcationParameter : Type
  conclusion : stabilityProperty ∧ equilibriumPoint

structure HamiltonianEndgameState where
  object : HamiltonianAdmittedObject

def HamiltonianWitnessClosed (O : HamiltonianAdmittedObject) : Prop :=
  O.stabilityProperty ∧ O.equilibriumPoint

end BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean
end HautevilleHouse