import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../data/models/selectionPopupModel/selection_popup_model.dart';

/// A custom dropdown widget that can be used to create dropdown menus.
class CustomDropDown extends StatefulWidget {
  /// Creates a [CustomDropDown] widget.
  CustomDropDown({
    Key? key,
    this.alignment,
    this.width,
    this.boxDecoration,
    this.focusNode,
    this.icon,
    this.iconSize,
    this.autoFocus = false,
    this.textStyle,
    this.hintText,
    this.hintStyle,
    required this.items,
    this.prefix,
    this.prefixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = false,
    this.validator,
    required this.onChanged,
  }) : super(key: key);

  /// The alignment of the dropdown widget.
  final Alignment? alignment;

  /// The width of the dropdown widget.
  final double? width;

  /// The decoration of the dropdown widget.
  final BoxDecoration? boxDecoration;

  /// The focus node of the dropdown widget.
  final FocusNode? focusNode;

  /// The icon of the dropdown widget.
  final Widget? icon;

  /// The size of the icon.
  final double? iconSize;

  /// Whether the dropdown widget is auto-focused.
  final bool autoFocus;

  /// The text style of the dropdown widget.
  final TextStyle? textStyle;

  /// The hint text of the dropdown widget.
  final String? hintText;

  /// The hint style of the dropdown widget.
  final TextStyle? hintStyle;

  /// The items of the dropdown widget.
  final List<SelectionPopupModel> items;

  /// The prefix of the dropdown widget.
  final Widget? prefix;

  /// The prefix constraints of the dropdown widget.
  final BoxConstraints? prefixConstraints;

  /// The content padding of the dropdown widget.
  final EdgeInsets? contentPadding;

  /// The border decoration of the dropdown widget.
  final InputBorder? borderDecoration;

  /// The fill color of the dropdown widget.
  final Color? fillColor;

  /// Whether the dropdown widget is filled.
  final bool filled;

  /// The validator of the dropdown widget.
  final FormFieldValidator<SelectionPopupModel>? validator;

  /// A callback function that is called when the selected item changes.
  final Function(SelectionPopupModel) onChanged;

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return widget.alignment != null
        ? Align(
      alignment: widget.alignment ?? Alignment.center,
      child: dropDownWidget,
    )
        : dropDownWidget;
  }

  Widget get dropDownWidget => Container(
    width: widget.width ?? double.maxFinite,
    decoration: widget.boxDecoration,
    child: DropdownButtonFormField<SelectionPopupModel>(
      focusNode: widget.focusNode,
      icon: widget.icon,
      iconSize: widget.iconSize ?? 24,
      autofocus: widget.autoFocus,
      isExpanded: true,
      style: widget.textStyle,
      hint: Text(
        widget.hintText ?? "",
        style: widget.hintStyle,
        overflow: TextOverflow.ellipsis,
      ),
      items: widget.items.map((SelectionPopupModel item) {
        return DropdownMenuItem<SelectionPopupModel>(
          value: item,
          child: Text(
            item.title,
            overflow: TextOverflow.ellipsis,
            style: widget.hintStyle,
          ),
        );
      }).toList(),
      decoration: decoration,
      validator: widget.validator,
      onChanged: (value) {
        widget.onChanged(value!);
      },
    ),
  );

  InputDecoration get decoration => InputDecoration(
    prefixIcon: widget.prefix,
    prefixIconConstraints: widget.prefixConstraints,
    isDense: true,
    contentPadding:
    widget.contentPadding ?? EdgeInsets.fromLTRB(4.h, 4.h, 2.h, 4.h),
    fillColor: widget.fillColor,
    filled: widget.filled,
    border: widget.borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.h),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onSecondaryContainer,
            width: 1,
          ),
        ),
    enabledBorder: widget.borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.h),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onSecondaryContainer,
            width: 1,
          ),
        ),
    focusedBorder: widget.borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.h),
        ).copyWith(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 1,
          ),
        ),
  );
}
