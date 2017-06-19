using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net;
using Newtonsoft.Json;


namespace ConsoleApplication1
{
    class Program
    {
        
        static void Main(string[] args)
        {
                                       

           
       var json = new WebClient().DownloadString("http://192.168.1.37/slimapp/public/api/customer/10");
              List<Usuario> m = JsonConvert.DeserializeObject<List<Usuario>>(json);
                Console.WriteLine(m.ElementAt(0).nit);
                        
                   

        }
    }
}
