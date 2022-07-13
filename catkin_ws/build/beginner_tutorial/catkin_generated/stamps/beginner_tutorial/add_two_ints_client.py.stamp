#!/usr/bin/env python
   2 
   3 from __future__ import print_function
   4 
   5 import sys
   6 import rospy
   7 from beginner_tutorials.srv import *
   8 
   9 def add_two_ints_client(x, y):
  10     rospy.wait_for_service('add_two_ints')
  11     try:
  12         add_two_ints = rospy.ServiceProxy('add_two_ints', AddTwoInts)
  13         resp1 = add_two_ints(x, y)
  14         return resp1.sum
  15     except rospy.ServiceException as e:
  16         print("Service call failed: %s"%e)
  17 
  18 def usage():
  19     return "%s [x y]"%sys.argv[0]
  20 
  21 if __name__ == "__main__":
  22     if len(sys.argv) == 3:
  23         x = int(sys.argv[1])
  24         y = int(sys.argv[2])
  25     else:
  26         print(usage())
  27         sys.exit(1)
  28     print("Requesting %s+%s"%(x, y))
  29     print("%s + %s = %s"%(x, y, add_two_ints_client(x, y)))
