using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using CCA.Util;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using QRCoder;

public partial class thankyou : System.Web.UI.Page
{
    public int vno;

    protected void Page_Load(object sender, EventArgs e)
    {


        if (!IsPostBack)
        {
            try
            {
                string wkey = WebConfigurationManager.AppSettings["workingkey"];
                string workingKey = wkey;//put in the 32bit alpha numeric key in the quotes provided here
                CCACrypto ccaCrypto = new CCACrypto();
                string encResponse = ccaCrypto.Decrypt(Request.Form["encResp"], workingKey);
                NameValueCollection Params = new NameValueCollection();
                string[] segments = encResponse.Split('&');
                foreach (string seg in segments)
                {
                    string[] parts = seg.Split('=');
                    if (parts.Length > 0)
                    {
                        string Key = parts[0].Trim();
                        string Value = parts[1].Trim();
                        Params.Add(Key, Value);
                    }
                }

                if (Params["order_status"] == "Success")
                {

                    // LedgerData ohdata = new LedgerData(int.Parse(Params["order_id"]));
                    OnlineOrderData od = new OnlineOrderData();
                    od.paymentstatus = "Success";
                    od.updateBookingStatus(int.Parse(Params["order_id"]));
                    lblh1.Text = "Thanks for Order!!";
                    lblh2.Text = "Your order is successfully placed.";
                    lblh3.Text = "Your order will be completed in next 7-10 days.";
                    // lblOrder.Text = "Your order is successfully placed. your order will be completed in next 7-10 days";
                    imgOrder.Src = "img/order-confirmed.jpg";
                    btnInvoiceDownload.Visible = true;
                    btnhome.Visible = false;
                lblorderid.Text =  (int.Parse(Params["order_id"])).ToString();
            }
                else
            {

                // OnlineOrderData ohdata = new OnlineOrderData(int.Parse(Params["order_id"]));
                OnlineOrderData od = new OnlineOrderData();
                od.paymentstatus = "Payment failed";
                od.updateBookingStatus(int.Parse(Params["order_id"]));
                lblh1.Text = "Oho!!";
                lblh2.Text = "Your order is Failed";
                lblh3.Text = "Please Re-Order with proper payment method";
                imgOrder.Src = "img/order-failed.png";
                btnInvoiceDownload.Visible = false;
                btnhome.Visible = true;
            }

        }
            catch { }
        }
    }
    public string EnryptString(string strEncrypted)
    {
        byte[] b = System.Text.ASCIIEncoding.ASCII.GetBytes(strEncrypted);
        string encrypted = Convert.ToBase64String(b);
        return encrypted;
    }

    protected void btnInvoiceDownload_Click(object sender, EventArgs e)
    {
        try
        {
            
            OnlineOrderData sd = new OnlineOrderData(int.Parse(lblorderid.Text));
            DistibutorData dd=new DistibutorData(sd.fitmentcentre);

          //  DataSet ds = sd.getDetails("select s.id,s.name,s.contactno,s.state,s.city,s.tlp,s.registrationno,s.chasisno,s.engineno,s.vehicletype,s.model,s.registrationdate,s.fueltype,s.ordertype,s.manufacturedate,s.sellerid,s.npid,s.status,s.classtype,s.orderdate,d.name as DName,d.email,d.contactno as emcontact,d.address,(select laserno from stock where id=(select itemid from selleritem where headerid=s.id LIMIT 0,1)) as frontlaser,(select laserno from stock where id=(select itemid from selleritem where headerid=s.id LIMIT 1,1)) as rearlaser from sellersales s join distibutor d where s.status=1 and s.npid=1 and s.sellerid=d.id and s.id=" + ids);
            string htmlbody = System.IO.File.ReadAllText(System.Web.HttpContext.Current.Server.MapPath("pdf/invoice.html"));

            //htmlbody = htmlbody.Replace("__Date__", sd.date.ToString("dd-MM-yyyy"));
            htmlbody = htmlbody.Replace("__ReceiptNumber__", (lblorderid.Text));
            htmlbody = htmlbody.Replace("__ReceiptDate__", sd.orderdaate);
            htmlbody = htmlbody.Replace("__OwnerName__", sd.ownername);
            htmlbody = htmlbody.Replace("__MobileNo__", sd.mobilenumber);
            htmlbody = htmlbody.Replace("__Address__", sd.billingaddress);
            htmlbody = htmlbody.Replace("__REGISTRATIONNUMBER__", sd.registrationnumber);
            htmlbody = htmlbody.Replace("__CHASSISNUMBER__", sd.chasisnumber);
            htmlbody = htmlbody.Replace("__ENGINENUMBER__", sd.enginenumber);
            htmlbody = htmlbody.Replace("__FUEL__", sd.fueltype);
            htmlbody = htmlbody.Replace("__VEHICLETYPE__", sd.vehicletype);
            htmlbody = htmlbody.Replace("__VehicleClass__", sd.vehiclecategory+" , "+sd.vehiclecategory1);
            htmlbody = htmlbody.Replace("__REGISTRATIONDATE__", sd.vehicleregistrationbate);
            htmlbody = htmlbody.Replace("__CentreName__", dd.name);
            htmlbody = htmlbody.Replace("__CentreAddress__", dd.address);
            htmlbody = htmlbody.Replace("__CentreEmailId__", dd.email);
            htmlbody = htmlbody.Replace("__CentreContact__", dd.contactno);
            htmlbody = htmlbody.Replace("__FitmentDateTime__", sd.fitmentdate);
            htmlbody = htmlbody.Replace("__Email__", sd.emailid);

            htmlbody = htmlbody.Replace("__ProductAmount__", sd.amount.ToString());
            htmlbody = htmlbody.Replace("__GST__", sd.gst.ToString());
            htmlbody = htmlbody.Replace("__TotalAmount__", sd.netanount.ToString());

            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            StringBuilder sb = new StringBuilder(htmlbody);
            StringReader sr = new StringReader(sb.ToString());
            Document pdfDoc = new Document(PageSize.LETTER, 25f, 25f, 25f, 25f);
            // Document pdfg=new Document(PageSize.LETTER,)
            pdfDoc.SetMargins(35f, 15f, 5f, 5f);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter writer = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            //iTextSharp.text.Image watermark = iTextSharp.text.Image.GetInstance("http://admin.bookmyhsrp.co.in/pdf/hd.png");
            //watermark.SetAbsolutePosition(25, 720);
            //pdfDoc.Add(watermark);

            //iTextSharp.text.Image watermark1 = iTextSharp.text.Image.GetInstance("http://admin.bookmyhsrp.co.in/pdf/sign.png");
            //watermark1.SetAbsolutePosition(460, 220);
            //pdfDoc.Add(watermark1);

            QRCodeGenerator qrGenerator = new QRCodeGenerator();
            QRCodeGenerator.QRCode qrCode = qrGenerator.CreateQrCode("Order Date : " + sd.orderdaate + ",Vehicle Registration No.:" + sd.registrationnumber + ",Engine No.:" + sd.enginenumber + ",Chassis No:" + sd.chasisnumber + ",Customer Name:" + sd.ownername, QRCodeGenerator.ECCLevel.Q);
            System.Web.UI.WebControls.Image imgBarCode = new System.Web.UI.WebControls.Image();
            imgBarCode.Height = 100;
            imgBarCode.Width = 100;
            imgBarCode.BorderWidth = 4;
            using (Bitmap bitMap = qrCode.GetGraphic(20))
            {
                using (MemoryStream ms = new MemoryStream())
                {
                    bitMap.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
                    byte[] byteImage = ms.ToArray();
                    imgBarCode.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(byteImage);
                    string base64 = Convert.ToBase64String(byteImage);
                    byte[] imagebytes = Convert.FromBase64String(base64);
                    iTextSharp.text.Image image = iTextSharp.text.Image.GetInstance(imagebytes);
                    iTextSharp.text.Image watermarkQR = iTextSharp.text.Image.GetInstance(image);
                    watermarkQR.ScaleAbsoluteHeight(130);
                    watermarkQR.ScaleAbsoluteWidth(130);
                    watermarkQR.SetAbsolutePosition(430, 620);
                    // watermarkQR.Width = 200;
                    pdfDoc.Add(watermarkQR);
                }
            }
            htmlparser.Parse(sr);
            pdfDoc.Close();
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=" + sd.registrationnumber + "_Invoice.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Write(pdfDoc);
            Response.End();
        }
        catch
        {

        }
    }

    protected void btnhome_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("Default.aspx");
        }
        catch { }
    }
}