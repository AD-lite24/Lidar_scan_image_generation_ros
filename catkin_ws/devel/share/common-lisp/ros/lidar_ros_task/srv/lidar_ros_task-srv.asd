
(cl:in-package :asdf)

(defsystem "lidar_ros_task-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "lidar" :depends-on ("_package_lidar"))
    (:file "_package_lidar" :depends-on ("_package"))
  ))