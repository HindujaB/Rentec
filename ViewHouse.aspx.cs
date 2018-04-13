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

public partial class ViewHouse : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["RentecDB"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {

        AdPost.Visible = false;
        if (Session["prop"] != null)
            {
                string propID = Convert.ToString(Session["prop"]);
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("ShowPostH", con);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@PID", propID);

                    SqlParameter ownh = new SqlParameter();
                    ownh.ParameterName = "@own";
                    ownh.SqlDbType = System.Data.SqlDbType.Int;
                    ownh.Direction = System.Data.ParameterDirection.Output;
                    cmd.Parameters.Add(ownh);

                    SqlParameter reg = new SqlParameter();
                    reg.ParameterName = "@rno";
                    reg.SqlDbType = System.Data.SqlDbType.NChar;
                    reg.Direction = System.Data.ParameterDirection.Output;
                    reg.Size = 10;
                    cmd.Parameters.Add(reg);

                    SqlParameter Dist = new SqlParameter();
                    Dist.ParameterName = "@dist";
                    Dist.SqlDbType = System.Data.SqlDbType.VarChar;
                    Dist.Direction = System.Data.ParameterDirection.Output;
                    Dist.Size = 30;
                    cmd.Parameters.Add(Dist);

                    SqlParameter type = new SqlParameter();
                    type.ParameterName = "@typ";
                    type.SqlDbType = System.Data.SqlDbType.VarChar;
                    type.Direction = System.Data.ParameterDirection.Output;
                    type.Size = 25;
                    cmd.Parameters.Add(type);

                    SqlParameter area = new SqlParameter();
                    area.ParameterName = "@are";
                    area.SqlDbType = System.Data.SqlDbType.VarChar;
                    area.Direction = System.Data.ParameterDirection.Output;
                    area.Size = 50;
                    cmd.Parameters.Add(area);

                    SqlParameter pic = new SqlParameter();
                    pic.ParameterName = "@pic";
                    pic.SqlDbType = System.Data.SqlDbType.NVarChar;
                    pic.Direction = System.Data.ParameterDirection.Output;
                    pic.Size = -1;
                    cmd.Parameters.Add(pic);

                    SqlParameter rnt = new SqlParameter();
                    rnt.ParameterName = "@rnt";
                    rnt.SqlDbType = System.Data.SqlDbType.Money;
                    rnt.Direction = System.Data.ParameterDirection.Output;
                    cmd.Parameters.Add(rnt);

                    
                    con.Open();
                    cmd.ExecuteNonQuery();
           
                    var OID = ownh.Value;
                    string RNO = reg.Value.ToString();
                    string DISTRICT = Dist.Value.ToString();
                    string TYPE = type.Value.ToString();
                    string AREA = area.Value.ToString();
                    string PIC = pic.Value.ToString();
                    string RNT = rnt.Value.ToString();


                SqlCommand cmdOfName = new SqlCommand("Select (f_name) from [user_details] where user_ID ="+OID+"", con);
                SqlCommand cmdOlName = new SqlCommand("Select (l_name) from [user_details]where user_ID =" + OID + "", con);

                string f = Convert.ToString(cmdOfName.ExecuteScalar());
                string l = Convert.ToString(cmdOlName.ExecuteScalar());

                own.Text = f+" "+l;
                rno.Text = RNO;
                dist.Text = DISTRICT;
                typeh.Text = TYPE ;
                areah.Text = AREA;
                rpd.Text = RNT;
               
                pstpic.ImageUrl = PIC;

                

                    con.Close();



                }
            }
            
     }


    

    public void Logout_click(object sender, EventArgs e)
    {
        Session.Remove("user");
        Response.Redirect("~/Login.aspx");



    }



   

    
}