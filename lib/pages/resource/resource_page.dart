import 'package:capstone_project_mobile/pages/resource/article_page/article_page.dart';
import 'package:capstone_project_mobile/pages/resource/book_recommendation_page/book_recommendation_page.dart';
import 'package:capstone_project_mobile/pages/resource/quote_page/qoute_slideshow.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ResourcePage extends StatefulWidget {
  const ResourcePage({super.key});

  @override
  State<ResourcePage> createState() => _ResourcePageState();
}

class _ResourcePageState extends State<ResourcePage> {
  final url = 'https://youtu.be/tY8NY6CMDFA?si=80fyBHrN8cUDQCh9';
  final img =
      "https://i.ytimg.com/an_webp/tY8NY6CMDFA/mqdefault_6s.webp?du=3000&sqp=COCR2bMG&rs=AOn4CLDT5fbXfIlx1ZqHQ15fAlI5nhc4LA";
  final title =
      "What Mental Health Is and Why It's Important to Take Care of It? - Kids Academy";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Discover',
              style: textTheme.displayLarge?.copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Videos of the week',
              style: textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            _buildVideoPlay(url, img, title),
            const SizedBox(height: 20),
            Text(
              'Motivation Quote',
              style: textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            const SlideshowPage(),
            Text(
              'Other',
              style: textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            _buildBooKPage(context),
            const SizedBox(height: 20),
            _buildArticlePage(context)
          ],
        ),
      ),
    );
  }

  Widget _buildVideoPlay(final url, final img, final title) {
    return InkWell(
      onTap: () {
        _launchURL(url);
      },
      child: Center(
        child: ClipRRect(
          borderRadius:
              BorderRadius.circular(10), // Adjust the radius as needed
          child: Stack(
            children: <Widget>[
              Image.network(
                img,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return const CircularProgressIndicator();
                },
                errorBuilder: (context, error, stackTrace) {
                  return Text('Error loading image: $error');
                },
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding:
                      const EdgeInsets.all(8.0), // Adjust padding as needed
                  color: Colors.black.withOpacity(
                      0.5), // Adjust the opacity and color as needed
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildArticlePage(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ArticlePage()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          textStyle: const TextStyle(fontSize: 25),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 20,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2.5,
              child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Article and Research',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 27,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Find out your level of emotions and stress',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                  ]),
            ),
            const Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              child: Image.asset(
                'lib/assets/images/article.png',
                width: 100,
                height: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBooKPage(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [colorScheme.secondary, colorScheme.primary],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BookRecommendationPage()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            foregroundColor: colorScheme.onPrimary,
            textStyle: const TextStyle(fontSize: 25),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 20,
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  'Book',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 27,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  'Recommendation',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 27,
                      fontWeight: FontWeight.w500),
                ),
              ]),
              Spacer(),
              Icon(Icons.arrow_forward),
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
