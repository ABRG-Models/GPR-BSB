% Compare SpiNNaker and SpineML results for single neuron models
% and generate statistics for the difference.

% Load SpiNNaker data
fsi_spinn = csvread ('SpiNNaker_results/membranepotential/fsifiringpattern.csv');
stn_spinn = csvread ('SpiNNaker_results/membranepotential/stnfiringpattern.csv');
msn_spinn = csvread ('SpiNNaker_results/membranepotential/strd1firingpattern.csv');
gpe_spinn = csvread ('SpiNNaker_results/membranepotential/gpefiringpattern.csv');
snr_spinn = csvread ('SpiNNaker_results/membranepotential/snrfiringpattern.csv');

fsi_spine = load_sc_data ('SpineML_results/FSI_v_logrep.xml')';
fsi_long_spine = load_sc_data ('SpineML_results/FSI_v_long_logrep.xml')';
stn_spine = load_sc_data ('SpineML_results/STN_v_logrep.xml')';
msn_spine = load_sc_data ('SpineML_results/D1_MSN_v_logrep.xml')';
gpe_spine = load_sc_data ('SpineML_results/GPe_v_logrep.xml')';
snr_spine = load_sc_data ('SpineML_results/SNr_v_logrep.xml')';

t = [0:0.1:4999.9];
tlong = [0:0.01:4999.99];

figure(1); clf; hold on;
plot (t, fsi_spinn, 'b');
plot (t, fsi_spine, 'r');
% 0.01 ms timestep is similar to 0.1 ms:
%plot (tlong, fsi_long_spine, 'g');
%legend('SpiNNaker','SpineML 0.1 ms ts','SpineML 0.01 ms ts');
%legend('SpiNNaker','SpineML 0.1 ms ts');
title('FSI');

figure(2); clf; hold on;
plot (t, msn_spinn, 'b');
plot (t, msn_spine, 'r');
legend('SpiNNaker','SpineML 0.1 ms ts');
title('Str D1 MSN');

figure(3); clf; hold on;
plot (t, stn_spinn, 'b');
plot (t, stn_spine, 'r');
legend('SpiNNaker','SpineML 0.1 ms ts');
title('STN');

figure(4); clf; hold on;
plot (t, gpe_spinn, 'b');
plot (t, gpe_spine, 'r');
legend('SpiNNaker','SpineML 0.1 ms ts');
title('GPe');

figure(5); clf; hold on;
plot (t, snr_spinn, 'b');
plot (t, snr_spine, 'r');
legend('SpiNNaker','SpineML 0.1 ms ts');
title('SNr');
