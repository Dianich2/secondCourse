
function filterStudentsByGroup(students) {
    let resultObject = {};
  
    students.forEach((student) => {
      let { name, age, groupId } = student;
      if (age > 17) {
        if (resultObject[groupId]) {
          resultObject[groupId].push(student);
        } else {
          resultObject[groupId] = [student];
        }
      }
    });
    return resultObject;
}

let students = [
    { name: 'Eva', age: 19, groupId: 2 },
    { name: 'Addy', age: 17, groupId: 1 },
    { name: 'Deni', age: 16, groupId: 1 },
    { name: 'Raul', age: 15, groupId: 2 },
    { name: 'Hannah', age: 21, groupId: 1 },
    { name: "Dany", age: 22, groupId : 2},
    { name: "Lee", age:23, groupId: 1 },
  ];
  
let filteredStudents = filterStudentsByGroup(students);
console.log(filteredStudents);