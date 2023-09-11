function getString(str1 = "first string", str2, str3 = prompt("Input any string", "")){
    return str1 + " " + str2 + " " + str3;
}

alert(getString());