import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean.KreinSignatureBifurcation

namespace HautevilleHouse
namespace BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean

def bridgeClosed (A : BifurcationAdmissibleClass) : Prop :=
  BifurcationWitnessClosed A.object

theorem bridge_from_admissible_class (A : BifurcationAdmissibleClass) : bridgeClosed A := by
  exact A.object.conclusion

def gateClosed (A : BifurcationAdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : BifurcationAdmissibleClass) : gateClosed A := by
  exact A.gateWitness

def ConstrainedBifurcationClosure (A : BifurcationAdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_bifurcation_endgame (A : BifurcationAdmissibleClass) : ConstrainedBifurcationClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BifurcationProblemsFiniteDimensionalHamiltonianCanonicalLaneLean
end HautevilleHouse