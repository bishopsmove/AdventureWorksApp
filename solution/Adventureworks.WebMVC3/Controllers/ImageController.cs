using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;
using System.Drawing;
using System.Drawing.Imaging;
using Adventureworks.Domain.Interfaces;
using Adventureworks.SQLRepository;
using Adventureworks.Infrastructure.Utilities;
using Adventureworks.Web.Helpers;

namespace Adventureworks.Web.Controllers
{
    public class ImageController : Controller
    {
        //
        // GET: /Image/ProductThumbnail?ProductPhotoID

        public ActionResult ProductThumbnail(int productPhotoID)
        {
            IProductRepository productRepository = new ProductRepository();
            MemoryStream image = productRepository.GetProductThumbnail(productPhotoID);

            byte[] buffer = image.ToArray();
            Bitmap bmp = (Bitmap)Bitmap.FromStream(image);
            buffer = GifConverter.ConvertGif(bmp);

            return new ImageResult { Image = buffer, ImageFormat = ImageFormat.Gif };
        }

        //
        // GET: /Image/ProductPhoto?ProductPhotoID

        public ActionResult ProductPhoto(int productPhotoID)
        {
            IProductRepository productRepository = new ProductRepository();
            MemoryStream image = productRepository.GetProductPhoto(productPhotoID);

            byte[] buffer = image.ToArray();
            Bitmap bmp = (Bitmap)Bitmap.FromStream(image);
            buffer = GifConverter.ConvertGif(bmp);

            return new ImageResult { Image = buffer, ImageFormat = ImageFormat.Gif };
        }
    }
}
