import 'package:flutter/material.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/widgets/app_svg_icon.dart';

class HomeHeader extends StatelessWidget implements PreferredSizeWidget {
  const HomeHeader({super.key});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final insets = MediaQuery.of(context).padding;
  
    return Container(
      padding: EdgeInsets.only(top: insets.top, left: 16, bottom: insets.bottom, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: Row(
              children: [
                Image.asset(
                  AppImages.hero,
                  width: 40,
                  height: 40
                ),
                const SizedBox(width: 16),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Welcome back", style: TextStyle(fontSize: 16, color: Colors.white70, height: 1.0,)),
                    const Text("Aymen Missaoui", style: TextStyle(fontSize: 16, color: Colors.white, height: 1.0,)),
                  ]
                )
              ],
            ),
          ),
          AppSvgIcon(
            assetPath: AppIcons.menu,
            size: 24,
            color: Colors.white,
            onTap: (){}
          )
        ]
      )
    );
  }

}