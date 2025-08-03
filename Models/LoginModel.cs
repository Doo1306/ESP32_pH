using Newtonsoft.Json.Converters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace ESP32_pH.Models
{
    public enum ePermission
    {
        Maker = 0,
        Admin = 1,
        User = 2,
    }
    public class LoginModel
    {
        public string UserName { get; set; }
        public string Password { get; set; }

        [JsonConverter(typeof(StringEnumConverter))]
        public ePermission Permission { get; set; }

    }
}
