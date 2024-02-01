using System;
using System.Collections.Generic;
using System.Text;

namespace iRoads.DigitalArchive.Models.Model
{
    public class ComboOptions
    {
        public ComboOptions() { }
        public List<string> ControlManagers { get; set; }
        public List<string> WBS { get; set; }
        public List<string> Tenders { get; set; }
        public List<string> Roads { get; set; }
        public List<string> Intersects { get; set; }
        public List<string> Contracts { get; set; }
        public List<string> Agaf { get; set; }
        public List<string> Contractors { get; set; }
        public List<string> Company { get; set; }
        public List<string> Mamap { get; set; }
        public List<string> Manhap { get; set; }
    }
}
