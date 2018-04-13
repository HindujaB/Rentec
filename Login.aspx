
<%@ Page Title="" Language="C#" MasterPageFile="~/Rentec.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="ContentLogin" ContentPlaceHolderID="CPHmain" Runat="Server">

    <!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Rentec</title>
  

    <style>
        .jumbotron.v{
            background-color:Highlight;
    padding:150px 150px;
    resize:both;
   
    }
        header .bottom-header{
           padding-top:240px;
           padding-bottom:280px;
       }

        }
        

        .headtxt {
            position: relative;
        }

       
        h2 {
            text-align: center;
        }


        .input {
            padding:6px;
            width: 150px;
            margin-left: 0px;
            margin-top:0px;
        }

        Label {
            font-weight: bold;
            font-family: Calibri;
            font-size: large;
        }


       
        
       
        

        .tbox {
            align-self: center;
            height: 40px;
            width: 210px;
        }

       
        
            </style>
</head>
<body style="height: 638px">
    
    <form runat="server">
        <div class="formclass">
                       <div class="row">
                       <div class="col-sm-2 center-block" style="font-size: 22px; font-weight: bold; font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; color: #FFFFFF"> Username</div>
                    <div class="col-sm-2 center-block">
                        <asp:TextBox ID="usertxt" CssClass="input" placeholder="Username" runat="server" BackColor="#99CCFF" Font-Names="Cambria"></asp:TextBox>
                    </div>
                    <br/>
                            <div class="col-sm-3 center-block">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="usertxt" ErrorMessage="Username Required" Font-Bold="True" Font-Names="Cambria" ForeColor="Red"></asp:RequiredFieldValidator>
                    
                <br/>
                    </div>       </div>
                <div class="row">
                        <div class="col-sm-2 center-block"style="font-size: 22px; font-weight: bold; font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; color: #FFFFFF">Password</div>
                    <div class="col-sm-2 center-block">
                        <asp:TextBox ID="passtxt" CssClass="input" placeholder="Password" TextMode="Password" runat="server" BackColor="#99CCFF" Font-Names="Cambria"></asp:TextBox>
                   </div>
                    <br/>
                     <div class="col-sm-3 center-block">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="passtxt" ErrorMessage="Password Required" Font-Bold="True" Font-Names="Cambria" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br/>
                         </div>
                    </div>
                    <div class="row">
                    <asp:Label ID="PassError" runat="server" Text="" BackColor="#99CCFF" Font-Bold="True" Font-Names="Ice Kingdom" Font-Size="Larger" ForeColor="#CC0000"></asp:Label>
                    </div>
            <div class="row"><br/></div>
               <div class="row">
            <asp:Button ID="login" runat="server" Text="Login" class="btn btn-block" Font-Bold="True" Font-Names="Calibri" Font-Size="Medium" Height="30px" Width="350px" Style="margin-left: 45px" OnClick="Login_Click" />
                 <br />
                   </div>
            
            
            
            
        </div>
    </form>
       
</body>
</html>
    </asp:Content>