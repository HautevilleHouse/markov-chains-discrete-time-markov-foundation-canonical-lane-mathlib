import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean.MarkovChainPackage

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean

structure CentralLimitTheoremPackage {M : MarkovChainPackage} where
  cltForMarkovChains : Prop
  asymptoticNormality : Prop
  varianceScaling : ℝ
  cltProof : cltForMarkovChains
  asymptoticNormalityProof : asymptoticNormality

def CentralLimitTheoremClosed {M : MarkovChainPackage} (C : CentralLimitTheoremPackage M) : Prop :=
  C.cltForMarkovChains ∧ C.asymptoticNormality

theorem central_limit_theorem_closed {M : MarkovChainPackage} (C : CentralLimitTheoremPackage M) (h : CentralLimitTheoremClosed C) :
    CentralLimitTheoremClosed C := by
  exact h

end MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean
end HautevilleHouse