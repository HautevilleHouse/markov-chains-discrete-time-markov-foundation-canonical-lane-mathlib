import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean

structure MarkovChain {S : StateSpace} (T : TransitionMatrix S) where
  initialDistribution : S.stateType -> ℝ
  transition : S.stateType -> S.stateType -> ℝ := T.P
  markovProperty : ∀ (n : ℕ) (i0 i1 ... in : S.stateType), 
    Probability[ X_{n+1} = i_{n+1} | X_n = i_n, ..., X_0 = i_0 ] = Probability[ X_{n+1} = i_{n+1} | X_n = i_n ]
  markovPropertyClosed : markovProperty

structure MarkovChainEvidence {S : StateSpace} {T : TransitionMatrix S} (M : MarkovChain T) where
  markovPropertyClosed : M.markovProperty

def MarkovChainClosed {S : StateSpace} {T : TransitionMatrix S} (M : MarkovChain T) : Prop :=
  M.markovProperty

theorem markov_chain_closed_from_evidence
    {S : StateSpace} {T : TransitionMatrix S} (M : MarkovChain T) (E : MarkovChainEvidence M) :
    MarkovChainClosed M := by
  exact E.markovPropertyClosed

end MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean
end HautevilleHouse