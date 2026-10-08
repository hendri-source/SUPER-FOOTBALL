import 'package:flutter/material.dart';
import 'shared/model/news.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  static const List<NewsItem> articles = [
    NewsItem(
      id: 'news-1',
      title:
          'Format Baru UEFA Champions League: Perebutan Puncak Klasemen Memanas',
      snippet:
          'Klasemen tunggal 36 klub menghasilkan persaingan sengit antarklub raksasa Eropa tanpa margin kesalahan.',
      content:
          'Musim 2025/2026 menjadi babak baru turnamen antarklub paling bergengsi di dunia dengan format Swiss System. Semua tim berlaga dalam satu klasemen terpadu untuk berebut posisi 8 besar otomatis.',
      category: 'UCL',
      imageUrl:
          'https://images.unsplash.com/photo-1508098682722-e99c43a406b2?auto=format&fit=crop&w=800&q=80',
      date: '29 Sep 2026',
      author: 'Redaksi Sepak Bola',
      readTime: '4 mnt',
      isFeatured: true,
    ),
    NewsItem(
      id: 'news-2',
      title:
          'Duel Bintang: Mbappé, Haaland & Lamine Yamal Bersaing di Panggung Eropa',
      snippet:
          'Generasi baru penyerang dunia saling unjuk kebolehan mencetak rekor gol dan assist spektakuler.',
      content:
          'Persaingan gelar pemain terbaik dunia kini diramaikan para bintang muda andalan klub-klub elit Spanyol dan Inggris.',
      category: 'Bintang',
      imageUrl:
          'https://images.unsplash.com/photo-1574629810360-7efbbe195018?auto=format&fit=crop&w=800&q=80',
      date: '28 Sep 2026',
      author: 'Analis Taktik',
      readTime: '3 mnt',
    ),
    NewsItem(
      id: 'news-3',
      title:
          'Bursa Transfer Musim Dingin: Klub Premier League & Serie A Bersiap',
      snippet:
          'Arsenal, Liverpool, dan Inter Milan berburu talenta baru untuk memperkuat kedalaman skuad.',
      content:
          'Jendela transfer Januari diprediksi memecahkan rekor nilai transfer untuk posisi gelandang jangkar dan penyerang sayap.',
      category: 'Transfer',
      imageUrl:
          'https://images.unsplash.com/photo-1489944445391-11dd35574549?auto=format&fit=crop&w=800&q=80',
      date: '27 Sep 2026',
      author: 'Koresponden Transfer',
      readTime: '5 mnt',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F17),
      appBar: AppBar(
        title: const Text('Berita Sepak Bola Dunia',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        backgroundColor: const Color(0xFF131B2E),
        elevation: 0,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: articles.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final a = articles[index];
          return Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF131B2E),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFF1E293B)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(a.imageUrl,
                      height: 140, width: double.infinity, fit: BoxFit.cover),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFBBF24).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(a.category,
                          style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFBBF24))),
                    ),
                    const SizedBox(width: 8),
                    Text('${a.date} · ${a.readTime}',
                        style: const TextStyle(
                            fontSize: 11, color: Color(0xFF94A3B8))),
                  ],
                ),
                const SizedBox(height: 6),
                Text(a.title,
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                const SizedBox(height: 4),
                Text(a.snippet,
                    style: const TextStyle(
                        fontSize: 12, color: Color(0xFFCBD5E1), height: 1.4)),
              ],
            ),
          );
        },
      ),
    );
  }
}
