function [AllData, StatNames] = MadeDataFile()
% histogram(AllData)
% P = prctile(AllData, 95)

load NormalisedCrossSpectra_3
load AreaNames
VarCount = 0;
StatNames  =[];
AllData = [];
%%
for ACounter = 1:length(AreaNames)
    for FreqCounter = 1:length(s)
        VarCount  = VarCount + 1;
        AllData(VarCount,1) = abs(squeeze(UKU(ACounter,ACounter,FreqCounter)));
        AllData(VarCount,2) = NaN;
        StatNames{VarCount,1} = [AreaNames{ACounter}, '_', num2str(FreqCounter)];
    end
end
%%
for A1Counter = 1:length(AreaNames)
    for A2Counter = A1Counter+1:length(AreaNames)
        for FreqCounter = 1:length(s)
            VarCount  = VarCount + 1;
            AllData(VarCount,1) = abs(squeeze(UKU(A1Counter,A2Counter,FreqCounter)));
            AllData(VarCount,2) = wrapToPi(angle(squeeze(UKU(A1Counter,A2Counter,FreqCounter))));

            StatNames{VarCount,1} = [AreaNames{A1Counter}, '-XXX-', AreaNames{A2Counter}, '_', num2str(FreqCounter)];
        end
    end
end

end