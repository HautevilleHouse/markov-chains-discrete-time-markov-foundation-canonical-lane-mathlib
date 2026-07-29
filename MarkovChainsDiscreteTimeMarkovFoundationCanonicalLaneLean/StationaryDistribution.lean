import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean

structure StationaryDistribution {S : StateSpace} {T : TransitionMatrix S} where
  pi : S.stateType → ℝ
  nonnegative : ∀ i, pi i ≥ 0
  sumOne : ∑' i, pi i = 1
  invariance : ∀ j, pi j = ∑' i, pi i * T.P i j
  invarianceClosed : invariance

structure StationaryDistributionEvidence {S : StateSpace} {T : TransitionMatrix S}
    (D : StationaryDistribution T) where
  invarianceClosed : D.invariance

def StationaryDistributionClosed {S : StateSpace} {T : TransitionMatrix S}
    (D : StationaryDistribution T) : Prop :=
  D.invariance

theorem stationary_distribution_closed_from_evidence
    {S : StateSpace} {T : TransitionMatrix S} (D : StationaryDistribution T)
    (E : StationaryDistributionEvidence D) : StationaryDistributionClosed D := by
  exact E.invarianceClosed

end MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean
end HautevilleHouse