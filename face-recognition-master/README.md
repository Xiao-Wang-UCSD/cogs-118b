# Face recognition on the Yale Faces dataset using tensorflow

## Introduction

The Yale faces dataset is a benchmark dataset for facial recognition problems. It contains 165 images of 11 different persons. The pictures were taken in different settings: with/without glasses, laughing/ sad, sleepy, surprised,... ([source](http://vision.ucsd.edu/content/yale-face-database)).

In this project we want to build an algorithm capable of matching images to the correct person (face recognition). We take a multi-label classification approach to this problem, meaning that we associate to each image a label corresponding to the relevant person figuring on it. 

The model we choose is a simple multi-layer perceptron (neural network with 2 densely-connected hidden layers, containing each 512 neurons). We do not use dropout regularization, as for this specific type of problem, it is in some ways suitable to overfit the data. 

## Usage

### Train

Download the project directory and cd to this directory. Use 

`python train.py`

to train the model with the Yale Faces data set. If you want to train the model using your own data, just put it into the data directory (./yalefaces) and if need be, modify the `helper.py` file to read your data (this project was built to read the Yale Faces data specifically, not any images). 

This model can achieve 100% accuracy on validation data (the Yale dataset was split in 80% training and 20% validation set). Obviously, the validation set is extremely similar to the training set ( we took 2 to 4 images per person for validation, but faces of the same person remain similar). Hence, the model is highly overfitting the data. However, in the context of face detection, this is a positive behaviour for our model. We want the model to remind your face specifically, so a high degree of overfitting is required.

Remark: Do not forget to change the path to the OpenCv haarcascade_frontalface_default.xml in the helper.py file. Just change the variable

`OPENCV_HAAR_CSC_PATH = "C:\\Users\\bebxadvaboy\\AppData\\Local\\Continuum\\Anaconda3\\pkgs\\opencv-3.3.0-py36_200\\Library\\etc\\haarcascades\\haarcascade_frontalface_default.xml"` 

to your correct file path.

### Deployment

TODO create a `predict.py` file that takes as arguments names of images file to predict. 
