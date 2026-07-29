import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean

structure StateSpace where
  carrier : Type
  countable : Prop

structure TransitionKernel (S : StateSpace) where
  transition : S.carrier → (S.carrier → ℕ → ℝ)
  stochastic : Prop
  timeHomogeneous : Prop

structure InitialDistribution (S : StateSpace) where
  dist : S.carrier → ℝ
  sumOne : ∑' x : S.carrier, dist x = 1
  nonneg : ∀ x : S.carrier, dist x ≥ 0

structure MarkovChain (S : StateSpace) (P : TransitionKernel S) (μ : InitialDistribution S) where
  finiteDims : Prop
  markovProperty : Prop
  stationary : Prop

structure MarkovChainEvidence (S : StateSpace) (P : TransitionKernel S) (μ : InitialDistribution S) (M : MarkovChain S P μ) where
  finiteDimsClosed : M.finiteDims
  markovPropertyClosed : M.markovProperty
  stationaryClosed : M.stationary

def MarkovChainClosed (S : StateSpace) (P : TransitionKernel S) (μ : InitialDistribution S) (M : MarkovChain S P μ) : Prop :=
  M.finiteDims ∧ M.markovProperty ∧ M.stationary

theorem markov_chain_closed_from_evidence {S : StateSpace} {P : TransitionKernel S} {μ : InitialDistribution S} {M : MarkovChain S P μ} (E : MarkovChainEvidence S P μ M) : MarkovChainClosed S P μ M := by
  exact And.intro E.finiteDimsClosed (And.intro E.markovPropertyClosed E.stationaryClosed)

end HautevilleHouse.MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean