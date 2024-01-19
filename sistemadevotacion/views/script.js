// Agrega una opción predeterminada "Seleccione" a cada selector
addDefaultOption(document.getElementById("region"));
addDefaultOption(document.getElementById("comuna"));
addDefaultOption(document.getElementById("candidato"));

// Realiza una solicitud Ajax para obtener datos de regiones
fetch('../controller/get_data.php?type=region')
    .then(response => response.json())
    .then(data => fillSelector(data, "region"))
    .catch(error => console.error('Error al obtener datos de regiones:', error));

// Realiza una solicitud Ajax para obtener datos de comunas
fetch('../controller/get_data.php?type=comuna')
    .then(response => response.json())
    .then(data => fillSelector(data, "comuna"))
    .catch(error => console.error('Error al obtener datos de comunas:', error));

// Realiza una solicitud Ajax para obtener datos de candidatos
fetch('../controller/get_data.php?type=candidato')
    .then(response => response.json())
    .then(data => fillSelector(data, "candidato"))
    .catch(error => console.error('Error al obtener datos de candidatos:', error));

// Función para llenar un selector con datos obtenidos
function fillSelector(data, selectorId) {
    var selector = document.getElementById(selectorId);
    addDefaultOption(selector);
    data.forEach(item => {
        var option = document.createElement("option");
        option.value = item.id;
        option.text = item.nombre;
        selector.add(option);
    });
}

// Función para agregar la opción predeterminada "Seleccione"
function addDefaultOption(selector) {
    // Verificar si ya existe una opción con valor vacío
    var defaultOption = selector.querySelector('option[value=""]');

    if (!defaultOption) {
        defaultOption = document.createElement("option");
        defaultOption.value = "";
        defaultOption.text = "Seleccione";
        selector.add(defaultOption);
    }
}

// Dentro de la función que maneja el envío del formulario
var votingForm = document.getElementById("votingForm");
var errorMessageContainer = document.getElementById("errorMessage");
var resultadosContainer = document.getElementById("resultadosContainer");

votingForm.addEventListener("submit", function (event) {
    event.preventDefault();

    // Obtiene las opciones seleccionadas
    var checkboxes = votingForm.elements['entero[]'];
    var opcionesSeleccionadas = obtenerOpcionesSeleccionadas(checkboxes);

    // Valida que se seleccionen exactamente dos opciones
    if (opcionesSeleccionadas.length !== 2) {
        errorMessageContainer.textContent = "Por favor, seleccione exactamente dos opciones en '¿Cómo se enteró de nosotros?'.";
        // Limpiar resultadosContainer en caso de error
        resultadosContainer.innerHTML = "";
        return;
    } else {
        errorMessageContainer.textContent = ""; // Limpiar mensaje de error si es válido
    }

    // Obtiene los valores del formulario
    var nombre = obtenerValorInput("nombre");
    var alias = obtenerValorInput("alias");
    var rut = obtenerValorInput("rut");
    var email = obtenerValorInput("email");
    var region = obtenerValorSelect("region");
    var comuna = obtenerValorSelect("comuna");
    var candidato = obtenerValorSelect("candidato");

    // Construye el objeto de datos a enviar
    var formData = new FormData();
    formData.append("nombre", nombre);
    formData.append("alias", alias);
    formData.append("rut", rut);
    formData.append("email", email);
    formData.append("region", region);
    formData.append("comuna", comuna);
    formData.append("candidato", candidato);
    formData.append("comoSeEntero", opcionesSeleccionadas.join(','));

    // Realiza una solicitud fetch con el método POST
    fetch('controller/submit_vote.php', {
        method: 'POST',
        body: formData
    })
        .then(response => response.json())
        .then(data => {
            // Maneja la respuesta según sea necesario
            if (data.success) {
                // Redirige a success.html si es necesario
                window.location.href = 'success.html?nombre=' + encodeURIComponent(nombre) +
                    '&alias=' + encodeURIComponent(alias) +
                    '&rut=' + encodeURIComponent(rut) +
                    '&email=' + encodeURIComponent(email) +
                    '&region=' + encodeURIComponent(region) +
                    '&comuna=' + encodeURIComponent(comuna) +
                    '&candidato=' + encodeURIComponent(candidato) +
                    '&comoSeEntero=' + opcionesSeleccionadas.join(', ');
            } else {
                // Maneja el error si la respuesta indica un fallo
                console.error('Error al enviar el formulario:', data.message);
                // Puedes mostrar un mensaje de error al usuario si es necesario
                errorMessageContainer.textContent = 'Error al enviar el formulario. Por favor, inténtelo de nuevo.';
            }
        })
        .catch(error => {
            console.error('Error en la solicitud fetch:', error);
            // Maneja errores aquí
            errorMessageContainer.textContent = 'Error en la solicitud fetch. Por favor, inténtelo de nuevo.';
        });
});

// Resto del script (mostrarResultados, funciones auxiliares, etc.)
function obtenerOpcionesSeleccionadas(checkboxes) {
    var opcionesSeleccionadas = [];
    for (var i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].checked) {
            opcionesSeleccionadas.push(checkboxes[i].value);
        }
    }
    return opcionesSeleccionadas;
}

function obtenerValorInput(id) {
    var elemento = document.getElementById(id);
    return elemento ? elemento.value.trim() !== "" ? elemento.value : "No especificado" : "No especificado";
}

function obtenerValorSelect(id) {
    var elemento = document.getElementById(id);
    return elemento ? elemento.options[elemento.selectedIndex].text : "No especificado";
}

function mostrarResultados(nombre, alias, rut, email, region, comuna, candidato, opciones, container) {
    // Limpiar el contenido existente
    container.innerHTML = "";

    // Crear un párrafo para cada valor del formulario y opción seleccionada
    var parrafos = [
        "Nombre y Apellido: " + (nombre.trim() !== "" ? nombre : "No especificado"),
        "Alias: " + (alias.trim() !== "" ? alias : "No especificado"),
        "RUT: " + (rut.trim() !== "" ? rut : "No especificado"),
        "Email: " + (email.trim() !== "" ? email : "No especificado"),
        "Región: " + (region.trim() !== "" ? region : "No especificado"),
        "Comuna: " + (comuna.trim() !== "" ? comuna : "No especificado"),
        "Candidato: " + (candidato.trim() !== "" ? candidato : "No especificado"),
        "¿Cómo se enteró de nosotros?: " + (opciones.length > 0 ? opciones.join(', ') : 'Ninguna')
    ];

    parrafos.forEach(function (parrafo) {
        var elementoParrafo = document.createElement("p");
        elementoParrafo.textContent = parrafo;
        container.appendChild(elementoParrafo);
    });
}
