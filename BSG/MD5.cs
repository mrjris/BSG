using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;
using System.Text;

namespace BSG
{
    public class MD5
    {
        public static string Encode(string sInputString)
        {
            MD5CryptoServiceProvider provider = new MD5CryptoServiceProvider();
            byte[] bytes = provider.ComputeHash(UTF8Encoding.UTF8.GetBytes(sInputString));
            StringBuilder hash = new StringBuilder();
            for(int i = 0; i < bytes.Length; i ++)
            {
                hash.Append(bytes[i].ToString("x2"));
            }
            return hash.ToString();
        }
    }
}