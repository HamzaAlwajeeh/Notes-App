import 'package:flutter/material.dart';
import 'package:notes_app/generated/l10n.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(S.of(context).title, style: TextStyle(fontSize: 25)),
        const Spacer(),
        CustomSearchWidget(),
      ],
    );
  }
}

class CustomSearchWidget extends StatelessWidget {
  const CustomSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(child: Icon(Icons.search, size: 28)),
    );
  }
}
