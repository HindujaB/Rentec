<%@ Page Title="" Language="C#" MasterPageFile="~/Rentec.master" AutoEventWireup="true" CodeFile="AddPostVehicle.aspx.cs" Inherits="AddPostVehicle" %>

<asp:Content ID="AddPostVcle" ContentPlaceHolderID="CPHmain" Runat="Server">
     <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Rentec</title>
         <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
   
       
        <script runat="server">

//void SubmitButton_Click(Object sender, EventArgs e) {
//     String savePath = @"C:\Users\fatima\Desktop\Level 2 Semester\Rentec\Post\";
//    if (myFile.PostedFile != null) {
//        try {
//            savePath += myFile.PostedFile.FileName;
//            myFile.PostedFile.SaveAs(savePath);
//            Span1.InnerHtml = "Upload Successful!";
//        }
//        catch (Exception ex) {
//            Span1.InnerHtml = "Error saving file <b>C:\\" +
//               myFile.Value + "</b><br>" + ex.ToString();
//        }
//    }
//}

</script>
        <style> 
            .navbar.transparent.navbar-inverse {
   background: rgba(0,0,0,0.4);
   margin:0px;
  
}
            .form-group{
                font-family :'Ice kingdom';
                color:whitesmoke;
                font-size:large;
            
            }
            .btn.btn-file {
                position: relative;
                overflow: hidden;
            }
            

            .auto-style1 {
                position: relative;
                min-height: 1px;
                float: left;
                width: 50%;
                left: 0px;
                top: 0px;
                padding-left: 15px;
                padding-right: 15px;
            }

        </style>
    </head>
    <body>
        <form runat="server">
        <div class="container">
            
    <nav class="navbar transparent navbar-inverse ">
    <div class="container-fluid">
  
    
      <ul class="nav navbar-nav" role="navigation">
        <li ><a href="SearchResult.aspx">Home</a></li>
        <li><a href="ProfileView.aspx">View Profile</a></li>
           <li id="AdPost" runat="server" class="active dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Add Post
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="AddPostHouse.aspx">House</a></li>
          <li><a href="AddPostShop.aspx">Shop</a></li>
          <li><a href="AddPostVehicle.aspx">Vehicle</a></li>
        </ul>
      </li>
        
          
		
      </ul>
      
    </div>
  
</nav>
 <br/> 
             
        <asp:LinkButton ID="LogOutbtn" runat="server" CssClass="btn btn-primary pull-right" Text="LogOut" OnClick="Logout_click"><span class="glyphicon glyphicon-log-out"></span>  LogOut</asp:LinkButton>  
</div>
        <br/> 
        <br/> 
        <div class="container">
  <h2 id="Addpost" style="font-family: 'Ice kingdom'; font-size: x-large; font-style: normal; color: #FFFFFF">Create Post For Vehicle Rental</h2>
  <br/>
            <br/>
    <div class="form-group col-xs-6">
      <label for="RegNo">Registration No:</label>
        <asp:TextBox ID="REGno" class="form-control" placeholder="Enter registration number" runat="server" name="regno"></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" runat="server" ErrorMessage="This is a required field!" ControlToValidate="REGno"></asp:RequiredFieldValidator>
    </div>
    <div class="form-group col-xs-6">
      <label for="rent">Rent per Hour:</label>
        <asp:TextBox ID="rnt" class="form-control" placeholder="Rent in Rupees" runat="server" name="rnt"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" runat="server" ErrorMessage="This is a required field!" ControlToValidate="rnt"></asp:RequiredFieldValidator>
    </div>
      <div class="container">
   
        <div class="form-group">
             <asp:Label ID="err" runat="server"/>  
        <div class="row-fluid">
            Upload Reference Image:<br />
        <input type="file" id="myFile" runat="Server"/>
        <p>
        <%--<input type="submit" id="Submit1" class="form-group btn-info" runat="Server" 
         value="Upload File"  OnServerClick="SubmitButton_Click"/>--%>
        </p>
        <span id="Span1" runat="Server" />
       
            <asp:RegularExpressionValidator 
             id="RegularExpressionValidator1" runat="server" 
             ErrorMessage="Only jpg, png or bmp files are 
             allowed!" ValidationExpression="^?($(i?)jpg|\.png|\.jpeg|\.gif)$" 
             ControlToValidate="myFile" CssClass="form-group">
            </asp:RegularExpressionValidator>
            <br />
            <asp:RequiredFieldValidator 
             id="RequiredFieldValidator1" runat="server" 
             ErrorMessage="This is a required field!" 
             ControlToValidate="myFile" CssClass="form-group">
            </asp:RequiredFieldValidator>

        </div>
</div>
     
</div>
            <div class="form-group col-xs-6">
                <h3>Model Details</h3>
      <label for="rent">Model</label>
        <asp:TextBox ID="mdl" class="form-control" placeholder="Model name" runat="server" name="mdl"></asp:TextBox>
   <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="Red" runat="server" ErrorMessage="This is a required field!" ControlToValidate="mdl"></asp:RequiredFieldValidator>
        <label for="rent">Colour</label>
        <asp:TextBox ID="clr" class="form-control" placeholder="Model colour" runat="server" name="clr"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ForeColor="Red" runat="server" ErrorMessage="This is a required field!" ControlToValidate="clr"></asp:RequiredFieldValidator>
        <label for="rent">Modal year</label>
        <asp:TextBox ID="yr" class="form-control" placeholder="Model year" runat="server" name="yr"></asp:TextBox>
    <label for="rent">Number of seats</label>
        <asp:TextBox ID="seat" class="form-control" placeholder="Number of seats" runat="server" name="seat"></asp:TextBox>
    </div>
         

      <div class="form-group col-xs-6 row-fluid">
      <label for="dis">District of Property: (For search facility)</label>
     <%-- <asp:TextBox ID="dist" class="form-control" placeholder="District of property" runat="server" name="dis"></asp:TextBox>--%>
          <asp:DropDownList ID="dist" placeholder="District of property" CssClass="form-control" runat="server">
                                        <asp:ListItem value="Ampara">Ampara</asp:ListItem>
                                        <asp:ListItem value="Anuradhapura">Anuradhapura</asp:ListItem>
                                        <asp:ListItem value="Badulla">Badulla</asp:ListItem>
                                        <asp:ListItem value="Batticaloa">Batticaloa</asp:ListItem>
										<asp:ListItem value="Colombo">Colombo</asp:ListItem>
										<asp:ListItem value="Galle">Galle</asp:ListItem>
										<asp:ListItem value="Gampaha">Gampaha</asp:ListItem>
										<asp:ListItem value="Hambantota">Hambantota</asp:ListItem>
										<asp:ListItem value="Jaffna">Jaffna</asp:ListItem>
										<asp:ListItem value="Kalutara">Kalutara</asp:ListItem>
										<asp:ListItem value="Kandy">Kandy</asp:ListItem>
										<asp:ListItem value="Kegalle">Kegalle</asp:ListItem>
										<asp:ListItem value="Kilinochchi">Kilinochchi</asp:ListItem>
										<asp:ListItem value="Kurunegala">Kurunegala</asp:ListItem>
										<asp:ListItem value="Mannar">Mannar</asp:ListItem>
										<asp:ListItem value="Matale">Matale</asp:ListItem>
										<asp:ListItem value="Matara">Matara</asp:ListItem>
										<asp:ListItem value="Monaragala">Monaragala</asp:ListItem>
										<asp:ListItem value="Mullaitivu">Mullaitivu</asp:ListItem>
										<asp:ListItem value="Nuwara Eliya">Nuwara Eliya</asp:ListItem>
										<asp:ListItem value="Polonnaruwa">Polonnaruwa</asp:ListItem>
										<asp:ListItem value="Puttalam">Puttalam</asp:ListItem>
										<asp:ListItem value="Ratnapura">Ratnapura</asp:ListItem>
										<asp:ListItem value="Trincomalee">Trincomalee</asp:ListItem>
										<asp:ListItem value="Vavuniya">Vavuniya</asp:ListItem>
                                    
              </asp:DropDownList>
                                  </div>
                                 
    </div>

      
      
            <asp:Button ID="SubmitPost" type="submit" CssClass="btn btn-info" runat ="server" Text="Submit Post" OnClick="SubmitPost_Click"/>
     
  <br/>
            <asp:Label ID="LabelShow" runat="server" ForeColor="Red"></asp:Label>
            </div>
</form>

    </body>



</html>
     </span>
</asp:Content>

