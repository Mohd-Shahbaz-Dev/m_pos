import 'package:flutter/material.dart';

class MenuCategoryRow extends StatefulWidget {
  const MenuCategoryRow({super.key});

  @override
  State<MenuCategoryRow> createState() => _MenuCategoryRowState();
}

class _MenuCategoryRowState extends State<MenuCategoryRow> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> categories = [
    {
      'title': 'Ramen',
      'icon': Icons.restaurant,
    },
    {
      'title': 'Soup',
      'icon': Icons.ramen_dining,
    },
    {
      'title': 'Sushi',
      'icon': Icons.set_meal,
    },
    {
      'title': 'Beverages',
      'icon': Icons.local_drink,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(categories.length, (index) {
          final bool isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 18,
              ),
              decoration: BoxDecoration(
                color: isSelected ? Colors.deepOrange : Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(
                    categories[index]['icon'],
                    size: 20,
                    color: isSelected ? Colors.white : Colors.deepOrange,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    categories[index]['title'],
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: isSelected ? Colors.white : Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
