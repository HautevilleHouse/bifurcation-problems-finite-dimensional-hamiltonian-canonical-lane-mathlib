import BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean.NormalForm

namespace HautevilleHouse
namespace BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean

structure ReductionMethods {H : HamiltonianSystem} {P : BifurcationParameter H} {N : NormalForm P} where
  centerManifoldExists : Prop
  lyapunovSchmidtExists : Prop
  centerManifoldSmooth : Prop
  lyapunovSchmidtBifurcationEquation : Prop
  reductionCompatible : Prop
  centerManifoldExistsClosed : centerManifoldExists
  lyapunovSchmidtExistsClosed : lyapunovSchmidtExists
  centerManifoldSmoothClosed : centerManifoldSmooth
  lyapunovSchmidtBifurcationEquationClosed : lyapunovSchmidtBifurcationEquation
  reductionCompatibleClosed : reductionCompatible

structure ReductionMethodsEvidence {H : HamiltonianSystem} {P : BifurcationParameter H} {N : NormalForm P} (R : ReductionMethods N) where
  centerManifoldExistsClosed : R.centerManifoldExists
  lyapunovSchmidtExistsClosed : R.lyapunovSchmidtExists
  centerManifoldSmoothClosed : R.centerManifoldSmooth
  lyapunovSchmidtBifurcationEquationClosed : R.lyapunovSchmidtBifurcationEquation
  reductionCompatibleClosed : R.reductionCompatible

def ReductionMethodsClosed {H : HamiltonianSystem} {P : BifurcationParameter H} {N : NormalForm P} (R : ReductionMethods N) : Prop :=
  R.centerManifoldExists ∧ R.lyapunovSchmidtExists ∧ R.centerManifoldSmooth ∧ R.lyapunovSchmidtBifurcationEquation ∧ R.reductionCompatible

theorem reduction_methods_closed_from_evidence {H : HamiltonianSystem} {P : BifurcationParameter H} {N : NormalForm P} (R : ReductionMethods N) (E : ReductionMethodsEvidence R) : ReductionMethodsClosed R := by
  exact And.intro E.centerManifoldExistsClosed (And.intro E.lyapunovSchmidtExistsClosed (And.intro E.centerManifoldSmoothClosed (And.intro E.lyapunovSchmidtBifurcationEquationClosed E.reductionCompatibleClosed)))

end BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean
end HautevilleHouse