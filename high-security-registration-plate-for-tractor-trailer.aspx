<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" enableEventValidation="false" CodeFile="high-security-registration-plate-for-tractor-trailer.aspx.cs" Inherits="high_security_registration_plate_for_tractor_trailer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .upr {
            text-transform: uppercase;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="mil-hero-inner mil-relative" id="top">
        <img src="img/ui/bg.png" alt="background" class="mil-bg" style="top: 0">
        <div class="container mil-column mil-jcb mil-h-100">
            <div class="row mil-jcb mil-h-100">
            </div>
        </div>
    </div>
    <asp:Panel ID="pnlVehicleInfot" runat="server">
        <div class="mil-p-0-15" id="scroll">
            <div class="container">
                <div class="mil-section-title  mil-up">
                    <h2 class="mil-fs-36">Vehicle Info</h2>
                    <div class="mil-dots"></div>
                    <b class="mil-fs-24">01</b>
                </div>
                <div class="row">
                    <div class="col-lg-12 mil-mb-15 mil-up">
                        <div class="mil-hero-form-frame mil-bg-m-4 mil-br-md">


                            <div class="row">
                                <div class="col-lg-6 mil-mb-30">
                                    <div class="mil-input-frame">
                                        <label style="margin-bottom: 10px;">State</label>
                                    </div>
                                    <div class="mil-input-frame">
                                        <%--<input type="text" id="user-name" name="user-name" placeholder="Name" class="mil-br-md mil-bg-m-3" autocomplete="name">--%>
                                        <asp:DropDownList ID="ddlState" runat="server" CssClass="mil-br-md mil-bg-m-3 " Width="100%" Height="56">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="ddlState"
                                            InitialValue="---Select state---" ErrorMessage="* Please select" ForeColor="red" />
                                    </div>
                                </div>
                                <div class="col-lg-6 mil-mb-30">
                                    <div class="mil-input-frame">
                                        <label style="margin-bottom: 10px;">Registration Number</label>
                                    </div>
                                    <div class="mil-input-frame">
                                        <%--<input type="text" id="user-name" name="user-name" placeholder="Name" class="mil-br-md mil-bg-m-3" autocomplete="name">--%>
                                        <asp:TextBox ID="txtRegistrationNumber" runat="server" placeholder="Registration Number" CssClass="mil-br-md mil-bg-m-3 upr" required></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1q" runat="server" ControlToValidate="txtRegistrationNumber"
                                            Display="Dynamic" ForeColor="Red" ErrorMessage="InValid Vehicle Number" ValidationExpression="[A-Za-z]{2}[0-9]{1,2}(?:[A-Za-z])?(?:[A-Za-z]*)?[0-9]{4}"></asp:RegularExpressionValidator>
                                    </div>
                                </div>
                                <div class="col-6 mil-mb-15">
                                    <div class="mil-input-frame">
                                        <label style="margin-bottom: 10px;">Chasis Number</label>
                                    </div>
                                    <div class="mil-input-frame">
                                        <%-- <input type="email" id="user-email" name="user-email" placeholder="Email" class="mil-br-md mil-bg-m-3" autocomplete="email">--%>
                                        <asp:TextBox ID="txtChasisNumber" runat="server" placeholder="Chassis No..* (XXXXX12345)" CssClass="mil-br-md mil-bg-m-3 upr" required></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtChasisNumber"
                                            Display="Dynamic" ForeColor="Red" ErrorMessage="* only last five number" ValidationExpression="[A-Za-z0-9]{5}"></asp:RegularExpressionValidator>
                                    </div>
                                </div>
                                <div class="col-md-6 mil-mb-15">
                                    <div class="mil-input-frame">
                                        <label style="margin-bottom: 10px;">Engine Number</label>
                                    </div>
                                    <div class="mil-input-frame">
                                        <%--<input type="tel" id="user-phone" name="user-tel" class="mil-phone-input mil-br-md mil-bg-m-3" placeholder="+38 (___) ___-__-__" autocomplete="tel">--%>
                                        <asp:TextBox ID="txtEngineNumber" runat="server" placeholder="Engine No.* (XXXXX12345)" CssClass="mil-br-md mil-bg-m-3 upr" required></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtEngineNumber"
                                            Display="Dynamic" ForeColor="Red" ErrorMessage="* only last five number" ValidationExpression="[A-Za-z0-9]{5}"></asp:RegularExpressionValidator>
                                    </div>
                                </div>

                                <div class="col-lg-12 mil-aic">
                                    <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                                    <asp:Button ID="btnSubmitt" runat="server" Text="Get Details" CssClass="mil-btn mil-bg-a-1 mil-br-xl mil-hover-bri-105 mil-hover-scale mil-ml-60 mil-sm-ml-30" OnClick="btnSubmitt_Click" />
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="pnlVehicleDetailst" runat="server">
        <div class="mil-p-0-15" id="scroll">
            <div class="container">
                <div class="mil-section-title  mil-up">
                    <h2 class="mil-fs-36">Vehicle Details</h2>
                    <div class="mil-dots"></div>
                    <b class="mil-fs-24">02</b>
                </div>
                <div class="row">
                    <div class="col-lg-12 mil-mb-15 mil-up">
                        <div class="mil-hero-form-frame mil-bg-m-4 mil-br-md">


                            <div class="row">
                                <div class="col-lg-6 mil-mb-30">
                                    <div class="mil-input-frame">
                                        <label style="margin-bottom: 10px;">Bharat Stage</label>
                                    </div>
                                    <div class="mil-input-frame">
                                        <%--<input type="text" id="user-name" name="user-name" placeholder="Name" class="mil-br-md mil-bg-m-3" autocomplete="name">--%>
                                        <asp:TextBox ID="lblBharatStage" runat="server" CssClass="mil-br-md mil-bg-m-3 " Enabled="false">
                                        </asp:TextBox>

                                    </div>
                                </div>
                                <div class="col-lg-6 mil-mb-30">
                                    <div class="mil-input-frame">
                                        <label style="margin-bottom: 10px;">Vehicle Registration Date</label>
                                    </div>
                                    <div class="mil-input-frame">
                                        <%--<input type="text" id="user-name" name="user-name" placeholder="Name" class="mil-br-md mil-bg-m-3" autocomplete="name">--%>
                                        <asp:TextBox ID="txtRegistrationDate" runat="server" CssClass="mil-br-md mil-bg-m-3" Enabled="false"></asp:TextBox>

                                    </div>
                                </div>
                                <div class="col-6 mil-mb-15">
                                    <div class="mil-input-frame">
                                        <label style="margin-bottom: 10px;">Fuel Type</label>
                                    </div>
                                    <div class="mil-input-frame">
                                        <%-- <input type="email" id="user-email" name="user-email" placeholder="Email" class="mil-br-md mil-bg-m-3" autocomplete="email">--%>
                                        <asp:TextBox ID="txtFuelType" runat="server" Enabled="false" CssClass="mil-br-md mil-bg-m-3"></asp:TextBox>

                                    </div>
                                </div>
                                <div class="col-md-6 mil-mb-15">
                                    <div class="mil-input-frame">
                                        <label style="margin-bottom: 10px;">Maker</label>
                                    </div>
                                    <div class="mil-input-frame">
                                        <%--<input type="tel" id="user-phone" name="user-tel" class="mil-phone-input mil-br-md mil-bg-m-3" placeholder="+38 (___) ___-__-__" autocomplete="tel">--%>
                                        <asp:TextBox ID="txtMaker" runat="server" CssClass="mil-br-md mil-bg-m-3" Enabled="false"></asp:TextBox>

                                    </div>
                                </div>
                                <div class="col-md-6 mil-mb-15">
                                    <div class="mil-input-frame">
                                        <label style="margin-bottom: 10px;">Vehicle Type</label>
                                    </div>
                                    <div class="mil-input-frame">
                                        <%--<input type="tel" id="user-phone" name="user-tel" class="mil-phone-input mil-br-md mil-bg-m-3" placeholder="+38 (___) ___-__-__" autocomplete="tel">--%>
                                        <asp:TextBox ID="txtVehicleType" runat="server" CssClass="mil-br-md mil-bg-m-3" Enabled="false"></asp:TextBox>

                                    </div>
                                </div>
                                <div class="col-md-6 mil-mb-15">
                                    <div class="mil-input-frame">
                                        <label style="margin-bottom: 10px;">Vehicle Category</label>
                                    </div>
                                    <div class="mil-input-frame">
                                        <%--<input type="tel" id="user-phone" name="user-tel" class="mil-phone-input mil-br-md mil-bg-m-3" placeholder="+38 (___) ___-__-__" autocomplete="tel">--%>
                                        <asp:TextBox ID="txtVehicleCategory" runat="server" CssClass="mil-br-md mil-bg-m-3" Enabled="false"></asp:TextBox>

                                    </div>
                                </div>
                                <div class="col-lg-6 mil-mb-30">
                                    <div class="mil-input-frame">
                                        <label style="margin-bottom: 10px;">Vehicle Category</label>
                                    </div>
                                    <div class="mil-input-frame">
                                        <%--<input type="text" id="user-name" name="user-name" placeholder="Name" class="mil-br-md mil-bg-m-3" autocomplete="name">--%>
                                        <asp:DropDownList ID="ddlVehicleCatory" runat="server" CssClass="mil-br-md mil-bg-m-3 " Width="100%" Height="56">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlVehicleCatory"
                                            InitialValue="---Select category---" ErrorMessage="* Please select" ForeColor="red" />
                                    </div>
                                </div>
                                <div class="col-lg-12 mil-aic">

                                    <asp:Button ID="btnNextVehicleDetailst" runat="server" OnClick="btnNextVehicleDetailst_Click" Text="Next" CssClass="mil-btn mil-bg-a-1 mil-br-xl mil-hover-bri-105 mil-hover-scale mil-ml-60 mil-sm-ml-30" />
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="pnlOwnerDetailst" runat="server">
        <div class="mil-p-0-15" id="scroll">
            <div class="container">
                <div class="mil-section-title  mil-up">
                    <h2 class="mil-fs-36">Owner Info</h2>
                    <div class="mil-dots"></div>
                    <b class="mil-fs-24">03</b>
                </div>
                <div class="row">
                    <div class="col-lg-12 mil-mb-15 mil-up">
                        <div class="mil-hero-form-frame mil-bg-m-4 mil-br-md">


                            <div class="row">
                                <div class="col-lg-6 mil-mb-30">
                                    <div class="mil-input-frame">
                                        <label style="margin-bottom: 10px;">Owner Name</label>
                                    </div>
                                    <div class="mil-input-frame">
                                        <%--<input type="text" id="user-name" name="user-name" placeholder="Name" class="mil-br-md mil-bg-m-3" autocomplete="name">--%>
                                        <asp:TextBox ID="txtOwnerName" runat="server" placeholder="Owner Name" CssClass="mil-br-md mil-bg-m-3" required></asp:TextBox>

                                    </div>
                                </div>

                                <div class="col-lg-6 mil-mb-30">
                                    <div class="mil-input-frame">
                                        <label style="margin-bottom: 10px;">Email Id</label>
                                    </div>
                                    <div class="mil-input-frame">
                                        <%--<input type="text" id="user-name" name="user-name" placeholder="Name" class="mil-br-md mil-bg-m-3" autocomplete="name">--%>
                                        <asp:TextBox ID="txtEmailId" runat="server" placeholder="Email Id" CssClass="mil-br-md mil-bg-m-3" required></asp:TextBox>

                                    </div>
                                </div>
                                <div class="col-6 mil-mb-15">
                                    <div class="mil-input-frame">
                                        <label style="margin-bottom: 10px;">mobile Number</label>
                                    </div>
                                    <div class="mil-input-frame">
                                        <%-- <input type="email" id="user-email" name="user-email" placeholder="Email" class="mil-br-md mil-bg-m-3" autocomplete="email">--%>
                                        <asp:TextBox ID="txtMobileNumber" runat="server" placeholder="Mobile Number" TextMode="Number" CssClass="mil-br-md mil-bg-m-3" required></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtMobileNumber"
                                            Display="Dynamic" ForeColor="Red" ErrorMessage="* only last five number" ValidationExpression="[6-9][0-9]{9}"></asp:RegularExpressionValidator>
                                    </div>
                                </div>
                                <div class="col-md-6 mil-mb-15">
                                    <div class="mil-input-frame">
                                        <label style="margin-bottom: 10px;">Billing Address</label>
                                    </div>
                                    <div class="mil-input-frame">
                                        <%--<input type="tel" id="user-phone" name="user-tel" class="mil-phone-input mil-br-md mil-bg-m-3" placeholder="+38 (___) ___-__-__" autocomplete="tel">--%>
                                        <asp:TextBox ID="txtBillingAddress" runat="server" placeholder="Billing Address" CssClass="mil-br-md mil-bg-m-3" TextMode="MultiLine" required></asp:TextBox>

                                    </div>
                                </div>

                                <div class="col-lg-12 mil-aic">

                                    <asp:Button ID="btnNextOwnerInfot" runat="server" OnClick="btnNextOwnerInfot_Click" Text="Next" CssClass="mil-btn mil-bg-a-1 mil-br-xl mil-hover-bri-105 mil-hover-scale mil-ml-60 mil-sm-ml-30" />
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="pnlFitmentLocationt" runat="server">
        <div class="mil-p-0-15" id="scroll">
            <div class="container">
                <div class="mil-section-title  mil-up">
                    <h2 class="mil-fs-36">Fitment Location</h2>
                    <div class="mil-dots"></div>
                    <b class="mil-fs-24">04</b>
                </div>
                <div class="row">
                    <div class="col-lg-12 mil-mb-15 mil-up">
                        <div class="mil-hero-form-frame mil-bg-m-4 mil-br-md">


                            <div class="row">
                                <div class="col-lg-6 mil-mb-30">
                                    <div class="mil-input-frame">
                                        <label style="margin-bottom: 10px;">City</label>
                                    </div>
                                    <div class="mil-input-frame">
                                        <%--<input type="text" id="user-name" name="user-name" placeholder="Name" class="mil-br-md mil-bg-m-3" autocomplete="name">--%>
                                        <asp:DropDownList ID="ddlCity" runat="server" CssClass="mil-br-md mil-bg-m-3 " AutoPostBack="true" OnSelectedIndexChanged="ddlCity_SelectedIndexChanged" Width="100%" Height="56">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlCity"
                                            InitialValue="---Select City---" ErrorMessage="* Please select" ForeColor="red" />
                                    </div>
                                </div>
                                <div class="col-lg-6 mil-mb-30">
                                    <div class="mil-input-frame">
                                        <label style="margin-bottom: 10px;">Fitment Centre</label>
                                    </div>
                                    <div class="mil-input-frame">
                                        <%--<input type="text" id="user-name" name="user-name" placeholder="Name" class="mil-br-md mil-bg-m-3" autocomplete="name">--%>
                                        <asp:DropDownList ID="ddlDealer" runat="server" CssClass="mil-br-md mil-bg-m-3 " Width="100%" Height="56" AutoPostBack="true" OnSelectedIndexChanged="ddlDealer_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlDealer"
                                            InitialValue="---Select Fitment Centre---" ErrorMessage="* Please select" ForeColor="red" />
                                    </div>
                                </div>
                                <div class="col-lg-12 mil-mb-30">
                                    <div class="mil-input-frame">
                                        <label style="margin-bottom: 10px;">Fitment Centre Details</label>
                                    </div>
                                    <div class="mil-input-frame">
                                        <%--<input type="text" id="user-name" name="user-name" placeholder="Name" class="mil-br-md mil-bg-m-3" autocomplete="name">--%>
                                        <asp:TextBox ID="txtDealerInfo" runat="server" CssClass="mil-br-md mil-bg-m-3 " Enabled="false">
                                            
                                        </asp:TextBox>

                                    </div>
                                </div>
                                <div class="col-lg-12 mil-aic">

                                    <asp:Button ID="btnNextFitmentLocationt" OnClick="btnNextFitmentLocationt_Click" runat="server" Text="Get Details" CssClass="mil-btn mil-bg-a-1 mil-br-xl mil-hover-bri-105 mil-hover-scale mil-ml-60 mil-sm-ml-30" />
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="pnlSummaryt" runat="server">
        <div class="mil-p-0-15" id="scroll">
            <div class="container">
                <div class="mil-section-title  mil-up">
                    <h2 class="mil-fs-36">Booking Summary</h2>
                    <div class="mil-dots"></div>
                    <b class="mil-fs-24">05</b>
                </div>
                <div class="row">
                    <div class="col-lg-12 mil-mb-15 mil-up">
                        <div class="mil-hero-form-frame mil-bg-m-4 mil-br-md">


                            <div class="row">
                                <div class="col-lg-4 mil-mb-30">
                                    <div class="mil-input-frame">
                                        <label style="margin-bottom: 10px;">State</label>
                                    </div>
                                    <div class="mil-input-frame">
                                        <asp:TextBox ID="lblState" runat="server" CssClass="mil-br-md mil-bg-m-3 " Enabled="false"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-4 mil-mb-30">
                                    <div class="mil-input-frame">
                                        <label style="margin-bottom: 10px;">Registration Number</label>
                                    </div>
                                    <div class="mil-input-frame">
                                        <asp:TextBox ID="lblRegistrationNumber" runat="server" CssClass="mil-br-md mil-bg-m-3 " Enabled="false"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-4 mil-mb-30">
                                    <div class="mil-input-frame">
                                        <label style="margin-bottom: 10px;">Chasis Number</label>
                                    </div>
                                    <div class="mil-input-frame">
                                        <asp:TextBox ID="lblChasisNumber" runat="server" CssClass="mil-br-md mil-bg-m-3 " Enabled="false"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-4 mil-mb-30">
                                    <div class="mil-input-frame">
                                        <label style="margin-bottom: 10px;">Engine Number</label>
                                    </div>
                                    <div class="mil-input-frame">
                                        <asp:TextBox ID="lblEngineNumber" runat="server" CssClass="mil-br-md mil-bg-m-3 " Enabled="false"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-4 mil-mb-30">
                                    <div class="mil-input-frame">
                                        <label style="margin-bottom: 10px;">Bharat Stage</label>
                                    </div>
                                    <div class="mil-input-frame">
                                        <asp:TextBox ID="lblBharatStages" runat="server" CssClass="mil-br-md mil-bg-m-3 " Enabled="false"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-4 mil-mb-30">
                                    <div class="mil-input-frame">
                                        <label style="margin-bottom: 10px;">Vehicle Registration Date</label>
                                    </div>
                                    <div class="mil-input-frame">
                                        <asp:TextBox ID="lblVehicleRegistrationDate" runat="server" CssClass="mil-br-md mil-bg-m-3 " Enabled="false"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-4 mil-mb-30">
                                    <div class="mil-input-frame">
                                        <label style="margin-bottom: 10px;">Fuel Type</label>
                                    </div>
                                    <div class="mil-input-frame">
                                        <asp:TextBox ID="lblFuelType" runat="server" CssClass="mil-br-md mil-bg-m-3 " Enabled="false"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-4 mil-mb-30">
                                    <div class="mil-input-frame">
                                        <label style="margin-bottom: 10px;">Maker</label>
                                    </div>
                                    <div class="mil-input-frame">
                                        <asp:TextBox ID="lblMaker" runat="server" CssClass="mil-br-md mil-bg-m-3 " Enabled="false"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-4 mil-mb-30">
                                    <div class="mil-input-frame">
                                        <label style="margin-bottom: 10px;">Vehicle Type</label>
                                    </div>
                                    <div class="mil-input-frame">
                                        <asp:TextBox ID="lblVehicleType" runat="server" CssClass="mil-br-md mil-bg-m-3 " Enabled="false"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-4 mil-mb-30">
                                    <div class="mil-input-frame">
                                        <label style="margin-bottom: 10px;">Vehicle Category</label>
                                    </div>
                                    <div class="mil-input-frame">
                                        <asp:TextBox ID="lblVehicleCategory" runat="server" CssClass="mil-br-md mil-bg-m-3 " Enabled="false"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-4 mil-mb-30">
                                    <div class="mil-input-frame">
                                        <label style="margin-bottom: 10px;">Vehicle Category</label>
                                    </div>
                                    <div class="mil-input-frame">
                                        <asp:TextBox ID="lblVehicleCategoryUser" runat="server" CssClass="mil-br-md mil-bg-m-3 " Enabled="false"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-12 mil-mb-30">
                                    <hr />
                                </div>
                                <div class="col-lg-4 mil-mb-30">
                                    <div class="mil-input-frame">
                                        <label style="margin-bottom: 10px;">Owner Name</label>
                                    </div>
                                    <div class="mil-input-frame">
                                        <asp:TextBox ID="lblOwnerName" runat="server" CssClass="mil-br-md mil-bg-m-3 " Enabled="false"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-4 mil-mb-30">
                                    <div class="mil-input-frame">
                                        <label style="margin-bottom: 10px;">Email Id</label>
                                    </div>
                                    <div class="mil-input-frame">
                                        <asp:TextBox ID="lblEmailId" runat="server" CssClass="mil-br-md mil-bg-m-3 " Enabled="false"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-4 mil-mb-30">
                                    <div class="mil-input-frame">
                                        <label style="margin-bottom: 10px;">Mobile Number</label>
                                    </div>
                                    <div class="mil-input-frame">
                                        <asp:TextBox ID="lblMobileNumber" runat="server" CssClass="mil-br-md mil-bg-m-3 " Enabled="false"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-4 mil-mb-30">
                                    <div class="mil-input-frame">
                                        <label style="margin-bottom: 10px;">Billing Address</label>
                                    </div>
                                    <div class="mil-input-frame">
                                        <asp:TextBox ID="lblBillingAddress" runat="server" CssClass="mil-br-md mil-bg-m-3 " Enabled="false"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-12 mil-mb-30">
                                    <hr />
                                </div>
                                <div class="col-lg-12 mil-mb-30">
                                    <div class="mil-input-frame">
                                        <label style="margin-bottom: 10px;">Fitment Centre</label>
                                    </div>
                                    <div class="mil-input-frame">
                                        <asp:TextBox ID="lblFitmentCentre" runat="server" CssClass="mil-br-md mil-bg-m-3 " Enabled="false"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-12 mil-mb-30">
                                    <hr />
                                </div>

                                <div class="col-lg-4 mil-mb-30">
                                    <div class="mil-input-frame">
                                        <label style="margin-bottom: 10px;">Payble Amount</label>
                                    </div>
                                    <div class="mil-input-frame">
                                        <asp:TextBox ID="txtAmount" runat="server" CssClass="mil-br-md mil-bg-m-3 " Enabled="false"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-12 mil-aic">
                                    <asp:Label ID="lblErroVerify" runat="server" ForeColor="Red"></asp:Label>
                                    <asp:Button ID="btnVerifyt" OnClick="btnVerifyt_Click" runat="server" Text="Verify & Pay" CssClass="mil-btn mil-bg-a-1 mil-br-xl mil-hover-bri-105 mil-hover-scale mil-ml-60 mil-sm-ml-30" />
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>
    </asp:Panel>
</asp:Content>