import 'package:flutter/material.dart';
import '../core/app_export.dart';
import 'base_button.dart';

/// A custom elevated button widget with customizable properties.
class CustomElevatedButton extends StatelessWidget {
  /// Creates a [CustomElevatedButton] widget.
  const CustomElevatedButton({
    Key? key,
    this.decoration,
    this.leftIcon,
    this.rightIcon,
    this.margin,
    this.onPressed,
    this.buttonStyle,
    this.alignment,
    this.buttonTextStyle,
    this.isDisabled,
    this.height,
    this.width,
    required this.text,
  }) : super(key: key);

  /// The decoration of the button.
  final BoxDecoration? decoration;

  /// The widget to display on the left side of the button.
  final Widget? leftIcon;

  /// The widget to display on the right side of the button.
  final Widget? rightIcon;

  /// The margin around the button.
  final EdgeInsets? margin;

  /// A callback function that is called when the button is pressed.
  final VoidCallback? onPressed;

  /// The style of the button.
  final ButtonStyle? buttonStyle;

  /// The alignment of the button within its parent.
  final Alignment? alignment;

  /// The style of the text on the button.
  final TextStyle? buttonTextStyle;

  /// Whether the button is disabled.
  final bool? isDisabled;

  /// The height of the button.
  final double? height;

  /// The width of the button.
  final double? width;

  /// The text to display on the button.
  final String text;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
      alignment: alignment ?? Alignment.center,
      child: buildElevatedButtonWidget,
    )
        : buildElevatedButtonWidget;
  }

  Widget get buildElevatedButtonWidget => Container(
    height: height ?? 62.h,
    width: width ?? double.maxFinite,
    margin: margin,
    decoration: decoration,
    child: ElevatedButton(
      style: buttonStyle,
      onPressed: isDisabled ?? false ? null : onPressed ?? () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          leftIcon ?? const SizedBox.shrink(),
          Text(
            text,
            style: buttonTextStyle ?? CustomTextStyles.titleMediumWhiteA700,
          ),
          rightIcon ?? const SizedBox.shrink(),
        ],
      ),
    ),
  );
}
