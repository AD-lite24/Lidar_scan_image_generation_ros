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

def check_dist(coords):
    dist = math.sqrt((coords[0] - end_point[0])*(coords[0] - end_point[0]) + (coords[1]-end_point[1])*(coords[1]-end_point[1]))
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

            if (380<=x_pos and x_pos<=400) or (0 <= x_pos and x_pos<=10) or (380<=y_pos and y_pos<=400) or (0 <= y_pos and y_pos<=10):
                print('skipped')
                continue

            map_pixels = map.load()
            num = num + 1
            map_pixels[x_pos, y_pos] = 255
            print('created point on map')  
        except:
            continue
    print(num)

#function to move bot around the map
def move_bot(current_x, current_y, lidar_scan_readings, map):

    create_map(current_x, current_y, lidar_scan_readings, map)
    
    if len(lidar_scan_readings) == 0:
        print ('no scans happened')

    visited_tiles = []
    dirs = [0 ,1, 2, 3]

    if current_x == end_point[0] and current_y == end_point[1]:
        print('end point reached please check generated map')
        #new_map.save("new_map_5.jpg") 
        return

    #for right
    i_0 = lidar_scan_readings[0][1]
    r_0 = lidar_scan_readings[0][0]
    right_coords = (int(r_0 + current_x + 4), int(current_y))

    #for bottom
    i_90 = lidar_scan_readings[90][1]
    r_90 = lidar_scan_readings[90][0]
    bottom_coords = (int(current_x), int(r_90 + current_y - 6))
    
    #for left
    i_180 = lidar_scan_readings[180][1]
    r_180 = lidar_scan_readings[180][0]
    left_coords = (int(-r_180 + current_x + 4), int(current_y))

    #for top
    i_270 = lidar_scan_readings[270][1]
    r_270 = lidar_scan_readings[270][0]
    top_coords = (int(current_x), int(-r_270 + current_y - 6))

    min_dist = min(check_dist(left_coords), check_dist(top_coords), check_dist(right_coords), check_dist(bottom_coords))

    if min_dist == check_dist(left_coords) and left_coords not in visited_tiles:
        current_x = left_coords[0]
        current_y = left_coords[1]
        print('went left to', (current_x, current_y))

    elif min_dist == check_dist(top_coords) and top_coords not in visited_tiles:
        current_x = top_coords[0]
        current_y = top_coords[1]
        print('went up to', (current_x, current_y))

    elif min_dist == check_dist(right_coords) and right_coords not in visited_tiles:
        current_x = right_coords[0]
        current_y = right_coords[1]
        print('went right to', (current_x, current_y))

    elif min_dist == check_dist(bottom_coords) and bottom_coords not in visited_tiles:
        current_x = bottom_coords[0]
        current_y = bottom_coords[1]
        print('went down to', (current_x, current_y))

    visited_tiles.append((current_x, current_y))
    #create_map(current_x, current_y, lidar_clien_func(current_x, current_y), map)
    move_bot(current_x, current_y, lidar_clien_func(current_x, current_y), map)


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
    
    if len(sys.argv) == 3:
        x = int (sys.argv[1])
        y = int (sys.argv[2])
    
    else:
        print(usage())
        sys.exit(1)
    #Enter execution code here
    
    create_map(399, 2, lidar_clien_func(399, 2), new_map)
    move_bot(399, 2, lidar_clien_func(399, 2), new_map)
    create_map(300, 300, lidar_clien_func(300,300), new_map)
    new_map.save("new_map_8.jpg")  
    print('test')
    
