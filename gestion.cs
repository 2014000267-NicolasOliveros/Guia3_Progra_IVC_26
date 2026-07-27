using System;

class Program
{
    // Matriz global o compartida de 10 filas x 3 columnas
    static string[,] estudiantes = new string[10, 3];

    static void Main(string[] args)
    {
        int opcion = 0;
        do
        {
            Console.WriteLine("=== MENÚ DE GESTIÓN DE ESTUDIANTES ===");
            Console.WriteLine("1. Registrar estudiante");
            Console.WriteLine("2. Mostrar estudiantes");
            Console.WriteLine("3. Actualizar estudiante por código");
            Console.WriteLine("4. Eliminar estudiante por código");
            Console.WriteLine("5. Salir");
            Console.Write("Seleccione una opción: ");
            
            if (int.TryParse(Console.ReadLine(), out opcion))
            {
                Console.WriteLine();
                switch (opcion)
                {
                    case 1: RegistrarEstudiante(); break;
                    case 2: MostrarEstudiantes(); break;
                    case 3: ActualizarEstudiante(); break;
                    case 4: EliminarEstudiante(); break;
                    case 5: Console.WriteLine("¡Hasta luego!"); break;
                    default: Console.WriteLine("Opción no válida."); break;
                }
            }
            else
            {
                Console.WriteLine("\nPor favor, ingrese un número válido.");
            }
            Console.WriteLine();
        } while (opcion != 5);
    }

    // 1. REGISTRAR
    static void RegistrarEstudiante()
    {
        int posLibre = -1;

        // Buscar una fila vacía
        for (int i = 0; i < 10; i++)
        {
            if (string.IsNullOrEmpty(estudiantes[i, 0]))
            {
                posLibre = i;
                break;
            }
        }

        if (posLibre == -1)
        {
            Console.WriteLine("Error: La capacidad máxima (10 estudiantes) se ha alcanzado.");
            return;
        }

        Console.Write("Ingrese Código: ");
        estudiantes[posLibre, 0] = Console.ReadLine();

        Console.Write("Ingrese Nombre: ");
        estudiantes[posLibre, 1] = Console.ReadLine();

        Console.Write("Ingrese Edad: ");
        estudiantes[posLibre, 2] = Console.ReadLine();

        Console.WriteLine("Estudiante registrado exitosamente.");
    }

    // 2. MOSTRAR
    static void MostrarEstudiantes()
    {
        bool hayDatos = false;
        Console.WriteLine("--- LISTA DE ESTUDIANTES ---");

        for (int i = 0; i < 10; i++)
        {
            if (!string.IsNullOrEmpty(estudiantes[i, 0]))
            {
                Console.WriteLine($"Código: {estudiantes[i, 0]} | Nombre: {estudiantes[i, 1]} | Edad: {estudiantes[i, 2]}");
                hayDatos = true;
            }
        }

        if (!hayDatos)
        {
            Console.WriteLine("No hay estudiantes registrados.");
        }
    }

    // 3. ACTUALIZAR
    static void ActualizarEstudiante()
    {
        Console.Write("Ingrese el código del estudiante a actualizar: ");
        string codigoBusqueda = Console.ReadLine();
        int pos = BuscarPorCodigo(codigoBusqueda);

        if (pos != -1)
        {
            Console.Write("Ingrese Nuevo Nombre: ");
            estudiantes[pos, 1] = Console.ReadLine();

            Console.Write("Ingrese Nueva Edad: ");
            estudiantes[pos, 2] = Console.ReadLine();

            Console.WriteLine("Estudiante actualizado correctamente.");
        }
        else
        {
            Console.WriteLine("Estudiante no encontrado.");
        }
    }

    // 4. ELIMINAR
    static void EliminarEstudiante()
    {
        Console.Write("Ingrese el código del estudiante a eliminar: ");
        string codigoBusqueda = Console.ReadLine();
        int pos = BuscarPorCodigo(codigoBusqueda);

        if (pos != -1)
        {
            estudiantes[pos, 0] = null;
            estudiantes[pos, 1] = null;
            estudiantes[pos, 2] = null;

            Console.WriteLine("Estudiante eliminado exitosamente.");
        }
        else
        {
            Console.WriteLine("Estudiante no encontrado.");
        }
    }

    // Método auxiliar para buscar la fila según el código
    static int BuscarPorCodigo(string codigo)
    {
        for (int i = 0; i < 10; i++)
        {
            if (estudiantes[i, 0] == codigo && !string.IsNullOrEmpty(codigo))
            {
                return i;
            }
        }
        return -1;
    }
}
