%% Start
clear all; close all; clc; clear cache;
sampleRate = 50;
%% Data processing object
ProcessObj = dataprocessing(sampleRate);
%% Train Linear Regressor
disp('Getting Labels . . .');
load trainlabels1248.mat % accuracy is 99.05% with lables of 1165
train_l = train_labels;
clear train_labels;
for j = 1:length(train_l)
    train_labels(j) = categorical({num2str(train_l(j,:))});
end
train_labels = train_labels';
load trainvec1248.mat % accuracy is 99.05%
disp('Training KNN Model . . .');
%% FITCECOC SVM
%%returns a trained ECOC model using the predictors X and the class labels y Fit multiclass models for support vector machines
%opt = statset('UseParallel',true);
%tmp = templateEnsemble('GentleBoost',200,templateTree('surrogate','on'));
%ecoc = fitcecoc(trainvec,train_labels(1:length(trainvec),:),'Coding','onevsall','Learners',tmp,...
%                    'Prior','uniform','Options',opt);
%% KNN
 %ecoc= fitcknn(trainvec,train_labels); % accuracy is 99/74% UNLIKELY
 ecoc = fitcknn(trainvec,train_labels,'OptimizeHyperparameters','auto',...
    'HyperparameterOptimizationOptions',...
    struct('AcquisitionFunctionName','expected-improvement-plus'));
%% FITCENSEMBLE
%ecoc= fitcensemble(trainvec,train_labels(1:length(trainvec),:)); % accuracy is 99/74% UNLIKELY
%% Decision Tree
%ecoc= fitctree(trainvec,train_labels(1:length(trainvec),:));
%% trainvec is our predictor "X" & train-labels is our class labels y
disp('Starting testing phase . . .')
ViewObj = interface_new1;
prevest = [0 0];
Window = [];
% n has to be as same as the train labels are.
for n = 1 : 1248
    est = predict(ecoc,trainvec(n,:));
    estimation = str2num(string(est));
    estimations(n) = est;
    lbl = str2num(string(train_labels(n)));
    ViewObj.updatedata(estimation,lbl);
    pause(0.1);
end
estimations = estimations';
%% confusion matrix
C = confusionmat(estimations,train_labels(1:length(estimations),:));
%% accuracy
Accuracy = sum(estimations==train_labels(1:length(estimations)))/numel(estimations);
%% cross value
cvmodel= crossval(ecoc);
%% CVMdl is a ClassificationPartitionedECOC cross-validated ECOC classifier.
genError = kfoldLoss(cvmodel);