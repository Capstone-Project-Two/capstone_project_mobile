import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String number;
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;

  const AnswerButton({
    super.key,
    required this.number,
    required this.text,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(181, 213, 255, 0.93),
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            textStyle: const TextStyle(fontSize: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 10,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 20),
              Icon(
                isSelected ? Icons.circle : Icons.circle_outlined,
                color: isSelected ? colorScheme.primary : Colors.black,
                size: 24,
              ),
              const SizedBox(width: 20),
              Text(
                number,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(
                    overflow: TextOverflow.visible,
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnswerChoices extends StatefulWidget {
  const AnswerChoices({super.key});

  @override
  State<AnswerChoices> createState() => _AnswerChoicesState();
}

class _AnswerChoicesState extends State<AnswerChoices> {
  int _selectedIndex = -1;

  void _onButtonPressed(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnswerButton(
          number: '0.',
          text: 'Never',
          isSelected: _selectedIndex == 0,
          onPressed: () => _onButtonPressed(0),
        ),
        AnswerButton(
          number: '1.',
          text: 'Almost Never',
          isSelected: _selectedIndex == 1,
          onPressed: () => _onButtonPressed(1),
        ),
        AnswerButton(
          number: '2.',
          text: 'Sometimes',
          isSelected: _selectedIndex == 2,
          onPressed: () => _onButtonPressed(2),
        ),
        AnswerButton(
          number: '3.',
          text: 'Fairly Often',
          isSelected: _selectedIndex == 3,
          onPressed: () => _onButtonPressed(3),
        ),
        AnswerButton(
          number: '4.',
          text: 'Very Often',
          isSelected: _selectedIndex == 4,
          onPressed: () => _onButtonPressed(4),
        ),
      ],
    );
  }
}
