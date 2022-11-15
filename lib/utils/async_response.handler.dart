import 'package:flutter/material.dart';
import '../widgets/success_snackbar.widget.dart';
import 'colors.dart';

void asyncResponseHandler<T>(BuildContext context, NavigatorState nav, ScaffoldMessengerState messenger, Future<T?> requester, Function resolver) async {
  showDialog(
    context: context,
    builder: (context) => Center(
      child: SizedBox(
        width: 50,
        height: 50,
        child: CircularProgressIndicator(
          backgroundColor: Colors.transparent,
          color: paletteMagenta,
          strokeWidth: 5,
        ),
      ),
    ),
  );
  var response = await requester;
  if (response != null) {
    nav.pop();
    resolver();
    messenger.showSnackBar(
        SuccessSnackBar(msg: 'Registered Successfully')
    );
  }
}