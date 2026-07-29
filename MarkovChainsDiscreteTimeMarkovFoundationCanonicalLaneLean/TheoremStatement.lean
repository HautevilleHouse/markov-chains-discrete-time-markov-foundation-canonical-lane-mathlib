import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean

structure MarkovAdmittedObject where
  stateSpace : Type
  transitionKernel : stateSpace → stateSpace → ℝ
  markovProperty : Prop
  stationaryDistribution : stateSpace → ℝ
  convergenceToStationary : Prop
  conclusion : markovProperty ∧ stationaryDistribution

def MarkovWitnessClosed (O : MarkovAdmittedObject) : Prop :=
  O.markovProperty ∧ O.stationaryDistribution

end MarkovChainsDiscreteTimeMarkovFoundationCanonicalLaneLean
end HautevilleHouse