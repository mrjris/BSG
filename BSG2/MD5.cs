
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;
using System.Text;
namespace BSG2
{
    public class MD5
    {
        public string MD5Endcoding(string sInputString)
        {
            MD5CryptoServiceProvider provider = new MD5CryptoServiceProvider();
            StringBuilder hash = new StringBuilder();
            byte[] arr = provider.ComputeHash(Encoding.UTF8.GetBytes(sInputString));
            foreach(var item in arr)
                hash.Append(item.ToString("x2"));
            return hash.ToString();
        }
    }
}