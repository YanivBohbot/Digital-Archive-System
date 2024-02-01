using Ness.Framework.Models.Lookup;
using Ness.Framework.Models.Model;
using System.Collections.Generic;

namespace iRoads.DigitalArchive.Models.Model
{
		public class User : UserBase
		{
				public string IdNumber { get; set; }
				public int Role { get; set; }
				public string DisplayName { get; set; }

    }
}
