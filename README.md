# GPR-BSB

A SpineML implementation of the GPR-like model implemented by Basab Sen
Bhattacharya and run on SpiNNaker.

Individual Izhikevich neuron models, as specified in the paper are to be
found in *_neuron directories.

bgbsb1/ is a single channel model of the BG

bgbsb1_impt/ is a single channel model of the BG which uses impulses
exactly like SpiNNaker, rather than spike events as is usual in a
SpineML model.

bgbsb3/ is the three channel model.

neuron_models/ contains SpineML implementations of the individual
neuron models used in the paper. It allows us to reproduce Figure 2.

spinn_spine_compare/ contains some models with fixed connectivity
which were used to verify that both models were the same.

labbook/ contains some ipython/jupyter notebooks which were used
during model development.
