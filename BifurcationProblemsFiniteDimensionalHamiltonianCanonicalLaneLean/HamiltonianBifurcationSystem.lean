import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean

structure PhaseSpace where
  point : Type
  dimension : ℕ

structure HamiltonianFunction (V : PhaseSpace) where
  h : V.point → ℝ
  smooth : Prop

structure HamiltonianSystem (V : PhaseSpace) where
  hamiltonian : HamiltonianFunction V
  symplecticStructure : Prop
  parameterSpace : Type
  parameter : parameterSpace
  smoothFlow : Prop

structure EquilibriumPoint {V : PhaseSpace} (H : HamiltonianSystem V) where
  point : V.point
  isCriticalPoint : Prop

structure Linearization {V : PhaseSpace} (H : HamiltonianSystem V) (eq : EquilibriumPoint H) where
  jacobian : Type
  spectrum : Set ℝ
  hasPureImaginaryEigenvalues : Prop

end BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean
end HautevilleHouse