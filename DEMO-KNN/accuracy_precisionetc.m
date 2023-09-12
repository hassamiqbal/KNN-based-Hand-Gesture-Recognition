clc; clear all; close all;

%% Ensemble Learners Method
load cmat_Ensemble.mat
C=cmatEnsemble;
%% KNN Method
% load cmat_KNN.mat
% C=cmatknn;
%%
%% START
t = 1:length(C);
%% accuracy
Accuracy = 100*sum(diag(C))./sum(C(:));
%% precision
cmt =C';
diagonal = diag(cmt)
sum_of_rows = sum (cmt, 2)
precision = diagonal ./ sum_of_rows
%% overall precision
overall_precision = mean(precision)
%% recall 
sum_of_column = sum(cmt, 1)
recall =  diagonal./sum_of_column
%% overall recall
overall_recall = mean(recall)
%% f1 score
f1_score = 2*((overall_precision*overall_recall)/(overall_precision+overall_recall));
