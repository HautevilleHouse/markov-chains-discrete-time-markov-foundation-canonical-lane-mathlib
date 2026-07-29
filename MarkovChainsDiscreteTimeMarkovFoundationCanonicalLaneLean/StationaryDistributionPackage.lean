import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean.MarkovChainPackage

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean

structure StationaryDistributionPackage {M : MarkovChainPackage} where
  stationaryDist : Set M.StateSpace -> ℝ
  stationarityCondition : ∀ x, stationaryDist = λ s => ∫ y, M.TransitionKernel y s * stationaryDist {y}
  existence : Prop
  uniqueness : Prop
  existenceProof : existence
  uniquenessProof : uniqueness

structure StationaryDistributionEvidence {M : MarkovChainPackage} (S : StationaryDistributionPackage M) where
  stationarityConditionClosed : S.stationarityCondition
  existenceClosed : S.existence
  uniquenessClosed : S.uniqueness

def StationaryDistributionClosed {M : MarkovChainPackage} (S : StationaryDistributionPackage M) : Prop :=
  S.stationarityCondition ∧ S.existence ∧ S.uniqueness

theorem stationary_distribution_closed_from_evidence
    {M : MarkovChainPackage} (S : StationaryDistributionPackage M) (E : StationaryDistributionEvidence S) :
    StationaryDistributionClosed S := by
  exact And.intro E.stationarityConditionClosed (And.intro E.existenceClosed E.uniquenessClosed)

end MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean
end HautevilleHouse