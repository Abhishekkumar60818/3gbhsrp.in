<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" enableEventValidation="true" CodeFile="cancel-order.aspx.cs" Inherits="cancel_order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="mil-hero-inner mil-relative" id="top">
        <img src="img/ui/bg.png" alt="background" class="mil-bg" style="top: 0">
        <div class="container mil-column mil-jcb mil-h-100">
            <div class="row mil-jcb mil-h-100">
                <div class="col-lg-7 mil-mb-60">
                    <div class="mil-main-title mil-jcc mil-ais mil-column">
                        <div class="mil-column mil-sm-mb-0 mil-w-100">
                            <div class="mil-aic" style="display: none">
                                <div class="mil-word-frame">
                                    <svg width="89" height="89" viewbox="0 0 89 89" fill="none" xmlns="http://www.w3.org/2000/svg" class="mil-text-star" style="top: -15%; right: -15%">
                                        <rect x="42.1406" y="13.0017" width="3.46874" height="62.7841" fill="#F6D62D"></rect>
                                        <rect x="13.0078" y="45.2607" width="3.46874" height="62.7841" transform="rotate(-90 13.0078 45.2607)" fill="#F6D62D"></rect>
                                        <rect x="21.5859" y="22.8096" width="3.46874" height="62.7841" transform="rotate(-45 21.5859 22.8096)" fill="#F6D62D"></rect>
                                        <rect x="22.8125" y="67.2046" width="3.46874" height="62.7841" transform="rotate(-135 22.8125 67.2046)" fill="#F6D62D"></rect>
                                    </svg>
                                    <h1 class="mil-fs-100 mil-sm-fs-72 mil-lh-110">Let's get in</h1>
                                </div>
                            </div>
                            <div class="mil-word-frame mil-mb-40" style="display: none">
                                <h1 class="mil-fs-100 mil-sm-fs-72 mil-lh-110">
                                    <img src="img/ui/t10.jpg" alt="image" class="mil-text-image mil-long">
                                    touch</h1>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="mil-column col-lg-5 mil-jcb mil-aie mil-sm-ais mil-mb-60">

                    <div class="mil-circle-text-position">
                        <div class="mil-circle-text mil-rotate mil-accent-inside" data-value="360">
                            <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewbox="0 0 300 300" enable-background="new 0 0 300 300" xml:space="preserve">
                                <defs>
                                    <path id="circlePath" d="M 150, 150 m -60, 0 a 60,60 0 0,1 120,0 a 60,60 0 0,1 -120,0 "></path>
                                </defs>
                                <circle cx="150" cy="100" r="75" fill="none"></circle>
                                <g>
                                    <use xlink:href="#circlePath" fill="none"></use>

                                </g>
                            </svg>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="mil-p-0-15" id="scroll">
        <div class="container">
            <div class="mil-section-title mil-mb-f mil-up">
                <h2 class="mil-fs-36">Cancel Your Order</h2>
                <div class="mil-dots"></div>
                
                <%-- <b class="mil-fs-24">01</b>--%>
            </div>
            <div class="row">
                <div class="col-lg-3 mil-mb-15 mil-up"></div>
                <div class="col-lg-6 mil-mb-15 mil-up">
                    <div class="mil-hero-form-frame mil-bg-m-4 mil-br-md">
                        <div class="row">
                            <div class="col-lg-12 mil-mb-30">
                                <div class="mil-input-frame">
                                    <label style="margin-bottom: 10px;">Order Number</label>
                                </div>
                                <div class="mil-input-frame">
                                    <asp:TextBox ID="txtName" runat="server" placeholder="Order Number" CssClass="mil-br-md mil-bg-m-3"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-12 mil-mb-30">
                                <div class="mil-input-frame">
                                    <label style="margin-bottom: 10px;">Vehicle Number</label>
                                </div>
                                <div class="mil-input-frame">
                                    
                                    <asp:TextBox ID="txtVehicleNumber" runat="server" placeholder="Vehicle Number" CssClass="mil-br-md mil-bg-m-3"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1q" runat="server" ControlToValidate="txtVehicleNumber"
                                        Display="Dynamic" ForeColor="Red" ErrorMessage="InValid Vehicle Number" ValidationExpression="[A-Za-z]{2}[0-9]{1,2}(?:[A-Za-z])?(?:[A-Za-z]*)?[0-9]{4}"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="col-lg-12 mil-aic">
                                <asp:Button ID="btnSubmit" runat="server" Text="Cancel Order" OnClick="btnSubmit_Click" CssClass="mil-btn mil-bg-a-1 mil-br-xl mil-hover-bri-105 mil-hover-scale mil-ml-60 mil-sm-ml-30" />
                            </div>
                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- contact form and map end -->

</asp:Content>