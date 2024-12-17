import 'package:flutter/material.dart';

class DialogUtils {
  static void ShowLoadingDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (buildContext) {
        return AlertDialog(
          content: Row(
            children: [
              const CircularProgressIndicator(),
              SizedBox(
                width: 10,
              ),
              Text(message),
            ],
          ),
        );
      },
      barrierDismissible: false,
    );
  }

  static void hideDialog(BuildContext context) {
    Navigator.pop(context);
  }

  static void ShowMessage(
    BuildContext context,
    String message, {
    String? postActionName,
    VoidCallback? postAction,
    String? nagActionName,
    VoidCallback? nagAction,
  }) {
    List<Widget> actions = [];
    if (postActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            postAction?.call();
          },
          child: Text(postActionName)));
    }
    if (nagActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            nagAction?.call();
          },
          child: Text(nagActionName)));
    }
    showDialog(
      context: context,
      builder: (buildContext) {
        return AlertDialog(
          content: Text(message),
          actions: actions,
        );
      },
    );
  }
}
