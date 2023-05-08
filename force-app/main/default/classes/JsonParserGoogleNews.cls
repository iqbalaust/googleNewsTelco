public class JsonParserGoogleNews {

	public String status;
	public Integer totalResults;
	public List<Articles> articles;

	public class Articles {
		public Source source;
		public String author;
		public String title;
		public String description;
		public String url;
		public String urlToImage;
		public String publishedAt;
		public String content;
	}

	public class Source {
		public String id;
		public String name;
	}

	
	public static JsonParserGoogleNews parse(String json) {
		return (JsonParserGoogleNews) System.JSON.deserialize(json, JsonParserGoogleNews.class);
	}
}