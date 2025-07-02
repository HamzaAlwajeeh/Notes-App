import 'package:flutter/material.dart';
import 'package:notes_app/Views/widgets/custom_widget.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, required this.icon});

  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: TextStyle(fontSize: 25)),
        const Spacer(),
        CustomWidget(icon: icon),
      ],
    );
  }
}
