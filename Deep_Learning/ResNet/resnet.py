import tensorflow as tf
import matplotlib.pyplot as plt
import keras,os
from keras.models import Sequential
from keras.layers import Dense, Conv2D, MaxPooling2D , Flatten, Input, ZeroPadding2D, AveragePooling2D, add, ReLU, BatchNormalization, Dropout
from keras.preprocessing.image import ImageDataGenerator
import numpy as np
from tensorflow.keras.datasets import cifar10
from tensorflow.keras.datasets import mnist
from keras.optimizers import Adam, SGD
from keras.callbacks import ModelCheckpoint, EarlyStopping
from keras.preprocessing.image import ImageDataGenerator
from keras.models import Model

# Commented out IPython magic to ensure Python compatibility.
# %matplotlib inline
np.random.seed(1)
#Define identity block
def identity_block(input_tensor, kernel_size, filters):
	F1, F2, F3 = filters

	x = Conv2D(F1, (1, 1))(input_tensor)
	x = BatchNormalization()(x)
	x = ReLU()(x)

	x = Conv2D(F2, kernel_size, padding='same')(x)
	x = BatchNormalization()(x)
	x = ReLU()(x)

	x = Conv2D(F3, (1, 1))(x)
	x = BatchNormalization()(x)
	x = ReLU()(x)
	#skip connection
	x = add([x, input_tensor])
	x = ReLU()(x)

	return x

#Define convolutional block
def conv_block(input_tensor, kernel_size, filters, strides=(2, 2)):
	F1, F2, F3 = filters

	x = Conv2D(F1, (1, 1), strides=strides)(input_tensor)
	x = BatchNormalization()(x)
	x = ReLU()(x)

	x = Conv2D(F2, kernel_size, padding='same')(x)
	x = BatchNormalization()(x)
	x = ReLU()(x)

	x = Conv2D(F3, (1, 1))(x)
	x = BatchNormalization()(x)
	#shortcut
	sc = Conv2D(F3, (1, 1), strides=strides)(input_tensor)
	x = BatchNormalization()(x)
  #Skip connection
	x = add([x, sc])
	x = ReLU()(x)

	return x

#Define function to build model
def resnet(input_tensor):
  net = ZeroPadding2D((3, 3))(input_tensor)
  net = Conv2D( 64, (7, 7), strides=(2, 2))(net)
  net = BatchNormalization()(net)
  net = ReLU()(net)
  net = MaxPooling2D((3, 3), strides=(2, 2))(net)

  net = conv_block(net, 3, [64, 64, 256], strides=(1, 1))
  net = identity_block(net, 3, [64, 64, 256])
  net = identity_block(net, 3, [64, 64, 256])

  net = conv_block(net, 3, [128, 128, 512])
  net = identity_block(net, 3, [128, 128, 512])
  net = identity_block(net, 3, [128, 128, 512])
  net = identity_block(net, 3, [128, 128, 512])
 
  net = conv_block(net, 3, [256, 256, 1024])
  net = identity_block(net, 3, [256, 256, 1024])
  net = identity_block(net, 3, [256, 256, 1024])
  net = identity_block(net, 3, [256, 256, 1024])
  net = identity_block(net, 3, [256, 256, 1024])
  net = identity_block(net, 3, [256, 256, 1024])
  net = AveragePooling2D((2, 2))(net)
  net = Flatten()(net)
  net = Dense(10, activation="softmax")(net)
  model = Model(input_tensor, net)
	#define optimizer
  opt = Adam(lr = 0.001)
	#compile model
  model.compile(optimizer=opt, loss=keras.losses.sparse_categorical_crossentropy, metrics=['accuracy'])
  return model

# Loading dataset and split into training and testing set
(X_train, Y_train), (X_test, Y_test) = mnist.load_data()	
#Add channels dimension if it is missing
if (X_train.ndim == 3):
  X_train = np.expand_dims(X_train, -1)
if (X_test.ndim == 3):
  X_test = np.expand_dims(X_test, -1)

#Input tensor shape
X = Input(shape=(28,28,1))
#Build model
model = resnet(X)
#Define trining parameters
aug = ImageDataGenerator()
EPOCHS = 30
BS = 32 #Batch size
N = X_train.shape[0] # Number of training samples
N_val = X_test.shape[0] # Number of validation samples
#Train Model
hist = model.fit_generator(aug.flow(X_train, Y_train, batch_size=BS), validation_data=(X_test, Y_test), steps_per_epoch= N/BS, validation_steps= N_val/BS, epochs=EPOCHS)

#Plot training and testing Accuracy
plt.plot(hist.history['accuracy'])
plt.plot(hist.history['val_accuracy'])
plt.title('MNIST - ResNet Accuracy - Learning Rate = 0.001')
plt.ylabel('accuracy')
plt.xlabel('epoch')
plt.legend(['train', 'val'], loc='best')
plt.grid()
plt.show()

#Plot training and testing Loss
plt.plot(hist.history['loss'])
plt.plot(hist.history['val_loss'])
plt.title('MNIST - ResNet Loss - Learning Rate = 0.001')
plt.ylabel('loss')
plt.xlabel('epoch')
plt.legend(['train', 'val'], loc='best')
plt.grid()
plt.show()

#Prediction on real data using trained MNIST model 
import cv2
img = cv2.imread('manual_data/9.png')
#Convert to grayscale
grayscale = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
#Add missing dimensions (batch size and numner of channels) 
x = np.expand_dims(grayscale, axis=0)
x = np.expand_dims(x, axis=3)
#Get Prediction Model Class does not have predict_classes fnc and only return probabilietes for each class
digit = model.predict(x)
#Get class with highest probability and print prediction
result = np.argmax(digit,axis=1)
print(result)

#Save model
model.save('resnet.h5')