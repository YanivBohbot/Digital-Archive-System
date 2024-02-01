using iRoads.DigitalArchive.Entities.Dbo;
using Ness.Framework.Entities.Mapping;

namespace iRoads.DigitalArchive.Entities.Mapping {
    
    
    public class ProjectTypeClassificationMap : EntityBaseMap<ProjectTypeClassification> {
        
        public ProjectTypeClassificationMap() {
			Table("ProjectType_Classification");
            CompositeId().KeyProperty(x => x.ClassificationCode, "ClassificationCode")
                         .KeyProperty(x => x.ProjectTypeCode, "ProjectTypeCode");
        }

      
    }
}
