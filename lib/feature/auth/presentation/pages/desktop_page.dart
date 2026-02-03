import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_pos/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:m_pos/feature/auth/presentation/bloc/auth_state.dart';
import 'package:m_pos/feature/auth/presentation/widgets/menu_category_btn.dart';
import 'package:m_pos/feature/auth/presentation/widgets/product_grid.dart';
import 'package:m_pos/feature/auth/presentation/widgets/search_bar.dart';
import 'package:m_pos/feature/auth/presentation/widgets/sidebar_menu.dart';

class MyDesktop extends StatelessWidget {
  const MyDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
  backgroundColor: const Color(0xFFF6F6F6),
  body: Row(
    children: [
       SideBar(onMenuSelected: (int value) {},),
       Expanded(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchBarWidget(),
              const SizedBox(height: 16),
              const MenuCategoryRow(),
              const SizedBox(height: 16),
             Expanded(child: ProductGrid()),
            ],
          ),
        ),
      ),
    ],
  ),
);

  }
}