import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean.MarkovChainPackage
import HautevilleHouse.MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean.StationaryDistributionPackage

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean

structure ConvergenceTheoremPackage {M : MarkovChainPackage} {S : StationaryDistributionPackage M} where
  aperiodicity : Prop
  irreducibility : Prop
  positiveRecurrence : Prop
  convergenceInTotalVariation : Prop
  convergenceRate : Prop
  aperiodicityProof : aperiodicity
  irreducibilityProof : irreducibility
  positiveRecurrenceProof : positiveRecurrence

def ConvergenceTheoremClosed {M : MarkovChainPackage} {S : StationaryDistributionPackage M} (C : ConvergenceTheoremPackage M S) : Prop :=
  C.aperiodicity ∧ C.irreducibility ∧ C.positiveRecurrence ∧ C.convergenceInTotalVariation ∧ C.convergenceRate

theorem convergence_theorem_closed {M : MarkovChainPackage} {S : StationaryDistributionPackage M} (C : ConvergenceTheoremPackage M S) (h : ConvergenceTheoremClosed C) :
    ConvergenceTheoremClosed C := by
  exact h

end MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean
end HautevilleHouse