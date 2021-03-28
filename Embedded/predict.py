import tensorflow as tf
from numpy import load

gpus = tf.config.experimental.list_physical_devices('GPU')
tf.config.experimental.set_memory_growth(gpus[0], True)

model = tf.keras.models.load_model("model/mask_detector.h5")

img = load('/tmp/picture.npy')

int(model.predict(img))