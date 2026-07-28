import BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean.HamiltonianSystem

namespace HautevilleHouse
namespace BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean

structure BifurcationParameterPackage where
  parameterSpace : Type u
  bifurcationPoint : parameterSpace
  equilibriumContinuation : Prop
  linearizationEigenvalues : parameterSpace → List ℂ
  eigenvalueCrossing : Prop

structure BifurcationParameterEvidence (B : BifurcationParameterPackage) where
  equilibriumContinuationClosed : B.equilibriumContinuation
  eigenvalueCrossingClosed : B.eigenvalueCrossing

def BifurcationParameterClosed (B : BifurcationParameterPackage) : Prop :=
  B.equilibriumContinuation ∧ B.eigenvalueCrossing

theorem bifurcation_parameter_closed_from_evidence
    (B : BifurcationParameterPackage) (E : BifurcationParameterEvidence B) :
    BifurcationParameterClosed B := by
  exact And.intro E.equilibriumContinuationClosed E.eigenvalueCrossingClosed

structure CenterManifoldPackage (H : HamiltonianPhaseSpacePackage) (B : BifurcationParameterPackage) where
  centerManifoldDimension : ℕ
  reductionExists : Prop
  normalFormComputed : Prop

structure CenterManifoldEvidence {H : HamiltonianPhaseSpacePackage}
    {B : BifurcationParameterPackage} (C : CenterManifoldPackage H B) where
  reductionExistsClosed : C.reductionExists
  normalFormComputedClosed : C.normalFormComputed

def CenterManifoldClosed {H : HamiltonianPhaseSpacePackage}
    {B : BifurcationParameterPackage} (C : CenterManifoldPackage H B) : Prop :=
  C.reductionExists ∧ C.normalFormComputed

theorem center_manifold_closed_from_evidence
    {H : HamiltonianPhaseSpacePackage} {B : BifurcationParameterPackage}
    (C : CenterManifoldPackage H B) (E : CenterManifoldEvidence C) :
    CenterManifoldClosed C := by
  exact And.intro E.reductionExistsClosed E.normalFormComputedClosed

end BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean
end HautevilleHouse
