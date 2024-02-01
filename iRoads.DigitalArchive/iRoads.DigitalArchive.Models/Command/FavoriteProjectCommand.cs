using System;
using System.Collections.Generic;
using System.Text;

namespace iRoads.DigitalArchive.Models.Command
{
    public class FavoriteProjectItem :  BaseCommand
    {
        public string ProjectId { get; set; }
        public int LevelCode { get; set; }
        public string Contract { get; set; }
        public bool IsFavorite { get; set; }
    }
    
}
