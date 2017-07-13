# GPR-BSB

SpineML implementations of the GPR-like models implemented by Basab Sen
Bhattacharya and run on SpiNNaker.

Individual Izhikevich neuron models, as specified in the paper are to be
found in *_neuron directories.

bgbsb1/ is a single channel model of the BG. It has probabilistic
connectivity and probabilistically determined connection delays. The
seeds are all set to 0, so that a seed is automatically selected at
runtime by SpinML_PreFLight each time the simulation is run.

bgbsb1_fixcon/ is a copy of bgbsb1 in which the randomised
fixed-connectivity connections & delays have had their seeds fixed at
123.

bgbsb1_impt/ is a single channel model of the BG which uses impulses
exactly like SpiNNaker, rather than spike events as is usual in a
SpineML model. Seeds are all 0, as in bgbsb1

bgbsb1_impt_fixcon/ Is a fixed-seed copy of bgbsb1_impt.

bgbsb3/ is the three channel model, where three instances of bgbsb1
have been connected together with the same connectivity as for the
SpiNNaker 3 channel model.

neuron_models/ contains SpineML implementations of the individual
neuron models used in the paper. It allows us to reproduce Figure 2.

spinn_spine_compare/ contains some models with fixed connectivity
which were used to verify whether the SpineML and SpiNNaker models
were the same.

impulse_event_compare/ contains some cut down models which were used
when comparing bgbsb1(_fixcon) and bgbsb1_impt(_fixcon).

labbook/ contains some ipython/jupyter notebooks which were used
during model development.
