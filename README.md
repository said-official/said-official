## Hi there 👋

<!--
**said-official/said-official** is a ✨ _special_ ✨ repository because its `README.md` (this file) appears on your GitHub profile.

Here are some ideas to get you started:

Console.WriteLine("Базовая проверка безопасности завершена");
                    }
                    catch (WebException ex)
                    {
                        var response = (HttpWebResponse)ex.Response;
                        if (response != null)
                        {
                            Console.WriteLine($"HTTP Status: {response.StatusCode} ({(int)response.StatusCode})");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Ошибка проверки безопасности сайта: {ex.Message}");
            }
        }
        
        private void CheckWindowsDefender()
        {
            try
            {
                // Простая проверка Windows Defender через реестр
                var defenderPath = @"SOFTWARE\Microsoft\Windows Defender";
                using (var key = Microsoft.Win32.Registry.LocalMachine.OpenSubKey(defenderPath))
                {
                    if (key != null)
                    {
                        Console.WriteLine("Windows Defender: обнаружен");
                    }
                    else
                    {
                        Console.WriteLine("Windows Defender: не обнаружен или отключен");
                    }
                }
            }
            catch
            {
                Console.WriteLine("Windows Defender: не удалось проверить");
            }
        }
        
        private void CheckSystemUpdates()
        {
            try
            {
                // Проверяем время работы системы
                var uptime = DateTime.Now - System.Diagnostics.Process.GetCurrentProcess().StartTime;
                if (uptime.TotalDays > 30)
                {
                    Console.WriteLine("Система работает более 30 дней - возможно требуются обновления");
                }
                else
                {
                    Console.WriteLine("Система недавно перезапускалась - возможны установленные обновления");
                }
            }
            catch
            {
                Console.WriteLine("Не удалось проверить время работы системы");
            }
        }
        
        private void AnalyzeRunningProcesses()
        {
            try
            {
                var processes = System.Diagnostics.Process.GetProcesses();
                Console.WriteLine($"Запущено процессов: {processes.Length}");
                
                // Показываем несколько подозрительных процессов
                string[] suspiciousNames = { "mimikatz", "metasploit", "cain", "wireshark", "nmap" };
                
                foreach (var proc in processes)
                {
                    try
                    {
                        foreach (var suspicious in suspiciousNames)
                        {
                            if (proc.ProcessName.ToLower().Contains(suspicious))
                            {
                                Console.WriteLine($"ПОДОЗРИТЕЛЬНЫЙ ПРОЦЕСС: {proc.ProcessName} (ID: {proc.Id})");
                            }
                        }
                    }
                    catch
                    {
                        // Игнорируем процессы к которым нет доступа
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Ошибка анализа процессов: {ex.Message}");
            }
        }
    }
}
