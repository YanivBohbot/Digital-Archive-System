using System;
using System.Collections.Generic;
using System.Text;

namespace iRoads.DigitalArchive.Models.Model
{
    public class SaveDocModel
    {
        public string ProjectID { get; set; }
        public string Status { get; set; }
        public string UserName { get; set; }
        public string Contract { get; set; }
        public string DocID { get; set; }
        public string TableName { get; set; }
    }
}
