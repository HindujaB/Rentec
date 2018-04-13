using System;
using System.Collections.Generic;
using System.Text;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Text.RegularExpressions;
using System.Globalization;
using System.IO;


public partial class Signin : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=LAPTOP-E222DOPN;Initial Catalog=Rentec;Persist Security Info=True;User ID=sa;Password=Hogwarts@8");


    protected int GetlastID()
    {
        con.Open();
        SqlCommand cmdID = new SqlCommand("Select Count(user_ID) from [user]", con);

        int i = Convert.ToInt32(cmdID.ExecuteScalar());
        con.Close();
        return i;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        if (Session["user"] != null)
        {
            int idses =(int)Session["user"];
            
        }
    }
  
       
    
    protected void Signinpg_Click(object sender, EventArgs e)
    {
        string fname = TextBoxFN.Text;
        string lname = TextBoxLN.Text;
        DateTime dobt = Convert.ToDateTime(TextBoxDOB.Text);
        var d = dobt.Date;
        string dob = d.ToString("yyyy-MM-dd ");
        string NIC = TextBoxNIC.Text;
        string gender = DropDownListGen.SelectedItem.Text;
        string contact_no = TextBoxTP.Text;
        string mail = TextBoxMail.Text;
        string addno = TextBoxAdd_no.Text;
        string addstreet = TextBoxAdd_street.Text;
        string addcity = TextBoxAdd_city.Text;
        int ID =Convert.ToInt32(Session["user"]);

        

       


        string ins_user = "insert into user_details(user_ID,f_name,l_name,DOB,NIC,mail_ID,gender,TP_no,add_no,add_street,add_city)values('" +ID + "','" + fname + "','" + lname + "','" + dob + "','" + NIC + "','" + mail + "','" + gender + "','" + contact_no + "','" + addno + "','" + addstreet + "','" + addcity + "')";
        SqlCommand cmd2 = new SqlCommand(ins_user, con);
        con.Open();
        cmd2.ExecuteNonQuery();
        con.Close();
        Session["user"] = ID;
        Response.Redirect("SearchResult.aspx");
    
    }
}