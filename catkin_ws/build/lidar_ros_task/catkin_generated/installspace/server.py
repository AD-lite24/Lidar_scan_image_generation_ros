#!/usr/bin/env python3
from lidar_ros_task.srv import lidar,lidarResponse
import rospy
import PIL
from PIL import Image
import pathlib
import math
def scanner(req):
    image = Image.open(pathlib.Path('map4.jpg'))
    image = image.convert('1')

    return_array = []

    no_of_rays = 360

    image.thumbnail((400, 400))

    image_size = min(image.size)

    if image.getpixel((req.centerX, req.centerY)) == 0:
        print('invalid')
    else:
        for i in range(0,360,int(360/no_of_rays)):
            r = 0

            currentX = round(req.centerX + r*math.cos(i*math.pi/180))
            currentY = round(req.centerY + r*math.sin(i*math.pi/180))

            while ((currentX < image_size and currentX >= 0) and (currentY < image_size and currentY >=0) and (image.getpixel((currentX, currentY)) != 0)):
                currentX = round(req.centerX + r*math.cos(i*math.pi/180))
                currentY = round(req.centerY + r*math.sin(i*math.pi/180))
                r+=1

            return_array.append(i)
            return_array.append(r)

    return lidarResponse(return_array)

def lidar_server():
    rospy.init_node('lidar_server')
    s = rospy.Service('scan', lidar, scanner)
    rospy.spin()

if __name__ == "__main__":
    lidar_server()

#!/usr/bin/env python
from lidar.srv import lidar,lidarResponse
import rospy
import PIL
from PIL import Image
import pathlib
import math
def scanner(req):
    image = Image.open(pathlib.Path('map4.jpg'))
    image = image.convert('1')

    return_array = []

    no_of_rays = 360

    image.thumbnail((400, 400))

    image_size = min(image.size)

    if image.getpixel((req.centerX, req.centerY)) == 0:
        print('invalid')
    else:
        for i in range(0,360,int(360/no_of_rays)):
            r = 0

            currentX = round(req.centerX + r*math.cos(i*math.pi/180))
            currentY = round(req.centerY + r*math.sin(i*math.pi/180))

            while ((currentX < image_size and currentX >= 0) and (currentY < image_size and currentY >=0) and (image.getpixel((currentX, currentY)) != 0)):
                currentX = round(req.centerX + r*math.cos(i*math.pi/180))
                currentY = round(req.centerY + r*math.sin(i*math.pi/180))
                r+=1

            return_array.append(i)
            return_array.append(r)

    return lidarResponse(return_array)

def lidar_server():
    rospy.init_node('lidar_server')
    s = rospy.Service('scan', lidar, scanner)
    rospy.spin()

if __name__ == "__main__":
    lidar_server()


