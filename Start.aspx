
<%@ Page Title="" Language="C#" MasterPageFile="~/Rentec.master" AutoEventWireup="true" CodeFile="Start.aspx.cs" Inherits="Start" %>
<asp:Content ID="ContentStart" ContentPlaceHolderID="CPHmain" Runat="Server">
    <!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

   <head> 
        <title></title>
       <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery.min.js"></script>
       
    <script src="js/jquery-1.7.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
         
    <style>
               .formclass {
            background-color: #99CCFF;
            padding: 15px;
            margin: auto;
            width: 550px;
            border: medium dotted #0066CC;
            position: absolute;
            top: 300px;
            vertical-align: middle;
            left: 0px;
            right: 0px;
        }

        .headtxt {
            position: relative;
        }
        



        .input {
            padding: 2px;
            width: 150px;
            margin-bottom: 0px;
        }

        Label {
            font-weight: bold;
            font-family: Calibri;
            font-size: large;
        }

        RadioButton.input {
            font-weight: bold;
        }

        #mem {
            text-align: center;
        }

        

        .auto-style1 {
            height: 31px;
        }

        .auto-style2 {
            height: 31px;
            width: 204px;
        }

        .auto-style3 {
            width: 204px;
        }


       
    </style>
       <script type="text/javascript">  
          
           function UNavail() { //This function call on text change.             
               $.ajax({
                   type: "POST",
                   url: "Start.aspx/CheckUN", // this for calling the web method function in cs code.  
                   data: '{Uname: "' + $("#<%=usertxt.ClientID%>")[0].value + '" }',// user name or email value  
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess,
                failure: function (response) {
                    alert(response);
                }
               });
           }

           // function OnSuccess  
           function OnSuccess(response) {
               var msg = $("#<%=lblStatus.ClientID%>")[0];
               switch (response.d) {
                   case "true":
                       msg.style.display = "block";
                       msg.style.color = "red";
                       msg.innerHTML = "Username already exists.";
                       break;
                   case "false":
                       msg.style.display = "block";
                       msg.style.color = "green";
                       msg.innerHTML = "Username Available";
                       break;
               }
           }

    </script>  
       <script>
           function Validate_user_type(source, args) {
               var utyp = document.getElementById('<%= usertype.ClientID %>');
               var utypIn = utyp.getElementsByTagName("input");
               for (var i = 0; i < utypIn.length; i++) {
        if (utypIn[i].checked) {
            args.IsValid = true;
            return;
        }
    }
    args.IsValid = false;
           }
          

       </script>
</head>
<body>
   
    <form id="form1" runat="server" title="Rentec">
     
        <div class="formclass">
            <table class="formtbl">
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="Labeluser" runat="server" Text="usename" Font-Names="Ice kingdom"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="usertxt" CssClass="input"  runat="server" onchange="UNavail()" BackColor="#99CCFF"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorun" runat="server" ErrorMessage="Username required" Font-Bold="True" ForeColor="Red" ControlToValidate="usertxt"></asp:RequiredFieldValidator>
                        <asp:Label ID="lblStatus" runat="server"></asp:Label>  
                          
                    </td> 
                    <td class="auto-style1">
                        <h4 style="font-family: 'ice kingdom'; width: 237px; height: 13px;">Please select your user type</h4>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Labelpass" runat="server" Text="password" Font-Names="Ice kingdom"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="passtxt" CssClass="input"  TextMode="Password" runat="server" BackColor="#99CCFF">password</asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorp" ForeColor="Red" runat="server" ErrorMessage="Password required" Font-Bold="True" ControlToValidate="passtxt"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <fieldset style="border-style: none; border-color: #FFFFFF">
                            <div style="border-style: none">
                                <br/> <%--<asp:CheckBox ID="Customer" runat="server"></asp:CheckBox>
                                    <asp:CheckBox ID="Owner" runat="server"></asp:CheckBox>
                                    <asp:CheckBox ID="Lawyer" runat="server"></asp:CheckBox>--%>
                                <asp:CheckBoxList ID="usertype" runat="server">
                                   
                                <asp:ListItem Text="Customer" Value="C"></asp:ListItem>  
                                <asp:ListItem Text="Owner" Value="O"></asp:ListItem>  
                                <asp:ListItem Text="Lawyer" Value="L"></asp:ListItem>  
                                </asp:CheckBoxList>
                                <br/>
                                <br/>
                                <%--<asp:RequiredFieldValidator ID="RFValidator1" runat="server" ErrorMessage="User type required" Font-Italic="False"></asp:RequiredFieldValidator>--%>
                                <%--<asp:RadioButton ID="customerbtn" runat="server" CssClass="input" Text="Customer" value="customer" AutoPostBack="True" GroupName="UserGroup" OnCheckedChanged="customerbtn_CheckedChanged" />
                                <br />
                                <asp:RadioButton ID="ownerbtn" runat="server" CssClass="input" Text="Owner" value="owner" AutoPostBack="True" GroupName="UserGroup" OnCheckedChanged="ownerbtn_CheckedChanged" />
                                <br />
                                <asp:RadioButton ID="lawyerbtn" runat="server" CssClass="input" Text="Lawyer" value="lawyer" AutoPostBack="True" GroupName="UserGroup" OnCheckedChanged="lawyerbtn_CheckedChanged" />
                                <br />--%>
                                <asp:CustomValidator runat="server" ID="utypvalid" ForeColor="Red" ClientValidationFunction="Validate_user_type"  ErrorMessage="Please Select Atleast one user type" ></asp:CustomValidator>

                            </div>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="cnfrmpass" runat="server" Text="Confirm password" Font-Names="Ice kingdom"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="cpasstxt" CssClass="input"  TextMode="Password" runat="server" BackColor="#99CCFF">password</asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorcp" runat="server" ForeColor="Red" ErrorMessage="Password confirmation required" Font-Bold="True" ControlToValidate="cpasstxt"></asp:RequiredFieldValidator>
                    </td>
                    <td></td>
                </tr>
            </table>
            <br />
            <asp:Button ID="sign" runat="server" Text="Submit" CssClass="btn" Font-Bold="True" Font-Names="Calibri" Font-Size="Medium" Height="30px" Width="441px" OnClick="Sign_Click" Style="margin-left: 74px" />
            <h4 id="mem">Already a member?</h4>
            <asp:Button ID="login" runat="server" Text="Login" CssClass="btn" Font-Bold="True" Font-Names="Calibri" Font-Size="Medium" Height="30px" Width="438px" Style="margin-left: 76px" OnClick="Login_Click" CausesValidation="False" />
        </div>
    
    <%--<div class="modal fade" id="lawmodal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
	  
        <div class="modal-header" runat="server">
          
          <h4 class="modal-title">If you are a lawyer,</h4>
        </div>
        <div class="modal-body">
            <asp:Label ID="fee" runat="server" Text="Enter your fees" Font-Bold="True"></asp:Label>
		<asp:TextBox ID="LawyerFee" runat="server"></asp:TextBox>
         
        </div>
        <div class="modal-footer">
		 <asp:Button ID="Add" runat="server" Text="Save" class="btn btn-default" data-dismiss="modal" OnClick="AddLawyer_fee" />
          <!--  <button type="button"  data-dismiss="modal">Close</button> -->
        </div>
		
      </div>
      
    </div>
  </div>--%>
      
    
        </form>
</body>
</html>
</asp:Content>