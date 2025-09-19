import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  const NavBar({super.key, required this.currentIndex, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month),
          label: "Calendar",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.book), label: "Materials"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "My Profile"),
      ],
    );
  }
}
