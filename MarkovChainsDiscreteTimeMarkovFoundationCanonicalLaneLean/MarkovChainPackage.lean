import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean

structure MarkovChainPackage where
  StateSpace : Type u
  SigmaAlgebra : Set (Set StateSpace)
  TransitionKernel : StateSpace -> Set StateSpace -> ℝ
  probabilityMeasure : Prop
  markovProperty : Prop
  timeHomogeneous : Prop
  initialDistribution : Set StateSpace -> ℝ
  initialDistributionOK : initialDistribution Set.univ = 1
  transitionKernelOK : ∀ x, TransitionKernel x Set.univ = 1

structure MarkovChainEvidence (M : MarkovChainPackage) where
  probabilityMeasureClosed : M.probabilityMeasure
  markovPropertyClosed : M.markovProperty
  timeHomogeneousClosed : M.timeHomogeneous

def MarkovChainClosed (M : MarkovChainPackage) : Prop :=
  M.probabilityMeasure ∧ M.markovProperty ∧ M.timeHomogeneous

theorem markov_chain_closed_from_evidence (M : MarkovChainPackage) (E : MarkovChainEvidence M) :
    MarkovChainClosed M := by
  exact And.intro E.probabilityMeasureClosed (And.intro E.markovPropertyClosed E.timeHomogeneousClosed)

end MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean
end HautevilleHouse