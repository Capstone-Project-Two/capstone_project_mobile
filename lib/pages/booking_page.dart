import 'package:capstone_project_mobile/components/cards/therapist_card.dart';
import 'package:capstone_project_mobile/components/dialogs/error_dialog.dart';
import 'package:capstone_project_mobile/layouts/my_app_bar.dart';
import 'package:capstone_project_mobile/model/dto/create_appointment.dart';
import 'package:capstone_project_mobile/model/therapist.dart';
import 'package:capstone_project_mobile/pages/layout_page.dart';
import 'package:capstone_project_mobile/services/post_service.dart';
import 'package:capstone_project_mobile/shared/success_screen.dart';
import 'package:flutter/material.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key, required this.therapist});
  final Therapist therapist;

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final bool isDisabled = false;

  final TextEditingController _notesController = TextEditingController();
  final TextEditingController _symtomsController = TextEditingController();

  final TextEditingController _dateController = TextEditingController();
  bool loading = false;

  Future handleBooking() async {
    setState(() {
      loading = true;
    });

    if (_notesController.text.isEmpty ||
        _symtomsController.text.isEmpty ||
        _dateController.text.isEmpty) {
      showDialog(
          context: context,
          builder: (context) =>
              const ErrorDialog(text: 'Please input the required fields.'));
    } else {
      var res = await createAppointment(CreateAppointment(
              note: _notesController.text,
              symptoms: _symtomsController.text,
              therapist: widget.therapist.id,
              patient: '63686861790123456789abcd',
              scheduleDate: _dateController.text))
          .then(
        (value) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SuccessScreen(
                successMsg: 'Booking Completed',
                backBtnTitle: 'Go to Therapist Page',
                nextBtnTitle: 'View Booking Details',
                backBtn: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LayoutPage(
                        selectedIndex: 2,
                      ),
                    ),
                  );
                },
                nextBtn: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LayoutPage(
                        selectedIndex: 2,
                      ),
                    ),
                  );
                },
              ),
            ),
          );
          _notesController.clear();
          _symtomsController.clear();
          _dateController.clear();
          return value;
        },
      ).catchError((err) {
        print(err);
        // showDialog(
        //   context: context,
        //   builder: (context) => ErrorDialog(text: err.toString()),
        // );
      }).whenComplete(
        () => setState(() {
          loading = false;
        }),
      );
      return res;
    }
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle secondaryTextStyle =
        TextStyle(color: Colors.black, fontSize: 16);

    const TextStyle primaryTextStyle = TextStyle(
        color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16);
    final ButtonStyle textButtonStyle = TextButton.styleFrom(
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 3,
      shadowColor: Colors.grey[500],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(128)),
      ),
    );
    return Scaffold(
      appBar: const MyAppBar(title: 'Book Appointment'),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Apppointment with',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            const SizedBox(height: 16),
            TherapistCard(therapist: widget.therapist),
            const SizedBox(height: 16),
            const Text(
              'Information',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            _textField(
                hintText:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                label: 'Notes',
                controller: _notesController),
            const SizedBox(height: 16),
            _textField(
                hintText: 'Insomnia, Stress, Tired...',
                label: 'Symptoms',
                controller: _symtomsController),
            const SizedBox(height: 16),
            const Text(
              'Schedule',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _dateController,
              readOnly: true,
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.calendar_month),
                label: RichText(
                  text: const TextSpan(
                      text: 'Schedule Date',
                      style: TextStyle(
                          color: Color.fromARGB(255, 70, 70, 70), fontSize: 18),
                      children: [
                        TextSpan(
                            text: ' *', style: TextStyle(color: Colors.red))
                      ]),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: 'YYYY/MM/DD',
                hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onTap: () {
                _selectDate();
              },
            ),
            const SizedBox(height: 24),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Session Price:', style: primaryTextStyle),
                Spacer(),
                Flexible(
                  child: Text(
                    '2 Coins/hrs',
                    textAlign: TextAlign.end,
                    overflow: TextOverflow.visible,
                    style: secondaryTextStyle,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Total:', style: primaryTextStyle),
                Spacer(),
                Flexible(
                  child: Text(
                    '4 Coins',
                    textAlign: TextAlign.end,
                    overflow: TextOverflow.visible,
                    style: secondaryTextStyle,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Booking Price:', style: primaryTextStyle),
                Spacer(),
                Flexible(
                  child: Text(
                    '2 Coins',
                    textAlign: TextAlign.end,
                    overflow: TextOverflow.visible,
                    style: secondaryTextStyle,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: handleBooking,
                    style: textButtonStyle,
                    child: const Text('Book Appointment',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 20)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _textField({required hintText, required label, required controller}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        label: RichText(
          text: TextSpan(
              text: label,
              style: const TextStyle(
                  color: Color.fromARGB(255, 70, 70, 70), fontSize: 18),
              children: const [
                TextSpan(text: ' *', style: TextStyle(color: Colors.red))
              ]),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100));
    if (picked != null) {
      setState(() {
        _dateController.text = picked.toString().split(" ")[0];
      });
    }
  }
}
