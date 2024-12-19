import 'package:flutter/material.dart';
import 'package:koueidar_ui/core/styles/text_styles.dart';

import '../core/constants.dart';

class CustomChipWidget extends StatelessWidget {
  const CustomChipWidget({
    super.key,
    required this.text,
    required this.isSelected,
  });

  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    // return ChoiceChip(
    //
    //   color: Color(0xffD4DCF1),
    //
    //     label: Text(
    //       text,
    //       style: MyTextStyles.textStyle16Medium,
    //     ),
    //     selected: isSelected);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(30),
            border: isSelected
                ? Border.all(
                    color: primaryColor,
                  )
                : null),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6),
          child: Text(
            text,
            style: MyTextStyles.textStyle14Medium.copyWith(
              color: isSelected ? primaryColor : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
