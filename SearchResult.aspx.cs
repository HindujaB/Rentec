using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;  
using System.Data;


public partial class SearchResult : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["RentecDB"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        int ID = Convert.ToInt32(Session["user"]);

        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            SqlCommand comm = new SqlCommand("SELECT Count(roleID) FROM user_role WHERE userID = '" + ID + "' AND roleID = 'O'", con);

            int re = Convert.ToInt32(comm.ExecuteScalar());
            if (re == 0)
            {
                AdPost.Visible = false;

            }
            SqlCommand command = new SqlCommand("SELECT Count(roleID) FROM user_role WHERE userID = '" + ID + "' AND roleID = 'L'", con);
            command.ExecuteScalar();
            int res = Convert.ToInt32(command.ExecuteScalar());
            if (res == 0)
            {
                AddFee.Visible = false;


            }
           


        }



    }



    protected void AddLawyer_fee(object sender, EventArgs e)
    {
        int FEE;
        if (Int32.TryParse(LawyerFee.Text, out FEE))
        {



            int UID = Convert.ToInt32(Session["user"]);
            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                SqlCommand cmdl = new SqlCommand("UPDATE [user_details] SET lawyer_fee = '" + FEE + "'WHERE user_ID = '" + UID + "'", con);
                cmdl.ExecuteNonQuery();
                Label1.Text = "Lawyer Fees updated successfuly!";
                con.Close();
            }
            //Response.Redirect("Signin.aspx");

        }

    }



    public void Logout_click(object sender, EventArgs e)
    {
        Session.Remove("user");
        Response.Redirect("~/Login.aspx");



    }
    protected void srch_click(object sender, EventArgs e)
    {


        string CS = ConfigurationManager.ConnectionStrings["RentecDB"].ConnectionString;
        // string conString = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

        // string query = "SELECT TOP 5 CustomerID,ContactName,Country FROM Customers";
        string query = "";
        if (dist.SelectedValue == "All")
        {
            if (prop.SelectedValue == "House")
            {
                query = "SELECT property.property_ID as PID,house.rent_per_day as rent, post.post_pic as photo, location.district as DIS FROM house INNER JOIN property ON house.house_ID = property.property_ID INNER JOIN post ON property.property_ID = post.post_ID INNER JOIN location ON property.property_ID = location.location_ID";

            }
            else if (prop.SelectedValue == "Shop")
            {
                query = "SELECT property.property_ID as PID,location.district as DIS, post.post_pic as photo, shop.rent_per_month as rent FROM location INNER JOIN property ON location.location_ID = property.property_ID INNER JOIN post ON property.property_ID = post.post_ID INNER JOIN shop ON property.property_ID = shop.shop_ID";

            }
            else
            {
                query = "SELECT property.property_ID as PID,location.district as DIS, post.post_pic as photo, vehicle.rent_per_hour as rent FROM location INNER JOIN property ON location.location_ID = property.property_ID INNER JOIN post ON property.property_ID = post.post_ID INNER JOIN vehicle ON property.property_ID = vehicle.vehicle_ID";

            }
        }
        else
        {
            if (prop.SelectedValue == "House")
            {
                query = "SELECT property.property_ID as PID,house.rent_per_day as rent, post.post_pic as photo, location.district as DIS FROM house INNER JOIN property ON house.house_ID = property.property_ID INNER JOIN post ON property.property_ID = post.post_ID INNER JOIN location ON property.property_ID = location.location_ID WHERE location.district = '" + dist.SelectedValue.ToString() + "'";
            }
            else if (prop.SelectedValue == "Shop")
            {
                query = "SELECT property.property_ID as PID,location.district as DIS, post.post_pic as photo, shop.rent_per_month as rent FROM location INNER JOIN property ON location.location_ID = property.property_ID INNER JOIN post ON property.property_ID = post.post_ID INNER JOIN shop ON property.property_ID = shop.shop_ID WHERE location.district = '" + dist.SelectedValue.ToString() + "'";


            }
            else
            {
                query = "SELECT property.property_ID as PID,location.district as DIS, post.post_pic as photo, vehicle.rent_per_hour as rent FROM location INNER JOIN property ON location.location_ID = property.property_ID INNER JOIN post ON property.property_ID = post.post_ID INNER JOIN vehicle ON property.property_ID = vehicle.vehicle_ID WHERE location.district = '" + dist.SelectedValue.ToString() + "'";


            }
        }

        SqlCommand cmd = new SqlCommand(query);

        using (SqlConnection con = new SqlConnection(CS))
        {
            
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                con.Open();
                cmd.Connection = con;
                sda.SelectCommand = cmd;
                using (DataSet ds = new DataSet())
                {
                    sda.Fill(ds);
                    Results.DataSource = ds;
                    Results.DataBind();
                }
            }
        }
        // ClientScript.RegisterStartupScript(this.GetType(), "Pop", "OpenModal();", true);
    }
    //protected void Grid_RowCommand(object sender, GridViewCommandEventArgs e)
    //{
    //    if (e.CommandName == "Show")
    //    {
    //        // Get the value of command argument
    //        var value = e.CommandArgument;
    //        if (e.CommandArgument != null)
    //        {
    //            string propID = e.CommandArgumentt.ToString();
    //            Session["prop"] = propID;
    //            if (prop.Text == "House")
    //                Response.Redirect("ViewHouse.aspx");
    //            if (prop.Text == "Shop")
    //                Response.Redirect("ViewShop.aspx");
    //            if (prop.Text == "Vehicle")
    //                Response.Redirect("ViewVehicle.aspx");
    //            //if (e.CommandName == "Select")
    //            //    {
    //            //        //Determine the RowIndex of the Row whose Button was clicked.
    //            //        int rowIndex = Convert.ToInt32(e.CommandArgument);

    //            //        //Reference the GridView Row.
    //            //        GridViewRow row = GridView1.Rows[rowIndex];

    //            //        //Fetch value of Name.
    //            //        string name = (row.FindControl("txtName") as TextBox).Text;

    //            //        //Fetch value of Country
    //            //        string country = row.Cells[1].Text;

    //            //        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Name: " + name + "\\nCountry: " + country + "');", true);
    //        }
    //        // Do whatever operation you want.  
    //    }

    //}

    protected void Results_redirect(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Show") { }
        Button btn = (Button)sender;
        string CommandName = btn.CommandName;
        string CommandArgument = btn.CommandArgument;
        if (CommandArgument != null)
        {
            string propID = CommandArgument.ToString();
            Session["prop"] = propID;
            if (prop.SelectedValue == "House")
                Response.Redirect("ViewHouse.aspx");
            if (prop.SelectedValue == "Shop")
                Response.Redirect("ViewShop.aspx");
            if (prop.SelectedValue == "Vehicle")
                Response.Redirect("ViewVehicle.aspx");
            //if (e.CommandName == "Select")
            //    {
            //        //Determine the RowIndex of the Row whose Button was clicked.
            //        int rowIndex = Convert.ToInt32(e.CommandArgument);

            //        //Reference the GridView Row.
            //        GridViewRow row = GridView1.Rows[rowIndex];

            //        //Fetch value of Name.
            //        string name = (row.FindControl("txtName") as TextBox).Text;

            //        //Fetch value of Country
            //        string country = row.Cells[1].Text;

            //        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Name: " + name + "\\nCountry: " + country + "');", true);
        }
    }



    protected void Add_Click(object sender, EventArgs e)
    {

    }
    protected void Interested_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        string CommandName = btn.CommandName;
        string CommandArgument = btn.CommandArgument;
        if (CommandArgument != null)
        {
            string propID = CommandArgument.ToString();
            Session["prop"] = propID;

        }
    }
}