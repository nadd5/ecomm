import 'package:flutter/material.dart';

import 'appcolor.dart';

class DialogeUtils {
  static void showLoading(
      {required BuildContext context,
        required String loadingLabel,
        bool barrierDismissible = false}) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child:
                  CircularProgressIndicator(color: AppColors.primaryColor),
                ),
                Text(
                    loadingLabel,
                    style:  Theme.of(context).textTheme.
                        bodyMedium!.copyWith(
                      color: AppColors.primaryColor,
                    ))
              ],
            ),
          );
        });
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage(
      {required BuildContext context,
        required String content,
        String title = "",
        String? posActionName,
        Function? posAction,
        String? negActionName,
        Function? negAction}) {
    List<Widget> actions = [];

    if (posActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            posAction?.call();
          },
          child: Text(posActionName,
              style:  Theme.of(context).textTheme
                  .bodyMedium
                  ?.copyWith(color: AppColors.primaryColor))));
    }

    if (negActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            negAction?.call();
          },
          child: Text(negActionName,
              style: Theme.of(context).textTheme
                  .bodyMedium
                  ?.copyWith(color: AppColors.primaryColor))));
    }
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(content,
                style: Theme.of(context).textTheme
                    .bodyMedium!
                    .copyWith(color: AppColors.primaryColor)),
            title: Text(title,
                style:  Theme.of(context).textTheme
                    .bodyMedium!
                    .copyWith(color: AppColors.primaryColor)),
            actions: actions,
          );
        });
  }
}
