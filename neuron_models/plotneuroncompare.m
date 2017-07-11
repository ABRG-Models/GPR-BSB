load neuron_compare.mat

figure(1); clf; hold on;
plot (t, fsi_spinn, 'b');
plot (t, fsi_spine, 'r');
xlabel('t (ms)'); ylabel ('v');
% 0.01 ms timestep is similar to 0.1 ms:
%plot (tlong, fsi_long_spine, 'g');
%legend('SpiNNaker','SpineML 0.1 ms ts','SpineML 0.01 ms ts');
legend('SpiNNaker','SpineML 0.1 ms ts');
title('FSI');

figure(2); clf; hold on;
plot (t, msn_spinn, 'b');
plot (t, msn_spine, 'r');
xlabel('t (ms)'); ylabel ('v');
legend('SpiNNaker','SpineML 0.1 ms ts');
title('Str D1 MSN');

figure(3); clf; hold on;
plot (t, stn_spinn, 'b');
plot (t, stn_spine, 'r');
xlabel('t (ms)'); ylabel ('v');
legend('SpiNNaker','SpineML 0.1 ms ts');
title('STN');

figure(4); clf; hold on;
plot (t, gpe_spinn, 'b');
plot (t, gpe_spine, 'r');
xlabel('t (ms)'); ylabel ('v');
legend('SpiNNaker','SpineML 0.1 ms ts');
title('GPe');

figure(5); clf; hold on;
plot (t, snr_spinn, 'b');
plot (t, snr_spine, 'r');
xlabel('t (ms)'); ylabel ('v');
legend('SpiNNaker','SpineML 0.1 ms ts');
title('SNr');
