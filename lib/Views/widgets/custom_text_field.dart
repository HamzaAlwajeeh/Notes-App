import 'package:flutter/material.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/generated/l10n.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.maxLines = 1,
    required this.hint,
    this.onSaved,
    this.initialValue,
    this.onChanged,
    this.suffixIcon,
    this.onSuffixIconPressed,
  });
  final int maxLines;
  final String hint;
  final String? initialValue;
  final IconData? suffixIcon;

  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final void Function()? onSuffixIconPressed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onSaved: onSaved,
      onChanged: onChanged,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          //Error Message
          return S.of(context).inputError + hint;
        }
        return null;
      },
      maxLines: maxLines,
      cursorColor: Colors.white.withOpacity(0.7),
      decoration: InputDecoration(
        filled: true,
        fillColor: kPrimaryColor.withOpacity(0.1),
        suffixIcon: IconButton(
          icon: Icon(suffixIcon),
          onPressed: onSuffixIconPressed,
        ),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
        contentPadding: EdgeInsets.all(15),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.transparent),
    );
  }
}
