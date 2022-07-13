// Auto-generated. Do not edit!

// (in-package lidar_ros_task.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class lidarRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.centerX = null;
      this.centerY = null;
    }
    else {
      if (initObj.hasOwnProperty('centerX')) {
        this.centerX = initObj.centerX
      }
      else {
        this.centerX = 0;
      }
      if (initObj.hasOwnProperty('centerY')) {
        this.centerY = initObj.centerY
      }
      else {
        this.centerY = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type lidarRequest
    // Serialize message field [centerX]
    bufferOffset = _serializer.int64(obj.centerX, buffer, bufferOffset);
    // Serialize message field [centerY]
    bufferOffset = _serializer.int64(obj.centerY, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type lidarRequest
    let len;
    let data = new lidarRequest(null);
    // Deserialize message field [centerX]
    data.centerX = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [centerY]
    data.centerY = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a service object
    return 'lidar_ros_task/lidarRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '85578d4a6a7df81c0c963f713c5c5d68';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 centerX
    int64 centerY
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new lidarRequest(null);
    if (msg.centerX !== undefined) {
      resolved.centerX = msg.centerX;
    }
    else {
      resolved.centerX = 0
    }

    if (msg.centerY !== undefined) {
      resolved.centerY = msg.centerY;
    }
    else {
      resolved.centerY = 0
    }

    return resolved;
    }
};

class lidarResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.lidar_array = null;
    }
    else {
      if (initObj.hasOwnProperty('lidar_array')) {
        this.lidar_array = initObj.lidar_array
      }
      else {
        this.lidar_array = new Array(720).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type lidarResponse
    // Check that the constant length array field [lidar_array] has the right length
    if (obj.lidar_array.length !== 720) {
      throw new Error('Unable to serialize array field lidar_array - length must be 720')
    }
    // Serialize message field [lidar_array]
    bufferOffset = _arraySerializer.int64(obj.lidar_array, buffer, bufferOffset, 720);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type lidarResponse
    let len;
    let data = new lidarResponse(null);
    // Deserialize message field [lidar_array]
    data.lidar_array = _arrayDeserializer.int64(buffer, bufferOffset, 720)
    return data;
  }

  static getMessageSize(object) {
    return 5760;
  }

  static datatype() {
    // Returns string type for a service object
    return 'lidar_ros_task/lidarResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '45165b919dd9aa7c6369c740dbaf4661';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64[720] lidar_array
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new lidarResponse(null);
    if (msg.lidar_array !== undefined) {
      resolved.lidar_array = msg.lidar_array;
    }
    else {
      resolved.lidar_array = new Array(720).fill(0)
    }

    return resolved;
    }
};

module.exports = {
  Request: lidarRequest,
  Response: lidarResponse,
  md5sum() { return '876c4429855d6020f9989528c5e136d4'; },
  datatype() { return 'lidar_ros_task/lidar'; }
};
