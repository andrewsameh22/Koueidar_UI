import 'package:flutter/material.dart';

import '../core/styles/app_colors.dart';
import '../core/styles/text_styles.dart';

AppBar defaultAppBar({
  required context,
  title,
  Color? color = Colors.black,
  List<Widget>? actions,
  bool? skipBackButton,
  bool? centerTitle = false,
  PreferredSizeWidget? bottom,
  double? elevation,
}) =>
    AppBar(
      backgroundColor: AppColors.backgroundColor,
      surfaceTintColor: AppColors.backgroundColor,
      elevation: 1,
      title: Text(
        title ?? '',
        style: MyTextStyles.textStyle18Bold.copyWith(
          color: Colors.black,
        ),
      ),
      centerTitle: centerTitle,
      bottom: bottom,
      leading: skipBackButton == true
          ? null
          : IconButton(
              icon: Icon(
                Icons.arrow_back_sharp,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
      actions: actions,
    );
