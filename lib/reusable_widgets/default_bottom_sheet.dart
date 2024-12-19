import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../core/constants.dart';
import '../core/styles/app_colors.dart';
import '../core/styles/text_styles.dart';

void showDefaultBottomSheet({
  required BuildContext context,
  double? radius,
  double? height = 320,
  required String text,
  bool? showButton,
  bool isScrollControlled = false,
  String? buttonText,
  void Function()? buttonOnTap,
  Widget? child,
  Widget? child2,
  Widget? child3,
}) {
  showModalBottomSheet(
    isScrollControlled: isScrollControlled,
    context: context,
    enableDrag: true,
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(radius ?? 45.0),
      ),
    ),
    builder: (context) => Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Container(
            height: height,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.backgroundColor,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(40),
                    //header widget
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            text,
                            style: MyTextStyles.textStyle18Bold.copyWith(
                              fontWeight: FontWeight.w600,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // scrollable child
                    if (child != null) ...[
                      child,
                      SizedBox(
                        height: 10,
                      ),
                    ],
                    if (child2 != null) ...[
                      child2,
                      SizedBox(
                        height: 10,
                      ),
                    ],
                    if (child3 != null) ...[
                      child3,
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 3,
                width: 90,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
