
<%@ Page Title="" Language="C#" MasterPageFile="~/Rentec.master" AutoEventWireup="true" CodeFile="Signin.aspx.cs" Inherits="Signin"%>

<asp:Content ID="ContentSign" ContentPlaceHolderID="CPHmain" Runat="Server">
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head >
    <title></title>
    <script type="text/javascript">
function AddressValidate(source, args)
{
if (document.getElementById("<%= TextBoxAdd_no.ClientID %>").value =="" &&
    document.getElementById("<%= TextBoxAdd_street.ClientID %>").value == "" &&
    document.getElementById("<%= TextBoxAdd_city.ClientID %>").value == "" ) 
{
args.IsValid = false;
}
else
{
args.IsValid = true;
}
}


</script>
<style type="text/css">
    
       .formclass {
            background-color: #99CCFF;
            padding: 15px;
            margin: auto;
            width: 550px;
            border: medium dotted #0066CC;
            position: absolute;
            top: 350px;
            vertical-align: middle;
            left: 0px;
            right: 0px;
        }
       
        .headtxt {
            position: relative;
        }
        
        .error{
            width: 40px;
            text-align:left;
            font-family:Calibri;
            font-size:12px;
            color:red;
            font-weight:bold;
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

     
        
    .col1 {
        width: 135px;
        font-weight: bold;
		font-family:'Ice kingdom';
		 font-size:15px;
         text-align:right;
    }
    .tbl tr { 
        line-height: 10px; 
    }
    .tbl td{
        vertical-align: middle;
    }
    </style>
</head>
<body>
    
    <form id="form2" runat="server" title="Rentec">
        
    <div class="formclass"  >
                <table class="tbl">
        <tr>
            <td class="col1">First Name:</td>
            <td class="tbox">
                <asp:TextBox ID="TextBoxFN" runat="server" Width="300px" CssClass="txtbox"></asp:TextBox>
                
                <br/>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBoxFN" CssClass="error" ErrorMessage="First Name required" ></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="col1">Last Name:</td>
            <td class="tbox">
                <asp:TextBox ID="TextBoxLN" runat="server" Width="300px" CssClass="txtbox"></asp:TextBox>
                
                <br/>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="TextBoxLN" CssClass="error" ErrorMessage="Last Name required"></asp:RequiredFieldValidator>
            </td>
         </tr>
         <tr>
             <td class="col1">Date of Birth:</td>
             <td class="tbox">
                 <asp:TextBox ID="TextBoxDOB" runat="server" Width="300px" CssClass="txtbox" type="date"></asp:TextBox>
                
                <br/>
                 <asp:RangeValidator ID="dob_validate" runat="server" MaximumValue="2000-12-31" MinimumValue="1937-01-01" Visible="true" ControlToValidate="TextBoxDOB" CssClass="error" ErrorMessage="Age out of range"></asp:RangeValidator>
                <br/>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="TextBoxDOB" CssClass="error" ErrorMessage="Date Of Birth required"></asp:RequiredFieldValidator>
             </td>
          </tr>
          <tr>
              <td class="col1">NIC Number:</td>
              <td class="tbox">
                  <asp:TextBox ID="TextBoxNIC" runat="server" Width="300px" CssClass="txtbox"></asp:TextBox>
                  
                  <br/>
                  <asp:RegularExpressionValidator ID="NIC_validate" runat="server" ErrorMessage="Invalid NIC number" ValidationGroup="error" ControlToValidate="TextBoxNIC" CssClass="error" Visible="False" ValidationExpression="[0-9]{9|11}[x|X|v|V]$"></asp:RegularExpressionValidator>
                  <br/>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="TextBoxNIC" CssClass="error" ErrorMessage="NIC Number required"></asp:RequiredFieldValidator>
              </td>
          </tr>
          <tr>
              <td class="col1">Gender:</td>
              <td>
                  <asp:DropDownList ID="DropDownListGen" runat="server" Width="200px" CssClass="txtbox">
                  
                       <asp:ListItem>Male</asp:ListItem>
                       <asp:ListItem>Female</asp:ListItem>
                       <asp:ListItem>Other</asp:ListItem>
                  </asp:DropDownList>
                  <br/>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="DropDownListGen" CssClass="error" ErrorMessage="Gender required" InitialValue="Other"></asp:RequiredFieldValidator>
              </td>
          </tr>
          <tr>
              <td class="col1">Telephone Number:</td>
              <td class="tbox">
                  <asp:TextBox ID="TextBoxTP" runat="server" Width="300px" CssClass="txtbox"></asp:TextBox>
                  
                  <br/>
                  <asp:RegularExpressionValidator ID="TPvalidate" runat="server" ErrorMessage="Invalid Telephone number" ValidationGroup="error" ControlToValidate="TextBoxTP" CssClass="error"  ValidationExpression="[0][1-9][1-9][0-9]{7}"></asp:RegularExpressionValidator>
                  <%--<asp:RangeValidator ID="TPvalidate" runat="server" ErrorMessage="Invalid Telephone number" ControlToValidate="TextBoxTP" CssClass="error" Visible="False" MaximumValue="0000000000" MinimumValue="0799999999"></asp:RangeValidator>--%>
                  <br/>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="TextBoxTP" CssClass="error" ErrorMessage="Telephone number required"></asp:RequiredFieldValidator>
              </td>
           </tr>
           <tr>
              <td class="col1">E-Mail :</td>
              <td class="tbox">
                  <asp:TextBox ID="TextBoxMail" runat="server" Width="300px" CssClass="txtbox"></asp:TextBox>
                   
                    <br/>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="TextBoxMail" CssClass="error" ErrorMessage="Mail Id is Required"></asp:RequiredFieldValidator>
                   <br/> 
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxMail" CssClass="error" ErrorMessage="Invalid mail id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
              </td>
           </tr>
           <tr>
              <td class="col1">Address:</td>
              <td class="tbox">
                  <asp:TextBox ID="TextBoxAdd_no" runat="server" Width="300px" CssClass="txtbox" Text="Number"></asp:TextBox>
                  
                  <br />
                  <asp:TextBox ID="TextBoxAdd_street" runat="server" Width="300px" CssClass="txtbox" Text="Street"></asp:TextBox>
                 
                  <br />
                  <asp:TextBox ID="TextBoxAdd_city" runat="server" Width="300px" CssClass="txtbox" Text="City"></asp:TextBox>
                  
                  <br/>
                  <asp:CustomValidator id="RequiredFieldValidatorAdd" runat="server" ErrorMessage="Address required" Display="Dynamic" ClientValidationFunction="AddressValidate" />
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="TextBoxAdd_no" ErrorMessage="Address required" CssClass="error"></asp:RequiredFieldValidator>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" ControlToValidate="TextBoxAdd_street" ErrorMessage="Address required" CssClass="error"></asp:RequiredFieldValidator>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator36" runat="server" ControlToValidate="TextBoxAdd_city" ErrorMessage="Address required" CssClass="error"></asp:RequiredFieldValidator>
              <br/>
                   <br/>
                  </td>
           </tr>
            <tr>
               <td class="col1"></td>
               <td>
                   <asp:Button ID="signinpg" runat="server" Text="Submit" Width="99px" OnClick="Signinpg_Click" />
                   <input id="Reset" type="reset" value="reset" /></td>
               
             </tr>
             </table>
        </div>
               
    </form>
</body></html>
</asp:Content>