using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Data;

public partial class Login : System.Web.UI.Page
{   

    SqlConnection con = new SqlConnection("Data Source=LAPTOP-E222DOPN;Initial Catalog=Rentec;Persist Security Info=True;User ID=sa;Password=Hogwarts@8");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) { }
       
    }
    public int GetID(string uname)
    {
        int UID;
        con.Open();
        SqlCommand cmd = new SqlCommand("select user_ID from [user] where username = '"+usertxt.Text+"'", con);
       
         UID = (Int32)cmd.ExecuteScalar();
            con.Close();
            return UID; 
    }
    protected void Login_Click(object sender, EventArgs e)
    {
        con.Open();
        try
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM [user] WHERE username = '" + usertxt.Text + "'", con);
            int temp = Convert.ToInt32(cmd.ExecuteScalar().ToString());
            con.Close();
           
            if (temp != 0)
            {
                con.Open();
                string checkpass = "SELECT password FROM [user] WHERE username = '" + usertxt.Text + "'";
                SqlCommand cmdpass = new SqlCommand(checkpass, con);
                string pass = cmdpass.ExecuteScalar().ToString().Replace(" ", "");
                con.Close();
                if (pass == passtxt.Text)
                {
                    
                    Session["user"] = GetID(usertxt.Text);
                    Response.Redirect("SearchResult.aspx");
                    HttpContext.Current.ApplicationInstance.CompleteRequest();
                }
                else
                    PassError.Text = "Password not correct!";


            }
        }
        catch (NullReferenceException ex)
        {
            PassError.Text = "Username not correct";
        }
        
       
        }
    }

    

        
