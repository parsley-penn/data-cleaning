% Performs 1-way ANOVA analysis on all survey slices.

% Japanese Investors
[p_japanese, table_japanese, stats_japanese] = anova1(percentages(...
    japanese_index:purina_index-1), groups(japanese_index:purina_index-1));
% Purina
[p_purina, table_purina, stats_purina] = anova1(percentages(...
    purina_index:thomas_index-1), groups(purina_index:thomas_index-1));
% Thomas
[p_thomas, table_thomas, stats_thomas] = anova1(percentages(...
    thomas_index:veraldi_index-1), groups(thomas_index:veraldi_index-1));
% Veraldi
[p_veraldi, table_veraldi, stats_veraldi] = anova1(percentages(...
    veraldi_index:waertsilae_index-1), groups(veraldi_index:waertsilae_index-1));
% Waertsilae
[p_waertsilae, table_waertsilae, stats_waertsilae] = anova1(percentages(...
    waertsilae_index:watches_index-1), groups(waertsilae_index:watches_index-1));
% Watches
[p_watches, table_watches, stats_watches] = anova1(percentages(...
    watches_index:length(percentages)), groups(watches_index:length(percentages)));

% All
[p_all, table_all, stats_all] = anova1(percentages, groups);

% Close all the figures that just popped up
close all