// Contributors:
//   James Domingo, Green Code LLC
//   Robert M. Scheller
 
using Landis.SpatialModeling;
using System;
using Landis.Library.HarvestManagement;

namespace Landis.Extension.BiomassHarvest
{
    /// <summary>
    /// Utility class for writing biomass-removed maps.
    /// </summary>
    public class BiomassMaps
    {
        private string nameTemplate;

        //---------------------------------------------------------------------

        /// <summary>
        /// Initializes a new instance.
        /// </summary>
        /// <param name="nameTemplate">
        /// The template for the pathnames to the maps.
        /// </param>
        public BiomassMaps(string nameTemplate)
        {
            this.nameTemplate = nameTemplate;
        }

        //---------------------------------------------------------------------

        /// <summary>
        /// Writes an output map of biomass removed from each active site.
        /// </summary>
        /// <param name="timestep">
        /// Timestep to use in the map's name.
        /// </param>
        public void WriteMap(int timestep)
        {
            string path = MapNames.ReplaceTemplateVars(nameTemplate, timestep);
            PlugIn.ModelCore.UI.WriteLine("   Writing biomass-removed map to {0} ...", path);
            using (IOutputRaster<IntPixel> outputRaster = PlugIn.ModelCore.CreateRaster<IntPixel>(path, PlugIn.ModelCore.Landscape.Dimensions))
            {
                IntPixel pixel = outputRaster.BufferPixel;
                foreach (Site site in PlugIn.ModelCore.Landscape.AllSites) {
                    pixel.MapCode.Value = (int) Math.Round(SiteVars.BiomassRemoved[site]);  
                    outputRaster.WriteBufferPixel();
                }
            }
        }

    }
}
