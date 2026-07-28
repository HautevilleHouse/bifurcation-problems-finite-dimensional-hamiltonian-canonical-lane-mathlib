import BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean.HamiltonianPhaseSpace

namespace HautevilleHouse
namespace BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean

structure HamiltonianEquilibriumPackage {P : HamiltonianPhaseSpacePackage}
    (hp : HamiltonianPhaseSpaceClosed P) where
  equilibriumPoint : P.manifold
  linearization : Type u
  hamiltonianMatrix : Type v
  linearStability : Prop
  centerManifold : Prop

structure HamiltonianEquilibriumEvidence {P : HamiltonianPhaseSpacePackage}
    {hp : HamiltonianPhaseSpaceClosed P}
    (E : HamiltonianEquilibriumPackage hp) where
  linearStabilityClosed : E.linearStability
  centerManifoldClosed : E.centerManifold

def HamiltonianEquilibriumClosed {P : HamiltonianPhaseSpacePackage}
    {hp : HamiltonianPhaseSpaceClosed P}
    (E : HamiltonianEquilibriumPackage hp) : Prop :=
  E.linearStability ∧ E.centerManifold

theorem hamiltonian_equilibrium_closed_from_evidence
    {P : HamiltonianPhaseSpacePackage} {hp : HamiltonianPhaseSpaceClosed P}
    (E : HamiltonianEquilibriumPackage hp) (Ev : HamiltonianEquilibriumEvidence E) :
    HamiltonianEquilibriumClosed E := by
  exact And.intro Ev.linearStabilityClosed Ev.centerManifoldClosed

end BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean
end HautevilleHouse