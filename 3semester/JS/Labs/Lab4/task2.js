let studentsList = new Set();

function addStudent(student){
    studentsList.add(student);
}

function removeStudent(gradeNumber){
    for(student of studentsList){
        if (student.gradeNumber == gradeNumber){
            studentsList.delete(student);
        }
    }
}

function filterByGroup(set){
    let arr = Array.from(set);
    set.clear();
    arr.sort((el1, el2) => el1.group > el2.group ? 1 : -1);
    arr.forEach(element => {
        set.add(element);
    });
}

function sortByGradeNubmer(set){
    let arr = Array.from(set);
    set.clear();
    arr.sort((el1, el2) => el1.gradeNumber > el2.gradeNumber ? 1 : -1);
    arr.forEach(element =>{
        set.add(element);
    })
}


addStudent({gradeNumber: 689, group: 4, fio: "Student1"});
addStudent({gradeNumber: 345, group: 1, fio: "Student2"});
addStudent({gradeNumber: 167, group: 2, fio: "Strudent3"});
addStudent({gradeNumber: 789, group: 1, fio: "Student4"});

filterByGroup(studentsList);
console.log(studentsList);

sortByGradeNubmer(studentsList);
console.log(studentsList);

removeStudent(345);
console.log(studentsList);