import BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean

structure SymplecticManifold where
  carrier : Type
  symplecticForm : Type
  closedNondegenerate : Prop
  dimensionEven : Prop

structure HamiltonianVectorField (M : SymplecticManifold) where
  hamiltonian : Type
  flow : Type
  preservesSymplecticForm : Prop

structure BifurcationPoint (M : SymplecticManifold) where
  parameter : Type
  equilibrium : M.carrier
  linearization : Type
  eigenvalues : List Type
  resonanceCondition : Prop

structure HamiltonianBifurcationPackage where
  manifold : SymplecticManifold
  vectorField : HamiltonianVectorField manifold
  bifurcationPoint : BifurcationPoint manifold
  normalForm : Type
  reduction : Type

end BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean
end HautevilleHouse