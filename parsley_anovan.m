% Perform N-way ANOVA on Parsley data

% NOTE: Uncomment to redo ANOVA
parsley_varnames = {'Survey';'ParseType'};
anovan(percentages,{surveys groups},2,2,parsley_varnames)
[~,~,parsley_stats] = anovan(percentages,{surveys groups},2,2,parsley_varnames);
[c,m,h,nms] = multcompare(parsley_stats,'Dimension',[1,2]);

% Sort means and standard errors
% m = sort(m);
means_errors = num2cell(m);
% surveys / means / errors
sme = [nms,means_errors];
% Sort first by mean, then subsort by survey type
sme = sortrows(sme, [1 2]);

h = errorbar(cell2mat(sme(:,2)), cell2mat(sme(:,3)), 'vertical', 'o');
xlim([0 16]);

% Drop markers for each survey
japanese_indices = [1,2,3];
thomas_indices = [4,5,6];
veraldi_indices = [7,8,9];
waertsilae_indices = [10,11,12];
watches_indices = [13,14,15];

hold;

% japanese
plot(japanese_indices(1), cell2mat(sme(japanese_indices(1), 2)), 'o',... 
        'MarkerSize', 10, 'MarkerFaceColor', [64/256 63/256 76/256]);
plot(japanese_indices(2), cell2mat(sme(japanese_indices(2), 2)), '^',... 
        'MarkerSize', 10, 'MarkerFaceColor', [64/256 63/256 76/256]);
plot(japanese_indices(3), cell2mat(sme(japanese_indices(3), 2)), 's',... 
        'MarkerSize', 10, 'MarkerFaceColor', [64/256 63/256 76/256]);
% thomas
plot(thomas_indices(1), cell2mat(sme(thomas_indices(1), 2)), 'o',... 
    'MarkerSize', 10, 'MarkerFaceColor', [232/256 72/256 85/256]);
plot(thomas_indices(2), cell2mat(sme(thomas_indices(2), 2)), '^',... 
    'MarkerSize', 10, 'MarkerFaceColor', [232/256 72/256 85/256]);
plot(thomas_indices(3), cell2mat(sme(thomas_indices(3), 2)), 's',... 
    'MarkerSize', 10, 'MarkerFaceColor', [232/256 72/256 85/256]);
% veraldi
plot(veraldi_indices(1), cell2mat(sme(veraldi_indices(1), 2)), 'o',... 
    'MarkerSize', 10, 'MarkerFaceColor', [249/256 220/256 92/256]);
plot(veraldi_indices(2), cell2mat(sme(veraldi_indices(2), 2)), '^',... 
    'MarkerSize', 10, 'MarkerFaceColor', [249/256 220/256 92/256]);
plot(veraldi_indices(3), cell2mat(sme(veraldi_indices(3), 2)), 's',... 
    'MarkerSize', 10, 'MarkerFaceColor', [249/256 220/256 92/256]);
% waertsilae
plot(waertsilae_indices(1), cell2mat(sme(waertsilae_indices(1), 2)), 'o',... 
    'MarkerSize', 10, 'MarkerFaceColor', [49/256 133/256 252/256]);
plot(waertsilae_indices(2), cell2mat(sme(waertsilae_indices(2), 2)), '^',... 
    'MarkerSize', 10, 'MarkerFaceColor', [49/256 133/256 252/256]);
plot(waertsilae_indices(3), cell2mat(sme(waertsilae_indices(3), 2)), 's',... 
    'MarkerSize', 10, 'MarkerFaceColor', [49/256 133/256 252/256]);
% watches
plot(watches_indices(1), cell2mat(sme(watches_indices(1), 2)), 'o',... 
    'MarkerSize', 10, 'MarkerFaceColor', [239/256 188/256 213/256]);
plot(watches_indices(2), cell2mat(sme(watches_indices(2), 2)), '^',... 
    'MarkerSize', 10, 'MarkerFaceColor', [239/256 188/256 213/256]);
plot(watches_indices(3), cell2mat(sme(watches_indices(3), 2)), 's',... 
    'MarkerSize', 10, 'MarkerFaceColor', [239/256 188/256 213/256]);

% Rotate 90 degrees
view(90, 90);

% Generate sorted table of means, corresponding errors, and surveys
mean_table = sortrows([num2cell(m) nms]);

% Label each of the points with a small vertical offset.
text(1-0.5, cell2mat(sme(1,2)), 'Japanese, Hand','FontSize', 20);
text(2-0.5, cell2mat(sme(2,2)), 'Japanese, Machine','FontSize', 20);
text(3-0.5, cell2mat(sme(3,2)), 'Japanese, Plain','FontSize', 20);
text(4-0.5, cell2mat(sme(4,2)), 'Thomas, Hand','FontSize', 20);
text(5-0.5, cell2mat(sme(5,2)), 'Thomas, Machine','FontSize', 20);
text(6-0.5, cell2mat(sme(6,2)), 'Thomas, Plain','FontSize', 20);
text(7-0.5, cell2mat(sme(7,2)), 'Veraldi, Hand','FontSize', 20);
text(8-0.5, cell2mat(sme(8,2)), 'Veraldi, Machine','FontSize', 20);
text(9-0.5, cell2mat(sme(9,2)), 'Veraldi, Plain','FontSize', 20);
text(10-0.5, cell2mat(sme(10,2)), 'Waertsilae, Hand','FontSize', 20);
text(11-0.5, cell2mat(sme(11,2)), 'Waertsilae, Machine','FontSize', 20);
text(12-0.5, cell2mat(sme(12,2)), 'Waertsilae, Plain','FontSize', 20);
text(13-0.5, cell2mat(sme(13,2)), 'Watches, Hand','FontSize', 20);
text(14-0.5, cell2mat(sme(14,2)), 'Watches, Machine','FontSize', 20);
text(15-0.5, cell2mat(sme(15,2)), 'Watches, Plain','FontSize', 20);

% Remove x label, label y
set(gca,'xtick',[]);
ylabel('% Correct, (higher is better)', 'FontSize', 20);
% title('Passage Comprehension', 'Fontsize', 20);
