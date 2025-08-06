import 'package:flutter/material.dart';
import 'package:notes_app/constants/constants.dart';

class ColorItemsListView extends StatefulWidget {
  const ColorItemsListView({super.key});

  @override
  State<ColorItemsListView> createState() => _ColorItemsListViewState();
}

class _ColorItemsListViewState extends State<ColorItemsListView> {
  int selectedColor = 0;
  List<Color> colorsList = const [
    Color(0xff006D77),
    Color(0xff83C5BE),
    Color(0xffedf6f9),
    Color(0xffFFDDD2),
    Color(0xffe29578),
    Color(0xffFDF0D5),
    Color(0xffc77dff),
    Color(0xffe0aaff),
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
