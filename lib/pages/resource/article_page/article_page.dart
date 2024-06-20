import 'package:capstone_project_mobile/layouts/my_app_bar.dart';
// import 'package:capstone_project_mobile/pages/resource/book_recommendation_page/book_recommendation_page.dart';
import 'package:capstone_project_mobile/pages/resource/expandable_tile.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticlePage extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Map<String, String>> books = [
    {
      'img': 'lib/assets/images/article.png',
      'title': 'Coping with ADHD',
      'author': 'by Louis Armstrong',
      'date': '2019',
      'url': 'https://example.com/article1' // Add URLs to your data
    },
    {
      'img': 'lib/assets/images/article.png',
      'title': 'Mental Health',
      'author': 'by Louis Godman',
      'date': '2012',
      'url': 'https://example.com/article2'
    },
    {
      'img': 'lib/assets/images/article.png',
      'title': 'Balance Living',
      'author': 'by Louis Godman',
      'date': '2012',
      'url': 'https://youtu.be/tRFLs_-54gE?si=BCraxyvBYz9ANlHI'
    },
    {
      'img': 'lib/assets/images/article.png',
      'title': 'Tips from Professional',
      'author': 'by Louis Godman',
      'date': '2012',
      'url': 'https://www.youtube.com/'
    },
  ];

  ArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: const MyAppBar(
        title: "Article and Research",
        actionsEnabled: true,
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildText(context),
            const SizedBox(height: 20),
            ...books.map((book) {
              return Column(
                children: [
                  _buildArticleCard(
                    context,
                    book['img']!,
                    book['title']!,
                    book['author']!,
                    book['date']!,
                    book['url']!,
                  ),
                  const SizedBox(height: 30),
                ],
              );
            }),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildText(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [colorScheme.primary, colorScheme.secondary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            foregroundColor: colorScheme.onPrimary,
            textStyle: const TextStyle(fontSize: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 20,
            ),
          ),
          child: const ExpandableTile(
            title: 'Empower Your Mind with Knowledge',
            text1:
                'Dive into our handpicked selection of insightful articles and research papers on mental health and self-help.',
            text2:
                "Stay informed with the latest findings, expert advice, and transformative strategies to enhance your well-being.",
            text3:
                'Unlock the power of knowledge and take control of your mental health journey today.',
          ),
        ),
      ),
    );
  }

  Widget _buildArticleCard(
    BuildContext context,
    final img,
    final title,
    final author,
    final date,
    final url,
  ) {
    return ElevatedButton(
      onPressed: () => _launchURL(url),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shadowColor: Colors.grey,
        elevation: 0,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 3,
              blurRadius: 6,
              offset: Offset(0, 5), // changes position of shadow
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 15,
            bottom: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 4,
                child: Image.asset(
                  img,
                  fit: BoxFit.fitHeight,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Stack(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            title,
                            style: const TextStyle(
                              color: Colors.black,
                              overflow: TextOverflow.visible,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            author,
                            style: const TextStyle(
                              color: Colors.black,
                              overflow: TextOverflow.visible,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            date,
                            style: const TextStyle(
                              color: Colors.black,
                              overflow: TextOverflow.visible,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                    const Positioned(
                      top: 0,
                      right: 0,
                      child: FavoriteButton(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  var isLike = false;
  void handleLike() {
    setState(() {
      isLike = !isLike; // Toggle the value of isLike
    });
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      ),
      child: IconButton(
        onPressed: () {
          handleLike();
        },
        icon: Icon(
          isLike ? Icons.bookmark : Icons.bookmark_outline,
          color: isLike ? colorScheme.primary : Colors.black,
          size: 30,
        ),
      ),
    );
  }
}
