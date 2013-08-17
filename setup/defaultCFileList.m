function cFiles = defaultCFileList;
% Returns a list of all .c source files found in the VISTASOFT repository.
%
% cFiles = defaultCFileList;
%
% This list was found using grep (around October 2008). cFiles is a cell
% array of strings. Each entry is relative to the default VISTASOFT root
% path.
%
% Some mex files need to concatenate multiple source files. You can
% concatenate the source file names separated by a ';'. E.g.:
% '/some/dir/first.c;some/dir/second.c' will compile first.c as the mex
% file 'first.mexext' and link in the code from second.c.
%
% ras 10/2008.
% 2009.07.01 RFD: cleaned up a few details. Can now compile things that
% require multiple source files (e.g., niftiRead)


% This will ultimately be the output:
cFiles = {};

% We search our path for these files. Files grouped together, need to be
% compiled in that order: e.g. 'mex matToQuat.c nifti1_io.c znzlib.c' (with
% their respective paths, of course).

cFileNames = {...
    {'matToQuat.c', 'nifti1_io.c', 'znzlib.c'}...
    {'readFileNifti.c', 'nifti1_io.c', 'znzlib.c'}...
    {'writeFileNifti.c', 'nifti1_io.c', 'znzlib.c'}...
    {'mrManDist.c'}...
    {'assignToNearest.c'}...
    {'spm_hist2_weighted.c'}...
    {'spm_hist2_weighted_MI.c'}...
    {'coranal.c'} ...
    {'sumOfNeighbors.c'} ...
    {'updateTinC.c'} ...
    {'varOfNeighbors.c'} ...
    {'dtiFitTensor.c'} ...
    {'dtiJointHist.c'} ...
    {'dtiSplitTensor.c'} ...
    {'dtiTensorInterp_Pajevic.c'} ...
    {'ndfun.c'} ...
    {'magicwand1.c'} ...
    {'initInvDiagsInC.c'} ...
    {'trilin.c'}...
    {'dtiLoadConTrackPaths.c'}...
    {'mrAnatFastInterp3.c'}...
    {'myCinterp3.c'}...
    {'findNearest.c'}...
    {'pnet.c'}...
    {'mrManDist.c'}...
    {'assignToNearest.c'}...
    {'edgesCross2d.c'}...
    {'mCheck.c'}...
    {'mrCheckNode2dIntersect.c'}...
    {'evaluate.c'}...
    {'regHistogram.c'}...
    {'SagittalRot.c'}...
    {'ObliqueRot.c'}...
    {'SagittalRot.c'}...
    {'ObliqueRot.c'}...
    {'SagittalRot.c'}...
    {'regInplanes.c'}...
    {'corrDn.c'}...
    {'histo.c'}...
    {'corrDn.c'}...
    {'histo.c'}...
    {'wrap.c'}...
    {'convolve.c'}...
    {'upConv.c'}...
    {'range2.c'}...
    {'edges-orig.c'}...
    {'edges.c'}...
    {'pointOp.c'}...
    {'wrap.c'}...
    {'convolve.c'}...
    {'upConv.c'}...
    {'range2.c'}...
    {'edges-orig.c'}...
    {'edges.c'}...
    {'pointOp.c'}...
    {'corrDn.c'}...
    {'histo.c'}...
    {'wrap.c'}...
    {'convolve.c'}...
    {'upConv.c'}...
    {'range2.c'}...
    {'edges-orig.c'}...
    {'edges.c'}...
    {'pointOp.c'}...
    {'varOfNeighbors.c'}};

for ii=1:length(cFileNames)
    this_files = [];
    for jj=1:length(cFileNames{ii})
        this_files = [this_files which(cFileNames{ii}{jj}) ' '];
    end
    cFiles{ii} = this_files;
end

return
