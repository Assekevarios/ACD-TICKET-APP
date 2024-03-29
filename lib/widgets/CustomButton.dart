import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final void Function()? onPressed;
  final String title;
  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
      ),
      onPressed: widget.onPressed,
      child: Text(widget.title),
    );
  }
}
