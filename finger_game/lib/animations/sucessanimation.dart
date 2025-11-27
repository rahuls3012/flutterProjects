import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
void showSuccessAnimation(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => Center(
      child: Stack(
        children: [
          Lottie.asset(
            'assets/lottie/Success.json',
            width: 250,
            height: 250,
            repeat: false,
            onLoaded: (composition) {
              // Close animation after it finishes
              Future.delayed(composition.duration, () {
                Navigator.of(context).pop(); // close dialog
                Navigator.of(context).popUntil((route) => route.isFirst); // go to first page
              });
            },
          ),
          // Positioned(
          //   top: 200,
          //   child: Text(
          //     'Order Successful!',
          //     style: TextStyle(
          //       fontSize: 24,
          //       fontWeight: FontWeight.bold,
          //       color: const Color.fromARGB(255, 77, 70, 213),
          //     ),
          //     textAlign: TextAlign.center,
          //   ),
          // ),
        ],
      ),
    ),
  );
}
