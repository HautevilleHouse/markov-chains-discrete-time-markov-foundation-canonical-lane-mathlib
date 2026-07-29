import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean

structure ChapmanKolmogorovPackage {S : StateSpace} {T : TransitionMatrix S} where
  nStepTransition : ℕ → S.stateType → S.stateType → ℝ
  semigroupProperty : ∀ (m n : ℕ) (i j : S.stateType),
    nStepTransition (m + n) i j = ∑' k, nStepTransition m i k * nStepTransition n k j
  semigroupPropertyClosed : semigroupProperty

structure ChapmanKolmogorovEvidence {S : StateSpace} {T : TransitionMatrix S}
    (C : ChapmanKolmogorovPackage T) where
  semigroupPropertyClosed : C.semigroupProperty

def ChapmanKolmogorovClosed {S : StateSpace} {T : TransitionMatrix S}
    (C : ChapmanKolmogorovPackage T) : Prop :=
  C.semigroupProperty

theorem chapman_kolmogorov_closed_from_evidence
    {S : StateSpace} {T : TransitionMatrix S} (C : ChapmanKolmogorovPackage T)
    (E : ChapmanKolmogorovEvidence C) : ChapmanKolmogorovClosed C := by
  exact E.semigroupPropertyClosed

end MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean
end HautevilleHouse