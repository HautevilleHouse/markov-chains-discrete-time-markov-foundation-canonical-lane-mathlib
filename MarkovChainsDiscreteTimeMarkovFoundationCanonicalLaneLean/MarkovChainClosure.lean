import MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean.ErgodicTheorem

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean

def ConstrainedMarkovChainClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_markov_chain_endgame (A : AdmissibleClass) : ConstrainedMarkovChainClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean
end HautevilleHouse