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

public partial class ViewVehicle : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand("ShowPostV", con);
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

                SqlParameter model = new SqlParameter();
                model.ParameterName = "@mdl";
                model.SqlDbType = System.Data.SqlDbType.VarChar;
                model.Direction = System.Data.ParameterDirection.Output;
                model.Size = 30;
                cmd.Parameters.Add(model);

                SqlParameter color = new SqlParameter();
                color.ParameterName = "@clr";
                color.SqlDbType = System.Data.SqlDbType.VarChar;
                color.Direction = System.Data.ParameterDirection.Output;
                color.Size = 25;
                cmd.Parameters.Add(color);

                SqlParameter yer = new SqlParameter();
                yer.ParameterName = "@year";
                yer.SqlDbType = System.Data.SqlDbType.VarChar;
                yer.Direction = System.Data.ParameterDirection.Output;
                yer.Size = 10;
                cmd.Parameters.Add(yer);

                SqlParameter ns = new SqlParameter();
                ns.ParameterName = "@nseat";
                ns.SqlDbType = System.Data.SqlDbType.VarChar;
                ns.Direction = System.Data.ParameterDirection.Output;
                ns.Size = 30;
                cmd.Parameters.Add(ns);

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
                string MDL = model.Value.ToString();
                string CLR = color.Value.ToString();
                string YR = yer.Value.ToString();
                string NSEAT = ns.Value.ToString();
                string PIC = pic.Value.ToString();
                string RNT = rnt.Value.ToString();


                SqlCommand cmdOfName = new SqlCommand("Select (f_name) from [user_details] where user_ID =" + OID + "", con);
                SqlCommand cmdOlName = new SqlCommand("Select (l_name) from [user_details]where user_ID =" + OID + "", con);

                string f = Convert.ToString(cmdOfName.ExecuteScalar());
                string l = Convert.ToString(cmdOlName.ExecuteScalar());

                own.Text = f + " " + l;
                rno.Text = RNO;
                dist.Text = DISTRICT;
                mdel.Text = MDL + " " + CLR + " " + YR;
                seats.Text = NSEAT;
                rph.Text = RNT;

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