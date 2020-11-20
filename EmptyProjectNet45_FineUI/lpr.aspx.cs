using FineUI;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using Baidu.Aip.Ocr;

namespace EmptyProjectNet45_FineUI
{
    public partial class lpr : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        /*private Baidu.Aip.Ocr.Ocr GetFacaClient()
        {
            // 设置APPID/AK/SK
            string APP_ID = "你的APP_ID";
            string API_KEY = "你的API_KEY";
            string SECRET_KEY = "你的SECRET_KEY";

            Ocr client = new Baidu.Aip.Ocr.Ocr(API_KEY, SECRET_KEY);
            client.Timeout = 60000;  // 修改超时时间

            return client;
        }
        private string ImgToBase64String(string image)
        {
            try
            {
                Bitmap bmp = new Bitmap(image, true);
                MemoryStream ms = new MemoryStream();
                bmp.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
                byte[] arr = new byte[ms.Length];
                ms.Position = 0;
                ms.Read(arr, 0, (int)ms.Length);
                ms.Close();

                return Convert.ToBase64String(arr);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public void LicensePlateDemo()
        {
            var APP_ID = "16688271";
            var API_KEY = "j7wkZMRTIZ0bqXMcprK7Heva";
            var SECRET_KEY = "MoX6qzz90IVCYt5ha3rfVAHRnYNC4lE0";

            var client = new Baidu.Aip.Ocr.Ocr(API_KEY, SECRET_KEY);
            client.Timeout = 60000;
            var image = File.ReadAllBytes(imgPhoto.ImageUrl);
            // 调用车牌识别，可能会抛出网络等异常，请使用try/catch捕获
            var result = client.LicensePlate(image);
            Console.WriteLine(result);
            // 如果有可选参数
            var options = new Dictionary<string, object>{
        {"multi_detect", "true"}
    };
            // 带参数调用车牌识别
            result = client.LicensePlate(image, options);
            Console.WriteLine(result);
        }*/

        protected void filePhoto_FileSelected(object sender, EventArgs e)
        {
            if (filePhoto.HasFile)
            {
                string fileName = filePhoto.ShortFileName;

               

                fileName = fileName.Replace(":", "_").Replace(" ", "_").Replace("\\", "_").Replace("/", "_");
                fileName = DateTime.Now.Ticks.ToString() + "_" + fileName;

                filePhoto.SaveAs(Server.MapPath("/图片/" + fileName));

                imgPhoto.ImageUrl = "/图片/" + fileName;

                // 清空文件上传组件
                filePhoto.Reset();
            }

        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (imgPhoto.ImageUrl == "~/res/images/blank.png")
            {
                filePhoto.MarkInvalid("请先上传个人头像！");

                Alert.ShowInTop("请先上传个人头像！");

                return;
            }
            var APP_ID = "16688271";
            var API_KEY = "j7wkZMRTIZ0bqXMcprK7Heva";
            var SECRET_KEY = "MoX6qzz90IVCYt5ha3rfVAHRnYNC4lE0";

            var client = new Baidu.Aip.Ocr.Ocr(API_KEY, SECRET_KEY);
            client.Timeout = 60000;
            //string image = ImgToBase64String("C:/Program Files (x86)/IIS Express/~图片/636976236820908105_example00.bmp");  
            var image = File.ReadAllBytes("D:/qq文件/原来文件/915394354/FileRecv/系统设计大三下/EmptyProjectNet45_FineUI/"+imgPhoto.ImageUrl);
            // 调用车牌识别，可能会抛出网络等异常，请使用try/catch捕获
            var result = client.LicensePlate(image);
            Console.WriteLine(result);
            // 如果有可选参数
            var options = new Dictionary<string, object>{
        {"multi_detect", "true"}
    };
            // 带参数调用车牌识别
            result = client.LicensePlate(image, options);
            Console.WriteLine(result);
            labResult.Text = "上传时间：" + DatePicker1.Text + "<br/>" +
                    "照片地址：" + imgPhoto.ImageUrl + "<br/>" +
                    "识别结果：" + result + "<br/>";

            // 清空表单字段（注意，不要清空imgPhoto，否则就看不到上传的头像了）
            //filePhoto.Reset();
            //tbxEmail.Reset();
            //tbxUserName.Reset();


        }
    }
}