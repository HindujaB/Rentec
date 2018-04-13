<%@ Page Title="" Language="C#" MasterPageFile="~/Rentec.master" AutoEventWireup="true" CodeFile="SearchResult.aspx.cs" Inherits="SearchResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPHmain" Runat="Server">
    <!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
     <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
   
    <style>
        @import "css\cssfamily.css";
          .navbar.transparent.navbar-inverse {
   background: rgba(0,0,0,0.4);
   margin:0px;
  
}
    
.dropdown.dropdown-lg .dropdown-menu {
    margin-top: -1px;
    padding: 6px 20px;
}
.input-group-btn .btn-group {
    display: flex !important;
}
.btn-group .btn {
    border-radius: 0;
    margin-left: -1px;
}
.btn-group .btn:last-child {
    border-top-right-radius: 4px;
    border-bottom-right-radius: 4px;
}
.btn-group .form-horizontal .btn[type="submit"] {
  border-top-left-radius: 4px;
  border-bottom-left-radius: 4px;
}
.form-horizontal .form-group {
    margin-left: 0;
    margin-right: 0;
}
.form-group .form-control:last-child {
    border-top-left-radius: 4px;
    border-bottom-left-radius: 4px;
}
.search-result.row.col-sm-7{
    font-size:larger;

}
@media screen and (min-width: 768px) {
    #adv-search {
        width: 500px;
        margin: 0 auto;
    }
    .dropdown.dropdown-lg {
        position: static !important;
    }
    .dropdown.dropdown-lg .dropdown-menu {
        min-width: 500px;
    }
}
.container { margin-top: 20px; color:white;}
#lawmodal{
    color:black;
}
.mb20 { margin-bottom: 20px; } 

hgroup { padding-left: 15px; border-bottom: 1px solid #ccc; }
hgroup h1 { font: 500 normal 1.625em "Roboto",Arial,Verdana,sans-serif; color:white; margin-top: 0; line-height: 1.15; }
hgroup h2.lead { font: normal normal 1.125em "Roboto",Arial,Verdana,sans-serif; color:white; margin: 0; padding-bottom: 10px; }

.search-result .thumbnail { border-radius: 0 !important; }
.search-result:first-child { margin-top: 0 !important; }
.search-result { margin-top: 20px; }
.search-result .col-md-2 { border-right: 1px dotted #ccc; min-height: 140px; }
.search-result ul { padding-left: 0 !important; list-style: none;  }
.search-result ul li { font: 400 normal .85em "Roboto",Arial,Verdana,sans-serif;  line-height: 30px; }
.search-result ul li i { padding-right: 5px; }
.search-result .col-sm-7 { position: relative; }
.search-result h3 { font: 500 normal 1.375em "Roboto",Arial,Verdana,sans-serif; margin-top: 0 !important; margin-bottom: 10px !important; }
.search-result h3 > a, .search-result i { color: #248dc1 !important; }
.search-result p { font: normal normal 1.125em "Roboto",Arial,Verdana,sans-serif; } 
.search-result span.plus { position: absolute; right: 0; top: 126px; }
.search-result span.plus a { background-color: #248dc1; padding: 5px 5px 3px 5px; }
.search-result span.plus a:hover { background-color: #414141; }
.search-result span.plus a i { color: #fff !important; }
.search-result span.border { display: block; width: 97%; margin: 0 15px; border-bottom: 1px dotted #ccc; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
    <nav class="navbar transparent navbar-inverse ">
    <div class="container-fluid">
  
     <%--<div class="collapse navbar-collapse" id="myNavbar">--%>
      <ul class="nav navbar-nav" role="navigation">
        <li class="active"><a href="#">Home</a></li>
        <li><a href="ProfileView.aspx" >View Profile</a></li>
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
        <asp:Button ID="AddFee" runat="server" Text="Add Fee" class="btn btn-info btn-lg" data-toggle="modal" data-target="#lawmodal"/>
</div>
        <br/>
        <br/>
   <nav class="navbar transparent navbar-inverse " role="navigation">
  
  <div class="navbar">
    
    <a class="navbar-brand" href="#" style="font-weight: bold; font-size: large; font-family: 'Ice kingdom'; color: #FFFFFF">Search for a property</a>
  </div>

 
  <div class="collapse navbar-collapse" id="srchbar">
    <ul class="nav navbar-nav">
        <li class="dropdown">
            <asp:DropDownList ID="prop" runat="server" CssClass="form-control btn btn-default dropdown-toggle" data-toggle="dropdown" style="font-size: large; color: #000000" placeholder="Select Property" >
                <asp:ListItem value="House">House</asp:ListItem>
                <asp:ListItem value="Shop">Shop</asp:ListItem>
                <asp:ListItem value="Vehicle">Vehicle</asp:ListItem>
            </asp:DropDownList>
        <%--<a id="prop" href="#" class="dropdown-toggle" data-toggle="dropdown" style="font-size: large; color: #FFFFFF">Select Property <b class="caret"></b></a>--%>
        <%--<ul class="dropdown-menu">
          <li><a href="#">House</a></li>
		  <li class="divider"></li>
          <li><a href="#">Shop</a></li>
		  <li class="divider"></li>
          <li><a href="#">Vehicle</a></li>
        </ul>--%>
      </li>
    </ul>
    <ul class="nav navbar-nav">
        <li class="dropdown">
   <%--         <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="font-size: large; color: #FFFFFF">Select by district <b class="caret"></b></a>--%>
  
     <%-- <asp:TextBox ID="dist" class="form-control" placeholder="District of property" runat="server" name="dis"></asp:TextBox>--%>
          <asp:DropDownList ID="dist" placeholder="District of property" CssClass="form-control btn btn-default dropdown-toggle" runat="server">
                                        <asp:ListItem value="All">All districts</asp:ListItem>
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
                                   
      </li>
    </ul>
    <div class="col-sm-3 col-md-3">
        <form class="navbar-form" role="search">
        
            
            <div class="input-group input-group-btn">
                <asp:LinkButton ID="LinkButton1" CssClass="btn btn-default" OnClick="srch_click" runat="server"><i class="glyphicon glyphicon-search"></i></asp:LinkButton>
                
            </div>
       
        </form>
    </div>
    
  </div><!-- /.navbar-collapse -->
</nav>
        <br/>
        <br/>
            <%--<div class="container">

    <hgroup class="mb20">
		<h1>Search Results</h1>
		<h2 class="lead"><strong class="text-danger"><asp:Label ID="num" runat="server" Text=""></asp:Label></strong> results were found for the search</h2>								
	</hgroup>

     
			
		
	<div class="search-result row">
			<div class="col-sm-3">
				<a href="#" title="Lorem ipsum" class="thumbnail"><asp:Image ID="Image1" runat="server" alt="Post photo" class="img" /></a>
			</div>
			
			<div class="col-sm-7 ">
				
				<h3><a href="#" title="">Result1</a></h3>
				<p>Result1 detail</p>	
                					
                
                <span class="pull-right buttons">
                    <asp:Button ID="Button1" runat="server" Text="Show" CssClass="btn btn-sm btn-info"/>
                  
                </span>
            
			</div>
			
			<span class="clearfix borda"></span>
		</div>
		<div class="search-result row col-sm-3">
			<div class="col-sm-3">
				<a href="#" title="Lorem ipsum" class="thumbnail"><asp:Image ID="Image2" runat="server" alt="Post photo" class="img" /></a>
			</div>
			
			<div class="col-sm-7 ">
				
				<h3><a href="#" title="">Result1</a></h3>
				<p>Result1 detail</p>	
                					
                
                <span class="pull-right buttons">
                    <asp:Button ID="Button2" runat="server" Text="Show" CssClass="btn btn-sm btn-info"/>
                  
                </span>
            
			</div>
			
			<span class="clearfix borda"></span>
		</div>
    </div> itemstyle-cssclass="search-result row " --%>
       	
        
        <%--<div class="container">

    <hgroup class="mb20">
		<h1>Search Results</h1>
		<h2 class="lead"><strong class="text-danger"><asp:Label ID="num" runat="server" Text=""></asp:Label></strong> results were found for the search</h2>								
	</hgroup>

     
			
		
	<div class="search-result row">
			<div class="col-sm-3">
				<a href="#" title="Lorem ipsum" class="thumbnail"><asp:Image ID="Image1" runat="server" alt="Post photo" class="img" /></a>
			</div>
			
			<div class="col-sm-7 ">
				
				<h3><a href="#" title="">Result1</a></h3>
				<p>Result1 detail</p>	
                					
                
                <span class="pull-right buttons">
                    <asp:Button ID="Button1" runat="server" Text="Show" CssClass="btn btn-sm btn-info"/>
                  
                </span>
            
			</div>
			
			<span class="clearfix borda"></span>
		</div>
		<div class="search-result row">
			<div class="col-sm-3">
				<a href="#" title="Lorem ipsum" class="thumbnail"><asp:Image ID="Image2" runat="server" alt="Post photo" class="img" /></a>
			</div>
			
			<div class="col-sm-7 ">
				
				<h3><a href="#" title="">Result1</a></h3>
				<p>Result1 detail</p>	
                					
                
                <span class="pull-right buttons">
                    <asp:Button ID="Button2" runat="server" Text="Show" CssClass="btn btn-sm btn-info"/>
                  
                </span>
            
			</div>
			
			<span class="clearfix borda"></span>
		</div>
    </div>--%>
        <div class="modal fade" id="lawmodal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
	  
        <div class="modal-header" runat="server">
          
          <h4 class="modal-title">If you are a lawyer,</h4>
        </div>
        <div class="modal-body">
            <asp:Label ID="fee" runat="server" Text="Enter your fees" Font-Bold="True"></asp:Label>
		<asp:TextBox ID="LawyerFee" runat="server"></asp:TextBox>
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        </div>
        <div class="modal-footer">
		 <asp:Button ID="Add" runat="server" Text="Save" class="btn btn-default" OnClick="AddLawyer_fee" UseSubmitBehavior="false"/>
            <asp:Button ID="close" runat="server" Text="Close" class="btn btn-default" data-dismiss="modal" />
          <!--  <button type="button"  data-dismiss="modal">Close</button> -->
        </div>
		
      </div>
      
    </div>
  </div>
        <asp:GridView ID="Results" runat="server" AutoGenerateColumns="false" CssClass="table table-responsive" EmptyDataText="No Results Found" EnableViewState="False" GridLines="Horizontal" OnRowCommand="Results_redirect">
                        <Columns>
                            <asp:ImageField DataImageUrlField="photo" HeaderText="" ItemStyle-CssClass="row col-sm-3 img" ControlStyle-Width="160" ControlStyle-Height = "120" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Right" HeaderStyle-VerticalAlign="Middle"  />
                            <asp:BoundField DataField="rent" HeaderText="Rent in rupees" ItemStyle-CssClass="row col-sm-3" ItemStyle-HorizontalAlign="Right" ItemStyle-VerticalAlign="Middle" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Right" HeaderStyle-VerticalAlign="Middle" />
                            <asp:BoundField DataField="DIS" HeaderText="District" ItemStyle-CssClass="row col-sm-3" ItemStyle-HorizontalAlign="Right" ItemStyle-VerticalAlign="Middle" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Right" HeaderStyle-VerticalAlign="Middle" />
                            <asp:TemplateField>
            <ItemTemplate>
                <%--<asp:Button ID="showp" runat="server" Text="Show" CssClass="btn btn-sm btn-info" CommandName="Show" CommandArgument='<%#Eval("PID")%>' />--%>
                <asp:Button ID="Interested" CssClass="btn-success" runat="server" Text="Interested to rent" OnClick="Interested_Click" CommandName="Show" CommandArgument='<%#Eval("PID")%>' />
                  
                   
            </ItemTemplate>
        </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
       
    </form>
</body>
</html>
</asp:Content>

