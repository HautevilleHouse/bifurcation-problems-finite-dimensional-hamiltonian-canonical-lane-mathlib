import BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean.BifurcationParameter

namespace HautevilleHouse
namespace BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean

structure NormalForm {H : HamiltonianSystem} {P : BifurcationParameter H} where
  transformation : Type u
  normalFormHamiltonian : Type v
  resonanceTerms : List Type
  transformationSymplectic : Prop
  normalFormSmooth : Prop
  resonanceClassification : Prop
  transformationSymplecticClosed : transformationSymplectic
  normalFormSmoothClosed : normalFormSmooth
  resonanceClassificationClosed : resonanceClassification

structure NormalFormEvidence {H : HamiltonianSystem} {P : BifurcationParameter H} (N : NormalForm P) where
  transformationSymplecticClosed : N.transformationSymplectic
  normalFormSmoothClosed : N.normalFormSmooth
  resonanceClassificationClosed : N.resonanceClassification

def NormalFormClosed {H : HamiltonianSystem} {P : BifurcationParameter H} (N : NormalForm P) : Prop :=
  N.transformationSymplectic ∧ N.normalFormSmooth ∧ N.resonanceClassification

theorem normal_form_closed_from_evidence {H : HamiltonianSystem} {P : BifurcationParameter H} (N : NormalForm P) (E : NormalFormEvidence N) : NormalFormClosed N := by
  exact And.intro E.transformationSymplecticClosed (And.intro E.normalFormSmoothClosed E.resonanceClassificationClosed)

end BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean
end HautevilleHouse