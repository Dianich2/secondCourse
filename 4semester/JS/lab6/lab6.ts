
type id = number;
type name = string;
type group = number;
type arrayElement = {id:id, name:name, group:group};
const array: arrayElement[] = [
    {id: 1, name: 'name1', group: 1},
    {id: 2, name: 'name2', group: 12},
    {id: 3, name: 'name3', group: 3},
    {id: 4, name: 'name4', group: 4},
    {id: 5, name: 'name5', group: 5},
];





type CarType = {
    model?: string;
    manufacturer?: string;
};
type ArrayCarsType = {cars:CarType[]};

let car: CarType = {}; //объект создан!
car.manufacturer = "manufacturer";
car.model = 'model';

const car1: CarType = {}; //объект создан!
car1.manufacturer = "manufacturer";
car1.model = 'model';

const car2: CarType = {}; //объект создан!
car2.manufacturer = "manufacturer";
car2.model = 'model';

const arrayCars: Array<ArrayCarsType> = [{
    cars: [car1, car2]
}];

let arrayCars2: ArrayCarsType[];




type MarkFilterType = 1|2|3|4|5|6|7|8|9|10;
type PassedType = boolean;
type GroupFilterType = MarkFilterType|11|12;
type MarkType = {
    subject: string,
    mark: MarkFilterType, // может принимать значения от 1 до 10
    passed: PassedType,
};
type StudentType = {
    id: number,
    name: string,
    group: GroupFilterType, // может принимать значения от 1 до 12
    marks: Array<MarkType>,
};
type studentsArray = Array<StudentType>;
type GroupType = {
    students: studentsArray,// массив студентов типа StudentType
    studentsFilter: (group: number) => Array<StudentType>, // фильтр по группе
    marksFilter: (mark: number) => Array<StudentType>, // фильтр по  оценке
    deleteStudent: (id: number) => void, // удалить студента по id из  исходного массива
    mark: MarkFilterType,
    group: GroupFilterType,
};


let student1: StudentType={
    id:1,
    name: "student 1",
    group: 7,
    marks: [
        {subject: "Java", mark:10, passed:true},
        {subject: "JS", mark:10, passed:true},
        {subject: "OOP", mark:10, passed:true}
    ]
};
let student2: StudentType={
    id:2,
    name: "student 2",
    group: 4,
    marks: [
        {subject: "Java", mark:5, passed:true},
        {subject: "JS", mark:3, passed:false},
        {subject: "OOP", mark:6, passed:true}
    ]
};
let Group:GroupType = {
    students: new Array<StudentType>(student1,student2),
    studentsFilter: (group: number) => {
        let arr:Array<StudentType> = Group.students.filter((stud: StudentType) => stud.group === group);
        return arr

    },
    marksFilter: (markk: number) => {
        let arr:Array<StudentType> = 
        Group.students.filter((stud:StudentType)=> stud.marks.every(mark => mark.mark === markk));
        return arr;
    },
    deleteStudent:(id: number) => {
        Group.students = Group.students.filter((stud:StudentType)=> stud.id != id)
    },
    mark: 5,
    group:12
};

// console.log(Group.studentsFilter(4));
// console.log("----");
// console.log(Group.marksFilter(10));
// console.log("-----");
// Group.deleteStudent(1);
// console.log(Group.students);
// console.log("----");

