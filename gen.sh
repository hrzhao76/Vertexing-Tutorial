# To run this script, use ./gen.sh <n_events> <n_pu> <acts_path>
# make sure you have execution permission
n_events=$1 
n_pu=$2
acts_path=$3 

./ActsExamplePythia8  --rnd-seed=42 --events=$n_events  --output-dir=data/gen/ttbar_mu$n_pu --output-root --output-csv --gen-cms-energy-gev=14000 --gen-hard-process=Top:qqbar2ttbar=on --gen-npileup=$n_pu -l 1 | tee log.ActsExamplePythia8

./ActsExampleFatrasGeneric --rnd-seed=42 --input-dir=data/gen/ttbar_mu$n_pu   --output-dir=data/sim_generic/ttbar_mu$n_pu  --output-csv  --select-eta=-2.5:2.5 --select-pt-gev=0.4: --fatras-pmin-gev 0.4 --remove-neutral  --bf-constant-tesla=0:0:2 -l 1 | tee log.ActsExampleFatrasGeneric

./ActsExampleTruthTracksGeneric --rnd-seed=42 --input-dir=data/sim_generic/ttbar_mu$n_pu --output-dir=data/reco_generic/ttbar_mu$n_pu --bf-constant-tesla=0:0:2 --digi-config-file $acts_path/Examples/Algorithms/Digitization/share/default-smearing-config-generic.json -l 1 | tee log.ActsExampleTruthTracksGeneric


cp data/gen/ttbar_mu$n_pu/particles.root data/reco_generic/ttbar_mu$n_pu/particles.root
./ActsExampleVertexFinderTrackReaderPerformanceWriter  --rnd-seed=42 --bf-constant-tesla=0:0:2 --input-dir=data/reco_generic/ttbar_mu$n_pu --output-dir=data/vertexing/ttbar_mu$n_pu -l 1 | tee log.ActsExampleVertexFinderTrackReaderPerformanceWriter
 


