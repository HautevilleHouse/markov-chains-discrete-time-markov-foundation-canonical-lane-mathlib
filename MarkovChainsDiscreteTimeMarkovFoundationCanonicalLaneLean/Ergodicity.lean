import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean.StationaryDistribution

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean

structure ErgodicityPackage {S : StateSpace} {T : TransitionProbability S} (P : StationaryDistributionPackage T) where
  irreducible : Prop
  aperiodic : Prop
  ergodicTheorem : ∀ (f : S.carrier → ℝ) (x : S.carrier),
    limit (λ n => (1/n) * ∑ i in Finset.range n, f (iterate T i x)) = ∫ f ∂ P.measure

def ErgodicityClosed {S : StateSpace} {T : TransitionProbability S} {P : StationaryDistributionPackage T} (E : ErgodicityPackage P) : Prop :=
  E.irreducible ∧ E.apenriodic ∧ E.ergodicTheorem

theorem ergodicity_closed_from_evidence {S : StateSpace} {T : TransitionProbability S} {P : StationaryDistributionPackage T} (E : ErgodicityPackage P) : ErgodicityClosed E := by
  exact And.intro E.irreducible (And.intro E.apenriodic E.ergodicTheorem)

end MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean
end HautevilleHouse
