# Submitting to GPU
```
sbatch train_gpu.sh
```

# Expected output
```
Downloading data from https://storage.googleapis.com/tensorflow/tf-keras-datasets/mnist.npz
11493376/11490434 [==============================] - 0s 0us/step
11501568/11490434 [==============================] - 0s 0us/step
2021-11-05 14:37:48.355782: I tensorflow/core/platform/cpu_feature_guard.cc:142] This TensorFlow binary is optimized with oneAPI Deep Neural Network Library (oneDNN) to use the following CPU instructions in performance-critical operations:  AVX2 AVX512F FMA
To enable them in other operations, rebuild TensorFlow with the appropriate compiler flags.
2021-11-05 14:37:52.120673: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1510] Created device /job:localhost/replica:0/task:0/device:GPU:0 with 6678 MB memory:  -> device: 0, name: NVIDIA GeForce RTX 2070 SUPER, pci bus id: 0000:1a:00.0, compute capability: 7.5
2021-11-05 14:37:53.138544: I tensorflow/compiler/mlir/mlir_graph_optimization_pass.cc:185] None of the MLIR Optimization Passes are enabled (registered 2)
2021-11-05 14:37:57.103368: I tensorflow/stream_executor/cuda/cuda_dnn.cc:369] Loaded cuDNN version 8101
x_train shape: (60000, 28, 28, 1)
60000 train samples
10000 test samples
Model: "sequential"
_________________________________________________________________
Layer (type)                 Output Shape              Param #   
=================================================================
conv2d (Conv2D)              (None, 26, 26, 32)        320       
_________________________________________________________________
max_pooling2d (MaxPooling2D) (None, 13, 13, 32)        0         
_________________________________________________________________
conv2d_1 (Conv2D)            (None, 11, 11, 64)        18496     
_________________________________________________________________
max_pooling2d_1 (MaxPooling2 (None, 5, 5, 64)          0         
_________________________________________________________________
flatten (Flatten)            (None, 1600)              0         
_________________________________________________________________
dropout (Dropout)            (None, 1600)              0         
_________________________________________________________________
dense (Dense)                (None, 10)                16010     
=================================================================
Total params: 34,826
Trainable params: 34,826
Non-trainable params: 0
_________________________________________________________________
Epoch 1/15
422/422 [==============================] - 15s 4ms/step - loss: 0.3632 - accuracy: 0.8886 - val_loss: 0.0801 - val_accuracy: 0.9782
Epoch 2/15
422/422 [==============================] - 1s 3ms/step - loss: 0.1099 - accuracy: 0.9664 - val_loss: 0.0576 - val_accuracy: 0.9845
Epoch 3/15
422/422 [==============================] - 1s 3ms/step - loss: 0.0827 - accuracy: 0.9749 - val_loss: 0.0468 - val_accuracy: 0.9883
Epoch 4/15
422/422 [==============================] - 1s 3ms/step - loss: 0.0713 - accuracy: 0.9781 - val_loss: 0.0468 - val_accuracy: 0.9878
Epoch 5/15
422/422 [==============================] - 1s 3ms/step - loss: 0.0624 - accuracy: 0.9806 - val_loss: 0.0405 - val_accuracy: 0.9877
Epoch 6/15
422/422 [==============================] - 1s 3ms/step - loss: 0.0561 - accuracy: 0.9823 - val_loss: 0.0362 - val_accuracy: 0.9890
Epoch 7/15
422/422 [==============================] - 1s 3ms/step - loss: 0.0509 - accuracy: 0.9839 - val_loss: 0.0353 - val_accuracy: 0.9910
Epoch 8/15
422/422 [==============================] - 1s 3ms/step - loss: 0.0465 - accuracy: 0.9851 - val_loss: 0.0352 - val_accuracy: 0.9897
Epoch 9/15
422/422 [==============================] - 1s 3ms/step - loss: 0.0432 - accuracy: 0.9868 - val_loss: 0.0311 - val_accuracy: 0.9910
Epoch 10/15
422/422 [==============================] - 1s 3ms/step - loss: 0.0424 - accuracy: 0.9868 - val_loss: 0.0305 - val_accuracy: 0.9917
Epoch 11/15
422/422 [==============================] - 1s 3ms/step - loss: 0.0372 - accuracy: 0.9881 - val_loss: 0.0301 - val_accuracy: 0.9910
Epoch 12/15
422/422 [==============================] - 1s 3ms/step - loss: 0.0373 - accuracy: 0.9879 - val_loss: 0.0285 - val_accuracy: 0.9922
Epoch 13/15
422/422 [==============================] - 1s 3ms/step - loss: 0.0354 - accuracy: 0.9885 - val_loss: 0.0306 - val_accuracy: 0.9917
Epoch 14/15
422/422 [==============================] - 1s 3ms/step - loss: 0.0350 - accuracy: 0.9889 - val_loss: 0.0307 - val_accuracy: 0.9918
Epoch 15/15
422/422 [==============================] - 1s 3ms/step - loss: 0.0316 - accuracy: 0.9897 - val_loss: 0.0257 - val_accuracy: 0.9920
Test loss: 0.02512264996767044
Test accuracy: 0.9918000102043152
```
