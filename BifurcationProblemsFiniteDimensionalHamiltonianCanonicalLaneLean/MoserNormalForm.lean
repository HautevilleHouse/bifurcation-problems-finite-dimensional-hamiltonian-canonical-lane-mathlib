import BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean.LyapunovSchmidtReduction

namespace HautevilleHouse
namespace BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean

structure MoserNormalFormPackage {M : SymplecticManifold}
    {H : HamiltonianBifurcationPackage} (L : LyapunovSchmidtReductionPackage H) where
  normalFormTransform : Type
  symplecticTransformation : Prop
  normalFormEquation : Prop
  transversality : Prop

structure MoserNormalFormEvidence {M : SymplecticManifold}
    {H : HamiltonianBifurcationPackage} {L : LyapunovSchmidtReductionPackage H}
    (N : MoserNormalFormPackage L) where
  normalFormTransformClosed : N.normalFormTransform
  symplecticTransformationClosed : N.symplecticTransformation
  normalFormEquationClosed : N.normalFormEquation
  transversalityClosed : N.transversality

def MoserNormalFormClosed {M : SymplecticManifold}
    {H : HamiltonianBifurcationPackage} {L : LyapunovSchmidtReductionPackage H}
    (N : MoserNormalFormPackage L) : Prop :=
  N.normalFormTransform ∧ N.symplecticTransformation ∧
  N.normalFormEquation ∧ N.transversality

theorem moser_normal_form_closed_from_evidence {M : SymplecticManifold}
    {H : HamiltonianBifurcationPackage} {L : LyapunovSchmidtReductionPackage H}
    (N : MoserNormalFormPackage L) (E : MoserNormalFormEvidence N) :
    MoserNormalFormClosed N := by
  exact And.intro E.normalFormTransformClosed
    (And.intro E.symplecticTransformationClosed
      (And.intro E.normalFormEquationClosed E.transversalityClosed))

end BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean
end HautevilleHouse