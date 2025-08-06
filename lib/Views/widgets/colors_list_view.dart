import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';

class ColorItemsListView extends StatefulWidget {
  const ColorItemsListView({super.key});

  @override
  State<ColorItemsListView> createState() => _ColorItemsListViewState();
}

class _ColorItemsListViewState extends State<ColorItemsListView> {
  int selectedColor = 0;
  List<Color> colorsList = const [
    Color(0xff0E1F2F),
    Color(0xff262628),
    Color(0xff21242A),
    Color(0xff111923),
    Color(0xff0d1b2a),
    Color(0xff001233),
    Color(0xff50514f),
    Color(0xff563C5C),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colorsList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
              onTap: () {
                selectedColor = index;
                setState(() {});
                BlocProvider.of<AddNoteCubit>(context).selectedColor =
                    colorsList[index];
              },
              child: ColorItem(
                isActive: selectedColor == index,
                color: colorsList[index],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});
  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 36,
      backgroundColor: kPrimaryColor,
      child: CircleAvatar(radius: isActive ? 32 : 36, backgroundColor: color),
    );
    // : CircleAvatar(radius: 36, backgroundColor: Colors.amber);
  }
}
