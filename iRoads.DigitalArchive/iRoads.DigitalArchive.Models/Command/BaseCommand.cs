using iRoads.DigitalArchive.Models.Model;
using System;
using System.Collections.Generic;
using System.Text;

namespace iRoads.DigitalArchive.Models.Command
{
    public class BaseCommand
    {
        public User User { get; set; }
        public BaseCommand()
        {
            User = new User();
        }
    }
}
