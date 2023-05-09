public with sharing class GoogleNewsService {
    @AuraEnabled
    public static List<DataWrapper> getCallout(String category){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
       
        request.setEndpoint('https://newsapi.org/v2/top-headlines?country=us&category='+category+'&apiKey=cb4c853b9b01467d947cac92538bc410');
       
        request.setMethod('GET');
       // request.
         List<DataWrapper> dtList = new List<DataWrapper>();
        //request.setHeader('Content-Type', 'application/json');
        HttpResponse response = http.send(request);
        if(response.getStatusCode() == 200){
            System.debug('Success');
            system.debug('response'+response.getBody());
            JsonParserGoogleNews gognews = JsonParserGoogleNews.parse(response.getBody());
            //System.debug('Articles'+gognews.articles);

            
            for (JsonParserGoogleNews.Articles jpart : gognews.articles) {
                
                DataWrapper dt = new DataWrapper(jpart.source.id, jpart.source.name ,jpart.author, jpart.title,
                                                jpart.description,jpart.url, jpart.urlToImage, 
                                                jpart.publishedAt, jpart.content );
                dtList.add(dt);
                system.debug('data'+dt);
            }
            system.debug('datalist'+dtList);
            return dtList;
           
            
        }else {
            System.debug('error'+ response.getStatus());
            system.debug('response'+response.getBody());
            return null;
        }
    }
    
    public class DataWrapper {
        @AuraEnabled
        public JsonParserGoogleNews.Source source;

        @AuraEnabled
        public String sourceId;

        @AuraEnabled
        public String sourceName;

        @AuraEnabled
		public String author;

        @AuraEnabled
		public String title;

        @AuraEnabled
		public String description;

        @AuraEnabled
		public String url;

        @AuraEnabled
		public String urlToImage;

        @AuraEnabled
		public String publishedAt;

        @AuraEnabled
		public String content;
       
        public DataWrapper(String sourceId, String sourceName , String author, String title, 
                            String description, String url, String urlToImage, String publishedAt, String content){
                this.sourceId = sourceId;
                this.sourceName = sourceName;
                this.author = author;
                this.title = title;
                this.description = description;
                this.url = url;
                this.urlToImage = urlToImage;
                this.publishedAt = publishedAt;
                this.content = content;
        }

    }
  
}