<%@ Page Title="" Language="C#" MasterPageFile="~/Rentec.master" AutoEventWireup="true" CodeFile="EditProfile.aspx.cs" Inherits="EditProfile" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="EditProfile" ContentPlaceHolderID="CPHmain" Runat="Server">
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
        .formclass {
            background-color: #99CCFF;
            padding: 15px;
            margin: auto;
            height:1000px;
            width: 1200px;
            border: medium dotted #0066CC;
            position: absolute;
            top:350px;
            vertical-align: middle;
            left: 0px;
            right: 0px;
        }

       .btn1{
           position:absolute;
           right:10px;
           top:10px;
           text-decoration:none;
           border-collapse:separate;
           border-spacing:10px 10px;
       }
       .btn2{
           position:absolute;
           right:10px;
           top:30px;
           text-decoration:none;
           border-collapse:separate;
           border-spacing:10px 10px;
       }
       .tblP{
            
            width:90%;
            text-align:center;
            padding:20px;
            position: absolute;
            left: 40px;
            top:200px;
           


       }
       tr{
           height: 30px;
           vertical-align: bottom;
           text-align: end;
       }
       tr:nth-child(even) {
           background-color: #52a2c6;

       }
       tr:nth-child(odd) {
           background-color: #09a597;

       }
       .dp{
            display: block;
            margin: auto;
            width: 100px;
            height:100px;
            border-radius: 50%;
            position:relative;
            top:50px;
       }

        .modalBackground{
            background-color:black;
            filter:alpha(opacity=80) !important;
            z-index:20;

        }
        .modalpopup{
            padding:20px 0px 24px 10px;
            position:relative;
            width:450px;
            height:300px;
            background-color:white;
            border:1px solid black;

        }

        
      </style>
</head>
<body style="height: 638px">

    <div class="container">
    <nav class="navbar transparent navbar-inverse ">
    <div class="container-fluid">
  
     <%--<div class="collapse navbar-collapse" id="myNavbar">--%>
      <ul class="nav navbar-nav" role="navigation">
        <li class="active"><a href="#">Home</a></li>
        <li><a href="ProfileView.aspx">View Profile</a></li>
           <li id="AdPost" runat="server" class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Add Post
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="AddPostHouse.aspx">House</a></li>
          <li><a href="AddPostShop.aspx">Shop</a></li>
          <li><a href="AddPostVehicle.aspx">Vehicle</a></li>
        </ul>
      </li>
        
          
		
      </ul>
      <ul class="nav navbar-nav navbar-right">
         <li><a href="#" runat="server" onserverclick="Logout_click"><span class="glyphicon glyphicon-log-out"></span> LogOut</a></li>
         <li></li>
      </ul>
    </div>
  
</nav>
</div>


    <form id="form1" runat="server" title="Rentec">
        
        <div class="formclass">
            
                <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">

                </asp:ToolkitScriptManager>
            
            
            <asp:ImageButton ID="DP" runat="server" AlternateText ="Profile picture" BorderColor="White" BorderStyle="Solid" CssClass="dp"  OnClientClick="dpupload_click" ImageUrl="~/DP/default.jpg"/>
            
            <asp:Label ID="PError" runat="server" Font-Bold="true" ForeColor="red"></asp:Label>
              
           <asp:Panel ID="ModalPanel" runat="server" Style="display: none;" CssClass="modalpopup"><br/>
                <asp:FileUpload ID="DPUpload" runat="server" /><br/><br/>
                <asp:Button ID="Upload" runat="server" Text="Upload Profile Picture" OnClientClick="DPUpload_Click" /><br/><br/>
                
               <asp:Label ID="UpErr" runat="server" Text="" ForeColor="Red" Font-Size="X-Large" Font-Names="ice kingdom" Font-Bold="True"></asp:Label>
                <br/><br/>
                <asp:Button ID="OK" runat="server" Text="Close" />

            </asp:Panel>
                  <asp:modalpopupextender id="mpe" runat="server" popupcontrolid="modalpanel" targetcontrolid="dp" backgroundcssclass="modalbackground" dropshadow="true" okcontrolid="ok">  
    </asp:modalpopupextender> 
           
           
            <asp:Table ID="PView" runat="server" CssClass="tblP">
                <asp:TableRow ID="TR1" HorizontalAlign="Center" runat="server">
                    <asp:TableCell HorizontalAlign="Left">First Name  </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left">
                        <asp:TextBox ID="Firstname" runat="server"></asp:TextBox>
                        
                    </asp:TableCell>
                </asp:TableRow>

                  <asp:TableRow ID="TR2" HorizontalAlign="Center" runat="server">
                    <asp:TableCell HorizontalAlign="Left">Last Name</asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left">
                        <asp:TextBox ID="Lastname" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow ID="TR3" HorizontalAlign="Center" runat="server">
                    <asp:TableCell HorizontalAlign="Left">User Type </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left">
                        <asp:Label ID="Utype" runat="server"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow ID="TR4" HorizontalAlign="Center" runat="server">
                    <asp:TableCell HorizontalAlign="Left">Date Of Birth </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left">
                        <asp:TextBox ID="DOB" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow ID="TR5" HorizontalAlign="Center" runat="server">
                    <asp:TableCell HorizontalAlign="Left">Address   </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left">
                        <asp:TextBox ID="Addressno" runat="server"></asp:TextBox>
                        <asp:TextBox ID="Addressst" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>

               <asp:TableRow ID="TR6" HorizontalAlign="Center" runat="server">
                    <asp:TableCell HorizontalAlign="Left"></asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left">
                        <asp:TextBox ID="Addressc" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>

                  <asp:TableRow ID="TR7" HorizontalAlign="Center" runat="server">
                    <asp:TableCell HorizontalAlign="Left">NIC number</asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left">
                        <asp:TextBox ID="natID" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>

                  <asp:TableRow ID="TR8" HorizontalAlign="Center" runat="server">
                    <asp:TableCell HorizontalAlign="Left">Mail ID</asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left">
                        <asp:TextBox ID="mailadd" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow ID="TR9" HorizontalAlign="Center" runat="server">
                    <asp:TableCell HorizontalAlign="Left">Contact Number</asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left">
                        <asp:TextBox ID="Cno" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>

            </asp:Table>
            
            
            <div class="container">
                <button type="button" class="btn btn-success" runat="server" style="float:right" id="save" OnClick="Save_Click">Save changes</button>
            </div>
         </div> 
        
    </form>
</body>
</html>
</asp:Content>


   
   

    
