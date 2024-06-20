import 'package:capstone_project_mobile/pages/resource/article_page/article_page.dart';
import 'package:capstone_project_mobile/pages/resource/book_recommendation_page/book_recommendation_page.dart';
import 'package:capstone_project_mobile/pages/resource/quote_page/qoute_slideshow.dart';
import 'package:capstone_project_mobile/pages/resource/video_play.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ResourcePage extends StatefulWidget {
  const ResourcePage({super.key});

  @override
  State<ResourcePage> createState() => _ResourcePageState();
}

class _ResourcePageState extends State<ResourcePage> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();
    const url = 'https://www.youtube.com/watch?v=tY8NY6CMDFA';
    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
      flags: const YoutubePlayerFlags(
        mute: false,
        loop: false,
        autoPlay: true,
      ),
    );
  }

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
            VideoPlayer(controller: controller), // Use the new widget here
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
}
