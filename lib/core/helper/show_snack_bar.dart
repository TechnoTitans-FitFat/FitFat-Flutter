import 'package:flutter/material.dart';

enum SnackBarType { success, error, warning }

SnackBar customSnackBar(
  BuildContext context,
  String title,
  String subtitle,
  SnackBarType type,
) {
  IconData icon;
  Color snackBarBackgroundColor;

  switch (type) {
    case SnackBarType.success:
      icon = Icons.check_circle;
      snackBarBackgroundColor = const Color.fromARGB(255, 201, 253, 216);
      break;
    case SnackBarType.error:
      icon = Icons.error;
      snackBarBackgroundColor = const Color.fromARGB(255, 255, 195, 195);
      break;
    case SnackBarType.warning:
      icon = Icons.warning;
      snackBarBackgroundColor = const Color.fromARGB(255, 253, 239, 199);
      break;
  }

  return SnackBar(
    elevation: 1,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
    content: Row(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(
            icon,
            color: type == SnackBarType.success
                ? const Color.fromARGB(255, 141, 221, 145)
                : type == SnackBarType.error
                    ? const Color.fromARGB(255, 241, 165, 165)
                    : const Color.fromARGB(255, 243, 188, 139),
            size: 20,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.black87,
                        ) ??
                    const TextStyle(color: Colors.black87, fontSize: 16),
              ),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.black54,
                        ) ??
                    const TextStyle(color: Colors.black54, fontSize: 13),
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.close, size: 20),
          color: Colors.black54,
          onPressed: () {},
        ),
      ],
    ),
    backgroundColor: snackBarBackgroundColor,
    duration: const Duration(seconds: 4),
  );
}
