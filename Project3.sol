// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SchoolGradingSystem {
    address public admin;

    struct Student {
        uint id;
        string name;
        mapping(string => uint) grades; // Course name to grade mapping
        string[] courses; // List of courses taken by the student
    }

    mapping(uint => Student) public students; // Student ID to Student struct mapping
    uint public studentCount;

    event StudentAdded(uint studentId, string name);
    event GradeAssigned(uint studentId, string course, uint grade);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can call this function");
        _;
    }

    constructor() {
        admin = msg.sender; // Set the contract deployer as the admin
    }

    function addStudent(string memory name) public onlyAdmin {
        // Using assert to ensure the name is not empty (internal consistency check)
        assert(bytes(name).length > 0);

        studentCount++;
        Student storage student = students[studentCount];
        student.id = studentCount;
        student.name = name;

        emit StudentAdded(studentCount, name);
    }

    function assignGrade(uint studentId, string memory course, uint grade) public onlyAdmin {
        require(studentId > 0 && studentId <= studentCount, "Student does not exist");
        require(grade <= 100, "Grade must be between 0 and 100");

        Student storage student = students[studentId];

        // Using revert to handle the condition where the same course is being assigned a grade again
        for (uint i = 0; i < student.courses.length; i++) {
            if (keccak256(bytes(student.courses[i])) == keccak256(bytes(course))) {
                revert("Course grade already assigned");
            }
        }

        student.grades[course] = grade;
        student.courses.push(course);

        emit GradeAssigned(studentId, course, grade);
    }

    function getGrade(uint studentId, string memory course) public view returns (uint) {
        require(studentId > 0 && studentId <= studentCount, "Student does not exist");
        Student storage student = students[studentId];

        // Using require to ensure the course has a grade assigned
        require(student.grades[course] != 0, "Course grade not found");

        return student.grades[course];
    }

    function getAverageGrade(uint studentId) public view returns (uint) {
        require(studentId > 0 && studentId <= studentCount, "Student does not exist");

        Student storage student = students[studentId];
        uint totalGrades = 0;
        uint totalCourses = student.courses.length;

        // Using assert to ensure totalCourses is not zero before dividing
        assert(totalCourses > 0);

        for (uint i = 0; i < totalCourses; i++) {
            totalGrades += student.grades[student.courses[i]];
        }

        return totalGrades / totalCourses;
    }
}
