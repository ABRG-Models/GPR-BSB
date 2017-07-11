% Compare the spike raster results from the event based and impulse
% based models. Here, the models have fixed seeds (of 123) for the
% connectivity and fixed seeds (of 123 and 124, respectively) for
% the D1 and STN poisson spike train inputs.

% The location of the output
s2b='/home/seb/src/SpineML_2_BRAHMS/temp/';
ev1=[s2b 'Spiking_BG_BSB_1ch_fc_e0/log/'];
imp1=[s2b 'Spiking_BG_BSB_1ch_imp_fc_e0/log/'];

d1ev = csvread([ev1 'D1_MSN_spike_log.csv']);
d1imp = csvread([imp1 'D1_MSN_spike_log.csv']);

figure(1); clf; hold on;
plot (d1ev(:,1),d1ev(:,2),'bo');
plot (d1imp(:,1),d1imp(:,2),'r.');
title('D1');

stnev = csvread([ev1 'STN_spike_log.csv']);
stnimp = csvread([imp1 'STN_spike_log.csv']);

figure(2); clf; hold on;
plot (stnev(:,1),stnev(:,2),'bo');
plot (stnimp(:,1),stnimp(:,2),'r.');
title('STN');

gpeev = csvread([ev1 'GPe_spike_log.csv']);
gpeimp = csvread([imp1 'GPe_spike_log.csv']);

figure(3); clf; hold on;
plot (gpeev(:,1),gpeev(:,2),'bo');
plot (gpeimp(:,1),gpeimp(:,2),'r.');
title('GPe');

snrev = csvread([ev1 'SNr_spike_log.csv']);
snrimp = csvread([imp1 'SNr_spike_log.csv']);

figure(4); clf; hold on;
plot (snrev(:,1),snrev(:,2),'bo');
plot (snrimp(:,1),snrimp(:,2),'r.');
title('SNr');

tabl = [ size(d1ev)(1), size(d1imp)(1);
         size(stnev)(1), size(stnimp)(1);
         size(gpeev)(1), size(gpeimp)(1);
         size(snrev)(1), size(snrimp)(1) ]