function [] = EMGAnalysis_KIOM()
    underBar = '_';
    extension = '.txt';
%% 
% 1. Datafile name input and text file load

    prompt = {'Patient number (01, 02, ..., 20):', 'Trial type (MVIC ,V1, V2):', 'Motion name (Ext_L, Ext_R, ..., Rec, 일, 월, ..., 수)'};
    digtitle = 'Input';
    fieldsize = [1 55; 1 55; 1 55];
    answer = inputdlg(prompt, digtitle, fieldsize);
    
    patient_number = string(answer(1));
    trial_type = string(answer(2));
    motion_name = string(answer(3));
    filename = strcat('',patient_number,underBar,trial_type,underBar,motion_name,extension,'');

    data = readmatrix(filename);
    sgtitle_name = strcat("","Subject ",patient_number," - ",trial_type," - ",motion_name,"");
%% 
% 2. Data visualization

    rectus_abdominis_right = data(:, 2); rectus_abdominis_left = data(:, 3);
    external_oblique_right = data(:, 4); external_oblique_left = data(:, 5);
    erector_spinae_right = data(:, 6); erector_spinae_left = data(:, 7);
    gluteus_maximus_right = data(:, 8); gluteus_maximus_left = data(:, 9);

    subplot(4, 2, 1); plot(rectus_abdominis_right); title("Right Rectus Abdominis", 'FontSize', 10);
    subplot(4, 2, 2); plot(rectus_abdominis_left); title("Left Rectus Abdominis", 'FontSize', 10);
    subplot(4, 2, 3); plot(external_oblique_right); title("Right External Oblique", 'FontSize', 10);
    subplot(4, 2, 4); plot(external_oblique_left); title("Left External Oblique", 'FontSize', 10);
    subplot(4, 2, 5); plot(erector_spinae_right); title("Right Erector spinae", 'FontSize', 10);
    subplot(4, 2, 6); plot(erector_spinae_left); title("Left Erector spinae", 'FontSize', 10);
    subplot(4, 2, 7); plot(gluteus_maximus_right); title("Right Gluteus Maximus", 'FontSize', 10);
    subplot(4, 2, 8); plot(gluteus_maximus_left); title("Left Gluteus Maximus", 'FontSize', 10);
    sgtitle(sgtitle_name);
%% 
% 3. Examples

    
%%
end