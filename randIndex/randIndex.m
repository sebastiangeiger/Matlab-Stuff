function [ result ] = randIndex( partitionA, partitionB )
%RANDINDEX Rand's Index for cluster similarity (expect values 0..1(1=identical)
%For a description of the index see: http://en.wikipedia.org/wiki/Rand_index
%Basically measures how many of the possible pairs in two partions are in 
%the same clusters.
%This number is called agreement, the index is expressed in the percentage
%of pairs that are in agreement. 

compatible =  isequal(size(partitionA),size(partitionB));
assert( compatible, 'The partitions need to be of the same size');

assert(isequal(size(partitionA,2), 1), 'Please pass in a row vector');

numberOfElements = size(partitionA,1);
allPairs = combnk(1:numberOfElements,2);
numberOfAllPairs = size(allPairs,1); % = (n 2) in the wiki article

%These functions are probably overly complicated but the return value is an
%array of booleans that indicate if the pair fullfills the condition
sameClusterInAandB = cell2mat(cellfun(@(pair) {inSameCluster(pair,partitionA,partitionB)}, num2cell(allPairs,2))); % = a in the wiki article
differentClusterInAandB = cell2mat(cellfun(@(pair) {inDifferentCluster(pair,partitionA,partitionB)}, num2cell(allPairs,2)));% = b in the wiki article

agreement = sum(sameClusterInAandB)+sum(differentClusterInAandB);
result = agreement/numberOfAllPairs;
end

function [ result ] = inSameCluster(pair,A,B)
    result = (A(pair(1))==A(pair(2))) && (B(pair(1))==B(pair(2)));
end

function [ result ] = inDifferentCluster(pair,A,B)
    result = (A(pair(1))~=A(pair(2))) && (B(pair(1))~=B(pair(2)));
end