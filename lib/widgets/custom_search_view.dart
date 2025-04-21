import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A custom search view widget with customizable properties.
class CustomSearchView extends StatelessWidget {
  /// Creates a [CustomSearchView] widget.
  const CustomSearchView({
    Key? key,
    this.alignment,
    this.width,
    this.boxDecoration,
    this.controller,
    this.focusNode,
    this.autofocus = false,
    this.textStyle,
    this.textInputType = TextInputType.text,
    this.maxLines = 1,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = true,
    this.validator,
    this.onChanged,
    this.scrollPadding = EdgeInsets.zero, // Default value added
  }) : super(key: key);

  /// Alignment properties
  final Alignment? alignment;

  /// Set the width of the widget
  final double? width;

  /// Set decoration on style
  final BoxDecoration? boxDecoration;

  /// Scroll padding of the textfield
  final EdgeInsets scrollPadding;

  /// Controller of text form
  final TextEditingController? controller;

  /// Check the controller that used
  final FocusNode? focusNode;

  /// Want to focus this to true or not
  final bool autofocus;

  /// Set the textStyle for this widget
  final TextStyle? textStyle;

  /// Define the type of text input
  final TextInputType? textInputType;

  /// Max line on this field
  final int? maxLines;

  /// Hint what user can type
  final String? hintText;

  /// Set the style of hint
  final TextStyle? hintStyle;

  /// Adding prefix icon
  final Widget? prefix;

  /// Constraints of prefix
  final BoxConstraints? prefixConstraints;

  /// Adding suffix icon
  final Widget? suffix;

  /// Constraints of suffix
  final BoxConstraints? suffixConstraints;

  /// Set content padding
  final EdgeInsets? contentPadding;

  /// Set style on border decoration
  final InputBorder? borderDecoration;

  /// Set the filling color
  final Color? fillColor;

  /// Define want it to filling or not
  final bool filled;

  /// Validator of text
  final FormFieldValidator<String>? validator;

  /// Call when changed
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
      alignment: alignment ?? Alignment.center,
      child: searchViewWidget(context),
    )
        : searchViewWidget(context);
  }

  Widget searchViewWidget(BuildContext context) => Container(
    width: width ?? double.maxFinite,
    decoration: boxDecoration,
    child: TextFormField(
      scrollPadding: scrollPadding, // Use the initialized scrollPadding
      controller: controller,
      focusNode: focusNode,
      autofocus: autofocus,
      style: textStyle ?? CustomTextStyles.bodyMedium(context),
      keyboardType: textInputType,
      maxLines: maxLines,
      decoration: decoration(context),
      validator: validator,
      onChanged: (String value) {
        onChanged?.call(value);
      },
    ),
  );

  InputDecoration decoration(BuildContext context) => InputDecoration(
    hintText: hintText ?? "",
    hintStyle: hintStyle ?? CustomTextStyles.bodyMedium(context),
    prefixIcon: prefix,
    prefixIconConstraints: prefixConstraints,
    suffixIcon: suffix ??
        IconButton(
          onPressed: () => controller!.clear(),
          icon: Icon(Icons.clear, color: Colors.grey.shade600),
        ),
    suffixIconConstraints: suffixConstraints,
    isDense: true,
    contentPadding: contentPadding ?? EdgeInsets.all(6.h),
    fillColor: fillColor ?? appTheme.whiteA700,
    filled: filled,
    border: borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.h),
          borderSide: BorderSide(
            color: appTheme.orangeA200.withOpacity(0.19),
            width: 1,
          ),
        ),
    enabledBorder: borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.h),
          borderSide: BorderSide(
            color: appTheme.orangeA200.withOpacity(0.19),
            width: 1,
          ),
        ),
    focusedBorder: (borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.h),
        ))
        .copyWith(
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.primary,
        width: 1,
      ),
    ),
  );
}