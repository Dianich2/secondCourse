var array = [
    { id: 1, name: 'name1', group: 1 },
    { id: 2, name: 'name2', group: 12 },
    { id: 3, name: 'name3', group: 3 },
    { id: 4, name: 'name4', group: 4 },
    { id: 5, name: 'name5', group: 5 },
];
var car = {}; //объект создан!
car.manufacturer = "manufacturer";
car.model = 'model';
var car1 = {}; //объект создан!
car1.manufacturer = "manufacturer";
car1.model = 'model';
var car2 = {}; //объект создан!
car2.manufacturer = "manufacturer";
car2.model = 'model';
var arrayCars = [{
        cars: [car1, car2]
    }];
var arrayCars2;
var student1 = {
    id: 1,
    name: "student 1",
    group: 7,
    marks: [
        { subject: "Java", mark: 10, passed: true },
        { subject: "JS", mark: 10, passed: true },
        { subject: "OOP", mark: 10, passed: true }
    ]
};
var student2 = {
    id: 2,
    name: "student 2",
    group: 4,
    marks: [
        { subject: "Java", mark: 10, passed: true },
        { subject: "JS", mark: 3, passed: false },
        { subject: "OOP", mark: 6, passed: true }
    ]
};
var Group = {
    students: new Array(student1, student2),
    studentsFilter: function (group) {
        var arr = Group.students.filter(function (stud) { return stud.group === group; });
        return arr;
    },
    marksFilter: function (markk) {
        var arr = Group.students.filter(function (stud) { return stud.marks.every(function (mark) { return mark.mark === markk; }); });
        return arr;
    },
    deleteStudent: function (id) {
        Group.students = Group.students.filter(function (stud) { return stud.id != id; });
    },
    mark: 5,
    group: 12
};
// console.log(Group.studentsFilter(4));
// console.log("----");
// console.log(Group.marksFilter(10));
// console.log("-----");
// Group.deleteStudent(1);
// console.log(Group.students);
// console.log("----");
console.log(Group.marksFilter(10));
