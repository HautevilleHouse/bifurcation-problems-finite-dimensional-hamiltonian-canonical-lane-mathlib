import BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean.HamiltonianPhaseSpace

namespace HautevilleHouse
namespace BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean

structure NormalFormPackage {P : SymplecticStructurePackage} where
  normalFormExpansion : Prop
  resonanceCondition : Prop
  stabilityMargin : Prop

structure NormalFormEvidence {P : SymplecticStructurePackage}
    (N : NormalFormPackage P) where
  normalFormExpansionClosed : N.normalFormExpansion
  resonanceConditionClosed : N.resonanceCondition
  stabilityMarginClosed : N.stabilityMargin

def NormalFormClosed {P : SymplecticStructurePackage}
    (N : NormalFormPackage P) : Prop :=
  N.normalFormExpansion ∧ N.resonanceCondition ∧ N.stabilityMargin

theorem normal_form_closed_from_evidence
    {P : SymplecticStructurePackage} (N : NormalFormPackage P)
    (E : NormalFormEvidence N) : NormalFormClosed N := by
  exact And.intro E.normalFormExpansionClosed
    (And.intro E.resonanceConditionClosed E.stabilityMarginClosed)

end BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean
end HautevilleHouse