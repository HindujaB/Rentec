<%@ Page Title="" Language="C#" MasterPageFile="~/Rentec.master" AutoEventWireup="true" CodeFile="ViewHouse.aspx.cs" Inherits="ViewHouse" %>

<asp:Content ID="vwhouse" ContentPlaceHolderID="CPHmain" Runat="Server">
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
 .col-md-6{
     font-size:x-large;

 }
        
      </style>
</head>
<body style="height: 638px">
    <form runat="server">
        <div class="container">
    <nav class="navbar transparent navbar-inverse ">
    <div class="container-fluid">
  
    
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
            <div class="container">
               <div class="jumbotron pv">
                    
                  <div class="row">
                      <div class="col-md-3 col-xs-12 col-sm-6 col-lg-3">
                        <div class="thumbnail text-center photo_view_postion_b" >
                          
						<asp:Image ID="pstpic" runat="server" alt="Post photo" class="img" />
						 
                        </div>
                      </div>
                      <div class="col-md-9 col-xs-12 col-sm-6 col-lg-9">
                          <div class="" style="border-bottom:1px solid black">
                            <h2><asp:Label ID="name" runat="server" Text="House Information"></asp:Label></h2>
                             
                          </div>
                            
                         
						   <div class="row">
                      <div class="form-group row">
                        <div class="col-md-12">
                            <div class="form-group" >
                                
                            </div>
                            <div class="col-md-6">
                                <div class="col-sm-6 col-xs-6 tital " >Owner:</div><div class="col-sm-6 col-xs-6 contant_i"><asp:Label ID="own" runat="server" Text=""></asp:Label></div>
                                <div class="clearfix"></div><div class="bot-border"></div>
                                <div class="col-sm-6 col-xs-6 tital " >Register Number:</div><div class="col-sm-6 col-xs-6 contant_i"><asp:Label ID="rno" runat="server" Text=""></asp:Label></div>
                                <div class="clearfix"></div><div class="bot-border"></div>
                             </div>    
                           <div class="col-md-6">
                                <div class="col-sm-6 col-xs-6 tital " >District:</div><div class="col-sm-6 col-xs-6 contant_i"><asp:Label ID="dist" runat="server" Text=""></asp:Label></div>
                                <div class="clearfix"></div><div class="bot-border"></div>
                                <div class="col-sm-6 col-xs-6 tital " >Type:</div><div class="col-sm-6 col-xs-6 contant_i"><asp:Label ID="typeh" runat="server" Text=""></asp:Label></div>
                                <div class="clearfix"></div><div class="bot-border"></div>
                             </div>  
						   <div class="col-md-6">
                                <div class="col-sm-6 col-xs-6 tital " >Area :</div><div class="col-sm-6 col-xs-6 contant_i"><asp:Label ID="areah" runat="server" Text=""></asp:Label></div>
                                <div class="clearfix"></div><div class="bot-border"></div>
                                <div class="col-sm-6 col-xs-6 tital " >Rent per day:</div><div class="col-sm-6 col-xs-6 contant_i"><asp:Label ID="rpd" runat="server" Text=""></asp:Label></div>
                                <div class="clearfix"></div><div class="bot-border"></div>
                             </div>  							 
                            
                        </div>
                      </div>
                    </div>
                      </div>
                    </div>
                   
                   </div>



            
                
               </div>
            
           
         </form>
   
</body>
</html>
</asp:Content>

