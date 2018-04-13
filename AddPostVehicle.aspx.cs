using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;


public partial class AddPostVehicle : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=LAPTOP-E222DOPN;Initial Catalog=Rentec;Persist Security Info=True;User ID=sa;Password=Hogwarts@8");
    string CS = ConfigurationManager.ConnectionStrings["RentecDB"].ConnectionString;


    protected int GetlastPID()
    {
        con.Open();
        SqlCommand cmdID = new SqlCommand("Select Count(property_ID) from [property]", con);

        int i = Convert.ToInt32(cmdID.ExecuteScalar());
        con.Close();
        return i;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        AdPost.Visible = false;
    }
    public void Logout_click(object sender, EventArgs e)
    {
        Session.Remove("user");
        Response.Redirect("~/Login.aspx");



    }

    protected void SubmitPost_Click(object sender, EventArgs e)
    {
        string CS = ConfigurationManager.ConnectionStrings["RentecDB"].ConnectionString;


        String savePath = @"C:\Users\fatima\Desktop\Level 2 Semester\Rentec\Post\";
        if (myFile.PostedFile != null)
        {
            try
            {
                savePath += myFile.PostedFile.FileName;
                myFile.PostedFile.SaveAs(savePath);
                Span1.InnerHtml = "Upload Successful!";
            }
            catch (Exception ex)
            {
                Span1.InnerHtml = "Error saving file <b>C:\\" +
                   myFile.Value + "</b><br>" + ex.ToString();
            }
        }


        string rno = REGno.Text;
        string model = mdl.Text;
        string colour =clr.Text;
        string year =yr.Text;
        string seats =seat.Text;
        int rent = Convert.ToInt32(rnt.Text);
        string district = dist.SelectedValue;
     
        int lpid = GetlastPID() + 1;
        string l = lpid.ToString();
        string pid = "p" + l;
        string path = "Post\\" + myFile.PostedFile.FileName;

        int id = Convert.ToInt32(Session["user"]);
        // ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "password_match", "alert('" + rno + rent + district + location + feature + pid + path + "')", true);


        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            try
            {
                SqlCommand cmdprop = new SqlCommand("insert into[property](property_ID, owner_ID,reg_no)values('" + pid + "', '" + id + "', '" + rno + "')", con);
                SqlCommand cmdshop = new SqlCommand("insert into[vehicle](vehicle_ID,model,color,year,seating,rent_per_hour)values('" + pid + "', '" + model + "', '" + colour + "', '" + year + "', '" + seats + "', '" + rent + "')", con);
                SqlCommand cmdloc = new SqlCommand("insert into[location](location_ID,number,street,district,landmark)values('" + pid + "', '" + district + "', '" + district + "', '" + district + "', '" + district + "')", con);

                SqlCommand cmdpost = new SqlCommand("insert into[post](post_ID,status,post_pic)values('" + pid + "', 'active', '" + path + "')", con);

                cmdprop.ExecuteNonQuery();
                cmdshop.ExecuteNonQuery();
                cmdloc.ExecuteNonQuery();
                cmdpost.ExecuteNonQuery();

                //int temp = Convert.ToInt32(cmd1.ExecuteScalar().ToString());

                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex);

            }







        }
        LabelShow.Text = "Post successful!";
        Session["prop"] = pid;
        Response.Redirect("ViewVehicle.aspx");
    }
}