import 'package:flutter/material.dart';

class SideBar extends StatefulWidget {
  final ValueChanged<int> onMenuSelected;

  const SideBar({super.key, required this.onMenuSelected});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(
                Icons.restaurant_menu, 
                color: Colors.deepOrange,
                size: 28,
              ),
              SizedBox(width: 8),
              Text(
                'Ultimate',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          _menuItem(0, Icons.dashboard, 'Dashboard'),
          _menuItem(1, Icons.event, 'Reservation'),
          _menuItem(2, Icons.people, 'Customers'),
          _menuItem(3, Icons.bar_chart, 'Report'),
          _menuItem(4, Icons.receipt, 'Transaction'),

          const Spacer(),

          _menuItem(5, Icons.settings, 'Settings'),
          _menuItem(6, Icons.info_outline, 'Info'),
        ],
      ),
    );
  }

  Widget _menuItem(int index, IconData icon, String title) {
    final bool isSelected = selectedIndex == index;

    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
        widget.onMenuSelected(index);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.deepOrange : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(icon, color: isSelected ? Colors.white : Colors.grey),
            const SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black87,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
