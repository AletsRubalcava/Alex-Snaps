import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavButton extends StatelessWidget {
  const BottomNavButton({
    required this.icon,
    required this.iconSize,
    required this.onNavigate,
    required this.pageIndex,
    super.key,
  });

  final String icon;
  final double iconSize;
  final Function(int) onNavigate;
  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onNavigate(pageIndex);
      },
      child: SvgPicture.asset(
        icon,
        width: iconSize,
        colorFilter: ColorFilter.mode(Color(0xFF316163), BlendMode.srcIn),
      ),
    );
  }
}
