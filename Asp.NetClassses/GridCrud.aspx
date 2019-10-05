<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="GridCrud.aspx.cs" Inherits="Asp.NetClassses.GridCrud" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">



        <div class="row" >
            <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
            <asp:Button ID="btnSave" runat="server" Visible="false" Text="Save" OnClick="btnSave_Click" />
            <asp:Button ID="btnCancel" runat="server" Visible="false" Text="Cancel" OnClick="btnCancel_Click" />
        </div>
        <div class="row">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false"
                BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px"
                CellPadding="3" DataKeyNames="EmpId"
                CellSpacing="2" Height="235px" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" Width="623px">
                <Columns>
                    <asp:TemplateField HeaderText="Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtBoxName" runat="server" Text='<%# Bind("EmpName") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                ControlToValidate="txtBoxName" Display="None"
                                ErrorMessage=" Name Can not Be Left Blank" ForeColor="Black"
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("EmpName") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtBoxNameFt" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                ControlToValidate="txtBoxNameFt" Display="None"
                                ErrorMessage="name Can not Be Left Blank" ForeColor="Black"
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Salary">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtBoxSalary" runat="server" Text='<%# Eval("EmpSalary") %>'></asp:TextBox>

                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblSalary" runat="server" Text='<%# Eval("EmpSalary") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtSalaryFt" runat="server"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="City">
                        <ItemTemplate>
                            <asp:Label ID="lblCity" runat="server" Text='<%# Eval("CityName")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlCities" runat="server">
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="ddlCityFt" runat="server">  </asp:DropDownList>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
                </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                <SortedDescendingHeaderStyle BackColor="#93451F" />
            </asp:GridView>
            <asp:ValidationSummary ID="ValidationSummary1" ForeColor="Red" runat="server" />
        </div>
</asp:Content>