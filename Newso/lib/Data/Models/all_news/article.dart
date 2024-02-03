import 'source.dart';

class Article {
	Source? source;
	String? author;
	String? title;
	String? description;
	String? url;
	String? urlToImage;
	String? publishedAt;
	String? content;

	Article({
		this.source, 
		this.author, 
		this.title, 
		this.description, 
		this.url, 
		this.urlToImage, 
		this.publishedAt, 
		this.content, 
	});

	factory Article.fromJson(Map<String, dynamic> json) => Article(
				source: json['source'] == null
						? null
						: Source.fromJson(json['source'] as Map<String, dynamic>),
				author: json['author'] as String? ?? "Unknown",
				title: json['title'] as String?,
				description: json['description'] as String? ?? "No Description",
				url: json['url'] as String?,
				urlToImage: json['urlToImage'] as String? ?? 
		"https://img.freepik.com/premium-vector/photo-icon-picture-icon-image-sign-symbol-vector-illustration_64749-4409.jpg?size=626&ext=jpg&ga=GA1.1.637631609.1688846713&semt=ais",
				publishedAt: json['publishedAt'] as String?,
				content: json['content'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'source': source?.toJson(),
				'author': author,
				'title': title,
				'description': description,
				'url': url,
				'urlToImage': urlToImage,
				'publishedAt': publishedAt,
				'content': content,
			};
}
