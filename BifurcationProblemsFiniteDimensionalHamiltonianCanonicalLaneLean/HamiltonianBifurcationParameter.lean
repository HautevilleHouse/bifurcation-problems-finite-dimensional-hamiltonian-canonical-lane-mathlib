import BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean.HamiltonianEquilibrium

namespace HautevilleHouse
namespace BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean

structure HamiltonianBifurcationParameterPackage {P : HamiltonianPhaseSpacePackage}
    {hp : HamiltonianPhaseSpaceClosed P}
    (Eq : HamiltonianEquilibriumPackage hp) where
  parameterSpace : Type u
  bifurcationCondition : Prop
  parameterDependence : Prop
  criticalValue : Type v

structure HamiltonianBifurcationParameterEvidence {P : HamiltonianPhaseSpacePackage}
    {hp : HamiltonianPhaseSpaceClosed P} {Eq : HamiltonianEquilibriumPackage hp}
    (B : HamiltonianBifurcationParameterPackage Eq) where
  bifurcationConditionClosed : B.bifurcationCondition
  parameterDependenceClosed : B.parameterDependence

def HamiltonianBifurcationParameterClosed {P : HamiltonianPhaseSpacePackage}
    {hp : HamiltonianPhaseSpaceClosed P} {Eq : HamiltonianEquilibriumPackage hp}
    (B : HamiltonianBifurcationParameterPackage Eq) : Prop :=
  B.bifurcationCondition ∧ B.parameterDependence

theorem hamiltonian_bifurcation_parameter_closed_from_evidence
    {P : HamiltonianPhaseSpacePackage} {hp : HamiltonianPhaseSpaceClosed P}
    {Eq : HamiltonianEquilibriumPackage hp} (B : HamiltonianBifurcationParameterPackage Eq)
    (Ev : HamiltonianBifurcationParameterEvidence B) :
    HamiltonianBifurcationParameterClosed B := by
  exact And.intro Ev.bifurcationConditionClosed Ev.parameterDependenceClosed

end BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean
end HautevilleHouse