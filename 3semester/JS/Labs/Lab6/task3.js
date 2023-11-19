let store = {
    state: {
        profilePage: {
            posts: [
                {id: 1, message: "Hi", likesCount: 12},
                {id: 2, message: "By", likesCount: 1},
            ],
            newPostText: "About me",
        },
        dialogsPage: {
            dialogs: [
                {id: 1, name: "Valeria"},
                {id: 2, name: "Andrey"},
                {id: 3, name: "Sasha"},
                {id: 4, name: "Viktor"},
            ],
            messages: [
                {id: 1, text: "hi"},
                {id: 2, text: "hi hi"},
                {id: 3, text: "hi hi hi"},
            ],
        },
        sidebar: [],
    }
}

let {state: {profilePage: {posts}, dialogsPage: {dialogs, messages}, sidebar}} = store;

for (post of posts) {
    console.log(post.likesCount);
}

let newDialogs = dialogs.filter(function(dialog){
    return dialog.id % 2 == 0;
})

console.log(newDialogs);

messages.map(function(message){
    message.text = "Hello user";
})

console.log(messages);
