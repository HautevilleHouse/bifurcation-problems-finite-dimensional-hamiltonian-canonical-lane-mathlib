import BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean.HamiltonianBifurcationParameter

namespace HautevilleHouse
namespace BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean

structure HamiltonianNormalFormPackage {P : HamiltonianPhaseSpacePackage}
    {hp : HamiltonianPhaseSpaceClosed P} {Eq : HamiltonianEquilibriumPackage hp}
    {B : HamiltonianBifurcationParameterPackage Eq} where
  centerManifoldReduction : Prop
  normalForm : Type u
  resonanceConditions : Prop
  unfolding : Prop

structure HamiltonianNormalFormEvidence {P : HamiltonianPhaseSpacePackage}
    {hp : HamiltonianPhaseSpaceClosed P} {Eq : HamiltonianEquilibriumPackage hp}
    {B : HamiltonianBifurcationParameterPackage Eq}
    (N : HamiltonianNormalFormPackage B) where
  centerManifoldReductionClosed : N.centerManifoldReduction
  normalFormClosed : Prop
  resonanceConditionsClosed : N.resonanceConditions
  unfoldingClosed : N.unfolding

def HamiltonianNormalFormClosed {P : HamiltonianPhaseSpacePackage}
    {hp : HamiltonianPhaseSpaceClosed P} {Eq : HamiltonianEquilibriumPackage hp}
    {B : HamiltonianBifurcationParameterPackage Eq}
    (N : HamiltonianNormalFormPackage B) : Prop :=
  N.centerManifoldReduction ∧ (N.normalForm) ∧ N.resonanceConditions ∧ N.unfolding

theorem hamiltonian_normal_form_closed_from_evidence
    {P : HamiltonianPhaseSpacePackage} {hp : HamiltonianPhaseSpaceClosed P}
    {Eq : HamiltonianEquilibriumPackage hp} {B : HamiltonianBifurcationParameterPackage Eq}
    (N : HamiltonianNormalFormPackage B) (Ev : HamiltonianNormalFormEvidence N) :
    HamiltonianNormalFormClosed N := by
  exact And.intro Ev.centerManifoldReductionClosed
    (And.intro Ev.normalFormClosed
      (And.intro Ev.resonanceConditionsClosed Ev.unfoldingClosed))

end BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean
end HautevilleHouse