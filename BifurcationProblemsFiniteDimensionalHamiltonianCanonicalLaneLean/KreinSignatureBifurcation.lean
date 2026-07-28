import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean.HamiltonianBifurcationSystem

namespace HautevilleHouse
namespace BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean

inductive KreinType where
  | real : ℝ → KreinType
  | complex : ℂ → KreinType
  | purelyImaginary : ℝ → KreinType

structure KreinSignature {V : PhaseSpace} {H : HamiltonianSystem V} {eq : EquilibriumPoint H}
    (L : Linearization H eq) where
  eigenvalueClassification : List KreinType
  collisionDetected : Prop
  eigenvalueCrossingAtParameter : Prop

structure KreinBifurcationEvidence {V : PhaseSpace} {H : HamiltonianSystem V} {eq : EquilibriumPoint H}
    {L : Linearization H eq} (K : KreinSignature L) where
  collisionDetectedClosed : K.collisionDetected
  eigenvalueCrossingAtParameterClosed : K.eigenvalueCrossingAtParameter

def KreinBifurcationClosed {V : PhaseSpace} {H : HamiltonianSystem V} {eq : EquilibriumPoint H}
    {L : Linearization H eq} (K : KreinSignature L) : Prop :=
  K.collisionDetected ∧ K.eigenvalueCrossingAtParameter

theorem krein_bifurcation_closed_from_evidence {V : PhaseSpace} {H : HamiltonianSystem V} {eq : EquilibriumPoint H}
    {L : Linearization H eq} (K : KreinSignature L) (E : KreinBifurcationEvidence K) : KreinBifurcationClosed K := by
  exact And.intro E.collisionDetectedClosed E.eigenvalueCrossingAtParameterClosed

end BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean
end HautevilleHouse