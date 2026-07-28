import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean

structure HamiltonianPhaseSpacePackage where
  manifold : Type u
  symplecticForm : manifold → manifold → ℝ
  hamiltonianFunction : manifold → ℝ
  smoothStructure : Prop
  nondegenerateForm : Prop
  closedForm : Prop

structure HamiltonianPhaseSpaceEvidence (H : HamiltonianPhaseSpacePackage) where
  smoothStructureClosed : H.smoothStructure
  nondegenerateFormClosed : H.nondegenerateForm
  closedFormClosed : H.closedForm

def HamiltonianPhaseSpaceClosed (H : HamiltonianPhaseSpacePackage) : Prop :=
  H.smoothStructure ∧ H.nondegenerateForm ∧ H.closedForm

theorem hamiltonian_phase_space_closed_from_evidence
    (H : HamiltonianPhaseSpacePackage) (E : HamiltonianPhaseSpaceEvidence H) :
    HamiltonianPhaseSpaceClosed H := by
  exact And.intro E.smoothStructureClosed
    (And.intro E.nondegenerateFormClosed E.closedFormClosed)

end BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean
end HautevilleHouse
