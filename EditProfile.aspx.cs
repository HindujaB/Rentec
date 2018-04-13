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

public partial class EditProfile : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["RentecDB"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        AdPost.Visible = false;
        if (Session["user"] != null)
        {
            int userID = Convert.ToInt32(Session["user"]);
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("EditProfileSP", con);
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

                SqlParameter oID = new SqlParameter();
                oID.ParameterName = "@IC";
                oID.SqlDbType = System.Data.SqlDbType.VarChar;
                oID.Direction = System.Data.ParameterDirection.Output;
                oID.Size = 12;
                cmd.Parameters.Add(oID);

                SqlParameter omail = new SqlParameter();
                omail.ParameterName = "@mail";
                omail.SqlDbType = System.Data.SqlDbType.VarChar;
                omail.Direction = System.Data.ParameterDirection.Output;
                omail.Size = 50;
                cmd.Parameters.Add(omail);

                SqlParameter otp = new SqlParameter();
                otp.ParameterName = "@tp";
                otp.SqlDbType = System.Data.SqlDbType.VarChar;
                otp.Direction = System.Data.ParameterDirection.Output;
                otp.Size = 10;
                cmd.Parameters.Add(otp);

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
                string ic = oID.Value.ToString();
                string mail = omail.Value.ToString();
                string tp = otp.Value.ToString();



                DateTime dob1 = Convert.ToDateTime(dob);

                Firstname.Text = fname;
                Lastname.Text =  lname;
                Utype.Text = urole;
                DOB.Text = dob1.ToString("MMMM dd,yyyy");

                Addressno.Text = ano;
                Addressst.Text = astreet;
                Addressc.Text = acity;
                DP.ImageUrl = dp;
                natID.Text = ic;
                mailadd.Text = mail;
                Cno.Text = tp;

                con.Close();



            }
        }
    }
    public void Logout_click(object sender, EventArgs e)
    {
        Session.Remove("user");
        Response.Redirect("~/Login.aspx");
    }

    protected void Logoutbtn_Click(object sender, EventArgs e)
    {
        Session.Remove("user");
        Response.Redirect("~/Login.aspx");
    }
    protected void Save_Click(object sender, EventArgs e)
    {
        string fname = Firstname.Text;
        string lname = Lastname.Text;
        DateTime dobt = Convert.ToDateTime(DOB.Text);
        var d = dobt.Date;
        string dob = d.ToString("yyyy-MM-dd ");
        string NIC = natID.Text;
        string contact_no = Cno.Text;
        string mail = mailadd.Text;
        string addno = Addressno.Text;
        string addstreet = Addressst.Text;
        string addcity = Addressc.Text;
        int ID = Convert.ToInt32(Session["user"]);





        string update_user = "update user_details set f_name = '"+ fname +"',l_name = '"+ lname +"',DOB = '"+ dob +"',NIC = '"+ NIC +"',mail_ID = '"+ mail +"',TP_no = '"+ contact_no +"',add_no = '"+ addno +"',add_street = '"+ addstreet +"',add_city = '"+ addcity +"' where user_ID ="+ ID +" ";
        //string update_user = "update user_details (user_ID,f_name,l_name,DOB,NIC,mail_ID,TP_no,add_no,add_street,add_city)values('" + ID + "','" + fname + "','" + lname + "','" + dob + "','" + NIC + "','" + mail + "','" + contact_no + "','" + addno + "','" + addstreet + "','" + addcity + "')";

        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd2 = new SqlCommand(update_user, con);
            con.Open();
            cmd2.ExecuteNonQuery();
            con.Close();
        }
        Response.Redirect("ProfileView.aspx");

    }

    protected void DPUpload_Click(object sender, EventArgs e)
    {
        if (DPUpload.HasFile)
        {
            string DPpath = Server.MapPath("http://localhost:65297/DP/") + DPUpload.FileName;
            DPUpload.PostedFile.SaveAs(DPpath);
            string path = "~/ DP /" + DPUpload.FileName.ToString();

            using (SqlConnection con = new SqlConnection(CS))
            {

                int userID = Convert.ToInt32(Session["user"]);
                SqlCommand cmdDP = new SqlCommand("DPchange", con);
                cmdDP.CommandType = System.Data.CommandType.StoredProcedure;
                cmdDP.Parameters.AddWithValue("@UID", userID);
                cmdDP.Parameters.AddWithValue("@dp", path);

                con.Open();
                cmdDP.ExecuteNonQuery();
                con.Close();
                UpErr.Text = "Profile picture updated successfully";

            }


        }
        else
            UpErr.Text = "Please upload a picture";



    }
   
}