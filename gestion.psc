Algoritmo GestionEstudiantes
    Definir estudiantes Como Cadena
    Dimension estudiantes[10, 3] // 10 filas, 3 columnas (Código, Nombre, Edad)
    
    // Inicializar matriz vacía
    InicializarMatriz(estudiantes)
    
    Definir opcion Como Entero
    Repetir
        Escribir "=== MENÚ DE GESTIÓN DE ESTUDIANTES ==="
        Escribir "1. Registrar estudiante"
        Escribir "2. Mostrar estudiantes"
        Escribir "3. Actualizar estudiante por código"
        Escribir "4. Eliminar estudiante por código"
        Escribir "5. Salir"
        Escribir "Seleccione una opción: "
        Leer opcion
        
        Según opcion Hacer
            1: RegistrarEstudiante(estudiantes)
            2: MostrarEstudiantes(estudiantes)
            3: ActualizarEstudiante(estudiantes)
            4: EliminarEstudiante(estudiantes)
            5: Escribir "¡Hasta luego!"
            De Otro Modo:
                Escribir "Opción no válida. Intente de nuevo."
        FinSegún
        Escribir ""
    Hasta Que opcion = 5
FinAlgoritmo

SubProceso InicializarMatriz(matriz)
    Para i <- 1 Hasta 10 Hacer
        matriz[i, 1] <- ""
        matriz[i, 2] <- ""
        matriz[i, 3] <- ""
    FinPara
FinSubProceso

SubProceso RegistrarEstudiante(matriz)
    Definir i, posLibre Como Entero
    posLibre <- -1
    
    // Buscar la primera posición disponible
    Para i <- 1 Hasta 10 Hacer
        Si matriz[i, 1] = "" Y posLibre = -1 Entonces
            posLibre <- i
        FinSi
    FinPara
    
    Si posLibre = -1 Entonces
        Escribir "Error: La capacidad máxima (10 estudiantes) se ha alcanzado."
    Sino
        Definir cod, nom, edad Como Cadena
        Escribir "Ingrese el Código:"
        Leer cod
        Escribir "Ingrese el Nombre:"
        Leer nom
        Escribir "Ingrese la Edad:"
        Leer edad
        
        matriz[posLibre, 1] <- cod
        matriz[posLibre, 2] <- nom
        matriz[posLibre, 3] <- edad
        Escribir "Estudiante registrado exitosamente."
    FinSi
FinSubProceso

SubProceso MostrarEstudiantes(matriz)
    Definir i, cont Como Entero
    cont <- 0
    Escribir "--- LISTA DE ESTUDIANTES ---"
    Para i <- 1 Hasta 10 Hacer
        Si matriz[i, 1] <> "" Entonces
            Escribir "Código: ", matriz[i, 1], " | Nombre: ", matriz[i, 2], " | Edad: ", matriz[i, 3]
            cont <- cont + 1
        FinSi
    FinPara
    Si cont = 0 Entonces
        Escribir "No hay estudiantes registrados."
    FinSi
FinSubProceso

SubProceso ActualizarEstudiante(matriz)
    Definir codBusqueda Como Cadena
    Definir i, pos Encontrado Como Entero
    pos <- -1
    
    Escribir "Ingrese el código del estudiante a actualizar:"
    Leer codBusqueda
    
    Para i <- 1 Hasta 10 Hacer
        Si matriz[i, 1] = codBusqueda Entonces
            pos <- i
        FinSi
    FinPara
    
    Si pos <> -1 Entonces
        Escribir "Ingrese el Nuevo Nombre:"
        Leer matriz[pos, 2]
        Escribir "Ingrese la Nueva Edad:"
        Leer matriz[pos, 3]
        Escribir "Estudiante actualizado correctamente."
    Sino
        Escribir "Estudiante no encontrado."
    FinSi
FinSubProceso

SubProceso EliminarEstudiante(matriz)
    Definir codBusqueda Como Cadena
    Definir i, pos Encontrado Como Entero
    pos <- -1
    
    Escribir "Ingrese el código del estudiante a eliminar:"
    Leer codBusqueda
    
    Para i <- 1 Hasta 10 Hacer
        Si matriz[i, 1] = codBusqueda Entonces
            pos <- i
        FinSi
    FinPara
    
    Si pos <> -1 Entonces
        matriz[pos, 1] <- ""
        matriz[pos, 2] <- ""
        matriz[pos, 3] <- ""
        Escribir "Estudiante eliminado exitosamente."
    Sino
        Escribir "Estudiante no encontrado."
    FinSi
FinSubProceso
