SubProceso Registrar ( productos )
	Definir i Como Entero
	Definir registrado Como Logico
	registrado <- Falso
	Para i <- 1 Hasta 10 Hacer
		Si productos[i,1] = "" Y registrado = Falso Entonces
			Escribir "Codigo del producto:"
			Leer productos[i,1]
			Escribir "Nombre del producto:"
			Leer productos[i,2]
			Escribir "Cantidad en existencia:"
			Leer productos[i,3]
			Escribir "Producto registrado correctamente."
			registrado <- Verdadero
		FinSi
	FinPara
	Si registrado = Falso Entonces
		Escribir "El inventario esta lleno."
	FinSi
FinSubProceso

SubProceso MostrarP ( productos )
	Definir i Como Entero
	Escribir "CODIGO    NOMBRE    CANTIDAD"
	Escribir "----------------------------"
	Para i <- 1 Hasta 10 Hacer
		Si productos[i,1] <> "" Entonces
			Escribir productos[i,1], "    ", productos[i,2], "    ", productos[i,3]
		FinSi
	FinPara
FinSubProceso

SubProceso Actualizar ( productos )
	Definir i Como Entero
	Definir codigo Como Cadena
	Definir encontrado Como Logico
	encontrado <- Falso
	Escribir "Ingrese el codigo a buscar:"
	Leer codigo
	Para i <- 1 Hasta 10 Hacer
		Si productos[i,1] = codigo Y encontrado = Falso Entonces
			Escribir "Nuevo nombre del producto:"
			Leer productos[i,2]
			Escribir "Nueva cantidad en existencia:"
			Leer productos[i,3]
			Escribir "Producto actualizado correctamente."
			encontrado <- Verdadero
		FinSi
	FinPara
	Si encontrado = Falso Entonces
		Escribir "Codigo no encontrado."
	FinSi
FinSubProceso

SubProceso Eliminar ( productos )
	Definir i Como Entero
	Definir codigo Como Cadena
	Definir encontrado Como Logico
	encontrado <- Falso
	Escribir "Ingrese el codigo a eliminar:"
	Leer codigo
	Para i <- 1 Hasta 10 Hacer
		Si productos[i,1] = codigo Y encontrado = Falso Entonces
			productos[i,1] <- ""
			productos[i,2] <- ""
			productos[i,3] <- ""
			Escribir "Producto eliminado correctamente."
			encontrado <- Verdadero
		FinSi
	FinPara
	Si encontrado = Falso Entonces
		Escribir "Codigo no encontrado."
	FinSi
FinSubProceso

SubProceso Pausa
	Escribir "Presione cualquier tecla para continuar..."
	Esperar Tecla
FinSubProceso

Algoritmo Lecc17Act3Inci1
	Dimension productos[10,3]
	Definir opcion Como Entero
	
	Repetir
		Limpiar Pantalla
		Escribir "===== MENU INVENTARIO ====="
		Escribir "1. Registrar producto"
		Escribir "2. Mostrar productos"
		Escribir "3. Actualizar producto"
		Escribir "4. Eliminar producto"
		Escribir "5. Salir"
		Escribir "Seleccione una opcion:"
		Leer opcion
		
		Segun opcion Hacer
			1:
				Limpiar Pantalla
				Escribir "=== REGISTRAR PRODUCTO ==="
				Registrar(productos)
				Pausa
			2:
				Limpiar Pantalla
				Escribir "=== MOSTRAR PRODUCTOS ==="
				MostrarP(productos)
				Pausa
			3:
				Limpiar Pantalla
				Escribir "=== ACTUALIZAR PRODUCTO ==="
				Actualizar(productos)
				Pausa
			4:
				Limpiar Pantalla
				Escribir "=== ELIMINAR PRODUCTO ==="
				Eliminar(productos)
				Pausa
			5:
				Escribir "Saliendo del sistema..."
			De Otro Modo:
				Escribir "Opcion invalida."
				Pausa
		FinSegun
	Hasta Que opcion = 5
FinAlgoritmo
