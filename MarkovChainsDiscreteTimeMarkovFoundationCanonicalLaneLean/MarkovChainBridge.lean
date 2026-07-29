import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean.DiscreteTimeMarkovChain

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean

structure MarkovChainAdmissibleClass where
  stateSpace : StateSpace
  transition : TransitionKernel stateSpace
  initial : InitialDistribution stateSpace
  chain : MarkovChain stateSpace transition initial

def bridgeClosed (A : MarkovChainAdmissibleClass) : Prop :=
  MarkovChainClosed A.stateSpace A.transition A.initial A.chain

theorem bridge_from_admissible_class (A : MarkovChainAdmissibleClass) : bridgeClosed A := by
  -- Assuming we have evidence from the chain construction
  sorry

end HautevilleHouse.MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean