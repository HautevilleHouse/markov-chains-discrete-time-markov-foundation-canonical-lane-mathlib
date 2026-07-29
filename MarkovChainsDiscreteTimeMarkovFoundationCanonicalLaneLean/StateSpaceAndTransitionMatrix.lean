import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean

structure StateSpace where
  stateType : Type u
  countable : Prop

structure TransitionMatrix (S : StateSpace) where
  P : S.stateType -> S.stateType -> ℝ
  nonnegative : ∀ i j, P i j ≥ 0
  rowSumOne : ∀ i, ∑' j, P i j = 1

structure TransitionMatrixEvidence {S : StateSpace} (T : TransitionMatrix S) where
  nonnegativeClosed : T.nonnegative
  rowSumOneClosed : T.rowSumOne

def TransitionMatrixClosed {S : StateSpace} (T : TransitionMatrix S) : Prop :=
  T.nonnegative ∧ T.rowSumOne

theorem transition_matrix_closed_from_evidence
    {S : StateSpace} (T : TransitionMatrix S) (E : TransitionMatrixEvidence T) :
    TransitionMatrixClosed T := by
  exact And.intro E.nonnegativeClosed E.rowSumOneClosed

end MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean
end HautevilleHouse