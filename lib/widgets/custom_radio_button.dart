import 'package:flutter/material.dart';
import '../core/app_export.dart';

class CustomRadioButton extends StatelessWidget {
  CustomRadioButton({
    Key? key,
    required this.onChange,
    this.decoration,
    this.alignment,
    this.isRightClick,
    this.iconSize,
    this.value,
    this.groupValue,
    this.text,
    this.width,
    this.padding,
    this.textStyle,
    this.overflow,
    this.textAlignment,
    this.gradient,
    this.backgroundColor,
    this.isExpandedText = false,
  }) : super(key: key);

  final BoxDecoration? decoration;
  final Alignment? alignment;
  final bool? isRightClick;
  final double? iconSize;
  String? value;
  final String? groupValue;
  final Function(String) onChange;
  final String? text;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final TextOverflow? overflow;
  final TextAlign? textAlignment;
  final Gradient? gradient;
  final Color? backgroundColor;
  final bool isExpandedText;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
      alignment: alignment ?? Alignment.center,
      child: buildRadioButtonWidget(context),
    )
        : buildRadioButtonWidget(context);
  }

  Widget buildRadioButtonWidget(BuildContext context) => GestureDetector(
    onTap: () {
      onChange(value!);
    },
    child: Container(
      decoration: decoration,
      width: width,
      padding: padding,
      child: (isRightClick ?? false)
          ? rightSideRadioButton(context)
          : leftSideRadioButton(context),
    ),
  );

  Widget leftSideRadioButton(BuildContext context) => Row(
    children: [
      radioButtonWidget(context),
      SizedBox(
        width: (text != null && text!.isNotEmpty) ? 8.0 : 0.0,
      ),
      isExpandedText ? Expanded(child: textWidget(context)) : textWidget(context),
    ],
  );

  Widget rightSideRadioButton(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      isExpandedText ? Expanded(child: textWidget(context)) : textWidget(context),
      SizedBox(
        width: (text != null && text!.isNotEmpty) ? 8.0 : 0.0,
      ),
      radioButtonWidget(context),
    ],
  );

  Widget textWidget(BuildContext context) => Text(
    text ?? "",
    textAlign: textAlignment ?? TextAlign.start,
    overflow: overflow,
    style: textStyle ?? Theme.of(context).textTheme.titleLarge,
  );

  Widget radioButtonWidget(BuildContext context) => SizedBox(
    height: iconSize,
    width: iconSize,
    child: Radio<String>(
      visualDensity: const VisualDensity(
        vertical: -4,
        horizontal: -4,
      ),
      value: value ?? "",
      groupValue: groupValue,
      onChanged: (value) {
        onChange(value!);
      },
    ),
  );
}