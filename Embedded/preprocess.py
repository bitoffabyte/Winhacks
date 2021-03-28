import cv2
from numpy import array, save
from os import remove

path = "/tmp/picture.jpg"

img_size = 100
img = cv2.imread(path, cv2.IMREAD_COLOR)
resize = cv2.resize(img, (img_size, img_size))
resize = array(resize).reshape(-1, img_size, img_size, 3)
save('/tmp/picture.npy', resize)

remove(path)