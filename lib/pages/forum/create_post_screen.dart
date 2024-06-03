import 'package:capstone_project_mobile/components/cards/profile_picture_card.dart';
import 'package:capstone_project_mobile/components/inputs/my_text_field.dart';
import 'package:capstone_project_mobile/layouts/my_app_bar.dart';
import 'package:capstone_project_mobile/model/dto/create_post.dart';
import 'package:capstone_project_mobile/model/error_response.dart';
import 'package:capstone_project_mobile/services/post_service.dart';
import 'package:flutter/material.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  bool loading = false;
  ErrorResponse? errors;
  TextEditingController bodyController = TextEditingController();

  Future handleCreatePost(String body) async {
    setState(() {
      loading = true;
    });
    var res = await createPost(
      CreatePost(body: body, patient: "63686861790123456789abcd"),
    ).then(
      (value) {
        Navigator.of(context).pop();
        return value;
      },
    ).catchError((err) {
      setState(() {
        errors = ErrorResponse.fromJson(err);
      });
    }).whenComplete(
      () => setState(() {
        loading = false;
      }),
    );

    return res;
  }

  @override
  Widget build(BuildContext context) {
    String imgPath = 'lib/assets/images/image 80.png';
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: const MyAppBar(
        title: 'Create Post',
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
              height: 20,
            ),
            // Body field
            MyTextField(
                controller: bodyController,
                hintText: "Write what's on your mind"),

            // Image upload field
            const SizedBox(
              height: 20,
            ),

            // Post Button
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(colorScheme.primary),
              ),
              onPressed: () async {
                loading ? null : await handleCreatePost(bodyController.text);
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Center(
                  child: loading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text(
                          'Post',
                          style: textTheme.displayMedium!.copyWith(
                            color: colorScheme.inversePrimary,
                          ),
                        ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Text(errors == null ? '' : errors!.statusCode.toString()),
                SizedBox(
                  width: 120,
                  child: Text(
                    errors == null ? '' : errors!.messages[0].toString(),
                    style: const TextStyle(
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount:
                    errors == null ? 0 : errors!.validationMessage.length,
                itemBuilder: (context, index) => Text(
                  errors == null
                      ? ''
                      : errors!.validationMessage[index].toString(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
