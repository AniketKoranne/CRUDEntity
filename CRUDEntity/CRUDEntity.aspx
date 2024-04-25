<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CRUDEntity.aspx.cs" Inherits="CRUDEntity.CRUDEntity" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script>
        // Search Data In grid 
        function Search_Gridview(strKey, strGV) {
            try {                
                var strData = strKey.value.toLowerCase().split(" ");
                var tblData = document.getElementById(strGV);
                var rowData;
                for (var i = 1; i < tblData.rows.length; i++) {
                    rowData = tblData.rows[i].innerHTML;
                    var styleDisplay = 'none';
                    for (var j = 0; j < strData.length; j++) {
                        if (rowData.toLowerCase().indexOf(strData[j]) >= 0)
                            styleDisplay = '';
                        else {
                            styleDisplay = 'none';
                            break;
                        }
                    }
                    tblData.rows[i].style.display = styleDisplay;
                }
            }
            catch (err) {
                console.error("Error in Search_Gridview function: " + err.message);
            }
        }

        var prm = Sys.WebForms.PageRequestManager.getInstance();
        if (prm != null) {
            prm.add_endRequest(function () {
                //REBIND TO JQUERY DATA TABLE
                if (Sys.WebForms.PageRequestManager.getInstance()._postBackSettings.panelsToUpdate != null) {
                    if ($('#<%= txtSearch.ClientID %>').length > 1) {
                    //console.log('Search_Gridview function called after postback');
                    Search_Gridview(document.getElementById('<%= txtSearch.ClientID %>'), '<%= GridView2.ClientID %>');
                    }
                }
            });
        }
</script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div>
                    <nav class="navbar bg-body-tertiary">
                        <div class="container-fluid">
                            <a class="navbar-brand text-dark fw-bold" href="#">
                                <img src="img/L1.png" alt="Logo" width="200" height="50" class="d-inline-block align-text-top" />
                                CRUDEntity
                            </a>
                        </div>
                    </nav>
                    <div class="card m-4">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtStudentID" runat="server" CssClass="form-control" placeholder="Student ID" Enabled="false"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtStudentID" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" placeholder="First Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFirstName" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtMiddleName" runat="server" CssClass="form-control" placeholder="Middle Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtMiddleName" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row mt-4">
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" placeholder="Last Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtLastName" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine" placeholder="Student Address"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtAddress" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" TextMode="Phone" placeholder="Phone Number"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtPhone" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="col-md-4">
                                    <asp:Button ID="btnInsert" runat="server" Text="Save" OnClick="btnInsert_Click" CssClass="btn btn-primary" />
                                </div>
                                <div class="col-md-4">
                                    <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-primary" OnClick="btnUpdate_Click" />
                                </div>
                                <div class="col-md-4">
                                    <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-primary" OnClick="btnDelete_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr />
                    <div class="row m-4">
                        <div class="col-md-4 pull-left" style="margin-top: 1em;">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-search" style="color: gold"></i></span>
                                <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Type To Search In Grid" onkeyup="Search_Gridview(this, 'GridView2')"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <asp:GridView ID="GridView2" runat="server" CssClass="table table-striped table-dark table-hover" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView2_SelectedIndexChanged"></asp:GridView>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
