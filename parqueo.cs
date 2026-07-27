using System;

class Program
{
    static string[,] vehiculos = new string[10, 3];

    static void Main(string[] args)
    {
        int opcion;
        do
        {
            Console.Clear();
            Console.WriteLine("===== MENU PARQUEO =====");
            Console.WriteLine("1. Registrar vehiculo");
            Console.WriteLine("2. Mostrar vehiculos");
            Console.WriteLine("3. Actualizar vehiculo");
            Console.WriteLine("4. Eliminar vehiculo");
            Console.WriteLine("5. Salir");
            Console.Write("Seleccione una opción: ");
            opcion = Convert.ToInt32(Console.ReadLine());

            switch (opcion)
            {
                case 1:
                    Console.Clear();
                    Console.WriteLine("=== REGISTRAR VEHICULO ===");
                    Registrar();
                    Pausa();
                    break;
                case 2:
                    Console.Clear();
                    Console.WriteLine("=== MOSTRAR VEHICULOS ===");
                    MostrarV();
                    Pausa();
                    break;
                case 3:
                    Console.Clear();
                    Console.WriteLine("=== ACTUALIZAR VEHICULO ===");
                    Actualizar();
                    Pausa();
                    break;
                case 4:
                    Console.Clear();
                    Console.WriteLine("=== ELIMINAR VEHICULO ===");
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
            if (string.IsNullOrEmpty(vehiculos[i, 0]))
            {
                Console.Write("Número de placa: ");
                vehiculos[i, 0] = Console.ReadLine();
                Console.Write("Nombre del propietario: ");
                vehiculos[i, 1] = Console.ReadLine();
                Console.Write("Marca del vehículo: ");
                vehiculos[i, 2] = Console.ReadLine();
                Console.WriteLine("\nVehículo registrado.");
                registrado = true;
                break;
            }
        }
        if (!registrado)
        {
            Console.WriteLine("\nEl parqueo está lleno.");
        }
    }

    static void MostrarV()
    {
        Console.WriteLine("\nPLACA\tPROPIETARIO\t\tMARCA");
        Console.WriteLine("----------------------------------");
        for (int i = 0; i < 10; i++)
        {
            if (!string.IsNullOrEmpty(vehiculos[i, 0]))
            {
                Console.WriteLine(vehiculos[i, 0] + "\t" + vehiculos[i, 1] + "\t\t" + vehiculos[i, 2]);
            }
        }
    }

    static void Actualizar()
    {
        string placa;
        bool encontrado = false;
        Console.Write("Número de placa a buscar: ");
        placa = Console.ReadLine();

        for (int i = 0; i < 10; i++)
        {
            if (vehiculos[i, 0] == placa)
            {
                Console.Write("Nuevo propietario: ");
                vehiculos[i, 1] = Console.ReadLine();
                Console.Write("Nueva marca: ");
                vehiculos[i, 2] = Console.ReadLine();
                Console.WriteLine("\nVehículo actualizado.");
                encontrado = true;
                break;
            }
        }
        if (!encontrado)
        {
            Console.WriteLine("\nPlaca no encontrada.");
        }
    }

    static void Eliminar()
    {
        string placa;
        bool encontrado = false;
        Console.Write("Número de placa a eliminar: ");
        placa = Console.ReadLine();

        for (int i = 0; i < 10; i++)
        {
            if (vehiculos[i, 0] == placa)
            {
                vehiculos[i, 0] = "";
                vehiculos[i, 1] = "";
                vehiculos[i, 2] = "";
                Console.WriteLine("\nVehículo eliminado.");
                encontrado = true;
                break;
            }
        }
        if (!encontrado)
        {
            Console.WriteLine("\nPlaca no encontrada.");
        }
    }

    static void Pausa()
    {
        Console.WriteLine("\nPresione cualquier tecla para continuar...");
        Console.ReadKey();
    }
}
