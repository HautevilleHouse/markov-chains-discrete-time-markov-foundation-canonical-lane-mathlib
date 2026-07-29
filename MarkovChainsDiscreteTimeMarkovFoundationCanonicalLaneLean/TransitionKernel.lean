import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean

structure StateSpace where
  carrier : Type u
  measurabilityStructure : Set (Set carrier)
  countableOrStandardBorel : Prop

structure TransitionProbability (S : StateSpace) where
  kernel : S.carrier → Set S.carrier → ℝ
  nonnegative : ∀ x A, kernel x A ≥ 0
  totalMassOne : ∀ x, kernel x (Set.univ) = 1
  measurability : ∀ A, MeasurableSet A → MeasurableFunction (λ x => kernel x A)

def StochasticKernelClosed {S : StateSpace} (T : TransitionProbability S) : Prop :=
  T.nonnegative ∧ T.totalMassOne ∧ T.measurability

theorem stochastic_kernel_closed_from_evidence {S : StateSpace} (T : TransitionProbability S) : StochasticKernelClosed T := by
  exact And.intro T.nonnegative (And.intro T.totalMassOne T.measurability)

end MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean
end HautevilleHouse
