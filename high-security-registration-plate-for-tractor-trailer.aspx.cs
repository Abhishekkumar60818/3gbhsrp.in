using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Reflection;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

public partial class high_security_registration_plate_for_tractor_trailer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                //string abd = "{\"message\":\"Vehicle details available in Vahan\",\"fuel\":\"PETROL\",\"maker\":\"HERO MOTOCORP LTD\",\"vchType\":\"Non-Transport\",\"norms\":\"BHARAT STAGE IV\",\"vchCatg\":\"2WN\",\"regnDate\":\"2018-10-30\",\"hsrpFrontLaserCode\":\"CE0000010151\",\"hsrpRearLaserCode\":\"CE0000010152\",\"stateCd\":\"UK\",\"offCd\":7,\"mobileNumberValidation\":null}";
                // string abd = "{\"message\":\"Vehicle details available in Vahan but OEM/Manufacturer (Homologation) of this vehicle have not authorized you for the State/RTO of this vehicle, please contact respective OEM.\",\"maker\":\"BAJAJ AUTO LTD\",\"stateCd\":\"RJ\",\"offCd\":31}";

                //   VaahanResultData r = Newtonsoft.Json.JsonConvert.DeserializeObject<VaahanResultData>(abd);

                pnlVehicleInfot.Visible = true;
                pnlVehicleDetailst.Visible = false;
                pnlOwnerDetailst.Visible = false;
                pnlFitmentLocationt.Visible = false;
                pnlSummaryt.Visible = false;

                CityDetails ddataa = new CityDetails();
                DataSet dstate = ddataa.getDetails("select * from state where status=1 and id in (select state from rateonlinetractor where status=1) order by name");
                ddlState.DataSource = dstate;
                ddlState.DataTextField = "name";
                ddlState.DataValueField = "id";
                ddlState.DataBind();
                ddlState.Items.Insert(0, "---Select state---");
                ddlState.SelectedIndex = 0;

                //DataSet dscat = ddataa.getDetails("select id,type as vtype from vehicletype where status=1 order by vtype");
                //ddlVehicleCatory.DataSource = dscat;
                //ddlVehicleCatory.DataTextField = "vtype";
                //ddlVehicleCatory.DataValueField = "id";
                //ddlVehicleCatory.DataBind();
                //ddlVehicleCatory.Items.Insert(0, "---Select category---");
                //ddlVehicleCatory.SelectedIndex = 0;

                lblError.Visible = false;
                lblErroVerify.Visible = false;
            }
            catch { }

        }
    }

    protected void btnSubmitt_Click(object sender, EventArgs e)
    {
        try
        {


            string apiUrl11 = "https://vahan.parivahan.gov.in/hsrpws/webresources/hsrpwebservice/getHsrpVehicleDetails/";
            object input11 = new
            {
                regnNO = txtRegistrationNumber.Text,
                chasisNo = txtChasisNumber.Text,
                userId = "3gbtech2023",
                engineNo = txtEngineNumber.Text

            };

            var request = WebRequest.Create(apiUrl11);

            System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12 | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls;

            request.ContentType = "application/json";
            request.Method = "GET";

            var type = request.GetType();
            var currentMethod = type.GetProperty("CurrentMethod", BindingFlags.NonPublic | BindingFlags.Instance).GetValue(request);

            var methodType = currentMethod.GetType();
            methodType.GetField("ContentBodyNotAllowed", BindingFlags.NonPublic | BindingFlags.Instance).SetValue(currentMethod, false);

            using (var streamWriter = new StreamWriter(request.GetRequestStream()))
            {
                streamWriter.Write(JsonConvert.SerializeObject(input11));
            }
            string abd = "";
            var response = request.GetResponse();
            var responseStream = response.GetResponseStream();
            if (responseStream != null)
            {
                var myStreamReader = new StreamReader(responseStream, Encoding.Default);
                var resultEntity = myStreamReader.ReadToEnd();
                myStreamReader.ReadToEnd();
                // lbl1.Text = resultEntity;

                abd = DecryptData(resultEntity, "3GbTech@20238h"); ;

            }
            responseStream.Close();
            response.Close();
            VaahanResultData r = Newtonsoft.Json.JsonConvert.DeserializeObject<VaahanResultData>(abd);

            if (r.message == "Vehicle details available in Vahan")
            {
                if (string.IsNullOrEmpty(r.hsrpFrontLaserCode))
                {
                    pnlVehicleInfot.Visible = false;
                    pnlVehicleDetailst.Visible = true;
                    pnlOwnerDetailst.Visible = false;
                    pnlFitmentLocationt.Visible = false;
                    pnlSummaryt.Visible = false;
                    lblError.Visible = false;
                    lblBharatStage.Text = r.norms;
                    txtRegistrationDate.Text = r.regnDate;
                    txtFuelType.Text = r.fuel;
                    txtMaker.Text = r.maker;
                    txtVehicleType.Text = r.vchType;
                    txtVehicleCategory.Text = r.vchCatg;

                    CityDetails ddataa = new CityDetails();
                    DataSet dscat = ddataa.getDetails("select id,type as vtype from vehicletype where status=1 and type in (select cate from rateonlinetractor where status=1 and state=" + int.Parse(ddlState.SelectedValue.ToString()) + ") order by vtype");
                    ddlVehicleCatory.DataSource = dscat;
                    ddlVehicleCatory.DataTextField = "vtype";
                    ddlVehicleCatory.DataValueField = "id";
                    ddlVehicleCatory.DataBind();
                    ddlVehicleCatory.Items.Insert(0, "---Select category---");
                    ddlVehicleCatory.SelectedIndex = 0;
                }
                else
                {
                    lblError.Visible = true;
                    lblError.Text = "* Please order from replacement option";
                }

            }
            else
            {
                lblError.Visible = true;
                lblError.Text = "* " + r.message;
            }

        }
        catch (Exception ex)
        {
            pnlVehicleInfot.Visible = true;
            pnlVehicleDetailst.Visible = false;
            pnlOwnerDetailst.Visible = false;
            pnlFitmentLocationt.Visible = false;
            pnlSummaryt.Visible = false;
            lblError.Visible = true;
            lblError.Text = ex.Message;
        }
    }
    string DecryptData(string EncryptedText, string Encryptionkey)
    {
        RijndaelManaged objrij = new RijndaelManaged();
        objrij.Mode = CipherMode.CBC;
        objrij.Padding = PaddingMode.PKCS7;
        objrij.KeySize = 0x80;
        objrij.BlockSize = 0x80;
        byte[] encryptedTextByte = Convert.FromBase64String(EncryptedText);
        byte[] passBytes = Encoding.UTF8.GetBytes(Encryptionkey);
        byte[] EncryptionkeyBytes = new byte[0x10];
        int len = passBytes.Length;
        if (len > EncryptionkeyBytes.Length)
        {
            len = EncryptionkeyBytes.Length;
        }
        Array.Copy(passBytes, EncryptionkeyBytes, len);
        objrij.Key = EncryptionkeyBytes;
        objrij.IV = EncryptionkeyBytes;
        //objrij.Padding = PaddingMode.Zeros;
        byte[] TextByte = objrij.CreateDecryptor().TransformFinalBlock(encryptedTextByte, 0, encryptedTextByte.Length);
        return Encoding.UTF8.GetString(TextByte);  //it will return readable string
    }
    protected void btnNextVehicleDetailst_Click(object sender, EventArgs e)
    {
        try
        {
            pnlVehicleInfot.Visible = false;
            pnlVehicleDetailst.Visible = false;
            pnlOwnerDetailst.Visible = true;
            pnlFitmentLocationt.Visible = false;
            pnlSummaryt.Visible = false;
        }
        catch { }
    }

    protected void btnNextOwnerInfot_Click(object sender, EventArgs e)
    {
        try
        {
            pnlVehicleInfot.Visible = false;
            pnlVehicleDetailst.Visible = false;
            pnlOwnerDetailst.Visible = false;
            pnlFitmentLocationt.Visible = true;
            pnlSummaryt.Visible = false;


            CityDetails ddataa = new CityDetails();
            DataSet dstate = ddataa.getDetails("select * from city where status=1 and state='" + ddlState.SelectedItem.ToString() + "' order by city");
            ddlCity.DataSource = dstate;
            ddlCity.DataTextField = "city";
            ddlCity.DataValueField = "id";
            ddlCity.DataBind();
            ddlCity.Items.Insert(0, "---Select City---");
            ddlCity.SelectedIndex = 0;
        }
        catch { }
    }

    protected void btnNextFitmentLocationt_Click(object sender, EventArgs e)
    {
        try
        {
            pnlVehicleInfot.Visible = false;
            pnlVehicleDetailst.Visible = false;
            pnlOwnerDetailst.Visible = false;
            pnlFitmentLocationt.Visible = false;
            pnlSummaryt.Visible = true;


            lblState.Text = ddlState.SelectedItem.ToString();
            lblRegistrationNumber.Text = txtRegistrationNumber.Text.ToUpper();
            lblChasisNumber.Text = txtChasisNumber.Text.ToUpper();
            lblEngineNumber.Text = txtEngineNumber.Text.ToUpper();
            lblBharatStages.Text = lblBharatStage.Text;
            lblVehicleRegistrationDate.Text = txtRegistrationDate.Text;
            lblFuelType.Text = txtFuelType.Text;
            lblMaker.Text = txtMaker.Text;
            lblVehicleType.Text = txtVehicleType.Text;
            lblVehicleCategory.Text = txtVehicleCategory.Text;
            lblVehicleCategoryUser.Text = ddlVehicleCatory.SelectedItem.ToString();
            lblOwnerName.Text = txtOwnerName.Text;
            lblEmailId.Text = txtEmailId.Text;
            lblMobileNumber.Text = txtMobileNumber.Text;
            lblBillingAddress.Text = txtBillingAddress.Text;
            lblFitmentCentre.Text = txtDealerInfo.Text;

            OnlineRateTractorTrailorData rd = new OnlineRateTractorTrailorData(ddlVehicleCatory.SelectedItem.ToString(), int.Parse(ddlState.SelectedValue.ToString()));
            if (rd.HasValue)
            {
                txtAmount.Text = rd.netamount.ToString();
            }
            else
            {
                btnVerifyt.Enabled = false;
                lblErroVerify.Text = "* Please contact with admin for rate";
                lblErroVerify.Visible = true;
            }


        }
        catch { }
    }

    protected void btnVerifyt_Click(object sender, EventArgs e)
    {
        try
        {
            OnlineOrderData odRR = new OnlineOrderData(txtOwnerName.Text, txtMobileNumber.Text, txtRegistrationNumber.Text.ToUpper());
            int flag = 0;

            if (odRR.HasValue)
            {
                if (odRR.npid == 0 && odRR.paymentstatus == "Success")
                {
                    flag = 1;
                }
            }
            if (flag == 0)
            {
                var timeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
                var now = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, timeZoneInfo);

                OnlineOrderData od = new OnlineOrderData();
                od.state = ddlState.SelectedItem.ToString();
                od.registrationnumber = txtRegistrationNumber.Text.ToUpper();
                od.chasisnumber = txtChasisNumber.Text.ToUpper();
                od.enginenumber = txtEngineNumber.Text.ToUpper();
                od.bharatstage = lblBharatStage.Text;
                od.vehicleregistrationbate = txtRegistrationDate.Text;
                od.fueltype = txtFuelType.Text;
                od.maker = txtMaker.Text;
                od.vehicletype = txtVehicleType.Text;
                od.vehiclecategory = txtVehicleCategory.Text;
                od.vehiclecategory1 = ddlVehicleCatory.SelectedItem.ToString();
                od.ownername = txtOwnerName.Text;
                od.emailid = txtEmailId.Text;
                od.mobilenumber = txtMobileNumber.Text;
                od.billingaddress = txtBillingAddress.Text;
                od.city = ddlCity.SelectedItem.ToString();
                od.fitmentcentre = int.Parse(ddlDealer.SelectedValue.ToString());
                od.orderdaate = now.ToString("dd-MM-yyyy HH:mm:ss");

                OnlineRateTractorTrailorData rd = new OnlineRateTractorTrailorData(ddlVehicleCatory.SelectedItem.ToString(), int.Parse(ddlState.SelectedValue.ToString()));
                //if (rd.HasValue)
                //{
                //    txtAmount.Text = rd.netamount.ToString();
                //}
                DistibutorData ddd = new DistibutorData(int.Parse(ddlDealer.SelectedValue.ToString()));
                od.emsid = ddd.extra;
                od.amount = rd.amount;
                od.gst = rd.gst;
                od.netanount = rd.netamount;
                od.fitmentdate = now.AddDays(15).ToString("dd-MM-yyyy") + " 10:30 AM";
                od.SaveForTractorTrailer();

                postData(txtOwnerName.Text, txtMobileNumber.Text, txtRegistrationNumber.Text.ToUpper());

            }
            else
            {
                lblErroVerify.Visible = true;
                lblErroVerify.Text = "This vehicle order is already in pending";
            }
            //OnlineOrderData odRR = new OnlineOrderData(txtOwnerName.Text, txtMobileNumber.Text, txtRegistrationNumber.Text.ToUpper());
        }
        catch { }
    }
    private void postData(string namess, string mobiles, string vehicles)
    {
        try
        {
            OnlineOrderData od = new OnlineOrderData(namess, mobiles, vehicles);
            //string BillingAddress = txtbillinghouse.Text + "," + txtbillingarea.Text + "," + txtbillingmark.Text + "," + txtbillingstate.Text;
            // string shippingAddress = txtshippinghouse.Text + "," + txtshippingarea.Text + "," + txtshippingmark.Text + "," + txtshppingstate.Text;
            string mid = WebConfigurationManager.AppSettings["merchantid"];
            string redirect_url = WebConfigurationManager.AppSettings["redirect_url"];
            string cancel_url = WebConfigurationManager.AppSettings["cancel_url"];
            OnlineOrderData oodd = new OnlineOrderData(od.id);
            NameValueCollection collections = new NameValueCollection();
            collections.Add("merchant_id", mid);
            collections.Add("order_id", od.id.ToString());
            collections.Add("amount", ((od.netanount * 2 / 100) + od.netanount).ToString());
            collections.Add("currency", "INR");
            collections.Add("redirect_url", redirect_url);
            collections.Add("cancel_url", cancel_url);
            collections.Add("billing_name", od.ownername);
            collections.Add("billing_city", od.city);
            collections.Add("billing_state", od.state);
            collections.Add("billing_address", od.billingaddress);
            collections.Add("billing_country", "India");
            collections.Add("billing_tel", od.mobilenumber);
            collections.Add("billing_email", od.emailid);
            collections.Add("billing_city", od.city);
            // collections.Add("billing_zip", "ad.zipcode");
            string remoteUrl = "ccavRequestHandler.aspx";

            string html = "<html><head>";
            html += "</head><body onload='document.forms[0].submit()'>";
            html += string.Format("<form name='customerData' method='POST' action='{0}'>", remoteUrl);
            foreach (string key in collections.Keys)
            {
                html += string.Format("<input name='{0}' type='text' value='{1}'>", key, collections[key]);
            }
            html += "</form></body></html>";
            Response.Clear();
            Response.ContentEncoding = Encoding.GetEncoding("ISO-8859-1");
            Response.HeaderEncoding = Encoding.GetEncoding("ISO-8859-1");
            Response.Charset = "ISO-8859-1";
            Response.Write(html);
            Response.End();
        }
        catch (Exception ex)
        { }
    }
    protected void ddlCity_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            CityDetails ddataa = new CityDetails();
            DataSet dstate = ddataa.getDetails("select * from distibutor where status=1 and city=" + ddlCity.SelectedValue.ToString() + " order by name");
            ddlDealer.DataSource = dstate;
            ddlDealer.DataTextField = "name";
            ddlDealer.DataValueField = "id";
            ddlDealer.DataBind();
            ddlDealer.Items.Insert(0, "---Select Fitment Centre---");
            ddlDealer.SelectedIndex = 0;
        }
        catch { }
    }

    protected void ddlDealer_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            DistibutorData dd = new DistibutorData(int.Parse(ddlDealer.SelectedValue.ToString()));
            txtDealerInfo.Text = dd.name + ", " + dd.address;
        }
        catch { }
    }
}