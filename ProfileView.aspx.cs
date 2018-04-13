using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.IO;
using SD = System.Drawing;
using System.Drawing.Imaging;
using System.Drawing.Drawing2D;



public partial class Menu : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["RentecDB"].ConnectionString;
    //SqlConnection con = new SqlConnection("Data Source=LAPTOP-E222DOPN;Initial Catalog=Rentec;Persist Security Info=True;User ID=sa;Password=Hogwarts@8");
    //bool launch = false;
    //protected void LaunchModal()
    //{
    //    launch = true;
    //}
    protected void Page_Load(object sender, EventArgs e)
    {
        AdPost.Visible = false;
        if (Session["user"] != null)
        {
            int userID = Convert.ToInt32(Session["user"]);
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("ShowProfile", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UID", userID);

                SqlParameter oFN = new SqlParameter();
                oFN.ParameterName = "@fname";
                oFN.SqlDbType = System.Data.SqlDbType.VarChar;
                oFN.Direction = System.Data.ParameterDirection.Output;
                oFN.Size = 50;
                cmd.Parameters.Add(oFN);

                SqlParameter oLN = new SqlParameter();
                oLN.ParameterName = "@lname";
                oLN.SqlDbType = System.Data.SqlDbType.VarChar;
                oLN.Direction = System.Data.ParameterDirection.Output;
                oLN.Size = 50;
                cmd.Parameters.Add(oLN);

                SqlParameter odob = new SqlParameter();
                odob.ParameterName = "@dob";
                odob.SqlDbType = System.Data.SqlDbType.Date;
                odob.Direction = System.Data.ParameterDirection.Output;
                cmd.Parameters.Add(odob);

                SqlParameter oano = new SqlParameter();
                oano.ParameterName = "@ano";
                oano.SqlDbType = System.Data.SqlDbType.VarChar;
                oano.Direction = System.Data.ParameterDirection.Output;
                oano.Size = 10;
                cmd.Parameters.Add(oano);

                SqlParameter oastreet = new SqlParameter();
                oastreet.ParameterName = "@astreet";
                oastreet.SqlDbType = System.Data.SqlDbType.VarChar;
                oastreet.Direction = System.Data.ParameterDirection.Output;
                oastreet.Size = 20;
                cmd.Parameters.Add(oastreet);

                SqlParameter oacity = new SqlParameter();
                oacity.ParameterName = "@acity";
                oacity.SqlDbType = System.Data.SqlDbType.VarChar;
                oacity.Direction = System.Data.ParameterDirection.Output;
                oacity.Size = 15;
                cmd.Parameters.Add(oacity);

                SqlParameter ourole = new SqlParameter();
                ourole.ParameterName = "@urole";
                ourole.SqlDbType = System.Data.SqlDbType.VarChar;
                ourole.Direction = System.Data.ParameterDirection.Output;
                ourole.Size = 15;
                cmd.Parameters.Add(ourole);

                SqlParameter odp = new SqlParameter();
                odp.ParameterName = "@dp";
                odp.SqlDbType = System.Data.SqlDbType.VarChar;
                odp.Direction = System.Data.ParameterDirection.Output;
                odp.Size = 200;
                cmd.Parameters.Add(odp);

                con.Open();
                cmd.ExecuteNonQuery();

                string fname = oFN.Value.ToString();
                string lname = oLN.Value.ToString();
                var dob = odob.Value;

                string ano = oano.Value.ToString();
                string astreet = oastreet.Value.ToString();
                string acity = oacity.Value.ToString();
                string urole = ourole.Value.ToString();
                string dp = odp.Value.ToString();



                DateTime dob1 = Convert.ToDateTime(dob);

                name.Text = fname+"  " + lname;
                Utype.Text = urole;
                DOB.Text = dob1.ToString("MMMM dd,yyyy");

                Address1.Text = ano + "  " + astreet;
                Address2.Text = acity;
                //DP.ImageUrl = dp;

                con.Close();



            }
        }
        //if (IsPostBack && FileUpload2.PostedFile != null)
        //{

        //    if (FileUpload2.PostedFile.FileName.Length > 0)
        //    {

        //        Session["Image"] = FileUpload2.PostedFile;
        //        Stream fs = FileUpload2.PostedFile.InputStream;
        //        BinaryReader br = new BinaryReader(fs);
        //        byte[] bytes = br.ReadBytes((Int32)fs.Length);
        //        string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
        //        img.ImageUrl = "data:image/png;base64," + base64String;

        //    }

        //}

        //if (launch)
        //{
        //    $find("mpe").show();

        //}
    }

    
    
    //protected void DPUpload_UploadComplete(object sender, AjaxControlToolkit.AjaxFileUploadEventArgs e)
    //{
    //    string DPpath = Server.MapPath("~/ DP /") + e.FileName;
    //    DPUpload.SaveAs(DPpath);
    //}
    //protected void DPUpload_UploadError(object sender, AjaxControlToolkit.AjaxFileUploadEventArgs e)
    //{
    //    UpErr.Text = "Upload unsuccessful! Please Try again";
    //}
    public void Logout_click(object sender, EventArgs e)
    {
        Session.Remove("user");
        Response.Redirect("~/Login.aspx");



    }



    protected void EditProfilebtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/EditProfile.aspx");
    }
}