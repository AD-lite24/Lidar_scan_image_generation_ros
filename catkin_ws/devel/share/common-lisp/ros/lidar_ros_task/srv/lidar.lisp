; Auto-generated. Do not edit!


(cl:in-package lidar_ros_task-srv)


;//! \htmlinclude lidar-request.msg.html

(cl:defclass <lidar-request> (roslisp-msg-protocol:ros-message)
  ((centerX
    :reader centerX
    :initarg :centerX
    :type cl:integer
    :initform 0)
   (centerY
    :reader centerY
    :initarg :centerY
    :type cl:integer
    :initform 0))
)

(cl:defclass lidar-request (<lidar-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <lidar-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'lidar-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name lidar_ros_task-srv:<lidar-request> is deprecated: use lidar_ros_task-srv:lidar-request instead.")))

(cl:ensure-generic-function 'centerX-val :lambda-list '(m))
(cl:defmethod centerX-val ((m <lidar-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lidar_ros_task-srv:centerX-val is deprecated.  Use lidar_ros_task-srv:centerX instead.")
  (centerX m))

(cl:ensure-generic-function 'centerY-val :lambda-list '(m))
(cl:defmethod centerY-val ((m <lidar-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lidar_ros_task-srv:centerY-val is deprecated.  Use lidar_ros_task-srv:centerY instead.")
  (centerY m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <lidar-request>) ostream)
  "Serializes a message object of type '<lidar-request>"
  (cl:let* ((signed (cl:slot-value msg 'centerX)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'centerY)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <lidar-request>) istream)
  "Deserializes a message object of type '<lidar-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'centerX) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'centerY) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<lidar-request>)))
  "Returns string type for a service object of type '<lidar-request>"
  "lidar_ros_task/lidarRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'lidar-request)))
  "Returns string type for a service object of type 'lidar-request"
  "lidar_ros_task/lidarRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<lidar-request>)))
  "Returns md5sum for a message object of type '<lidar-request>"
  "876c4429855d6020f9989528c5e136d4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'lidar-request)))
  "Returns md5sum for a message object of type 'lidar-request"
  "876c4429855d6020f9989528c5e136d4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<lidar-request>)))
  "Returns full string definition for message of type '<lidar-request>"
  (cl:format cl:nil "int64 centerX~%int64 centerY~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'lidar-request)))
  "Returns full string definition for message of type 'lidar-request"
  (cl:format cl:nil "int64 centerX~%int64 centerY~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <lidar-request>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <lidar-request>))
  "Converts a ROS message object to a list"
  (cl:list 'lidar-request
    (cl:cons ':centerX (centerX msg))
    (cl:cons ':centerY (centerY msg))
))
;//! \htmlinclude lidar-response.msg.html

(cl:defclass <lidar-response> (roslisp-msg-protocol:ros-message)
  ((lidar_array
    :reader lidar_array
    :initarg :lidar_array
    :type (cl:vector cl:integer)
   :initform (cl:make-array 720 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass lidar-response (<lidar-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <lidar-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'lidar-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name lidar_ros_task-srv:<lidar-response> is deprecated: use lidar_ros_task-srv:lidar-response instead.")))

(cl:ensure-generic-function 'lidar_array-val :lambda-list '(m))
(cl:defmethod lidar_array-val ((m <lidar-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lidar_ros_task-srv:lidar_array-val is deprecated.  Use lidar_ros_task-srv:lidar_array instead.")
  (lidar_array m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <lidar-response>) ostream)
  "Serializes a message object of type '<lidar-response>"
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    ))
   (cl:slot-value msg 'lidar_array))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <lidar-response>) istream)
  "Deserializes a message object of type '<lidar-response>"
  (cl:setf (cl:slot-value msg 'lidar_array) (cl:make-array 720))
  (cl:let ((vals (cl:slot-value msg 'lidar_array)))
    (cl:dotimes (i 720)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<lidar-response>)))
  "Returns string type for a service object of type '<lidar-response>"
  "lidar_ros_task/lidarResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'lidar-response)))
  "Returns string type for a service object of type 'lidar-response"
  "lidar_ros_task/lidarResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<lidar-response>)))
  "Returns md5sum for a message object of type '<lidar-response>"
  "876c4429855d6020f9989528c5e136d4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'lidar-response)))
  "Returns md5sum for a message object of type 'lidar-response"
  "876c4429855d6020f9989528c5e136d4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<lidar-response>)))
  "Returns full string definition for message of type '<lidar-response>"
  (cl:format cl:nil "int64[720] lidar_array~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'lidar-response)))
  "Returns full string definition for message of type 'lidar-response"
  (cl:format cl:nil "int64[720] lidar_array~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <lidar-response>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'lidar_array) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <lidar-response>))
  "Converts a ROS message object to a list"
  (cl:list 'lidar-response
    (cl:cons ':lidar_array (lidar_array msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'lidar)))
  'lidar-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'lidar)))
  'lidar-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'lidar)))
  "Returns string type for a service object of type '<lidar>"
  "lidar_ros_task/lidar")