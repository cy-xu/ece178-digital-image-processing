To run the search_vote_func.m you need mex files.

We have provided these files for windows on GS and their names are 'nnmex.mexw64' and 'votemex.mexw64'.

For MAC OS these files are available in the link 'http:// www.cs.princeton.edu/gfx/pubs/Barnes_2009_PAR/patchmatch-2.1.zip'. The filenames for the MAC OS are 'nnmex.mexmaci64' and 'votemex.mexmaci64'. 

The mex files allows you to implement optimized functions in C and interface it with MATLAB.

Note that nnmex.m and votemex.m files available in 'patchmatch-2.1' folder would be completely commented. They are simply used to let the user know how to interface with the nnmex.mexw64 and votemex.mexw64 files. 


So here's what you do to make sure your system is setup properly (tested for Windows):

Step1: Download and copy the mex files to the current folder.
Step3: Run test_mex.m.

The test_mex.m function will take as input a test image of size 35*47 and perform search and vote operation on it to generate 
a slightly smaller target image of size 35*46. If test_mex.m runs properly, then the mex files are working fine on your system.

You could now go ahead and implement the complete image summarization algorithm as explained in Part 1 of the project. 

Please contact TA if you are not able to run test_mex.m on your system.  



