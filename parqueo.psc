SubProceso Registrar ( vehiculos )
	Definir i Como Entero
	Definir registrado Como Logico
	registrado <- Falso
	Para i <- 1 Hasta 10 Hacer
		Si vehiculos[i,1] = "" Y registrado = Falso Entonces
			Escribir "Numero de placa:"
			Leer vehiculos[i,1]
			Escribir "Nombre del propietario:"
			Leer vehiculos[i,2]
			Escribir "Marca del vehiculo:"
			Leer vehiculos[i,3]
			Escribir "Vehiculo registrado correctamente."
			registrado <- Verdadero
		FinSi
	FinPara
	Si registrado = Falso Entonces
		Escribir "El parqueo esta lleno."
	FinSi
FinSubProceso

SubProceso MostrarV ( vehiculos )
	Definir i Como Entero
	Escribir "PLACA    PROPIETARIO    MARCA"
	Escribir "----------------------------"
	Para i <- 1 Hasta 10 Hacer
		Si vehiculos[i,1] <> "" Entonces
			Escribir vehiculos[i,1], "    ", vehiculos[i,2], "    ", vehiculos[i,3]
		FinSi
	FinPara
FinSubProceso

SubProceso Actualizar ( vehiculos )
	Definir i Como Entero
	Definir placa Como Cadena
	Definir encontrado Como Logico
	encontrado <- Falso
	Escribir "Ingrese el numero de placa a buscar:"
	Leer placa
	Para i <- 1 Hasta 10 Hacer
		Si vehiculos[i,1] = placa Y encontrado = Falso Entonces
			Escribir "Nuevo propietario:"
			Leer vehiculos[i,2]
			Escribir "Nueva marca del vehiculo:"
			Leer vehiculos[i,3]
			Escribir "Vehiculo actualizado correctamente."
			encontrado <- Verdadero
		FinSi
	FinPara
	Si encontrado = Falso Entonces
		Escribir "Placa no encontrada."
	FinSi
FinSubProceso

SubProceso Eliminar ( vehiculos )
	Definir i Como Entero
	Definir placa Como Cadena
	Definir encontrado Como Logico
	encontrado <- Falso
	Escribir "Ingrese el numero de placa a eliminar:"
	Leer placa
	Para i <- 1 Hasta 10 Hacer
		Si vehiculos[i,1] = placa Y encontrado = Falso Entonces
			vehiculos[i,1] <- ""
			vehiculos[i,2] <- ""
			vehiculos[i,3] <- ""
			Escribir "Vehiculo eliminado correctamente."
			encontrado <- Verdadero
		FinSi
	FinPara
	Si encontrado = Falso Entonces
		Escribir "Placa no encontrada."
	FinSi
FinSubProceso

SubProceso Pausa
	Escribir "Presione cualquier tecla para continuar..."
	Esperar Tecla
FinSubProceso

Algoritmo Lecc17Act3Inci2
	Dimension vehiculos[10,3]
	Definir opcion Como Entero
	
	Repetir
		Limpiar Pantalla
		Escribir "===== MENU PARQUEO ====="
		Escribir "1. Registrar vehiculo"
		Escribir "2. Mostrar vehiculos"
		Escribir "3. Actualizar vehiculo"
		Escribir "4. Eliminar vehiculo"
		Escribir "5. Salir"
		Escribir "Seleccione una opcion:"
		Leer opcion
		
		Segun opcion Hacer
			1:
				Limpiar Pantalla
				Escribir "=== REGISTRAR VEHICULO ==="
				Registrar(vehiculos)
				Pausa
			2:
				Limpiar Pantalla
				Escribir "=== MOSTRAR VEHICULOS ==="
				MostrarV(vehiculos)
				Pausa
			3:
				Limpiar Pantalla
				Escribir "=== ACTUALIZAR VEHICULO ==="
				Actualizar(vehiculos)
				Pausa
			4:
				Limpiar Pantalla
				Escribir "=== ELIMINAR VEHICULO ==="
				Eliminar(vehiculos)
				Pausa
			5:
				Escribir "Saliendo del sistema..."
			De Otro Modo:
				Escribir "Opcion invalida."
				Pausa
		FinSegun
	Hasta Que opcion = 5
FinAlgoritmo
