import 'package:capstone_project_mobile/model/appointment.dart';
import 'package:flutter/material.dart';

class BookingCard extends StatelessWidget {
  final Appointment appointment;

  const BookingCard({
    super.key,
    required this.appointment,
  });

  @override
  Widget build(BuildContext context) {
    const TextStyle primaryTextStyle = TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    );

    const TextStyle secondaryTextStyle =
        TextStyle(color: Colors.black, fontSize: 16);
    return Container(
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
      child: (Row(
        children: [
          Image.asset(
            'lib/assets/images/Doctor_profile_icon.png',
            height: 100,
            width: 100,
          ),
          const SizedBox(width: 16),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dr. ${appointment.therapist.firstName} ${appointment.therapist.lastName}",
                  overflow: TextOverflow.visible,
                  style: primaryTextStyle,
                ),
                const SizedBox(height: 4),
                const Text(
                  'Therapist',
                  style: secondaryTextStyle,
                ),
                const SizedBox(height: 4),
                const Text(
                  'Specialized in ',
                  style: secondaryTextStyle,
                ),
                Wrap(
                    direction: Axis.horizontal,
                    children: List.generate(
                        appointment.therapist.specializations.length, (index) {
                      return Text(
                        index ==
                                appointment.therapist.specializations.length - 1
                            ? '${appointment.therapist.specializations[index]}'
                            : '${appointment.therapist.specializations[index]}, ',
                        overflow: TextOverflow.visible,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      );
                    })),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
