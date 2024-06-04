import 'package:capstone_project_mobile/pages/become_therapist_page/become_therapist_page3.dart';
import 'package:capstone_project_mobile/pages/layout_page.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class BecomeTherapistPage2 extends StatefulWidget {
  const BecomeTherapistPage2({super.key});

  @override
  State<BecomeTherapistPage2>  createState() => _BecomeTherapistPage2State();
}

class _BecomeTherapistPage2State extends State<BecomeTherapistPage2> {
  final img1 =
      "https://i.pinimg.com/736x/d2/28/6e/d2286eb8935144d6cbfa0b40744aa41e.jpg";
  final img2 =
      "https://w0.peakpx.com/wallpaper/681/788/HD-wallpaper-hualian-hua-cheng-mxtx-tgcf-tian-guan-ci-fu-xie-lian-thumbnail.jpg";

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  // BecomeTherapistPage2({super.key});

  String? _filePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: _buildPreferredSize(context),
      body: _buildBody(context),
      bottomNavigationBar: _buildBottomAppBar(context),
    );
  }

  PreferredSize _buildPreferredSize(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return PreferredSize(
      preferredSize:
          const Size.fromHeight(65.0), // Set the height of the AppBar
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(20.0), // Adjust the radius as needed
        ),
        child: AppBar(
          backgroundColor: colorScheme.primary,
          title: Text(
            "Therapist Sign Up",
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 22,
              fontFamily: 'Kantumruy Pro', // Specify your font family
              fontWeight: FontWeight.w500, // Use FontWeight.w700 for bold
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  colorScheme.primary,
                  colorScheme.secondary,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomAppBar(BuildContext context) {
    return SizedBox(
      height: 50, // Set the desired height for the BottomAppBar
      child: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.white,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Already have an account?",
                style: TextStyle(
                  color: Colors.black, // Change the text color if needed
                  fontSize: 16, // Adjust the font size if needed
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const LayoutPage(selectedIndex: 4)));
                },
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.blue, // Change the text color if needed
                    fontSize: 16, // Adjust the font size if needed
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align children to the start
          children: [
            const Text(
              "Input National ID",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            _buildFileUploadButton(context),
            if (_filePath != null) ...[
              const SizedBox(height: 10),
              Text('Selected file: $_filePath')
            ],
            const SizedBox(height: 20),
            _buildStack(),
            const SizedBox(height: 20),
            _buildTakePhoto(),
            const SizedBox(height: 20),
            _buildNextButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildFileUploadButton(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: ElevatedButton(
        onPressed: () async {
          FilePickerResult? result = await FilePicker.platform.pickFiles();

          if (result != null) {
            setState(() {
              _filePath = result.files.single.path;
            });
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.onPrimary,
          foregroundColor: colorScheme.onPrimary,
          textStyle: const TextStyle(fontSize: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 10,
          ),
          side: const BorderSide(
            color: Colors.grey,
            width: 2.0,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.image_outlined),
              color: Colors.grey,
            ),
            const Text(
              'Upload File',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNextButton(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // context.router.push(const BecomeTherapistPage3());
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const BecomeTherapistPage3()),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          textStyle: const TextStyle(fontSize: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 10,
          ),
        ),
        child: const Text('Next'),
      ),
    );
  }

  Widget _buildStack() {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Container with optional adjustments
        Container(
          width: double.infinity,
          height: 20.0,
        ),
        const Positioned(
          left: 0.0, // Position at left edge
          right: 0.0, // Position at right edge
          top: 15.0, // Adjust vertical position within the container
          child: Divider(
            height: 2.0, // Adjust line thickness
            color: Colors.grey, // Adjust line color
          ),
        ),
        // Centered Text (optional)
        const Positioned(
          child: Text(
            "\u00A0\u00A0\u00A0\u00A0 or \u00A0\u00A0\u00A0\u00A0",
            style: TextStyle(
              fontSize: 20.0, // Adjust font size as needed
              color: Colors.black, // Adjust text color
              backgroundColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTakePhoto() {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // context.router.push(BecomeTherapistPage2());
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          textStyle: const TextStyle(fontSize: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 10,
          ),
        ),
        child: const Text('Take a Photo'),
      ),
    );
  }
}
