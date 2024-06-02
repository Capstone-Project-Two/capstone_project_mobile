import 'package:capstone_project_mobile/components/cards/profile_picture_card.dart';
import 'package:capstone_project_mobile/components/inputs/my_text_field.dart';
import 'package:capstone_project_mobile/model/dio/create_post.dart';
import 'package:capstone_project_mobile/services/post_service.dart';
import 'package:flutter/material.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future handleCreatePost(String body) async {
      await createPost(
              CreatePost(body: body, patient: "63686861790123456789abcd"))
          .then((value) {})
          .catchError((err) {});
    }

    TextEditingController bodyController = TextEditingController();
    String imgPath = 'lib/assets/images/image 80.png';
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
      ),
      body: Container(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            // User Profile
            Row(
              children: [
                // Profile pic
                ProfilePictureCard(imgPath: imgPath),

                const SizedBox(
                  width: 12,
                ),

                // Username
                Text(
                  'Username',
                  style: textTheme.displayMedium,
                ),
              ],
            ),

            const SizedBox(
              width: 12,
            ),
            // Body field
            MyTextField(
                controller: bodyController,
                hintText: "Write what's on your mind"),

            // Image upload field
            const SizedBox(
              width: 12,
            ),
            // Post Button
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(colorScheme.primary),
              ),
              onPressed: () async {
                await handleCreatePost(bodyController.text);
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Center(
                  child: Text(
                    'Post',
                    style: textTheme.displayMedium!.copyWith(
                      color: colorScheme.inversePrimary,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
