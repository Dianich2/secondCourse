let user = {
    name: "Valentine",
    age: 19
};

let admin = {
    isAdmin: true,
    ...user
}

console.log(admin);