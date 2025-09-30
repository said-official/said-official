using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Net.Sockets;

namespace VulnScanner
{
    class Program
    {
        static async Task Main(string[] args)
        {
            // ваш код main
        }
        // остальные методы
    }

    public class VulnerabilityScanner
    {
        private readonly List<string> _commonPorts = new List<int> { 21, 22, 23 /* и прочие */ }.ConvertAll(p => p.ToString());

        public async Task ScanNetworkRange(string networkRange)
        {
            // Здесь нужно либо написать логику развертывания IP-адресов сети,
            // либо временно просто вывести сообщение, чтобы компилятор не ругался.
            Console.WriteLine("Метод ScanNetworkRange ещё не реализован.");
        }

        // Остальные методы (ScanSingleHost, ScanWebsite, ScanLocalSystem)
    }
}
