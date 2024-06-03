import 'package:capstone_project_mobile/pages/therapists/detail_therapist_page.dart';
import 'package:flutter/material.dart';

class TherapistCard extends StatelessWidget {
  const TherapistCard({
    super.key,
    this.firstName,
    this.lastName,
    this.specializations,
  });

  final String? firstName;
  final String? lastName;
  final List<dynamic>? specializations;

  @override
  Widget build(BuildContext context) {
    const TextStyle primaryTextStyle = TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    );

    const TextStyle secondaryTextStyle =
        TextStyle(color: Colors.black, fontSize: 16);
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailTherapistPage()));
      },
      child: Container(
        margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 5),
            )
          ],
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        child: Row(
          children: [
            Image.asset(
              'lib/assets/images/Doctor_profile_icon.png',
              height: 100,
              width: 100,
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dr. $firstName $lastName",
                  style: primaryTextStyle,
                ),
                const SizedBox(height: 4),
                const Text(
                  'Therapist',
                  style: secondaryTextStyle,
                ),
                const SizedBox(height: 4),
                const Text(
                  'Specializations: ',
                  style: secondaryTextStyle,
                ),
                for (var i = 0; i < specializations!.length; i++)
                  Text(
                    specializations![i],
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
