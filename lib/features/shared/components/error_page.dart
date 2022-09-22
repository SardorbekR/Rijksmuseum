import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final VoidCallback onTap;
  final String errorMessage;

  const ErrorPage({
    super.key,
    required this.onTap,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/error_img.jpg',
              ),
              Text(
                errorMessage,
              ),
              TextButton(
                onPressed: onTap,
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
