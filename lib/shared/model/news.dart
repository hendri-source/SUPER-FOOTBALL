class NewsItem {
  final String id;
  final String title;
  final String snippet;
  final String content;
  final String category;
  final String imageUrl;
  final String date;
  final String author;
  final String readTime;
  final bool isFeatured;

  const NewsItem({
    required this.id,
    required this.title,
    required this.snippet,
    required this.content,
    required this.category,
    required this.imageUrl,
    required this.date,
    required this.author,
    required this.readTime,
    this.isFeatured = false,
  });
}
