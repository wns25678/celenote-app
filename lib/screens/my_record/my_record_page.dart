import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:celenote_app/extension/extensions.dart';

class MyRecordPage extends StatelessWidget {
  const MyRecordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        surfaceTintColor: const Color(0xFFFFFFFF),
        toolbarHeight: 76,
        title: const Text(
          '내 기록',
          style: TextStyle(
            color: Color(0xFF0F0F0F),
            fontSize: 26,
            fontWeight: FontWeight.w600,
            height: 1,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 54,
              height: 76,
              color: Colors.transparent,
              alignment: Alignment.center,
              child: SvgPicture.asset(
                'assets/icons/ic-settings.svg',
                width: 28,
                height: 28,
                colorFilter: const ColorFilter.mode(
                  Color(0xFF1A1A1A),
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: context.width(),
                color: const Color(0xFFFFFFFF),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 32,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: context.width(),
                      alignment: Alignment.center,
                      child: const Text(
                        '로그인이 필요합니다',
                        style: TextStyle(
                          color: Color(0xFF0F0F0F),
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          height: 1.4,
                        ),
                      ),
                    ),
                    Container(
                      width: context.width(),
                      margin: const EdgeInsets.only(top: 4),
                      alignment: Alignment.center,
                      child: const Text(
                        '로그인 후 축의금 내역을 기록하세요',
                        style: TextStyle(
                          color: Color(0xFF808080),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              menuTile(context, '친구찾기', () async {
                await context.pushNamed(
                  'find_friends',
                );
              }),
              menuTile(context, '보낸기록', () {
                //
              }),
              menuTile(context, '내 결혼식', () async {
                await context.pushNamed(
                  'record_my_wedding',
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget menuTile(BuildContext context, String label, Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: context.width(),
        height: 48,
        decoration: const BoxDecoration(
          color: Color(0xFFFFFFFF),
          border: Border(
            top: BorderSide(
              color: Color(0xFFF2F2F2),
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(
                right: 8,
              ),
              color: Colors.transparent,
              alignment: Alignment.centerLeft,
              child: Text(
                label,
                style: const TextStyle(
                  color: Color(0xFF0F0F0F),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  height: 1,
                ),
              ),
            ),
            Container(
              width: 24,
              height: 24,
              padding: const EdgeInsets.all(5),
              child: SvgPicture.asset(
                'assets/icons/ic-arrow.svg',
                fit: BoxFit.fitHeight,
                colorFilter: const ColorFilter.mode(
                  Color(0xFF1A1A1A),
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
