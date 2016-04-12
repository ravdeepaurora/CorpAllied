using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;

namespace CorpAllied.User
{
    /// <summary>
    /// Summary description for ImageHandle
    /// </summary>
    public class ImageHandle : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string imageid = context.Request.QueryString["Id"];
            string profileemail = context.Request.QueryString["pEmail"];
            if (imageid != null)
            {
                SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
                connection.Open();
                SqlCommand command = new SqlCommand("select StatusImg from Status where Id=" + imageid, connection);
                SqlDataReader dr = command.ExecuteReader();
                dr.Read();
                if (dr.HasRows)
                {
                    if (!dr.IsDBNull(0))
                        context.Response.BinaryWrite((Byte[])dr[0]);
                    connection.Close();
                    context.Response.End();
                }
          
            }
            if (profileemail != null)
            {
                SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
                connection.Open();
                SqlCommand command = new SqlCommand("select DisplayPic from users where email='"+profileemail+"'", connection);
                SqlDataReader dr = command.ExecuteReader();
                dr.Read();
                if (dr.HasRows)
                {
                    if (!dr.IsDBNull(0))
                        context.Response.BinaryWrite((Byte[])dr[0]);
                    connection.Close();
                    context.Response.End();
                }
            }
        }
        public static byte[] converterDemo(Image x)
        {
            ImageConverter _imageConverter = new ImageConverter();
            byte[] xByte = (byte[])_imageConverter.ConvertTo(x, typeof(byte[]));
            return xByte;
        }
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}