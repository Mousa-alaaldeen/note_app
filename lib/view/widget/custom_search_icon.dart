import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({super.key, required this.icon, this.onTap});
  final IconData icon;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: 46,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: IconButton(onPressed: onTap, icon: Icon(icon)),
      ),
    );
  }
}
