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
                <div class="row m-4">
                    <div class="col-md-12">
                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-dark table-hover" AutoGenerateColumns="False" DataKeyNames="Student_ID" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="Student_ID" HeaderText="Student_ID" ReadOnly="True" SortExpression="Student_ID" />
                                <asp:BoundField DataField="Student_FName" HeaderText="Student_FName" SortExpression="Student_FName" />
                                <asp:BoundField DataField="Student_MName" HeaderText="Student_MName" SortExpression="Student_MName" />
                                <asp:BoundField DataField="Student_LName" HeaderText="Student_LName" SortExpression="Student_LName" />
                                <asp:BoundField DataField="Student_Address" HeaderText="Student_Address" SortExpression="Student_Address" />
                                <asp:BoundField DataField="Student_Phone" HeaderText="Student_Phone" SortExpression="Student_Phone" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnection %>" SelectCommand="SELECT * FROM [StudentRecords]"></asp:SqlDataSource>
                        <asp:EntityDataSource ID="EntityDataSource1" runat="server">
                        </asp:EntityDataSource>
                    </div>
                </div>
            </nav>
        </div>
    </form>
</body>
</html>
