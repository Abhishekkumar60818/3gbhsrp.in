<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" enableEventValidation="true" CodeFile="contact.aspx.cs" Inherits="contact" %>

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
                            <div class="mil-aic" style="display:none">
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
                            <div class="mil-word-frame mil-mb-40" style="display:none">
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
                <h2 class="mil-fs-36">Write to us</h2>
                <div class="mil-dots"></div>
                <b class="mil-fs-24">01</b>
            </div>
            <div class="row">
                <div class="col-lg-6 mil-mb-15 mil-up">
                    <div class="mil-hero-form-frame mil-bg-m-4 mil-br-md">
                        <div class="mil-aic mil-column">
                            <h3 class="mil-fs-32 mil-tac mil-lh-140 mil-mb-60">We accept your requests
                                <br>
                                24 hours a day, 7 days a week</h3>
                        </div>

                        <div class="row">
                            <div class="col-lg-12 mil-mb-30">
                                <div class="mil-input-frame">
                                    <%--<input type="text" id="user-name" name="user-name" placeholder="Name" class="mil-br-md mil-bg-m-3" autocomplete="name">--%>
                                    <asp:TextBox ID="txtName" runat="server" placeholder="Name" CssClass="mil-br-md mil-bg-m-3"></asp:TextBox>
                                    <i class="far fa-user mil-a-2"></i>
                                </div>
                            </div>
                            <div class="col-6 mil-mb-15">
                                <div class="mil-input-frame">
                                    <%-- <input type="email" id="user-email" name="user-email" placeholder="Email" class="mil-br-md mil-bg-m-3" autocomplete="email">--%>
                                    <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" CssClass="mil-br-md mil-bg-m-3"></asp:TextBox>
                                    <i class="far fa-at mil-a-2"></i>
                                </div>
                            </div>
                            <div class="col-md-6 mil-mb-15">
                                <div class="mil-input-frame">
                                    <%--<input type="tel" id="user-phone" name="user-tel" class="mil-phone-input mil-br-md mil-bg-m-3" placeholder="+38 (___) ___-__-__" autocomplete="tel">--%>
                                    <asp:TextBox ID="txtMobileNumber" runat="server" placeholder="Mobile Number" CssClass="mil-br-md mil-bg-m-3" TextMode="Number"></asp:TextBox>
                                    <i class="far fa-mobile mil-a-2"></i>
                                </div>
                            </div>

                            <div class="col-lg-12 mil-mb-30">
                                <div class="mil-input-frame mil-type-2">
                                    <%--<textarea id="message" name="message" placeholder="Enter your message" class="mil-br-md mil-bg-m-3" autocomplete="off"></textarea>--%>
                                    <asp:TextBox ID="txtMsg" runat="server" placeholder="Enter your message" CssClass="mil-br-md mil-bg-m-3" TextMode="MultiLine" Rows="4"></asp:TextBox>
                                    <i class="far fa-comment-alt mil-a-2"></i>
                                </div>
                            </div>
                            <div class="col-lg-12 mil-aic">
                                <p class="mil-fs-14 mil-m-2">By clicking the send button, you agree to the rules for processing personal data</p>
                                <%--<button class="mil-btn mil-bg-a-1 mil-br-xl mil-hover-bri-105 mil-hover-scale mil-ml-60 mil-sm-ml-30" type="submit">Send requests</button>--%>
                                <asp:Button ID="btnSubmit" runat="server" Text="Send requests" OnClick="btnSubmit_Click" CssClass="mil-btn mil-bg-a-1 mil-br-xl mil-hover-bri-105 mil-hover-scale mil-ml-60 mil-sm-ml-30" />
                            </div>
                        </div>

                    </div>
                </div>
                <div class="col-lg-6 mil-mb-15 mil-up">
                    <div class="mil-map-frame">
                        <iframe src="https://www.google.com/maps/embed/v1/place?q=3gb+technology&key=AIzaSyBFw0Qbyq9zTFTd-tUY6dZWTgaQzuU17R8" width="600" height="450" style="border: 0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- contact form and map end -->

    <!-- contact info -->
    <div class="mil-p-0-f">
        <div class="container">
            <div class="mil-section-title mil-mb-f mil-up">
                <h2 class="mil-fs-36">Contact info</h2>
                <div class="mil-dots"></div>
                <b class="mil-fs-24">02</b>
            </div>
            <div class="mil-features mil-bg-m-4 mil-br-md mil-up">
                <div class="row">
                    <div class="col-lg-4 mil-tac mil-mb-60">
                        <img src="img/ui/icons/13.png" alt="icon" class="mil-card-icon mil-mb-30">

                        <p class="mil-fs-18 mil-mb-5"><a href="mailto:info@3gb.co.in" style="color: #4d81e0;">info@3gb.co.in</a></p>
                        <p class="mil-fs-18"><a href="mailto:sales@3gbhsrp.com " style="color: #4d81e0;">sales@3gbhsrp.com </a></p>
                    </div>
                    <div class="col-lg-4 mil-tac mil-mb-60">
                        <img src="img/ui/icons/14.png" alt="icon" class="mil-card-icon mil-mb-30">

                        <p class="mil-fs-18 mil-mb-5"><a href="tel:+919829393007" style="color: #4d81e0;">9829393007</a></p>
                        <p class="mil-fs-18"><a href="tel:+917073805777" style="color: #4d81e0;">7073805777</a></p>
                    </div>
                    <div class="col-lg-4 mil-tac mil-mb-60">
                        <img src="img/ui/icons/15.png" alt="icon" class="mil-card-icon mil-mb-30">

                        <p class="mil-fs-18 mil-lh-160" style="color: #4d81e0;">25, Kardhani Enclave Gokulpura<br />
                            Jhotwara, Jaipur, Rajasthan 302012</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

