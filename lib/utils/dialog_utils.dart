import 'package:flutter/material.dart';

class DialogUtils {
  static void showSuccessDialog(
    BuildContext context,
    String title,
    String message,
  ) {
    _showDialog(
      context,
      title: title,
      message: message,
      icon: Icons.check_circle,
      iconColor: Colors.green,
    );
  }

  static void showFailureDialog(
    BuildContext context,
    String title,
    String message,
  ) {
    _showDialog(
      context,
      title: title,
      message: message,
      icon: Icons.error,
      iconColor: Colors.red,
    );
  }

  static void _showDialog(
    BuildContext context, {
    required String title,
    required String message,
    required IconData icon,
    required Color iconColor,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Row(
            children: [
              Icon(icon, color: iconColor),
              const SizedBox(width: 8),
              Flexible(
                child: Text(title, style: TextStyle(color: iconColor)),
              ),
            ],
          ),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).primaryColor,
              ),
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
