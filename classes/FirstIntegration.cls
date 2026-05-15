@RestResource(urlMapping='/basic/')
global class FirstIntegration {
    
       @HttpPost
		global static Id Working()
       {
           RestRequest req=RestContext.request;
           RestResponse res=RestContext.response;
           Blob b =req.requestBody;
           
           Map<String,Object> bodyMap=(Map<String,Object>) JSON.deserializeUnTyped(b.toString());
           Account acc=new Account();
           acc.Name=String.valueOf(bodyMap.get('Name'));
           insert acc;
           res.statusCode=200;
           return acc.Id;
	    }
}