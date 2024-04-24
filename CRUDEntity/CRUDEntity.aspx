<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CRUDEntity.aspx.cs" Inherits="CRUDEntity.CRUDEntity" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <nav class="navbar bg-body-tertiary">
                <div class="container-fluid">
                    <a class="navbar-brand text-dark fw-bold" href="#">
                        <img src="img/L1.png" alt="Logo" width="30" height="24" class="d-inline-block align-text-top" />
                        CRUDEntity
                    </a>
                </div>                
            </nav>
            <div class="card m-4">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-4">
                            <asp:TextBox ID="txtStudentID" runat="server" CssClass="form-control" placeholder="Student ID" Enabled="false"></asp:TextBox>
                        </div>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" placeholder="First Name"></asp:TextBox>
                        </div>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtMiddleName" runat="server" CssClass="form-control" placeholder="Middle Name"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row mt-4">
                        <div class="col-md-4">
                            <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" placeholder="Last Name"></asp:TextBox>
                        </div>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine" placeholder="Student Address"></asp:TextBox>
                        </div>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" TextMode="Phone" placeholder="Phone Number"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-md-4">
                            <asp:Button ID="btnInsert" runat="server" Text="Save" OnClick="btnInsert_Click" CssClass="btn btn-primary"/>
                        </div>
                        <div class="col-md-4">
                            <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-primary"/>
                        </div>
                        <div class="col-md-4">
                            <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-primary"/>
                        </div>
                    </div>
                </div>
            </div>
            <hr />
            <div class="row m-4">
                <div class="col-md-12">
                    <asp:GridView ID="GridView2" runat="server" CssClass="table table-striped table-dark table-hover"></asp:GridView>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
