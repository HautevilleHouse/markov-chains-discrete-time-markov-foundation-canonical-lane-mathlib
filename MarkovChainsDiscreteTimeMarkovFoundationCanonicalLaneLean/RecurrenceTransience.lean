import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean.DiscreteTimeMarkovChain

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean

structure RecurrenceClass (S : StateSpace) (P : TransitionKernel S) where
  recurrentStates : Set (S.carrier)
  transientStates : Set (S.carrier)
  hittingProbability : Prop

structure RecurrenceClassEvidence (S : StateSpace) (P : TransitionKernel S) (R : RecurrenceClass S P) where
  recurrentStatesClosed : R.recurrentStates = {x | True}
  transientStatesClosed : R.transientStates = ∅
  hittingProbabilityClosed : R.hittingProbability

def RecurrenceClassClosed (S : StateSpace) (P : TransitionKernel S) (R : RecurrenceClass S P) : Prop :=
  R.hittingProbability

theorem recurrence_class_closed_from_evidence {S : StateSpace} {P : TransitionKernel S} {R : RecurrenceClass S P} (Ev : RecurrenceClassEvidence S P R) : RecurrenceClassClosed S P R := by
  exact Ev.hittingProbabilityClosed

end HautevilleHouse.MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean