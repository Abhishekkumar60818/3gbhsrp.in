<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="thankyou.aspx.cs" Inherits="thankyou" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="mil-hero-3 mil-relative" id="top">
        <asp:Label ID="lblorderid" runat="server" Visible="false"></asp:Label>
    <img src="img/ui/bg.png" alt="background" class="mil-bg" style="top: 0">
    <div class="container mil-column mil-jcb mil-h-100">
        <div class="row mil-jcb mil-h-100">
            <div class="col-lg-7">
                <div class="mil-main-title mil-jcc mil-ais mil-column">
                    <div class="mil-column mil-sm-aic mil-mb-60 mil-md-mb-0 mil-w-100">
                        <div class="mil-aic">
                            <div class="mil-word-frame" style="margin-bottom: 15px;">
                               
                                <h1 class=" mil-lh-110"><asp:label ID="lblh1" runat="server"></asp:label></h1>
                            </div>
                            <br />
                            <%--<div class="mil-fs-16 mil-m-2 mil-lh-160 mil-ml-60 mil-mt-20 mil-sm-hidden">We clean objects of any <br>complexity and size in 6-9 hours</div>--%>
                        </div>
                        <div class="mil-word-frame" style="margin-bottom: 15px;">
                            <h1 class=" mil-lh-110"><asp:label ID="lblh2" runat="server"></asp:label> </h1>
                        </div>
                        <div class="mil-word-frame mil-mb-40" style="margin-bottom: 15px;">
                            <h1 class=" mil-lh-110"><asp:label ID="lblh3" runat="server"></asp:label></h1>
                         <%--   <svg width="89" height="89" viewbox="0 0 89 89" fill="none" xmlns="http://www.w3.org/2000/svg" class="mil-text-star mil-sm-hidden" style="width: 2vw; bottom: -40%;left: 5%;">
                                <rect x="42.1406" y="13.0017" width="3.46874" height="62.7841" fill="#F6D62D"></rect>
                                <rect x="13.0078" y="45.2607" width="3.46874" height="62.7841" transform="rotate(-90 13.0078 45.2607)" fill="#F6D62D"></rect>
                                <rect x="21.5859" y="22.8096" width="3.46874" height="62.7841" transform="rotate(-45 21.5859 22.8096)" fill="#F6D62D"></rect>
                                <rect x="22.8125" y="67.2046" width="3.46874" height="62.7841" transform="rotate(-135 22.8125 67.2046)" fill="#F6D62D"></rect>
                            </svg>--%>
                        </div>
                        <div class="mil-buttons-frame">
                            
                            <%--<a href="services.html" class="mil-btn mil-icon-btn mil-bg-a-1 mil-br-xl mil-hover-bri-105 mil-hover-scale">Download Invoice<i class="far fa-plus mil-bg-m-4 mil-m-1"></i></a>--%>
                            <asp:Button ID="btnInvoiceDownload" runat="server" Text="Download Invoice" CssClass="mil-btn mil-icon-btn mil-bg-a-1 mil-br-xl mil-hover-bri-105 mil-hover-scale" OnClick="btnInvoiceDownload_Click" />
                            <asp:Button ID="btnhome" runat="server" Text="Go to home" CssClass="mil-btn mil-icon-btn mil-bg-a-1 mil-br-xl mil-hover-bri-105 mil-hover-scale" OnClick="btnhome_Click" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-5">
                <div class="mil-hero-right-image" style="    min-height: 470px;">
                    <img id="imgOrder" runat="server" alt="image" class="mil-scale-img-top" data-value-1="1" data-value-2="1.1" />
                </div>
            </div>
        </div>
        
    </div>
</div>

</asp:Content>