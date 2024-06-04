import 'package:flutter/material.dart';

class ProfilePictureCard extends StatelessWidget {
  final String imgPath;
  const ProfilePictureCard({super.key, required this.imgPath});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Image.asset(
        imgPath,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
        filterQuality: FilterQuality.high,
      ),
    );
  }
}
