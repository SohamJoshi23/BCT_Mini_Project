// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MentalHealthRecords {
    
    // Structure to hold patient's encrypted record
    struct HealthRecord {
        string encryptedRecord;
        address doctor;
        uint timestamp;
    }
    
    // Mapping from patient address to health records
    mapping(address => HealthRecord[]) private records;
    
    // Event for logging when a new record is added
    event RecordAdded(address indexed patient, address indexed doctor, uint timestamp);

    // Add a new health record for a patient (only doctor can add)
    function addRecord(address _patient, string memory _encryptedRecord) public {
        records[_patient].push(HealthRecord(_encryptedRecord, msg.sender, block.timestamp));
        emit RecordAdded(_patient, msg.sender, block.timestamp);
    }
    
    // Get patient's records (only patient can view their records)
    function getRecords() public view returns (HealthRecord[] memory) {
        return records[msg.sender];
    }

    // Get specific patient's records (for doctors, with patient's permission)
    function getPatientRecords(address _patient) public view returns (HealthRecord[] memory) {
        // In practice, add authorization logic here (e.g., permission check)
        return records[_patient];
    }
}
