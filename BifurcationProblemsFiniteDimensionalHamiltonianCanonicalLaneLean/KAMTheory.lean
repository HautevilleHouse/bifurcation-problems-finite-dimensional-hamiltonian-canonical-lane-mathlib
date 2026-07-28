import BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean.MoserNormalForm

namespace HautevilleHouse
namespace BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean

structure KAMPackage {M : SymplecticManifold}
    {H : HamiltonianBifurcationPackage} {L : LyapunovSchmidtReductionPackage H}
    {N : MoserNormalFormPackage L} where
  diophantineCondition : Prop
  nondegeneracyCondition : Prop
  invariantTorusPersistence : Prop
  smallDivisorBounds : Prop

structure KAMEvidence {M : SymplecticManifold}
    {H : HamiltonianBifurcationPackage} {L : LyapunovSchmidtReductionPackage H}
    {N : MoserNormalFormPackage L} (K : KAMPackage N) where
  diophantineConditionClosed : K.diophantineCondition
  nondegeneracyConditionClosed : K.nondegeneracyCondition
  invariantTorusPersistenceClosed : K.invariantTorusPersistence
  smallDivisorBoundsClosed : K.smallDivisorBounds

def KAMClosed {M : SymplecticManifold}
    {H : HamiltonianBifurcationPackage} {L : LyapunovSchmidtReductionPackage H}
    {N : MoserNormalFormPackage L} (K : KAMPackage N) : Prop :=
  K.diophantineCondition ∧ K.nondegeneracyCondition ∧
  K.invariantTorusPersistence ∧ K.smallDivisorBounds

theorem kam_closed_from_evidence {M : SymplecticManifold}
    {H : HamiltonianBifurcationPackage} {L : LyapunovSchmidtReductionPackage H}
    {N : MoserNormalFormPackage L} (K : KAMPackage N) (E : KAMEvidence K) :
    KAMClosed K := by
  exact And.intro E.diophantineConditionClosed
    (And.intro E.nondegeneracyConditionClosed
      (And.intro E.invariantTorusPersistenceClosed E.smallDivisorBoundsClosed))

end BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean
end HautevilleHouse