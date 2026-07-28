import BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean.BifurcationAnalysis

namespace HautevilleHouse
namespace BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean

structure HopfBifurcationPackage {H : HamiltonianPhaseSpacePackage}
    {B : BifurcationParameterPackage} (C : CenterManifoldPackage H B) where
  eigenvaluePairCrossesImaginaryAxis : Prop
  periodicOrbitEmergence : Prop
  stabilityChange : Prop

structure HopfBifurcationEvidence {H : HamiltonianPhaseSpacePackage}
    {B : BifurcationParameterPackage} {C : CenterManifoldPackage H B}
    (P : HopfBifurcationPackage C) where
  eigenvaluePairCrossesImaginaryAxisClosed : P.eigenvaluePairCrossesImaginaryAxis
  periodicOrbitEmergenceClosed : P.periodicOrbitEmergence
  stabilityChangeClosed : P.stabilityChange

def HopfBifurcationClosed {H : HamiltonianPhaseSpacePackage}
    {B : BifurcationParameterPackage} {C : CenterManifoldPackage H B}
    (P : HopfBifurcationPackage C) : Prop :=
  P.eigenvaluePairCrossesImaginaryAxis ∧ P.periodicOrbitEmergence ∧ P.stabilityChange

theorem hopf_bifurcation_closed_from_evidence
    {H : HamiltonianPhaseSpacePackage} {B : BifurcationParameterPackage}
    {C : CenterManifoldPackage H B} (P : HopfBifurcationPackage C)
    (E : HopfBifurcationEvidence P) : HopfBifurcationClosed P := by
  exact And.intro E.eigenvaluePairCrossesImaginaryAxisClosed
    (And.intro E.periodicOrbitEmergenceClosed E.stabilityChangeClosed)

end BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean
end HautevilleHouse
