import MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean.StationaryDistribution

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean

structure ErgodicTheoremPackage {S : DiscreteTimeStateSpace} {K : TransitionKernelSpace S} {C : ChapmanKolmogorovPackage K} (P : StationaryDistributionPackage C) where
  irreducible : Prop
  aperiodic : Prop
  ergodicLimit : (S.stateSet → ℝ) → (S.stateSet → ℝ)
  ergodicLimitProperty : ∀ f s, ergodicLimit f s = ∫ t in S.stateSet, f t * P.stationaryMeasure t

structure ErgodicTheoremEvidence {S : DiscreteTimeStateSpace} {K : TransitionKernelSpace S} {C : ChapmanKolmogorovPackage K} {P : StationaryDistributionPackage C} (E : ErgodicTheoremPackage P) where
  ergodicLimitPropertyClosed : E.ergodicLimitProperty

def ErgodicTheoremClosed {S : DiscreteTimeStateSpace} {K : TransitionKernelSpace S} {C : ChapmanKolmogorovPackage K} {P : StationaryDistributionPackage C} (E : ErgodicTheoremPackage P) : Prop :=
  E.ergodicLimitProperty

theorem ergodic_theorem_closed_from_evidence {S : DiscreteTimeStateSpace} {K : TransitionKernelSpace S} {C : ChapmanKolmogorovPackage K} {P : StationaryDistributionPackage C} (E : ErgodicTheoremPackage P) (Ev : ErgodicTheoremEvidence E) : ErgodicTheoremClosed E := by
  exact Ev.ergodicLimitPropertyClosed

end MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean
end HautevilleHouse