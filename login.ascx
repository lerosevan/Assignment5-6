<!DOCTYPE html>
<script runat="server">

    Protected Sub Button1_Click(sender As Object, e As EventArgs)
        Session("name") = usertext.Text
        Response.Redirect("TryItPage.aspx")
    End Sub
</script>

<style type="text/css">
    .auto-style1 {
        width: 545px;
    }
</style>

<table style="width:100%;">
    <tr>
        <td class="auto-style1">Username:</td>
        <td>
            <asp:TextBox ID="usertext" runat="server" ValidationGroup="Iv"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="usertext" ForeColor="Red" ValidationGroup="Iv">*</asp:RequiredFieldValidator>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style1">Password:</td>
        <td>
            <asp:TextBox ID="passwordtext" runat="server" ValidationGroup="Iv"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="passwordtext" ForeColor="Red" ValidationGroup="Iv">*</asp:RequiredFieldValidator>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style1">&nbsp;</td>
        <td>
            <asp:Button ID="Button1" runat="server" Text="Login" ValidationGroup="Iv" OnClick="Button1_Click" style="height: 35px" />
        </td>
        <td>&nbsp;</td>
    </tr>
</table>