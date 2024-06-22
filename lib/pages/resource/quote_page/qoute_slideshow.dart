import 'package:capstone_project_mobile/pages/resource/quote_page/qoute_page.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SlideshowPage extends StatefulWidget {
  const SlideshowPage({super.key});
  @override
  State<SlideshowPage> createState() => _SlideshowPageState();
}

class _SlideshowPageState extends State<SlideshowPage> {
  final List<String> imageUrls = [
    'https://i.pinimg.com/236x/58/50/6b/58506b21cb2333e481478bf0631ca5c9.jpg',
    'https://cdn.shopify.com/s/files/1/0070/7032/files/rohn-quote.png?v=1706739779',
    'https://m.media-amazon.com/images/I/71MQYuGHUkL._AC_UF1000,1000_QL80_.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2BgOfjoH6kuOgqHd0xPg_KxKOwJ2CQ-QU4w&s',
  ];

  late CarouselController _controller;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = CarouselController();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CarouselSlider.builder(
          carouselController: _controller,
          itemCount: imageUrls.length,
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            height: 300,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          itemBuilder: (context, index, realIndex) {
            final imageUrl = imageUrls[index];
            return ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                imageUrl,
                fit: BoxFit.fill,
                width: double.infinity,
                height: 300,
              ),
            );
          },
        ),
        const SizedBox(
          height: 10,
        ),
        Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                imageUrls.length,
                (index) => Container(
                  width: 10.0,
                  height: 30.0,
                  margin: const EdgeInsets.symmetric(horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index ? Colors.blue : Colors.grey,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: SizedBox(
                height: 10,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const QoutePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: colorScheme.inversePrimary,
                    foregroundColor: colorScheme.onPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 10,
                    ),
                  ),
                  child: Text(
                    'See All',
                    style: TextStyle(fontSize: 16, color: colorScheme.primary),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
