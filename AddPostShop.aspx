<%@ Page Title="" Language="C#" MasterPageFile="~/Rentec.master" AutoEventWireup="true" CodeFile="AddPostShop.aspx.cs" Inherits="AddPostShop" %>

<asp:Content ID="AddPostSp" ContentPlaceHolderID="CPHmain" Runat="Server">
    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Rentec</title>
         <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
   
       
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
  
     <%--<div class="collapse navbar-collapse" id="myNavbar">--%>
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
  <h2 id="Addpost" style="font-family: 'Ice kingdom'; font-size: x-large; font-style: normal; color: #FFFFFF">Create Post For Shop Rental</h2>
  <br/>
            <br/>
    <div class="form-group col-xs-6">
      <label for="RegNo">Registration No:</label>
        <asp:TextBox ID="REGno" class="form-control" placeholder="Enter registration number" runat="server" name="regno"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" runat="server" ErrorMessage="This is a required field!" ControlToValidate="REGno"></asp:RequiredFieldValidator>
    </div>
    <div class="form-group col-xs-6">
      <label for="rent">Rent per Month:</label>
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
      <label for="rent">Air conditioned or not:<br/></label>
          <div class="row">    <label class="radio-inline">  <asp:RadioButton ID="ac" GroupName="acnonac" runat="server" Text="A/C" /></label>
               <label class="radio-inline">  <asp:RadioButton ID="nonac" GroupName="acnonac" runat="server" Text="Non A/C" /></label>
       </div>
                </div>
     
    

      <div class="form-group col-xs-6 row">
      <label for="dis">District of Property: (For search facility)</label>
     
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
<div class="row-fluid">
    <div class="form-group">
        <br/>
        <br/>
        <br/>
        <br/>
      <label for="area">Location in words:</label>
        <asp:TextBox ID="area" rows="3" class="form-control" placeholder="Location details of property" runat="server" name="loc"></asp:TextBox>
    
            
    </div>
    </div>
      
      <div class="form-group">
      <label for="fact">Features:</label>
          <asp:TextBox ID="fact" rows="5" class="form-control" placeholder="description of property" runat="server" name="fea"></asp:TextBox>
      
    </div>
            <asp:Button ID="SubmitPost" type="submit" CssClass="btn btn-info" runat ="server" Text="Submit Post" OnClick="SubmitPost_Click"/>
     
  <br/>
            <asp:Label ID="LabelShow" runat="server" ForeColor="Red"></asp:Label>
            </div>
</form>

    </body>



</html>
</asp:Content>

