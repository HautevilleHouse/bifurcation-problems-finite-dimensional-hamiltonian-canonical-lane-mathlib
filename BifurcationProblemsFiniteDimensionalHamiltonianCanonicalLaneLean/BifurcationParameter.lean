import BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean.HamiltonianSystem

namespace HautevilleHouse
namespace BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean

structure BifurcationParameter (H : HamiltonianSystem) where
  parameterSpace : Type u
  family : parameterSpace → H.hamiltonianFunction
  bifurcationValue : parameterSpace
  equilibriumPoint : H.phaseSpace
  linearizationAtEquilibrium : Type v
  imaginaryEigenvalues : Prop
  nonresonanceCondition : Prop
  familySmooth : Prop
  imaginaryEigenvaluesClosed : imaginaryEigenvalues
  nonresonanceConditionClosed : nonresonanceCondition
  familySmoothClosed : familySmooth

structure BifurcationParameterEvidence {H : HamiltonianSystem} (P : BifurcationParameter H) where
  imaginaryEigenvaluesClosed : P.imaginaryEigenvalues
  nonresonanceConditionClosed : P.nonresonanceCondition
  familySmoothClosed : P.familySmooth

def BifurcationParameterClosed {H : HamiltonianSystem} (P : BifurcationParameter H) : Prop :=
  P.imaginaryEigenvalues ∧ P.nonresonanceCondition ∧ P.familySmooth

theorem bifurcation_parameter_closed_from_evidence {H : HamiltonianSystem} (P : BifurcationParameter H) (E : BifurcationParameterEvidence P) : BifurcationParameterClosed P := by
  exact And.intro E.imaginaryEigenvaluesClosed (And.intro E.nonresonanceConditionClosed E.familySmoothClosed)

end BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean
end HautevilleHouse