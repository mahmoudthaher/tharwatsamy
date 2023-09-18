import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
          color: const Color(0xFF3b3b3b),
          borderRadius: BorderRadius.circular(16)),
      child: Icon(
        Icons.search,
        size: 30,
      ),
    );
  }
}
