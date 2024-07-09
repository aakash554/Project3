# Project: SchoolGradingSystem Smart Contract: Understanding Error Handling

# Introduction
This document explains the use of require, assert, and revert in the SchoolGradingSystem smart contract.

# Error Handling in Solidity
Solidity provides three functions for error handling:
- `require()`
- `assert()`
- `revert()`

Each serves a specific purpose in ensuring contract integrity and proper execution.

### require()

`require()` is used for input validation and checking conditions that should be met for the function to proceed.

Usage in SchoolGradingSystem:

```solidity
function assignGrade(uint studentId, string memory course, uint grade) public onlyAdmin {
    require(studentId > 0 && studentId <= studentCount, "Student does not exist");
    require(grade <= 100, "Grade must be between 0 and 100");
    // ... (rest of the function)
}
```
In this example, require() is used to validate that the student exists and that the grade is within a valid range.

### assert()

`assert()` is used to check for internal errors and invariants. It should only fail in case of a bug in the code.

Usage in SchoolGradingSystem:

```solidity
function addStudent(string memory name) public onlyAdmin {
    assert(bytes(name).length > 0);
    // ... (rest of the function)
}
```
Here, assert() is used to ensure that the student name is not empty, which is considered an internal consistency check.

### revert()

`revert()` is used to flag an error and revert the current call. It can provide a reason for the revert.

Usage in SchoolGradingSystem:

```solidity
function assignGrade(uint studentId, string memory course, uint grade) public onlyAdmin {
    // ... (previous code)
    for (uint i = 0; i < student.courses.length; i++) {
        if (keccak256(bytes(student.courses[i])) == keccak256(bytes(course))) {
            revert("Course grade already assigned");
        }
    }
    // ... (rest of the function)
}
```
In this case, revert() is used to handle the condition where a grade is being assigned to a course that already has a grade.

### Additional Error Handling Examples

#### Using require() in a View Function:

```solidity
function getGrade(uint studentId, string memory course) public view returns (uint) {
    require(studentId > 0 && studentId <= studentCount, "Student does not exist");
    Student storage student = students[studentId];
    require(student.grades[course] != 0, "Course grade not found");
    return student.grades[course];
}
```
This function uses `require()` to check if the student exists and if the course has a grade assigned.

##### Using assert() to Prevent Division by Zero:

```solidity
function getAverageGrade(uint studentId) public view returns (uint) {
    // ... (previous code)
    uint totalCourses = student.courses.length;
    assert(totalCourses > 0);
    // ... (rest of the function)
}
```
Here, `assert()` is used to ensure that division by zero doesn't occur when calculating the average grade.

## Conclusion
The SchoolGradingSystem contract effectively uses all three error handling mechanisms:

`require()` for input validation and state checks
`assert()` for internal consistency checks
`revert()` for specific error conditions

This comprehensive approach to error handling helps ensure the contract's robustness and reliability in managing student grades.

## Authors

Contributors names and contact info

Aakash Sharma  
(aakasharma5504@gmail.com)
