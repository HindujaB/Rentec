<%@ Page Title="" Language="C#" MasterPageFile="~/Rentec.master" AutoEventWireup="true" CodeFile="ProfileView.aspx.cs" Inherits="Menu" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="ContentProfile" ContentPlaceHolderID="CPHmain" Runat="Server">
    
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Rentec</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
   
    <style>
        
       .jumbotron.pv{
           background-color: Highlight;
       } 
       header .bottom-header{
           padding-top:240px;
           padding-bottom:280px;
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
 
       
        .navbar.transparent.navbar-inverse {
            background: rgba(0,0,0,0.4);
            margin: 0px;
        }
            .details li {
      list-style: none;
    }
    li {
        margin-bottom:10px;
    }
   .tital{
       text-align:right;
   }
   .contant_i{
        color: #631e1e;
        border-bottom: 1px solid #cea7a7;
   }
  
        
      </style>
</head>
<body style="height: 638px">
    <form runat="server">
        <div class="container">
    <nav class="navbar transparent navbar-inverse ">
    <div class="container-fluid">
  
     <%--<div class="collapse navbar-collapse" id="myNavbar">--%>
      <ul class="nav navbar-nav" role="navigation">
        <li ><a href="SearchResult.aspx">Home</a></li>
        <li class="active"><a href="#">View Profile</a></li>
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
      
    </div>
  
</nav>
         <br/> 
             
        <asp:LinkButton ID="LogOutbtn" runat="server" CssClass="btn btn-primary pull-right" Text="LogOut" OnClick="Logout_click"><span class="glyphicon glyphicon-log-out"></span>  LogOut</asp:LinkButton>  
</div>
        <br/> 
            



            
                <%--<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">

                </asp:ToolkitScriptManager>--%>
            
            
            <%--<asp:ImageButton ID="DP" runat="server" AlternateText ="Profile picture" BorderColor="White" BorderStyle="Solid" CssClass="dp" ImageUrl="~/DP/default.jpg" />--%>
           
           <%--<asp:Panel ID="ModalPanel" runat="server" Style="display: none;" CssClass="modalpopup"><br/>
                <asp:FileUpload ID="DPUpload" runat="server" /><br/><br/>
                <asp:Button ID="Upload" runat="server" Text="Upload Profile Picture" OnClientClick="DPUpload_Click" /><br/><br/>
                <%--<asp:AjaxFileUpload ID="DPUpload" runat="server" Font-Names="Ice kingdom" Font-Strikeout="False" OnClientUploadComplete="DPUpload_UploadComplete" OnClientUploadError="DPUpload_UploadError" />--%>
               <%-- <asp:Label ID="UpErr" runat="server" Text="" ForeColor="Red" Font-Size="X-Large" Font-Names="ice kingdom" Font-Bold="True"></asp:Label>
                <br/><br/>
                <asp:Button ID="OK" runat="server" Text="Close" />

            </asp:Panel>--%>
            
    <%--        <asp:ModalPopupExtender ID="mpe" runat="server" PopupControlID="ModalPanel" TargetControlID="DP" BackgroundCssClass="modalBackground" DropShadow="True" OkControlID="OK">  
    </asp:ModalPopupExtender> 
           --%>
           <div class="container">
               <div class="jumbotron pv">
                    
                  <div class="row">
                      <div class="col-md-3 col-xs-12 col-sm-6 col-lg-3">
                        <div class="thumbnail text-center photo_view_postion_b" >
                          <img src="DP\default.jpg" alt="Profile photo" class="img"/>
                        </div>
                      </div>
                      <div class="col-md-9 col-xs-12 col-sm-6 col-lg-9">
                          <div class="" style="border-bottom:1px solid black">
                            <h2><asp:Label ID="name" runat="server" Text=""></asp:Label></h2>
                          </div>
                            <hr/>
                          <div class="col-md-8">  
                          <ul class=" details">
                           
                            <li><p><span class="glyphicon glyphicon-user" style="width:50px;"></span><asp:Label ID="Utype" runat="server" Text=""></asp:Label></p></li>
                            <li><p><span class="glyphicon glyphicon-map-marker one" style="width:50px;"></span><asp:Label ID="Address1" runat="server" Text=""></asp:Label>,  <asp:Label ID="Address2" runat="server" Text=""></asp:Label></p></li>
                            
                          </ul>
                          </div>
                          <div class="col-md-4">  
                            <div class="col-sm-5 col-xs-6 tital " style="font-size: large">Birthday:</div><div class="col-sm-7 col-xs-6" style="font-size: large"> <asp:Label ID="DOB" runat="server" Text=""></asp:Label></div>
                            <div class="clearfix"></div><div class="bot-border"></div>
                           
                            <div class="clearfix"></div><div class="bot-border"></div>
                            
                          </div>
                      </div>
                    </div>
                   </div>
               <%--<table class="table table-hover">
            
                
                    <tr><td>Name </td> 
                    
                   
                        <td><asp:Label ID="name" runat="server" Text=""></asp:Label></td>
                    
                    </tr>
                
                
                   <tr><td>User Type </td>
                        <td><asp:Label ID="Utype" runat="server" Text=""></asp:Label></td>
                    
                    </tr>
                
                
                    <tr><td>Date Of Birth</td>
                    
                  
                       <td> <asp:Label ID="DOB" runat="server" Text=""></asp:Label></td>
                    <
                    </tr>
                
                    <tr><td>Address  </td> 
                  
                    
                       <td> <asp:Label ID="Address1" runat="server" Text=""></asp:Label></td><br/>
                        
                   
                    </tr>
                <tr>
                    <td></td>
                  
                    
                        <td><asp:Label ID="Address2" runat="server" Text=""></asp:Label></td>
                    
                   </tr>
                
            
            </table>--%>
               </div>
            <button type="button" class="btn btn-default" runat="server" style="float:right" id="edit"><a href="EditProfile.aspx">Edit Profile</a></button>
           
         </form>
   
</body>
</html>
</asp:Content>
