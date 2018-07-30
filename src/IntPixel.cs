//  Contributors:
//    James B. Domingo
//    Robert M. Scheller

using Landis.SpatialModeling;

namespace Landis.Extension.BiomassHarvest
{
    public class IntPixel : Pixel
    {
        public Band<int> MapCode  = "The numeric code for each raster cell";

        public IntPixel()
        {
            SetBands(MapCode);
        }
    }
}
