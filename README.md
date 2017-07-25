# GPR-BSB

SpineML implementations of the GPR-like models implemented by Basab Sen
Bhattacharya et al. to run on SpiNNaker.

## Toolchain to run these models

The SpineML models in this repository can be opened with SpineCreator
and executed with SpineML_2_BRAHMS. To do so, first install the tools
as described at:

http://spineml.github.io/spinecreator/sourcelin/

or, if building on a Mac, at:

http://spineml.github.io/spinecreator/source/

These pages explain how to build and install the SpineML toolchain
from the four git repositories that it's hosted on:

1) SpineCreator from:

https://github.com/SpineML/SpineCreator

2) SpineML_2BRAHMS from:

https://github.com/SpineML/SpineML_2_BRAHMS

3) SpineML_PreFlight from:

https://github.com/SpineML/SpineML_PreFlight

4) BRAHMS from:

https://github.com/BRAHMS-SystemML/brahms

Installing from the master branches of the relevant git repositories
should work fine and will ensure you get the latest features and bugfixes.
However, in order to guarantee that the models in this project
can be run in the future, it is possible to checkout and compile the repositories
above with the branch tag "GPR-BSB-paper1". Using this branch will ensure that the SpineML toolchain
exactly matches the one I used to produce the results in the associated paper ("Building a spiking neural network model of the Basal Ganglia on SpiNNaker", Bhattacharya et al., currently in submission, July 2017).

## Project layout

SpineML implementations of the individual Izhikevich neuron models, as 
specified in the paper are to be
found in neuron_models/\*_neuron directories. These models allow us to
reproduce Figure 2 from the paper.

bgbsb1/ is a single channel model of the BG. It has probabilistic
connectivity and probabilistically determined connection delays. The
seeds are all set to 0, so that a seed is automatically selected at
runtime by SpinML_PreFLight each time the simulation is run. This is the
single channel event-based model referred to in the paper.

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

spinn_spine_compare/ contains some models with fixed connectivity
which were used to verify whether the SpineML and SpiNNaker models
were the same.

impulse_event_compare/ contains some cut down models which were used
when comparing bgbsb1(_fixcon) and bgbsb1_impt(_fixcon).

labbook/ contains some ipython/jupyter notebooks which were used
during model development.

labbook/performance contains the performance analysis code and results
for running 1 second of simulation time for comparison with the
SpiNNaker machine.
