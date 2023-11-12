# 3D-Reconstruction-from-2D-images-Using-Structure-from-Motion-Algorithm

SFM stands for Structure from Motion. It is a computer vision technique used to reconstruct 3D structures from 2D image sequences. The basic idea behind SFM is to find the 3D points in a scene by matching feature points across multiple images taken from different viewpoints. These 3D points are then used to build a 3D point cloud representation of the scene.

The process of SFM typically involves the following steps:

## Image acquisition
A set of images of the same scene is captured from different viewpoints using a camera or other imaging device.

## Feature extraction: 
Features such as corners, edges, or blobs are extracted from each image in the sequence. These features provide a way to track the position of points in the scene across images.

## Matching: 
Correspondences between features in adjacent images are established, allowing the estimation of the 3D positions of these features. This step is often performed using techniques such as feature matching or bundle adjustment.

## Reconstruction:
Using the matched features, a 3D point cloud is constructed representing the scene. This point cloud can be further processed to generate a mesh or other 3D representation of the scene.

## 3D modeling: 
SFM can be used to create detailed 3D models of buildings, landscapes, or other environments.


## Camera Calibration
![image](https://github.com/mnusrat786/3D-Reconstruction-from-2D-images-Using-Structure-from-Motion-Algorithm/assets/45511078/916c96ff-ff11-4c50-a8b7-3c3cb06a04e0)
## Original Image vs Undistorted Image
![image](https://github.com/mnusrat786/3D-Reconstruction-from-2D-images-Using-Structure-from-Motion-Algorithm/assets/45511078/846278bb-0da7-4d73-b00f-6c82d6d3fc28)
## Input Image
![image](https://github.com/mnusrat786/3D-Reconstruction-from-2D-images-Using-Structure-from-Motion-Algorithm/assets/45511078/acaf703b-9c99-41c2-9f86-c45d91495377)
## Gray Scale Image
![image](https://github.com/mnusrat786/3D-Reconstruction-from-2D-images-Using-Structure-from-Motion-Algorithm/assets/45511078/b6e90bdf-f9ae-41d4-bdec-8be27ca0f532)
## Feature Matching
![image](https://github.com/mnusrat786/3D-Reconstruction-from-2D-images-Using-Structure-from-Motion-Algorithm/assets/45511078/cb5a24a9-70e2-42e0-935f-21ddcbe94b20)
## 3D Reconstruction
![image](https://github.com/mnusrat786/3D-Reconstruction-from-2D-images-Using-Structure-from-Motion-Algorithm/assets/45511078/be37741e-ea79-41c0-8a65-78ff95f96fbe)

# References
[1]  Agarwal, S., Furukawa, Y., Snavely, N., Simon, I., Curless, B., Seitz, S. M., & Szeliski, R. (2011). Building Rome in day. Communications of the ACM,54(10), 105-112.






