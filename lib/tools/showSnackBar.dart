import 'package:flutter/material.dart';

class snackBarMessage {
  //method about a SnackBar for success action
  SnackBar success(String message) {
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
          Expanded(child: Text(message))
        ],
      ),
    );
  }

  //method about a SnackBar for info action
  SnackBar info(String message) {
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
          Expanded(child: Text(message))
        ],
      ),
    );
  }
}
