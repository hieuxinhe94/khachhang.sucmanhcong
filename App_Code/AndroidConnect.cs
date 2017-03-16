using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

[WebService(Namespace = "http://tempuri.org/androidService")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]

public class AndroidConnect : System.Web.Services.WebService {

    public AndroidConnect () {

    }

    string[,] mgsInfo = { };


    [WebMethod]
    public string HelloWorld() {
        return "Hello World";
    }


    [WebMethod]
    public string getMessage(string numberMobile)
    {
        // get message from here 
        return " MESSAGE TO PHONE : "+ numberMobile+"";
    }

    [WebMethod]
    public string getMessageFromId(int id) 
    {
        // get message from here 
        return " MESSAGE TO ID  : " + id + "";
    }

    
}
