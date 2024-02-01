using System.Security.Cryptography;
using System.Text;
using HttpContext = Ness.Framework.Core.Web.HttpContext;

namespace iRoads.DigitalArchive.Web.Services
{
    public class TokenService
    {
        private const string _alg = "HmacSHA256";
        private const string _salt = "QH11RwqAZx40ohIdRfsD"; // Generated at https://www.random.org/strings

        public static string GenerateToken(string username, string ip, string userAgent, long ticks)
        {
            string hash = string.Join(":", new string[] { username, ip, userAgent, ticks.ToString() });
            string hashLeft = "";
            string hashRight = "";

            using (HMAC hmac = HMACSHA256.Create(_alg))
            {
                hmac.Key = Encoding.UTF8.GetBytes(GetHashedPassword(username));
                hmac.ComputeHash(Encoding.UTF8.GetBytes(hash));

                hashLeft = Convert.ToBase64String(hmac.Hash);
                hashRight = string.Join(":", new string[] { username, ticks.ToString() });
            }

            return Convert.ToBase64String(Encoding.UTF8.GetBytes(string.Join(":", hashLeft, hashRight)));
        }

        public static string GetHashedPassword(string password)
        {
            string key = string.Join(":", new string[] { password, _salt });

            using (HMAC hmac = HMACSHA256.Create(_alg))
            {
                // Hash the key.
                hmac.Key = Encoding.UTF8.GetBytes(_salt);
                hmac.ComputeHash(Encoding.UTF8.GetBytes(key));

                return Convert.ToBase64String(hmac.Hash);
            }
        }

        public static bool IsTokenValid(string token, string ip, string userAgent)
        {
            bool result = false;

            try
            {
                // Base64 decode the string, obtaining the token:username:timeStamp.
                string key = Encoding.UTF8.GetString(Convert.FromBase64String(token));

                // Split the parts.
                string[] parts = key.Split(new char[] { ':' });
                if (parts.Length == 3)
                {
                    // Get the hash message, username, and timestamp.
                    string hash = parts[0];
                    string username = parts[1];
                    long ticks = long.Parse(parts[2]);
                    //DateTime timeStamp = new DateTime(ticks);

                    // Ensure the timestamp is valid.
                    //bool expired = Math.Abs((DateTime.UtcNow - timeStamp).TotalMinutes) > _expirationMinutes;
                    //if (!expired)
                    //{
                        //
                        // Lookup the user's account from the db.
                        //
                        if (username == HttpContext.Current.Session.Get("user")?.ToString())
                        {
                            // Hash the message with the key to generate a token.
                            string computedToken = GenerateToken(username, ip, userAgent, ticks);

                            // Compare the computed token with the one supplied and ensure they match.
                            result = (token == computedToken);
                        }
                   // }
                }
            }
            catch
            {
            }

            return result;
        }
    }
}