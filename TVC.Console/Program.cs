using System;
using System.Globalization;
using System.IO;

namespace TVC.CommunityConsole
{
    internal static class Program
    {
        private const string Version = "0.1.0";
        private const string Build = "0003";

        private static int Main(string[] args)
        {
            // A harmless learning console. No kernel connection, plugins or admin privileges.
            try
            {
                Console.Title = "TaktVibes Community Console " + Version;
            }
            catch (IOException)
            {
                // Some terminals do not support changing the window title.
            }
            catch (PlatformNotSupportedException)
            {
                // Redirected or unusual terminals may not provide a title.
            }

            PrintWelcome();
            while (true)
            {
                Console.Write("TVC> ");
                string line = Console.ReadLine();
                if (line == null)
                {
                    Console.WriteLine();
                    return 0; // end of input (e.g. Ctrl+Z)
                }

                line = line.Trim();
                if (line.Length == 0)
                {
                    continue;
                }

                int separator = line.IndexOfAny(new[] { ' ', '\t' });
                string command = (separator < 0 ? line : line.Substring(0, separator))
                    .ToLowerInvariant();
                string argument = separator < 0 ? string.Empty : line.Substring(separator + 1).TrimStart();

                switch (command)
                {
                    case "help":
                        ShowHelp();
                        break;
                    case "version":
                        Console.WriteLine("TaktVibes Community Console " + Version + " | Build " + Build);
                        break;
                    case "echo":
                        Console.WriteLine(argument);
                        break;
                    case "time":
                        Console.WriteLine(DateTime.Now.ToString("dd.MM.yyyy HH:mm:ss", CultureInfo.GetCultureInfo("de-DE")));
                        break;
                    case "cls":
                        try
                        {
                            Console.Clear();
                        }
                        catch (IOException)
                        {
                            Console.WriteLine("Bildschirm kann in diesem Terminal nicht geloescht werden.");
                        }
                        break;
                    case "exit":
                        Console.WriteLine("Auf Wiedersehen!");
                        return 0;
                    default:
                        Console.WriteLine("Unbekannter Befehl: " + command + "  (help zeigt die Befehle)");
                        break;
                }
            }
        }

        private static void PrintWelcome()
        {
            Console.WriteLine("========================================");
            Console.WriteLine("      TAKTVIBES COMMUNITY CONSOLE");
            Console.WriteLine("      Version " + Version + " | Build " + Build);
            Console.WriteLine("========================================");
            Console.WriteLine("Einfaches C#-Lernprojekt (kein Kernel)");
            Console.WriteLine("Befehl: help");
            Console.WriteLine();
        }

        private static void ShowHelp()
        {
            Console.WriteLine("help       - Alle Befehle anzeigen");
            Console.WriteLine("version    - Version und Build anzeigen");
            Console.WriteLine("echo TEXT  - Text ausgeben");
            Console.WriteLine("time       - Aktuelle lokale Uhrzeit anzeigen");
            Console.WriteLine("cls        - Konsole leeren");
            Console.WriteLine("exit       - Konsole beenden");
        }
    }
}
