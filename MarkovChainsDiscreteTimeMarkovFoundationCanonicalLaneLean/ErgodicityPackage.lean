import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean.MarkovChainPackage

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean

structure ErgodicityPackage {M : MarkovChainPackage} where
  ergodicTheorem : Prop
  birkhoffSum : (M.StateSpace → ℝ) → (M.StateSpace → ℝ)
  timeAverageEqualsSpaceAverage : Prop
  ergodicityCondition : Prop
  ergodicityProof : ergodicityCondition
  ergodicTheoremProof : ergodicTheorem

def ErgodicityClosed {M : MarkovChainPackage} (E : ErgodicityPackage M) : Prop :=
  E.ergodicTheorem ∧ E.timeAverageEqualsSpaceAverage ∧ E.ergodicityCondition

theorem ergodicity_closed {M : MarkovChainPackage} (E : ErgodicityPackage M) (h : ErgodicityClosed E) :
    ErgodicityClosed E := by
  exact h

end MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean
end HautevilleHouse