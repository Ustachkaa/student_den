import 'package:flutter/material.dart';
import 'package:student_den/core/utils/navigator_service.dart';

class ProgressDialogUtils {
  ///common method for showing progress dialog
  static void showProgressDialog({
    required BuildContext context,
    bool isCancellable = false,
  }) async {
    showGeneralDialog(
      context: context,
      barrierDismissible: isCancellable,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return Center(
          child: CircularProgressIndicator.adaptive(
            strokeWidth: 4,
            valueColor: const AlwaysStoppedAnimation<Color>(
              Colors.white,
            ),
          ),
        );
      },
    );
  }

  ///common method for hiding progress dialog
  static void hideProgressDialog(BuildContext context) {
    Navigator.pop(context);
  }
}
