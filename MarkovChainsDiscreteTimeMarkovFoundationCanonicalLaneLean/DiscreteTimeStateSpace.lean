import MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean

structure DiscreteTimeStateSpace where
  stateSet : Type u
  sigmaAlgebra : Set (Set stateSet)
  countable : Prop

structure TransitionKernelSpace where
  stateSpace : DiscreteTimeStateSpace
  transitionFunction : stateSpace.stateSet → Set (stateSpace.stateSet) → ℝ
  markovProperty : ∀ s, transitionFunction s Set.univ = 1

structure DiscreteTimeStateSpaceEvidence (S : DiscreteTimeStateSpace) where
  sigmaAlgebraClosed : S.sigmaAlgebra ≠ ∅
  countableClosed : S.countable

structure DiscreteTimeStateSpaceClosed (S : DiscreteTimeStateSpace) : Prop := mk :: (
  sigmaAlgebraClosed : S.sigmaAlgebra ≠ ∅
  countableClosed : S.countable
)

theorem discrete_time_state_space_closed_from_evidence (S : DiscreteTimeStateSpace) (E : DiscreteTimeStateSpaceEvidence S) : DiscreteTimeStateSpaceClosed S := by
  exact And.intro E.sigmaAlgebraClosed E.countableClosed

end MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean
end HautevilleHouse