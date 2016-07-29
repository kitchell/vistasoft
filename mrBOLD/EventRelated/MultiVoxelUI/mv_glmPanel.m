function mv = mv_glmPanel(mv)
%
% Attach a uipanel to a MultiVoxelUI with controls for visualizing
% GLMs. This initializes the panel to 'off', not visible. The panel is
% made visible when the visualize GLM option is selected.
%
%
% ras, 10/06
if notDefined('mv'), mv = get(gcf, 'UserData'); end
if ishandle(mv), mv = get(mv, 'UserData'); end

mv.ui.glmPanel = mrvPanel('right',  .2);
set(mv.ui.glmPanel,  'BackgroundColor',  'w');

% voxel slider
nVoxels = size(mv.tSeries,  2);
mv.ui.glmVoxel = mrvSlider([.1 .8 .8 .1], 'Voxel', 'Parent', mv.ui.glmPanel,  ...
                           'Range',  [1 nVoxels], 'IntFlag', 1, ...
                           'MaxLabelFlag', 1, ...
                           'Callback', 'mv_visualizeGlm(gcf,  round(val));');


% buttons to grab the current voxel time course, multi voxel
cb = ['tmp = get(gcf, ''UserData''); ' ...
      'iTmp = get(tmp.ui.glmVoxel.sliderHandle, ''Value''); ' ...
      'mv_selectSubset(tmp, iTmp, ''voxels'', 2); ' ...
      'clear tmp iTmp'];
uicontrol('Parent', mv.ui.glmPanel, 'Style', 'pushbutton', ...
          'Units', 'norm', 'Position', [.1 .6 .8 .06], ...
          'String', 'Cur Voxel Timecourse', 'FontSize', 9, ...
          'BackgroundColor', 'w', 'HorizontalAlignment', 'center', ...
          'Callback', cb);
      
cb = ['tmp = get(gcf, ''UserData''); ' ...
      'iTmp = get(tmp.ui.glmVoxel.sliderHandle, ''Value''); ' ...
      'mv_selectSubset(tmp, iTmp, ''voxels'', 1); ' ...
      'clear tmp iTmp'];
uicontrol('Parent', mv.ui.glmPanel, 'Style', 'pushbutton', ...
          'Units', 'norm', 'Position', [.1 .54 .8 .06], ...
          'String', 'Cur Voxel MVUI', 'FontSize', 9, ...
          'BackgroundColor', 'w', 'HorizontalAlignment', 'center', ...
          'Callback', cb);

% text describing voxel location
mv.ui.glmVoxCoords = uicontrol('Parent', mv.ui.glmPanel, 'Style', 'text', ...
          'Units', 'Normalized', 'Position', [.1 .4 .8 .06], ...          
          'String', '', 'BackgroundColor', 'w');

% toggle buttons for time course traces
cb = ['tmp = {''off'' ''on''}; val = get(gcbo, ''Value'')+1; ' ...
      'set(get(gcbo,''UserData''), ''Visible'', tmp{val}); ' ...
      'clear tmp val '];
  
h1 = uicontrol('Parent', mv.ui.glmPanel, 'Style', 'checkbox', ...
               'Units', 'normalized', ...
               'Position', [.1 .2 .8 .05], 'String', 'Time Course', ...
               'BackgroundColor', 'w', 'Value', 1, 'Callback', cb);
h2 = uicontrol('Parent', mv.ui.glmPanel, 'Style', 'checkbox', ...
               'Units', 'normalized', ...
               'Position', [.1 .15 .8 .05], 'String', 'Predictors', ...
               'BackgroundColor', 'w', 'Value', 0, 'Callback', cb);
h3 = uicontrol('Parent', mv.ui.glmPanel, 'Style', 'checkbox', ...
               'Units', 'normalized', ...
               'Position', [.1 .1 .8 .05], 'String', 'Best Fit', ...
               'BackgroundColor', 'w', 'Value', 1, 'Callback', cb);
h4 = uicontrol('Parent', mv.ui.glmPanel, 'Style', 'checkbox', ...
               'Units', 'normalized', ...
               'Position', [.1 .05 .8 .05], 'String', 'Residual', ...
               'BackgroundColor', 'w', 'Value', 0, 'Callback', cb);

mv.ui.glmToggles = [h1 h2 h3 h4];           
      
      
set( get(mv.ui.glmPanel, 'Children'), 'Units', 'normalized' );

mrvPanelToggle(mv.ui.glmPanel,  'off');      

return