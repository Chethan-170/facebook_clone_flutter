import 'package:flutter/material.dart';

class IconLabelButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color iconColor;
  final Function onPressed;

  const IconLabelButton({
    super.key,
    required this.icon,
    required this.label,
    required this.iconColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(),
      child: Row(
        children: [
          Icon(icon, color: iconColor),
          const SizedBox(
            width: 4.0,
          ),
          Text(label)
        ],
      ),
    );
  }
}
