Contains so far:
##Rand Index
Implements [RandIndex](http://en.wikipedia.org/wiki/Rand_index) that measures the similarity between to clusterings.
Add the randIndex folder to your path and try this:

    data = [randn(10,2)+ones(10,2);randn(10,2)-ones(10,2)]
    clusterA = kmeans(data,2)
    clusterB = kmeans(data,3)
    randIndex(clusterA,clusterB)
    % returns: ans = 0.8105 (or a similar value since data is random)


###Development notes:
Needs [MATLAB xUnit Test Framework](http://www.mathworks.com/matlabcentral/fileexchange/22846-matlab-xunit-test-framework) to run the unit tests.
