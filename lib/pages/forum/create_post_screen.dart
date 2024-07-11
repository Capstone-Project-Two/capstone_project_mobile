import 'dart:io';

import 'package:capstone_project_mobile/components/buttons/my_text_button.dart';
import 'package:capstone_project_mobile/components/cards/profile_picture_card.dart';
import 'package:capstone_project_mobile/components/dialogs/error_dialog.dart';
import 'package:capstone_project_mobile/components/inputs/my_text_field.dart';
import 'package:capstone_project_mobile/layouts/my_app_bar.dart';
import 'package:capstone_project_mobile/core/model/dto/create_post.dart';
import 'package:capstone_project_mobile/core/providers/post_provider.dart';
import 'package:capstone_project_mobile/core/services/post_service.dart';
import 'package:capstone_project_mobile/shared/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  bool loading = false;
  dynamic errors;
  TextEditingController bodyController = TextEditingController();
  List<XFile> postImages = [];
  final ImagePicker picker = ImagePicker();

  List<File> getAllPaths({List<XFile>? postImages}) {
    List<File> filePaths = [];
    for (int i = 0; i < postImages!.length; i++) {
      filePaths.add(File(postImages[i].path));
    }

    return filePaths;
  }

  Future handleCreatePost(String body) async {
    setState(() {
      loading = true;
    });

    // await Future.delayed(const Duration(seconds: 3));

    var res = await PostService.createPost(CreatePost(
      body: body,
      patient: "63686861790123456789abcd",
      postPhotos: getAllPaths(postImages: postImages),
    )).then(
      (value) {
        Provider.of<PostProvider>(context, listen: false).getAllPosts();
        // Navigator.pushReplacement(
        //   context,
        //   CupertinoPageRoute(
        //     builder: (context) => SuccessScreen(
        //       backBtn: () {
        //         Navigator.pushReplacement(
        //           context,
        //           CupertinoPageRoute(
        //             builder: (context) => const LayoutPage(
        //               selectedIndex: 0,
        //             ),
        //           ),
        //         );
        //       },
        //       nextBtn: () {
        //         Navigator.pushReplacement(
        //           context,
        //           CupertinoPageRoute(
        //             builder: (context) => const LayoutPage(
        //               selectedIndex: 1,
        //             ),
        //           ),
        //         );
        //       },
        //       successMsg: "Post Created Successfully",
        //       backBtnTitle: "Go to home page",
        //       nextBtnTitle: "View forum",
        //     ),
        //   ),
        // );

        Navigator.of(context).pop();
        return value;
      },
    ).catchError((err) {
      showDialog(
        context: context,
        builder: (context) => ErrorDialog(text: err.toString()),
      );
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

    if (loading) return const LoadingScreen();

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
              hintText: "Write what's on your mind",
            ),

            const SizedBox(
              height: 20,
            ),

            // Image upload field
            MyTextButton(
              padding: const EdgeInsets.all(8),
              text: "Upload Image",
              iconData: LucideIcons.upload,
              onTap: () async {
                List<XFile>? images = await picker.pickMultiImage();
                // if (images.isEmpty) return;
                setState(() {
                  postImages = images;
                });
              },
            ),

            if (postImages.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: postImages.length,
                  itemBuilder: (context, index) => Image.file(
                    File(postImages[index].path),
                    height: 200,
                    width: 200,
                  ),
                ),
              )
            else
              const Text(''),

            const SizedBox(
              height: 20,
            ),

            // Post Button
            PostButton(
              loading: loading,
              handleCreatePost: handleCreatePost,
              bodyController: bodyController,
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class PostButton extends StatelessWidget {
  final bool loading;
  final Function(String text) handleCreatePost;
  final TextEditingController bodyController;
  const PostButton({
    super.key,
    required this.loading,
    required this.handleCreatePost,
    required this.bodyController,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    return ElevatedButton(
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
          child: Text(
            'Post',
            style: textTheme.displayMedium!.copyWith(
              color: colorScheme.inversePrimary,
            ),
          ),
        ),
      ),
    );
  }
}
