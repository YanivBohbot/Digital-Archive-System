using iRoads.DigitalArchive.Models.Model;
using Ness.Framework.Models.Command;
using System;
using System.Collections.Generic;
using System.Text;

namespace iRoads.DigitalArchive.Models.Command
{
		public class BaseCommandSave<T, E> : CommandSave<T, E>
		{
				public User User { get; set; }

				public BaseCommandSave()
				{
						User = new User();
				}
		}
}
