using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;
using System.Drawing;
using System.Net.Mail;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for support
/// </summary>
public class support
{
	public support()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    private SqlConnection myconn;
    private SqlCommand mycomm;
    private SqlDataReader mydr;
    private void SetConnection()
    {
        //myconn = new SqlConnection("Data Source=localhost;Initial Catalog=project16;User ID=rajesh;Password=Root@1234");
        myconn = new SqlConnection();
        myconn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["project16ConnectionString"].ConnectionString;
    }

    public string sendmaildummy(string from,string subject, string content)
    {
        string result = string.Empty;
        try
        {
            MailMessage mail = new MailMessage();
            SmtpClient SmtpServer = new SmtpClient("email-smtp.us-west-2.amazonaws.com");
            mail.From = new MailAddress("admin@srijothedam.in");
            mail.To.Add(from);
          //  mail.CC.Add("admin@srijothedam.in");
            mail.Subject = subject;
            AlternateView htmlView = AlternateView.CreateAlternateViewFromString(content);
            htmlView.ContentType = new System.Net.Mime.ContentType("text/html");
            mail.AlternateViews.Add(htmlView);
           // mail.Body = content;
            //Attachment attachment = new Attachment(filename);
            // mail.Attachments.Add(attachment);
            SmtpServer.DeliveryMethod = SmtpDeliveryMethod.Network;
            SmtpServer.Port = 465;
            SmtpServer.UseDefaultCredentials = false;
            SmtpServer.Credentials = new System.Net.NetworkCredential("AKIAJ6TO7HH2GJ6NC52Q", "AhqOV+1VBIifJxJnwxzr5h1xq7MkIPD7pka/o0IFiwy1");
            
            SmtpServer.EnableSsl = true;

            SmtpServer.Send(mail);
            result = "true";
        }
        catch(Exception es)
        {
            result = "false";
        }
        return result;
    }

    public string sendmail(string from, string subject, string content)
    {
        string result = string.Empty;
        const String FROM = "admin@srijothedam.in";   // Replace with your "From" address. This address must be verified.
        String TO = from.ToString();  // Replace with a "To" address. If your account is still in the
        // sandbox, this address must be verified.

        string SUBJECT = subject;
        string BODY = content;

        // Supply your SMTP credentials below. Note that your SMTP credentials are different from your AWS credentials.
        const String SMTP_USERNAME = "AKIAJ6TO7HH2GJ6NC52Q";  // Replace with your SMTP username. 
        const String SMTP_PASSWORD = "AhqOV+1VBIifJxJnwxzr5h1xq7MkIPD7pka/o0IFiwy1";  // Replace with your SMTP password.

        // Amazon SES SMTP host name. This example uses the US West (Oregon) region.
        const String HOST = "email-smtp.us-west-2.amazonaws.com";

        // Port we will connect to on the Amazon SES SMTP endpoint. We are choosing port 587 because we will use
        // STARTTLS to encrypt the connection.
        const int PORT = 587;

        // Create an SMTP client with the specified host name and port.
        using (System.Net.Mail.SmtpClient client = new System.Net.Mail.SmtpClient(HOST, PORT))
        {
            // Create a network credential with your SMTP user name and password.
            client.Credentials = new System.Net.NetworkCredential(SMTP_USERNAME, SMTP_PASSWORD);
           
            // Use SSL when accessing Amazon SES. The SMTP session will begin on an unencrypted connection, and then 
            // the client will issue a STARTTLS command to upgrade to an encrypted connection using SSL.
            client.EnableSsl = true;
            MailMessage mail = new MailMessage(FROM, TO);
            mail.Subject = SUBJECT;
            AlternateView htmlView = AlternateView.CreateAlternateViewFromString(content);
            htmlView.ContentType = new System.Net.Mime.ContentType("text/html");
            mail.AlternateViews.Add(htmlView);
            
            // Send the email. 
            try
            {
                client.Send(mail);
                result = "True";
                
            }
            catch (Exception ex)
            {
                result = "False";
               
            }
        }
        return result;
    }

    public string sendmailwithattach(string from, string subject, string content, List<string> paths)
    {
        string result = string.Empty;
       
        const String FROM = "admin@srijothedam.in";   // Replace with your "From" address. This address must be verified.
        String TO = from.ToString();  // Replace with a "To" address. If your account is still in the
        // sandbox, this address must be verified.

        string SUBJECT = subject;
        string BODY = content;

        // Supply your SMTP credentials below. Note that your SMTP credentials are different from your AWS credentials.
        const String SMTP_USERNAME = "AKIAJ6TO7HH2GJ6NC52Q";  // Replace with your SMTP username. 
        const String SMTP_PASSWORD = "AhqOV+1VBIifJxJnwxzr5h1xq7MkIPD7pka/o0IFiwy1";  // Replace with your SMTP password.

        // Amazon SES SMTP host name. This example uses the US West (Oregon) region.
        const String HOST = "email-smtp.us-west-2.amazonaws.com";

        // Port we will connect to on the Amazon SES SMTP endpoint. We are choosing port 587 because we will use
        // STARTTLS to encrypt the connection.
        const int PORT = 587;

        // Create an SMTP client with the specified host name and port.
        using (System.Net.Mail.SmtpClient client = new System.Net.Mail.SmtpClient(HOST, PORT))
        {
            // Create a network credential with your SMTP user name and password.
            client.Credentials = new System.Net.NetworkCredential(SMTP_USERNAME, SMTP_PASSWORD);

            // Use SSL when accessing Amazon SES. The SMTP session will begin on an unencrypted connection, and then 
            // the client will issue a STARTTLS command to upgrade to an encrypted connection using SSL.
            client.EnableSsl = true;
            MailMessage mail = new MailMessage(FROM, TO);
            foreach(string fpath in paths)
            {
                Attachment atch = new Attachment(HttpContext.Current.Server.MapPath(fpath));
                mail.Attachments.Add(atch);
            }
            mail.Subject = SUBJECT;
            mail.Body = BODY;
            
            // Send the email. 
            try
            {
                client.Send(mail);
                result = "True";

            }
            catch (Exception ex)
            {
                result = "False";

            }
        }
        return result;
    }

    public string sendmailwithattach23(string from, string subject, string content, List<string> paths)
    {
        string result = string.Empty;
        try
        {
            MailMessage mail = new MailMessage();
            SmtpClient SmtpServer = new SmtpClient("email-smtp.us-west-2.amazonaws.com");
            mail.From = new MailAddress("admin@srijothedam@gmail.in");
            mail.To.Add(from);
            //  mail.CC.Add("contact.srijothedam@gmail.com");
            mail.Subject = subject;
            mail.Body = content;
            foreach(string path in paths)
            {
                Attachment attach = new Attachment(HttpContext.Current.Server.MapPath(path));
                mail.Attachments.Add(attach);
            }
            //Attachment attachment = new Attachment(filename);
            // mail.Attachments.Add(attachment);
            SmtpServer.DeliveryMethod = SmtpDeliveryMethod.Network;
            SmtpServer.Port = 587;
            SmtpServer.UseDefaultCredentials = false;
            SmtpServer.Timeout = 25000000;
            SmtpServer.Credentials = new System.Net.NetworkCredential("AKIAJ6TO7HH2GJ6NC52Q", "AhqOV+1VBIifJxJnwxzr5h1xq7MkIPD7pka/o0IFiwy1");

            SmtpServer.EnableSsl = true;

            SmtpServer.Send(mail);
            result = "true";
        }
        catch (Exception es)
        {
            result = "false";
        }
        return result;
    }

    public string insertQuery(string Query)
    {
        try
        {
            SetConnection();
            myconn.Open();
            mycomm = new SqlCommand(Query, myconn);
            mycomm.ExecuteNonQuery();
           // return mycomm.Parameters["@id"].Value.ToString();
            return "True";
        }
        catch(Exception ex)
        {
            return ex.ToString();
        }
        finally
        {
            if(myconn.State ==ConnectionState.Open)
            {
                myconn.Close();
            }
            myconn.Dispose();
        }
       
    }

    public string insertQuery(string Query, string id)
    {
        try
        {
            SetConnection();
            myconn.Open();
            mycomm = new SqlCommand(Query, myconn);
            var obj = mycomm.ExecuteScalar();
           
            return obj.ToString();
            //return "True";
        }
        catch (Exception ex)
        {
            return ex.ToString();
        }
        finally
        {
            if (myconn.State == ConnectionState.Open)
            {
                myconn.Close();
            }
            myconn.Dispose();
        }

    }

    public string getValue(string Query)
    {
        string getval = "";
        try
        {
            SetConnection();
            myconn.Open();
            mycomm = new SqlCommand(Query, myconn);
            mydr = mycomm.ExecuteReader();
            if (mydr.HasRows)
            {
                mydr.Read();
                getval = mydr[0].ToString();
            }
            return getval;
        }
        catch(Exception ex)
        {
            return ex.ToString();
        }
         finally
        {
            if(myconn.State ==ConnectionState.Open)
            {
                myconn.Close();
            }
            myconn.Dispose();
        }

    }
    
    public DataTable getBulkValues(string Query)
    {
        SqlDataReader dr = null;
        DataTable dt = new DataTable();
        try
        {
            SetConnection();
            myconn.Open();
            SqlDataAdapter myda = new SqlDataAdapter(Query, myconn);
            myda.Fill(dt);
            
            return dt;
        }
        catch (Exception ex)
        {
            return dt;
        }
        finally
        {
            if (myconn.State == ConnectionState.Open)
            {
                myconn.Close();
            }
            myconn.Dispose();
        }
    }
   
    public string Encrypt(string clearText)
    {
        string EncryptionKey = "ThisTest2015";
        byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
        using (Aes encryptor = Aes.Create())
        {
            Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
            encryptor.Key = pdb.GetBytes(32);
            encryptor.IV = pdb.GetBytes(16);
            using (MemoryStream ms = new MemoryStream())
            {
                using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                {
                    cs.Write(clearBytes, 0, clearBytes.Length);
                    cs.Close();
                }
                clearText = Convert.ToBase64String(ms.ToArray());
            }
        }
        return clearText;
    }

    public string Decrypt(string cipherText)
    {
        string EncryptionKey = "ThisTest2015";
        byte[] cipherBytes = Convert.FromBase64String(cipherText);
        using (Aes encryptor = Aes.Create())
        {
            Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
            encryptor.Key = pdb.GetBytes(32);
            encryptor.IV = pdb.GetBytes(16);
            using (MemoryStream ms = new MemoryStream())
            {
                using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                {
                    cs.Write(cipherBytes, 0, cipherBytes.Length);
                    cs.Close();
                }
                cipherText = Encoding.Unicode.GetString(ms.ToArray());
            }
        }
        return cipherText;
    }

    
    

    public void AddtoCart(string id,string uname,string quantity)
    {

        if (uname != null && uname != "")
        {
            string chkcart = "Select * from cart_products where cart_pro_product_Id='" + id + "' and cart_pro_user_id='" + uname + "' and cart_pro_shop_Id is null";
            DataTable dt4 = getBulkValues(chkcart);
            if (dt4.Rows.Count == 1)
            {
                string cart_pro_Id = dt4.Rows[0].ItemArray[0].ToString();
                int quatinty_old = Convert.ToInt32(dt4.Rows[0].ItemArray[3].ToString());
                int nre_quatity = quatinty_old + +Convert.ToInt32(quantity);
                string update_query = "Update cart_products Set cart_pro_quatity='" + nre_quatity + "' where cart_pro_Id='" + cart_pro_Id + "'";
                insertQuery(update_query);
            }
            else
            {
                string addcart = "Insert into cart_products(cart_pro_product_Id,cart_pro_user_id,cart_pro_quatity)values('" + id + "','" + uname + "','" + quantity + "')";
                insertQuery(addcart);
            }
        }
        else
        {
//DataTable myCart = HttpContext.Current.Session["myCartDT"] as DataTable;
            if ((HttpContext.Current.Session["myCartDT"] as DataTable).Rows.Count == 0)
            {
                (HttpContext.Current.Session["myCartDT"] as DataTable).Rows.Add(id, "xxx", quantity);
            }
            else
            {
                string exnew = "False";
                foreach (DataRow dr in (HttpContext.Current.Session["myCartDT"] as DataTable).Rows)
                {
                    if(dr.ItemArray[0].ToString().Contains(id))
                    {
                        dr.SetField("cart_pro_quatity", Convert.ToInt32(dr.ItemArray[2].ToString()) + Convert.ToInt32(quantity));
                        exnew = "True";
                    }
                }
                if(exnew=="False")
                {
                    (HttpContext.Current.Session["myCartDT"] as DataTable).Rows.Add(id, "xxx", quantity);
                }
            }

            //HttpContext.Current.Session["myCartDt"] = myCart;
        }
    }
    
    //    public Image Base64ToImage(string base64String)
//    {
//        // Convert Base64 String to byte[]
//        byte[] imageBytes = Convert.FromBase64String(base64String);
//        MemoryStream ms = new MemoryStream(imageBytes, 0,
//          imageBytes.Length);

//        // Convert byte[] to Image
//        ms.Write(imageBytes, 0, imageBytes.Length);
//        Image image = Image.FromStream(ms, true);
//        return image;
//    }

    public void GuestCart(string id,string quantity)
    {

    }
}