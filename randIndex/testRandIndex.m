function [ ] = testRandIndex( )
initTestSuite;
end

function testRandIndex_allInSameClusterWith3Pairs_retruns1()
assertEqual(1,randIndex([1;1;1],[1;1;1]));
end

function testRandIndex_mixedWith3Pairs_retruns1()
assertEqual(1/3,randIndex([1;1;2],[1;2;1]));
end


function testRandIndex_firstInSameSecondInDifferentClusterWith1Pair_retruns0()
assertEqual(0,randIndex([1;1],[1;2]));
end
 
function testRandIndex_allInDifferentClusterWith1Pair_retruns1()
assertEqual(1,randIndex([1;2],[1;3]));
end
 
function testRandIndex_firstDifferentInSecondInSameClusterWith1Pair_retruns0()
assertEqual(0,randIndex([1;2],[1;1]));
end
 
function testRandIndex_allInSameClusterWith1PairClusterCalledDifferently_retruns1()
assertEqual(1,randIndex([1;1],[2;2]));
end
 
function testRandIndex_firstInSameSecondInDifferentClusterWith1PairClusterCalledDifferently_retruns0()
assertEqual(0,randIndex([2;2],[1;3]));
end