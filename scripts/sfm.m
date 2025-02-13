%--------------------------------------------------------------------------
% Structure from Motion (SfM) - 3D Reconstruction
%--------------------------------------------------------------------------

clc; clear; close all;

% Select Image Directory
imageDir = uigetdir('', 'Select Image Folder');
if imageDir == 0
    error('No folder selected. Exiting script.');
end

% Define Image Type
imageType = fullfile(imageDir, '*.jpeg');

% Load Camera Parameters
cameraParamsFile = fullfile(imageDir, 'cameraParams.mat');
if exist(cameraParamsFile, 'file')
    data = load(cameraParamsFile);
    cameraParams = data.cameraParams;
else
    error('cameraParams.mat not found! Please provide camera parameters.');
end

% Read Image Files
imStruct = dir(imageType);
imgs = {imStruct.name};

% Ensure Images Exist
if isempty(imgs)
    error('No images found in the directory!');
end

% Initialize Image Storage
images = cell(1, numel(imgs));
filenames = cell(1, numel(imgs));

for i = 1:numel(imgs)
    % Read and store images
    full_path = fullfile(imageDir, imgs{i});
    filenames{i} = full_path;
    I = imread(full_path);
    images{i} = rgb2gray(I);
end

% Display Montage of Input Images
figure;
montage(filenames);
title('Input Image Sequence');

% Undistort First Image
I = undistortImage(images{1}, cameraParams);
imshow(I);
title('Undistorted First Image');

%--------------------------------------------------------------------------
% Feature Detection
%--------------------------------------------------------------------------
border = 50;
roi = [border, border, size(I, 2)- 2*border, size(I, 1)- 2*border];

prevPoints = detectSURFFeatures(I, 'NumOctaves', 8, 'ROI', roi);
prevFeatures = extractFeatures(I, prevPoints, 'Upright', true);

% Initialize View Set
vSet = imageviewset;
viewId = 1;
vSet = addView(vSet, viewId, 'Points', prevPoints, 'Orientation', eye(3), 'Location', [0 0 0]);

prev_I = I;

%--------------------------------------------------------------------------
% Feature Matching Across Images
%--------------------------------------------------------------------------
for i = 2:numel(images)
    % Undistort the current image
    I = undistortImage(images{i}, cameraParams);
    
    % Detect and Extract Features
    currPoints = detectSURFFeatures(I, 'NumOctaves', 8, 'ROI', roi);
    currFeatures = extractFeatures(I, currPoints, 'Upright', true);
    
    % Match Features
    indexPairs = matchFeatures(prevFeatures, currFeatures, 'MaxRatio', .95, 
