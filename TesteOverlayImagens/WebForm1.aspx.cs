using System;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;

namespace TesteOverlayImagens
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public static Image imgTemplate1;
        public static Image imgOverlay1;
        protected void Page_Load(object sender, EventArgs e)
        {            

            
        }

        protected void mesclaImagens(int margemEsquerda, int margemSuperior)
        {                        
            Image imgTemplate = imgTemplate1;

            Image imgOverlay = imgOverlay1;         

            Image original = imgTemplate;
            Graphics gra = Graphics.FromImage(original);

            gra.DrawImage(imgOverlay, margemEsquerda, margemSuperior, imgOverlay.Width, imgOverlay.Height);

            Response.ContentType = "image/Png";
            original.Save(Response.OutputStream, ImageFormat.Png);

        }

        protected void btnUpload1_Click(object sender, EventArgs e)
        {
            Stream fs = fuImagem1.PostedFile.InputStream;

            loadImage(fs, "template");
        }

        protected void btnUpload2_Click(object sender, EventArgs e)
        {
            Stream fs = fuImagem2.PostedFile.InputStream;

            loadImage(fs, "overlay");
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            mesclaImagens(Convert.ToInt32(txtMargemEsquerda.Text), Convert.ToInt32(txtMargemSuperior.Text));
        }

        private void loadImage(Stream fs, string imageName)
        {

            BinaryReader br = new BinaryReader(fs);
            Byte[] bytes = br.ReadBytes((Int32)fs.Length);
            string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);

            if (imageName.Equals("template"))
            {
                imgOriginal.ImageUrl = "data:image/jpeg;base64," + base64String;
                imgTemplate1 = Image.FromStream(fs);
            }
            else if (imageName.Equals("overlay"))
            {
                imgSobrepor.ImageUrl = "data:image/jpeg;base64," + base64String;
                imgOverlay1 = Image.FromStream(fs);
            }
        }


    }
}