import BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean.HamiltonianObjects

namespace HautevilleHouse
namespace BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean

structure SymplecticStructurePackage where
  phaseSpace : HamiltonianPhaseSpace
  symplecticFormNondegenerate : Prop
  closedForm : Prop
  integrableSystem : Prop

structure SymplecticStructureEvidence (P : SymplecticStructurePackage) where
  symplecticFormNondegenerateClosed : P.symplecticFormNondegenerate
  closedFormClosed : P.closedForm
  integrableSystemClosed : P.integrableSystem

def SymplecticStructureClosed (P : SymplecticStructurePackage) : Prop :=
  P.symplecticFormNondegenerate ∧ P.closedForm ∧ P.integrableSystem

theorem symplectic_structure_closed_from_evidence
    (P : SymplecticStructurePackage) (E : SymplecticStructureEvidence P) :
    SymplecticStructureClosed P := by
  exact And.intro E.symplecticFormNondegenerateClosed
    (And.intro E.closedFormClosed E.integrableSystemClosed)

end BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean
end HautevilleHouse