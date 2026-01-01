import 'package:flutter/material.dart';
class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Center(
        child: Text(
          'Contact Section',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
