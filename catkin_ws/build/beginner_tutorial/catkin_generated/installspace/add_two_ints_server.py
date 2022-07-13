#!/usr/bin/env python3
   2 
   3 from __future__ import print_function
   4 
   5 from beginner_tutorials.srv import AddTwoInts,AddTwoIntsResponse
   6 import rospy
   7 
   8 def handle_add_two_ints(req):
   9     print("Returning [%s + %s = %s]"%(req.a, req.b, (req.a + req.b)))
  10     return AddTwoIntsResponse(req.a + req.b)
  11 
  12 def add_two_ints_server():
  13     rospy.init_node('add_two_ints_server')
  14     s = rospy.Service('add_two_ints', AddTwoInts, handle_add_two_ints)
  15     print("Ready to add two ints.")
  16     rospy.spin()
  17 
  18 if __name__ == "__main__":
  19     add_two_ints_server()
