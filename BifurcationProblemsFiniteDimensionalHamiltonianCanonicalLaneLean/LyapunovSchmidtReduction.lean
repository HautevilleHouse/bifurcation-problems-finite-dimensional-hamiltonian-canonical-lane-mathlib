import BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean.HamiltonianStructure

namespace HautevilleHouse
namespace BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean

structure LyapunovSchmidtReductionPackage {M : SymplecticManifold}
    (H : HamiltonianBifurcationPackage) where
  splitting : Type
  bifurcationEquation : Prop
  reducedEquation : Prop
  persistence : Prop

structure LyapunovSchmidtEvidence {M : SymplecticManifold}
    {H : HamiltonianBifurcationPackage} (L : LyapunovSchmidtReductionPackage H) where
  splittingClosed : L.splitting
  bifurcationEquationClosed : L.bifurcationEquation
  reducedEquationClosed : L.reducedEquation
  persistenceClosed : L.persistence

def LyapunovSchmidtClosed {M : SymplecticManifold}
    {H : HamiltonianBifurcationPackage} (L : LyapunovSchmidtReductionPackage H) : Prop :=
  L.splitting ∧ L.bifurcationEquation ∧ L.reducedEquation ∧ L.persistence

theorem lyapunov_schmidt_closed_from_evidence {M : SymplecticManifold}
    {H : HamiltonianBifurcationPackage} (L : LyapunovSchmidtReductionPackage H)
    (E : LyapunovSchmidtEvidence L) : LyapunovSchmidtClosed L := by
  exact And.intro E.splittingClosed
    (And.intro E.bifurcationEquationClosed
      (And.intro E.reducedEquationClosed E.persistenceClosed))

end BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean
end HautevilleHouse