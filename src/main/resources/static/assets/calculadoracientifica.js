function handleButtonClick(value) {
    const display = document.getElementById("display");

    if (value === "C") {
        // Limpia el display
        display.value = "";
    } else if (value === "=") {
        // Evalúa la expresión matemática en el display
        try {
            display.value = eval(display.value);
        } catch (error) {
            display.value = "Error";
        }
    } else {
        // Agrega el valor del botón al display
        display.value += value;
    }
}