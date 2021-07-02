function [EEG, plothandles] = clean_data_with_zapline_eeglab_wrapper(EEG, zaplineConfig)
% super small wrapper for zapline that takes an EEGLAB EEG struct and a config as input and makes sure all info is
% stored, passes the plothandles out to be saved on disk. The config input is optional, otherwise default parameters are
% used. The used parameters are stored in EEG.etc.zapline.config and can be re-entered into the function to reproduce
% the cleaning. For detailed information about the parameters, see the clean_data_with_zapline function.
%
% Examples:
% 
%   EEG = clean_data_with_zapline(EEG); EEG.etc.zapline
% 
%   zaplineConfig = [];
%   zaplineConfig.adaptiveSigma = 0;
%   [EEG, plothandles] = clean_data_with_zapline(EEG,zaplineConfig); EEG.etc.zapline
% 
% 
% see also: clean_data_with_zapline
% 
% Author: Marius Klug, 2021

if ~exist('zaplineConfig','var')
    % run zapline subfunction with default parameters
    [EEG.data, EEG.etc.zapline.config, EEG.etc.zapline.NremoveFinal, EEG.etc.zapline.Scores, EEG.etc.zapline.resNoisePeaks,...
        EEG.etc.zapline.resFoundNoise,plothandles] = clean_data_with_zapline(EEG.data, EEG.srate);
else
    % run zapline subfunction with config parameters
    [EEG.data, EEG.etc.zapline.config, EEG.etc.zapline.NremoveFinal, EEG.etc.zapline.Scores, EEG.etc.zapline.resNoisePeaks,...
        EEG.etc.zapline.resFoundNoise,plothandles] = clean_data_with_zapline(EEG.data, EEG.srate, zaplineConfig);
end

