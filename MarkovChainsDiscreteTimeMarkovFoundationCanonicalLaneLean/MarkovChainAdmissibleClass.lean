import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean.TransitionKernel
import HautevilleHouse.MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean.ChapmanKolmogorov
import HautevilleHouse.MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean.StationaryDistribution
import HautevilleHouse.MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean.Ergodicity

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean

structure MarkovChainAdmittedObject where
  stateSpace : StateSpace
  kernel : TransitionProbability stateSpace
  chapmanKolmogorov : ChapmanKolmogorovPackage kernel
  stationary : Option (StationaryDistributionPackage kernel)
  ergodicity : Option (ErgodicityPackage stationary)
  conclusion : ChapmanKolmogorovClosed chapmanKolmogorov

structure MarkovChainAdmissibleClass where
  object : MarkovChainAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : MarkovChainAdmissibleClass) : Prop :=
  A.object.conclusion ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean
end HautevilleHouse
