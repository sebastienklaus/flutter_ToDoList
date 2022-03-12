import 'package:flutter/material.dart';

class snackBarMessage {
  SnackBar success(String text) {
    return SnackBar(
      backgroundColor: Colors.green,
      duration: const Duration(seconds: 2),
      content: Row(
        children: [
          const Icon(
            Icons.check_circle_outlined,
            color: Colors.white,
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(child: Text(text))
        ],
      ),
    );
  }

  SnackBar info(String text) {
    return SnackBar(
      backgroundColor: const Color(0xff3399ff),
      duration: const Duration(seconds: 2),
      content: Row(
        children: [
          const Icon(
            Icons.info_outlined,
            color: Colors.white,
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(child: Text(text))
        ],
      ),
    );
  }
}
