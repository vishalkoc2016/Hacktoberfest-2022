# -*- coding: utf-8 -*-
"""Digit_Recogni.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1PBXiG2NwCxkS9c7hg2NXGdaRuEc0s-Pe

# New Section
"""

# Commented out IPython magic to ensure Python compatibility.
import numpy as np
import pandas as pd
import tensorflow as tf
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from keras.utils.np_utils import to_categorical
from keras.preprocessing.image import ImageDataGenerator
from keras.callbacks import LearningRateScheduler

# %matplotlib inline

train = pd.read_csv('/content/train.csv')
test = pd.read_csv('/content/test.csv')

train.head()

train.head()

Y_train = train["label"]
X_train = train.drop(labels=["label"],axis=1)

test.shape

Y_train.shape

X_train = X_train / 255.0

X_train = X_train.values.reshape(-1, 28, 28, 1)

plt.figure(figsize=(10, 10))
for i in range(9):
    ax = plt.subplot(3,3,i+1)
    plt.xticks([])
    plt.yticks([])
    plt.grid(False)
    plt.imshow(X_train[i], cmap=plt.cm.binary)
    plt.title(Y_train[i])
    plt.axis("off")
plt.show()

Y_train = to_categorical(Y_train, num_classes=10)

X_train, X_val, Y_train, Y_val = train_test_split(X_train, Y_train, test_size=0.1, random_state=2)

data_augmentation = ImageDataGenerator(
        rotation_range=10,  
        zoom_range = 0.10,  
        width_shift_range=0.1, 
        height_shift_range=0.1)

learning_schedule = LearningRateScheduler(lambda x: 1e-4 * 0.95 ** x)

model = tf.keras.Sequential([
    tf.keras.layers.Conv2D(32, kernel_size=(5,5), padding='same', activation='relu', input_shape=(28, 28, 1)),
    tf.keras.layers.BatchNormalization(),
    tf.keras.layers.Conv2D(32, kernel_size=(5,5), padding='same', activation='relu'),
    tf.keras.layers.BatchNormalization(),
    tf.keras.layers.Dropout(0.4),
    tf.keras.layers.Conv2D(64, kernel_size=(5,5), padding='same', activation='relu'),
    tf.keras.layers.BatchNormalization(),
    tf.keras.layers.Conv2D(64, kernel_size=(5,5), padding='same', activation='relu'),
    tf.keras.layers.BatchNormalization(),
    tf.keras.layers.Dropout(0.4),
    tf.keras.layers.Conv2D(128, kernel_size=(5,5), padding='same', activation='relu'),
    tf.keras.layers.Conv2D(128, kernel_size=(5,5), padding='same', activation='relu'),
    tf.keras.layers.BatchNormalization(),
    tf.keras.layers.Flatten(),
    tf.keras.layers.Dropout(0.5),
    tf.keras.layers.Dense(256, activation='relu'),
    tf.keras.layers.Dropout(0.5),
    tf.keras.layers.Dense(10, activation='softmax')
])

model.summary()

model.compile(optimizer=tf.keras.optimizers.Adam(0.0001),
              loss="categorical_crossentropy",
              metrics=["accuracy"])

history = model.fit_generator(data_augmentation.flow(X_train, Y_train, batch_size=64),
                    epochs=50,
                    validation_data=(X_val, Y_val),
                    callbacks = [learning_schedule],
                    steps_per_epoch = X_train.shape[0]/64,
                    verbose=2
                   )

acc = history.history['accuracy']
val_acc = history.history['val_accuracy']

loss = history.history['loss']
val_loss = history.history['val_loss']

epochs_range = range(50)

plt.figure(figsize=(10, 10))
plt.subplot(1, 2, 1)
plt.plot(epochs_range, acc, label='Training Accuracy')
plt.plot(epochs_range, val_acc, label='Validation Accuracy')
plt.legend(loc='lower right')
plt.title('Training and Validation Accuracy')

plt.subplot(1, 2, 2)
plt.plot(epochs_range, loss, label='Training Loss')
plt.plot(epochs_range, val_loss, label='Validation Loss')
plt.legend(loc='upper right')
plt.title('Training and Validation Loss')
plt.show()

probability_model = tf.keras.Sequential([model, tf.keras.layers.Softmax()])

predictions = probability_model.predict(test.values.reshape(-1,28,28,1))

predictions[0]

plt.imshow(test.values.reshape(-1,28,28,1)[0], cmap='gray')

plt.figure(figsize=(10, 10))
for i in range(9):
    ax=plt.subplot(3,3,i+1)
    plt.imshow(test.values.reshape(-1,28,28,1)[i]/255, cmap=plt.cm.binary)
    plt.title(np.argmax(predictions[i]))
    plt.grid(False)
    plt.colorbar()
    plt.axis("off")
plt.show()

test = pd.read_csv('/content/test.csv')

test = np.array(test, dtype=np.float32)/255
test = test.reshape(-1,28,28,1)
prediction = model.predict(test)
predict = np.array(np.round(prediction), dtype = np.int32)
predict = np.argmax(predict , axis=1).reshape(-1, 1)
out = [{'ImageId': i+1, 'Label': predict[i][0]} for i in range(len(predict))]
pd.DataFrame(out).to_csv('submission.csv', index=False)
