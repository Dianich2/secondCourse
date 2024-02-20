


let form = document.getElementById("studentForm");
let submitButton = document.getElementById("submitButton");

form.addEventListener("submit", function(event){

    event.preventDefault();

    let firstNameInput = document.getElementById("firstName");
    let secondNameInput = document.getElementById("secondName");
    let emainInput = document.getElementById("email");
    let telInput = document.getElementById("telNumber");
    let aboutMeInput = document.getElementById("aboutMe");
    let isInBstu = document.getElementById("isInBSTU");
    let city = document.getElementById("city").value;
    let course = document.getElementById("course");
    

    let isInBstuConfirm = false;
    let cityConfirm = false;
    let courseConfirm = false;


    let isFirstNameValid = validateFirstName(firstNameInput);
    let isSecondNameValid = validateSecondName(secondNameInput);
    let isEmailValid = validateEmail(emainInput);
    let isTelValid = validateTelNumber(telInput);
    let isAboutMeValid = validateAboutMe(aboutMeInput)

    
    if(!isInBstu.checked){
        isInBstuConfirm = confirm("Вы точно учитесь в БГТУ?");
    }
    if(city != "Минск"){
        cityConfirm = confirm("Вы точно учитесь не в Минске?");
    }
    if(!course.checked){
        courseConfirm = confirm("Вы правильно указали курс?");
    }

    
    if(isFirstNameValid && isSecondNameValid && isEmailValid
        && isTelValid && isAboutMeValid && isInBstuConfirm && cityConfirm && courseConfirm) {
        form.submit();
    }

});

function validateFirstName(firstNameInput){
    let errorSpan = document.getElementById("firstNameError")
    let brakeLine = document.createElement("br");
    brakeLine.id = "brakelineId";

    if(firstNameInput.value.trim() === ""){
        if(errorSpan){
            errorSpan.textContent = "Поле не должно быть пустым";
            return false;
        }
        errorSpan = document.createElement('span');
        errorSpan.id = "firstNameError";

        errorSpan.textContent = "Поле не должно быть пустым";
        errorSpan.style.color = "red";
        firstNameInput.insertAdjacentElement("afterend", errorSpan);
        firstNameInput.insertAdjacentElement("afterend", brakeLine);

        return false;
    }
    if(firstNameInput.value.length > 20){
        if(errorSpan){
            errorSpan.textContent = "Поле не должно содержать более 20 символов"
            return false;
        }
        errorSpan = document.createElement('span');
        errorSpan.id = "firstNameError";

        errorSpan.textContent = "Поле не должно содержать более 20 символов";
        errorSpan.style.color = "red";
        firstNameInput.insertAdjacentElement("afterend", brakeLine);
        firstNameInput.insertAdjacentElement("afterend", errorSpan);
        return false;
    }
    if(!/^[а-яА-Яa-zA-Z]+$/.test(firstNameInput.value.trim())){
        if(errorSpan){
            errorSpan.textContent = "Поле должно содержать только символы русского и английского алфавита";
            return false;
        }
        errorSpan = document.createElement('span');
        errorSpan.id = "firstNameError";

        errorSpan.textContent = "Поле должно содержать только символы русского и английского алфавита";
        errorSpan.style.color = "red";
        firstNameInput.insertAdjacentElement("afterend", errorSpan);
        firstNameInput.insertAdjacentElement("afterend", brakeLine);

        return false;
    }
    errorSpan.parentNode.removeChild(errorSpan);
    brakeLine = document.getElementById("brakelineId");
    brakeLine.parentNode.removeChild(brakeLine);
    return true;
}

function validateSecondName(secondNameInput){
    let errorSpan = document.getElementById("secondNameError")
    let brakeLine = document.createElement("br");
    brakeLine.id = "brakelineIdSecond";

    if(secondNameInput.value.trim() === ""){
        if(errorSpan){
            errorSpan.textContent = "Поле не должно быть пустым";
            return false;
        }
        errorSpan = document.createElement('span');
        errorSpan.id = "secondNameError";

        errorSpan.textContent = "Поле не должно быть пустым";
        errorSpan.style.color = "red";
        secondNameInput.insertAdjacentElement("afterend", errorSpan);
        secondNameInput.insertAdjacentElement("afterend", brakeLine);

        return false;
    }
    if(secondNameInput.value.length > 20){
        if(errorSpan){
            errorSpan.textContent = "Поле не должно содержать более 20 символов"
            return false;
        }
        errorSpan = document.createElement('span');
        errorSpan.id = "secondNameError";

        errorSpan.textContent = "Поле не должно содержать более 20 символов";
        errorSpan.style.color = "red";
        secondNameInput.insertAdjacentElement("afterend", brakeLine);
        secondNameInput.insertAdjacentElement("afterend", errorSpan);
        return false;
    }
    if(!/^[а-яА-Яa-zA-Z]+$/.test(secondNameInput.value)){
        if(errorSpan){
            errorSpan.textContent = "Поле должно содержать только символы русского и английского алфавита";
            return false;
        }
        errorSpan = document.createElement('span');
        errorSpan.id = "secondNameError";

        errorSpan.textContent = "Поле должно содержать только символы русского и английского алфавита";
        errorSpan.style.color = "red";
        secondNameInput.insertAdjacentElement("afterend", errorSpan);
        secondNameInput.insertAdjacentElement("afterend", brakeLine);

        return false;
    }
    
    errorSpan.parentNode.removeChild(errorSpan);
    brakeLine = document.getElementById("brakelineIdSecond");
    brakeLine.parentNode.removeChild(brakeLine);
    return true;
}

function validateEmail(emailInput) {
    let errorSpan = document.getElementById("emailError");
    let brakeLine = document.createElement("br");
    brakeLine.id = "brakelineIdEmail";

    let emailParts = emailInput.value.split("@");
    if (emailParts.length !== 2 || emailParts[0].length === 0 || emailParts[1].length === 0) {
        if (errorSpan) {
            errorSpan.textContent = "Некорректный формат email";
            return false;
        }
        errorSpan = document.createElement('span');
        errorSpan.id = "emailError";

        errorSpan.textContent = "Некорректный формат email";
        errorSpan.style.color = "red";
        emailInput.insertAdjacentElement("afterend", errorSpan);
        emailInput.insertAdjacentElement("afterend", brakeLine);
        return false;
    }

    let domainParts = emailParts[1].split(".");
    if (domainParts.length !== 2 || domainParts[0].length < 2 || domainParts[0].length > 5 || domainParts[1].length < 2 || domainParts[1].length > 3) {
        if (errorSpan) {
            errorSpan.textContent = "Некорректный формат домена (@ххххх.ххх)";
            return false;
        }
        errorSpan = document.createElement('span');
        errorSpan.id = "emailError";

        errorSpan.textContent = "Некорректный формат домена (@ххххх.ххх)";
        errorSpan.style.color = "red";
        emailInput.insertAdjacentElement("afterend", errorSpan);
        emailInput.insertAdjacentElement("afterend", brakeLine);
        return false;
    }

    errorSpan.parentNode.removeChild(errorSpan);
    brakeLine = document.getElementById("brakelineIdEmail");
    brakeLine.parentNode.removeChild(brakeLine);

    return true;
}

function validateTelNumber(phoneInput) {
    let errorSpan = document.getElementById("phoneError");
    let brakeLine = document.createElement("br");
    brakeLine.id = "brakelineIdTel";

    if (!/^\(\d{3}\)\d{3}-\d{2}-\d{2}$/.test(phoneInput.value)) {
        if (errorSpan) {
            errorSpan.textContent = "Некорректный формат телефона";
            return false;
        }
        errorSpan = document.createElement('span');
        errorSpan.id = "phoneError";

        errorSpan.textContent = "Некорректный формат телефона";
        errorSpan.style.color = "red";
        phoneInput.insertAdjacentElement("afterend", errorSpan);
        phoneInput.insertAdjacentElement("afterend", brakeLine);
        return false;
    }

    errorSpan.parentNode.removeChild(errorSpan);
    brakeLine = document.getElementById("brakelineIdTel");
    brakeLine.parentNode.removeChild(brakeLine);

    return true;
}

function validateAboutMe(aboutMeInput) {
    let errorSpan = document.getElementById("aboutMeError");
    let brakeLine = document.createElement("br");
    brakeLine.id = "brakelineIdMe";

    if (aboutMeInput.value.trim() === "") {
        if (errorSpan) {
            errorSpan.textContent = "Поле не должно быть пустым";
            return false;
        }
        errorSpan = document.createElement('span');
        errorSpan.id = "aboutMeError";

        errorSpan.textContent = "Поле не должно быть пустым";
        errorSpan.style.color = "red";
        aboutMeInput.insertAdjacentElement("afterend", errorSpan);
        aboutMeInput.insertAdjacentElement("afterend", brakeLine);

        return false;
    }

    if (aboutMeInput.value.length > 250) {
        if (errorSpan) {
            errorSpan.textContent = "Размер поля не должен превышать 250 символов";
            return false;
        }
        errorSpan = document.createElement('span');
        errorSpan.id = "aboutMeError";

        errorSpan.textContent = "Размер поля не должен превышать 250 символов";
        errorSpan.style.color = "red";
        aboutMeInput.insertAdjacentElement("afterend", errorSpan);
        aboutMeInput.insertAdjacentElement("afterend", brakeLine);
        return false;
    }

    errorSpan.parentNode.removeChild(errorSpan);
    brakeLine = document.getElementById("brakelineIdMe");
    brakeLine.parentNode.removeChild(brakeLine);

    return true;
}


