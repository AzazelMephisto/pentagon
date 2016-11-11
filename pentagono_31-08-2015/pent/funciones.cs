using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net;
using System.Net.Mail;

namespace pent
{
    public class funciones
    {
        public string enviarCorreo(string fromname, string[] tomail, string toname, string bodymail, string subjectmail)
        {
            System.Net.ServicePointManager.ServerCertificateValidationCallback += (s, cert, chain, sslPolicyErrors) => true;
            //var toAddress = new MailAddress(to, toname);
            var fromAddress = new MailAddress("aspen.appweb@aspenpharmalatam.com", fromname);
            string fromPassword = "Asp3nWeb48";
            var smtp = new SmtpClient
            {
                Host = "smtp.office365.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
            };

            MailMessage msg = new MailMessage();
            msg.From = fromAddress;
            //msg.To.Add(toAddress);
            foreach (string mail in tomail) 
            { 
                if(!(String.IsNullOrEmpty(mail) || mail == ""))
                { 
                    msg.To.Add(mail);
                }
            }
            //msg.CC.Add(ccmail);
            msg.Body = bodymail;
            msg.Subject = subjectmail;
            try
            {
                smtp.Send(msg);
            }
            catch (Exception ex)
            {
                return ex.Message;//HttpContext.Current.Response.Write(ex);
            }
            return "";

            //using (var message = new MailMessage(fromAddress, toAddress)
            //{
            //    Subject = subjectmail,
            //    Body = bodymail
            //})
            //    try
            //    {
            //        smtp.Send(message);
            //    }
            //    catch (Exception ex)
            //    {
            //        //HttpContext.Current.Response.Write(ex);
            //    }
        }
        public string enviarCorreoAsync(string fromname, string[] tomail, string toname, string bodymail, string subjectmail)
        {
            System.Net.ServicePointManager.ServerCertificateValidationCallback += (s, cert, chain, sslPolicyErrors) => true;
            //var toAddress = new MailAddress(to, toname);
            var fromAddress = new MailAddress("aspen.appweb@aspenpharmalatam.com", fromname);
            string fromPassword = "Asp3nWeb48";
            var smtp = new SmtpClient
            {
                Host = "smtp.office365.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
            };

            MailMessage msg = new MailMessage();
            msg.From = fromAddress;
            //msg.To.Add(toAddress);
            foreach (string mail in tomail)
            {
                if (!(String.IsNullOrEmpty(mail) || mail == ""))
                {
                    msg.To.Add(mail);
                }
            }
            //msg.CC.Add(ccmail);
            //msg.IsBodyHtml = true;
            msg.Body = bodymail;
            msg.Subject = subjectmail;
            try
            {
                smtp.SendAsync(msg,null); 
            }
            catch (Exception ex)
            {
                return ex.InnerException.Message;//HttpContext.Current.Response.Write(ex);
            }
            return "";

            //using (var message = new MailMessage(fromAddress, toAddress)
            //{
            //    Subject = subjectmail,
            //    Body = bodymail
            //})
            //    try
            //    {
            //        smtp.Send(message);
            //    }
            //    catch (Exception ex)
            //    {
            //        //HttpContext.Current.Response.Write(ex);
            //    }
        }
        public string enviarCorreo(string fromname, string[] tomail, string [] cc, string toname, string bodymail, string subjectmail)
        {
            System.Net.ServicePointManager.ServerCertificateValidationCallback += (s, cert, chain, sslPolicyErrors) => true;
            //var toAddress = new MailAddress(to, toname);
            string respuesta = "";
            var fromAddress = new MailAddress("aspen.appweb@aspenpharmalatam.com", fromname);
            string fromPassword = "Asp3nWeb48";
            var smtp = new SmtpClient
            {
                Host = "smtp.office365.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
            };
            //si no existe el correo destinatario no se puede mandar nada
            if (tomail.Count() > 0)
            {
            //Creamos el objeto mensaje que será el correo
            MailMessage msg = new MailMessage();
            msg.From = fromAddress;
            
                //Agregamos los correos para el/los usuarios
                foreach (string mail in tomail)
                {
                    if (!(String.IsNullOrEmpty(mail) || mail == ""))
                    {
                        msg.To.Add(mail);
                    }
                }
                //Si existe copia para alguien, se agregan los correos
                if (!String.IsNullOrEmpty(cc[0]))
                {
                    foreach (string copia in cc)
                    {
                        if (!(String.IsNullOrEmpty(copia) || copia == ""))
                        {
                            msg.CC.Add(copia);
                        }
                    }
                }
                //definimos el cuerpo del correo (lo ponemos com html para poder darle formato)
                msg.IsBodyHtml = true;
                msg.Body = bodymail;
                msg.Subject = subjectmail;
                try
                {
                    smtp.Send(msg);
                    respuesta = "OK";
                }
                catch (Exception ex)
                {
                    respuesta = ex.InnerException.Message;//HttpContext.Current.Response.Write(ex);
                }
            }
            else
            {
                respuesta = "No existe gente agregada como destinatario";
            }

            return respuesta;
        }
    }
}
