#!/usr/bin/env python

from enum import EnumMeta
from shutil import move
from turtle import right
from lidar_ros_task.srv import lidar, lidarResponse
import sys
import rospy 
import PIL
from PIL import Image, ImageDraw
import math



new_map = PIL.Image.new(mode = '1', size = (400, 400))
end_point = (2, 395)

#distance calculator function
def check_dist(coords, current):
    dist = math.sqrt((coords[0] - current[0])*(coords[0] - current[0]) + (coords[1]-current[1])*(coords[1]-current[1]))
    return dist

#function to create the map from scans
def create_map(centerX, centerY, lidar_scan_readings, map):
    num = 0

    print(type(lidar_scan_readings))

    if len(lidar_scan_readings) == 0:
        print ('no scans detected')

    for values in lidar_scan_readings:
        try:
            r = values[0]
            i = values[1]

            x_pos = int(r*math.cos(i*math.pi/180) + centerX - 2)
            y_pos = int(r*math.sin(i*math.pi/180) + centerY + 1)

            #for testing purposes
            print("angle = ", i, "r =", r, "x_pos =", x_pos, "y_pos =", y_pos, "current coords = ", (centerX, centerY))

            #for cleaning up the border points
            if (380<=x_pos and x_pos<=400) or (0 <= x_pos and x_pos<=10) or (380<=y_pos and y_pos<=400) or (0 <= y_pos and y_pos<=10):
                print('skipped')
                continue
            
            #colouring pixels on the map
            map_pixels = map.load()
            num = num + 1
            map_pixels[x_pos, y_pos] = 255
            print('created point on map')  
        except:
            #To deal with the expcetions, such as positions being out of range
            continue
    print(num)


def move_bot(current_x, current_y, lidar_scan_readings, map, num_scans):

    if num_scans == 25:
        print('max number of scans finsished, please check completed map')
        return

    create_map(current_x, current_y, lidar_scan_readings, map)

    data = []
    dists = []
    next_coord = ()

    for values in lidar_scan_readings:
        r = values[0]
        i = values[1]

        x_pos = int(r*math.cos(i*math.pi/180) + current_x - 2)
        y_pos = int(r*math.sin(i*math.pi/180) + current_y + 1)

        data.append(((x_pos, y_pos), check_dist((x_pos, y_pos), (current_x, current_y))))
        dists.append(check_dist((x_pos, y_pos), (current_x, current_y)))
    
    max_dist = max(dists)
    print('coord farthest away from current pos is:', max_dist)
    for item in data:
        if item[1] == max_dist:
            next_coord = item[0]
            print('coord set')
            break
        else:
            print('no coord set')
    
    print(next_coord)
    num_scans = num_scans + 1
    move_bot(next_coord[0], next_coord[1], lidar_clien_func(next_coord[0], next_coord[1]), map, num_scans)
    
    
    



#Let's hope this part works, fingers crossed lol :)
def lidar_clien_func (x, y):
    rospy.wait_for_service('scan')

    try:
        scan_data = rospy.ServiceProxy('scan', lidar)
        resp1 = scan_data(x, y)
        scan_values = []
        for i, j in enumerate(resp1.lidar_array):
            if (i%2 == 0):
                scan_values.append((resp1.lidar_array[i+1],j))
        return scan_values


    except rospy.ServiceException as e:
        print("Service call failed: %s"%e)

def usage():
    return "%s [x, y]"%sys.argv[0]



if __name__ == "__main__":
    
    #didn't erase because i was afraid it might break something
    if len(sys.argv) == 3:
        x = int (sys.argv[1])
        y = int (sys.argv[2])
    
    else:
        print(usage())
        sys.exit(1)
    #Enter execution code here
    
    # create_map(399, 2, lidar_clien_func(399, 2), new_map)
    move_bot(399, 2, lidar_clien_func(399, 2), new_map, 0)
    # create_map(300, 300, lidar_clien_func(300,300), new_map)
    new_map.save("new_map_9.jpg")  
    print('test')
    
