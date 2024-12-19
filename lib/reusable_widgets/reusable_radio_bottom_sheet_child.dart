import 'package:flutter/material.dart';
import 'package:koueidar_ui/core/styles/text_styles.dart';

import '../core/constants.dart';

class GenericRadioBottomSheet<T> extends StatefulWidget {
  const GenericRadioBottomSheet({
    super.key,
    required this.items,
    required this.onChanged,
    required this.itemTitleBuilder,
    required this.selectedItemController,
  });

  final String Function(T) itemTitleBuilder;
  final T? selectedItemController;
  final List<T> items;
  final void Function(T) onChanged;

  @override
  State<GenericRadioBottomSheet<T>> createState() =>
      _GenericRadioBottomSheetState<T>();
}

class _GenericRadioBottomSheetState<T>
    extends State<GenericRadioBottomSheet<T>> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.items
          .map(
            (item) => Column(
              children: [
                RadioListTile<T>(
                  title: Text(widget.itemTitleBuilder(item),
                      style: MyTextStyles.textStyle16Medium),
                  value: item,
                  groupValue: widget.selectedItemController,
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.trailing,
                  onChanged: (value) => widget.onChanged(value!),
                  activeColor: primaryColor,
                ),
                Divider(
                  color: Colors.grey.shade200,
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}
