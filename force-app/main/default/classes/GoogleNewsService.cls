public with sharing class GoogleNewsService {
    public static void getCallout(String category){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
       
        request.setEndpoint('https://newsapi.org/v2/top-headlines?country=my&category='+category+'&apiKey=cb4c853b9b01467d947cac92538bc410');
       
        request.setMethod('GET');
       // request.
        
        //request.setHeader('Content-Type', 'application/json');
        HttpResponse response = http.send(request);
        if(response.getStatusCode() == 200){
            System.debug('Success');
            system.debug('response'+response.getBody());

        }else {
            System.debug('error'+ response.getStatus());
            system.debug('response'+response.getBody());
        }
    } 
}