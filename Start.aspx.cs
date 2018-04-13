using System;
using System.Web.UI;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Text.RegularExpressions;
using System.Web.UI.WebControls;

public partial class Start : System.Web.UI.Page
{
    char user_role;
    SqlConnection con = new SqlConnection("Data Source=LAPTOP-E222DOPN;Initial Catalog=Rentec;Persist Security Info=True;User ID=sa;Password=Hogwarts@8");
    
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public bool CheckPassword(string password)
    {  
        
        string valid_password = "(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{6,15})$";

        if (password != null) return Regex.IsMatch(password, valid_password);
        else return false;
    }
    protected int GenerateID()
    {
        con.Open();
        SqlCommand cmdID = new SqlCommand("Select Count(user_ID) from [user]", con);

        int i = Convert.ToInt32(cmdID.ExecuteScalar());
        con.Close();
        i++;
        return i;
    }
    protected void Sign_Click(object sender, EventArgs e)
    {
        
        if (CheckPassword(passtxt.Text))
        {
            if (passtxt.Text == cpasstxt.Text)
            {
                for (int a = 0; a < usertype.Items.Count; a++)
                {
                    if (usertype.Items[a].Value == "Lawyer")
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "lawModal", "$('#lawmodal').modal();", true);

                    }
                }

            
                
                int i = GenerateID();
                con.Open();
                SqlCommand cmdU = new SqlCommand("insert into [user](user_ID,username,password)values('"+i+"','" + usertxt.Text+"','"+passtxt.Text+"')",con);
                cmdU.ExecuteNonQuery();
                for (int c = 0; c < usertype.Items.Count; c++)
                {
                    String role;

                    if (usertype.Items[c].Selected)
                    {

                        role = usertype.Items[c].Value;
                        string ins = "insert into user_role(userID,roleID)values('" + i + "','" + role + "')";

                        SqlCommand cmdR = new SqlCommand(ins, con);
                        cmdR.ExecuteNonQuery();

                    }

                }
                con.Close();
                Session["user"] = i;
                Response.Redirect("Signin.aspx");

            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "password_match", "alert('Passwords are not matching')", true);
            }
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "password_valid", "alert('Password must contain minimum 6 characters, atleast one alphabet and a digit')", true);
        }
        
        
    }

    //protected void customerbtn_CheckedChanged(object sender, EventArgs e)
    //{
    //    user_role = 'C';
    //    Session["role"] = user_role;

    //}

    //protected void ownerbtn_CheckedChanged(object sender, EventArgs e)
    //{
    //    user_role = 'O';
    //    Session["role"] = user_role;
    //}

    //protected void lawyerbtn_CheckedChanged(object sender, EventArgs e)
    //{
    //    user_role = 'L';
    //    Session["role"] = user_role;
    //}
    //protected void AddLawyer_fee(object sender, EventArgs e)
    //{
    //    int FEE =Convert.ToInt32(LawyerFee.Text);
    //    int UID =Convert.ToInt32( Session["user"]);

    //    Session["fee"] = FEE;


    //    //Response.Redirect("Signin.aspx");



    //}





    protected void Login_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");

    }




    //protected void customerbx_CheckedChanged(object sender, EventArgs e)
    //{
    //    user_role = 'C';

    //}

    //protected void ownerbx_CheckedChanged(object sender, EventArgs e)
    //{
    //    user_role = 'O';

    //}

    //protected void lawyerbx_CheckedChanged(object sender, EventArgs e)
    //{
    //    user_role = 'L';

    //}

    [System.Web.Services.WebMethod]
    public static string CheckUN(string Uname)
    {
        string retval = "";
        using (SqlConnection con = new SqlConnection("Data Source=LAPTOP-E222DOPN;Initial Catalog=Rentec;Persist Security Info=True;User ID=sa;Password=Hogwarts@8"))
        {
            //SqlConnection con = new SqlConnection("data source=LENOVO;initial catalog=Test;UID=sa;PWD=connect");
            con.Open();
            SqlCommand cmd = new SqlCommand("select username from [user] where username=@un", con);
            cmd.Parameters.AddWithValue("@un", Uname);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                retval = "true";
            }
            else
            {
                retval = "false";
            }
        }
        return retval;
    }
}