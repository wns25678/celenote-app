import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class BottomNavigation extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  const BottomNavigation({Key? key, required this.navigationShell})
      : super(key: key);

  @override
  State createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: widget.navigationShell,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFFFFFFF),
        selectedItemColor: const Color(0xFF1A1A1A),
        unselectedItemColor: const Color(0xFF1A1A1A),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: widget.navigationShell.currentIndex,
        onTap: (index) {
          widget.navigationShell.goBranch(
            index,
            initialLocation: index == widget.navigationShell.currentIndex,
          );
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/ic-home.svg',
              width: 32,
              height: 32,
              colorFilter: const ColorFilter.mode(
                Color(0xFF1A1A1A),
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/ic-home.svg',
              width: 32,
              height: 32,
              colorFilter: const ColorFilter.mode(
                Color(0xFF1A1A1A),
                BlendMode.srcIn,
              ),
            ),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/ic-my-record.svg',
              width: 32,
              height: 32,
              colorFilter: const ColorFilter.mode(
                Color(0xFF1A1A1A),
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/ic-my-record.svg',
              width: 32,
              height: 32,
              colorFilter: const ColorFilter.mode(
                Color(0xFF1A1A1A),
                BlendMode.srcIn,
              ),
            ),
            label: '내 기록',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/ic-ex.svg',
              width: 32,
              height: 32,
              colorFilter: const ColorFilter.mode(
                Color(0xFF1A1A1A),
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/ic-ex.svg',
              width: 32,
              height: 32,
              colorFilter: const ColorFilter.mode(
                Color(0xFF1A1A1A),
                BlendMode.srcIn,
              ),
            ),
            label: 'EX',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/ic-my.svg',
              width: 32,
              height: 32,
              colorFilter: const ColorFilter.mode(
                Color(0xFF1A1A1A),
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/ic-my.svg',
              width: 32,
              height: 32,
              colorFilter: const ColorFilter.mode(
                Color(0xFF1A1A1A),
                BlendMode.srcIn,
              ),
            ),
            label: 'MY',
          ),
        ],
      ),
    );
  }
}
