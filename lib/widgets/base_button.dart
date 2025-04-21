import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  BaseButton(
      {Key? key,
        required this.text,
        this.onPressed,
        this.buttonStyle,
        this.buttonTextStyle,
        this.isDisabled,
        this.height,
        this.width,
        this.margin,
        this.allignment})
      : super(key: key);

  /// The text to display on the button.
  final String text;

  /// A callback function that is called when the button is pressed.
  final VoidCallback? onPressed;

  /// The style of the button.
  final ButtonStyle? buttonStyle;

  /// The style of the text on the button.
  final TextStyle? buttonTextStyle;

  /// Whether the button is disabled.
  final bool? isDisabled;

  /// The height of the button.
  final double? height;

  /// The width of the button.
  final double? width;

  /// The margin around the button.
  final EdgeInsets? margin;

  /// The alignment of the button within its parent.
  final Alignment? allignment;

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
