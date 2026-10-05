import 'package:flutter/material.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/widgets/app_svg_icon.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.black,
          hintText: "Search...",
          hintStyle: const TextStyle(color: Colors.white38),
          prefixIcon: AppSvgIcon(
            assetPath: AppIcons.search,
            size: 20,
            color: Colors.white,
            onTap: (){}
          ),
          suffixIcon: AppSvgIcon(
            assetPath: AppIcons.filter,
            size: 20,
            color: Colors.white,
            onTap: (){}
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 12,
          )
        ),
      ),
    );
  }
}