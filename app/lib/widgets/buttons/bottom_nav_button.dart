import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavButton extends StatelessWidget {
  const BottomNavButton({
    required this.icon,
    required this.iconSize,
    required this.newPage,
    super.key,
  });

  final String icon;
  final double iconSize;
  final Widget newPage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (_, _, _) => newPage,
            transitionDuration: Duration(milliseconds: 0),
            reverseTransitionDuration: Duration(milliseconds: 0),
          ),
        );
      },
      child: SvgPicture.asset(
        icon,
        width: iconSize,
        colorFilter: ColorFilter.mode(Color(0xFF316163), BlendMode.srcIn),
      ),
    );
  }
}
