import 'package:flutter/material.dart';

Future showCustomDraggableBottomShhet(
    BuildContext context, Widget child, {bool isDismissible=true}) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.7,
        maxChildSize: .95,
        minChildSize: .7,
        
        builder: (context, scrollController) {
          return child;
        },
      );
    },
    isScrollControlled: true,
    enableDrag: true,
    isDismissible: isDismissible,
    clipBehavior: Clip.none,
  );
}

Future showCustomBottomShhet(
    BuildContext context, Widget child, {bool isDismissible=true, bool isScrollControlled = true}) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return child;
    },
    isScrollControlled: isScrollControlled,
    isDismissible: isDismissible,
    clipBehavior: Clip.none,
  );
}