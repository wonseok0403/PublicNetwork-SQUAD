pragma solidity ^0.4.17;

contract SimpleStorage {
  uint myVariable;
  struct IoTDevice {
    string Name;
    int CheckSum;
  }
  IoTDevice[] devices;

  function setIoT(string x, int y) public {
    devices.push(IoTDevice({Name: x, CheckSum: y}));
  }
  function getIoTDeviceCheckSum(string x) constant public returns (int) {
    uint i;
    for( i=0; i<devices.length ; i++) {
      if( keccak256(x) == keccak256(devices[i].Name) ){
        return devices[i].CheckSum;
      }
    }
    return -1;
  }

  function set(uint x) public {
    myVariable = x;
  }


  function get() constant public returns (uint) {
    return myVariable;
  }
}
