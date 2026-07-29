import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean.MarkovChainPackage

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  MarkovChainClosed A.object

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

def ConstrainedMarkovClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_markov_endgame (A : AdmissibleClass) :
    ConstrainedMarkovClosure A := by
  have hBridge : bridgeClosed A := by
    exact A.object.conclusion
  have hGate : gateClosed A := by
    exact A.gateWitness
  exact And.intro hBridge hGate

end MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean
end HautevilleHouse