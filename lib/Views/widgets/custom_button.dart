import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/generated/l10n.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    bool isLoading = BlocProvider.of<AddNoteCubit>(context).isLoading;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        //Gitting The Width Of The Scren
        width: MediaQuery.of(context).size.width,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color(0xff4F378B),
        ),
        child: Center(
          child:
              isLoading
                  ? CircularProgressIndicator()
                  : Text(
                    S.of(context).saveButton,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
        ),
      ),
    );
  }
}
