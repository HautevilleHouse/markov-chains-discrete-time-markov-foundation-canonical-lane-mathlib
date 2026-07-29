import MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean.MarkovChainClosure

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean

structure AdmissibleClass where
  object : TransitionKernelSpace
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  (∃ (S : DiscreteTimeStateSpace) (K : TransitionKernelSpace S) (C : ChapmanKolmogorovPackage K) (P : StationaryDistributionPackage C) (E : ErgodicTheoremPackage P), True) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean
end HautevilleHouse