using System;

class Program
{
    static string[,] productos = new string[10, 3];

    static void Main(string[] args)
    {
        int opcion;
        do
        {
            Console.Clear();
            Console.WriteLine("===== MENU INVENTARIO =====");
            Console.WriteLine("1. Registrar producto");
            Console.WriteLine("2. Mostrar productos");
            Console.WriteLine("3. Actualizar producto");
            Console.WriteLine("4. Eliminar producto");
            Console.WriteLine("5. Salir");
            Console.Write("Seleccione una opción: ");
            opcion = Convert.ToInt32(Console.ReadLine());

            switch (opcion)
            {
                case 1:
                    Console.Clear();
                    Console.WriteLine("=== REGISTRAR PRODUCTO ===");
                    Registrar();
                    Pausa();
                    break;
                case 2:
                    Console.Clear();
                    Console.WriteLine("=== MOSTRAR PRODUCTOS ===");
                    MostrarP();
                    Pausa();
                    break;
                case 3:
                    Console.Clear();
                    Console.WriteLine("=== ACTUALIZAR PRODUCTO ===");
                    Actualizar();
                    Pausa();
                    break;
                case 4:
                    Console.Clear();
                    Console.WriteLine("=== ELIMINAR PRODUCTO ===");
                    Eliminar();
                    Pausa();
                    break;
                case 5:
                    Console.WriteLine("Saliendo del sistema...");
                    break;
                default:
                    Console.WriteLine("Opción inválida.");
                    Pausa();
                    break;
            }
        } while (opcion != 5);
    }

    static void Registrar()
    {
        bool registrado = false;
        for (int i = 0; i < 10; i++)
        {
            if (string.IsNullOrEmpty(productos[i, 0]))
            {
                Console.Write("Código del producto: ");
                productos[i, 0] = Console.ReadLine();
                Console.Write("Nombre del producto: ");
                productos[i, 1] = Console.ReadLine();
                Console.Write("Cantidad en existencia: ");
                productos[i, 2] = Console.ReadLine();
                Console.WriteLine("\nProducto registrado.");
                registrado = true;
                break;
            }
        }
        if (!registrado)
        {
            Console.WriteLine("\nEl inventario está lleno.");
        }
    }

    static void MostrarP()
    {
        Console.WriteLine("\nCODIGO\tNOMBRE\t\tCANTIDAD");
        Console.WriteLine("----------------------------------");
        for (int i = 0; i < 10; i++)
        {
            if (!string.IsNullOrEmpty(productos[i, 0]))
            {
                Console.WriteLine(productos[i, 0] + "\t" + productos[i, 1] + "\t\t" + productos[i, 2]);
            }
        }
    }

    static void Actualizar()
    {
        string codigo;
        bool encontrado = false;
        Console.Write("Código a buscar: ");
        codigo = Console.ReadLine();

        for (int i = 0; i < 10; i++)
        {
            if (productos[i, 0] == codigo)
            {
                Console.Write("Nuevo nombre: ");
                productos[i, 1] = Console.ReadLine();
                Console.Write("Nueva cantidad: ");
                productos[i, 2] = Console.ReadLine();
                Console.WriteLine("\nProducto actualizado.");
                encontrado = true;
                break;
            }
        }
        if (!encontrado)
        {
            Console.WriteLine("\nCódigo no encontrado.");
        }
    }

    static void Eliminar()
    {
        string codigo;
        bool encontrado = false;
        Console.Write("Código a eliminar: ");
        codigo = Console.ReadLine();

        for (int i = 0; i < 10; i++)
        {
            if (productos[i, 0] == codigo)
            {
                productos[i, 0] = "";
                productos[i, 1] = "";
                productos[i, 2] = "";
                Console.WriteLine("\nProducto eliminado.");
                encontrado = true;
                break;
            }
        }
        if (!encontrado)
        {
            Console.WriteLine("\nCódigo no encontrado.");
        }
    }

    static void Pausa()
    {
        Console.WriteLine("\nPresione cualquier tecla para continuar...");
        Console.ReadKey();
    }
}
