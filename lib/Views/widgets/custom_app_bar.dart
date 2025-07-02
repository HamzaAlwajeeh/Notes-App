import 'package:flutter/material.dart';
import 'package:notes_app/Views/widgets/custom_search_widget.dart';
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
