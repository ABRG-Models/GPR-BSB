% Find the max value of g in the bgbsb1_impt model

pth = '/home/seb/src/SpineML_2_BRAHMS/temp/Spiking_BG_BSB_1ch_imp_pt_e0/log/';

D1_gaba = load_sc_data([pth 'D1_MSN_PT_to_D1_MSN_Synapse_0_postsynapse_g_gaba_logrep.xml']);
D2_gaba = load_sc_data([pth 'D2_MSN_PT_to_D2_MSN_Synapse_0_postsynapse_g_gaba_logrep.xml']);
FSI_gaba = load_sc_data([pth 'FSI_PT_to_FSI_Synapse_0_postsynapse_g_gaba_logrep.xml']);
STN_gaba = load_sc_data([pth 'GPe_to_STN_Synapse_0_postsynapse_g_gaba_logrep.xml']);
GPe_gaba = load_sc_data([pth 'GPe_PT_to_GPe_Synapse_0_postsynapse_g_gaba_logrep.xml']);
SNr_gaba = load_sc_data([pth 'SNr_PT_to_SNr_Synapse_0_postsynapse_g_gaba_logrep.xml']);

D1_ampa = load_sc_data([pth 'Background_to_D1_MSN_Synapse_0_postsynapse_g_ampa_logrep.xml']);
D2_ampa = load_sc_data([pth 'Background_to_D2_MSN_Synapse_0_postsynapse_g_ampa_logrep.xml']);
FSI_ampa = load_sc_data([pth 'Background_to_FSI_Synapse_0_postsynapse_g_ampa_logrep.xml']);
STN_ampa = load_sc_data([pth 'BackgroundSTN_to_STN_Synapse_0_postsynapse_g_ampa_logrep.xml']);
GPe_ampa = load_sc_data([pth 'STN_to_GPe_Synapse_0_postsynapse_g_ampa_logrep.xml']);
SNr_ampa = load_sc_data([pth 'STN_to_SNr_Synapse_0_postsynapse_g_ampa_logrep.xml']);

D1_gaba_max = max(max(D1_gaba))
D2_gaba_max = max(max(D2_gaba))
FSI_gaba_max = max(max(FSI_gaba))
STN_gaba_max = max(max(STN_gaba))
GPe_gaba_max = max(max(GPe_gaba))
SNr_gaba_max = max(max(SNr_gaba))

D1_ampa_max = max(max(D1_ampa))
D2_ampa_max = max(max(D2_ampa))
FSI_ampa_max = max(max(FSI_ampa))
STN_ampa_max = max(max(STN_ampa))
GPe_ampa_max = max(max(GPe_ampa))
SNr_ampa_max = max(max(SNr_ampa))
