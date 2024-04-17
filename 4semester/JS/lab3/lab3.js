filterBySubject: function(subject: string): MarkType[]{
    return this.students.reduce((acc: MarkType[], stud: StudentType) => {
        let mark = stud.marks.filter(mark => mark.subject === subject);
        return acc.concat(mark);
    }, [])
},
