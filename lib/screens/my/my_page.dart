import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:celenote_app/extension/extensions.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        surfaceTintColor: const Color(0xFFFFFFFF),
        toolbarHeight: 76,
        title: const Text(
          'My 정보',
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
              Container(
                width: context.width(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 24,
                ),
                color: const Color(0xFFFFFFFF),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            child: Text(
                              '결혼식 참여',
                              style: TextStyle(
                                color: Color(0x66000000),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                height: 1.4,
                              ),
                            ),
                          ),
                          SizedBox(
                            child: Text(
                              '??회',
                              style: TextStyle(
                                color: Color(0xFF0F0F0F),
                                fontSize: 19,
                                fontWeight: FontWeight.w600,
                                height: 1.31,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            child: Text(
                              '페이 금액',
                              style: TextStyle(
                                color: Color(0x66000000),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                height: 1.4,
                              ),
                            ),
                          ),
                          SizedBox(
                            child: Text(
                              '??원',
                              style: TextStyle(
                                color: Color(0xFF0F0F0F),
                                fontSize: 19,
                                fontWeight: FontWeight.w600,
                                height: 1.31,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              menuTile(context, 'assets/icons/ic-mail.svg', '보낸 청첩장', () {
                //
              }),
              menuTile(context, 'assets/icons/ic-mail.svg', '받은 청첩장', () {
                //
              }),
              menuTile(context, 'assets/icons/ic-my-record.svg', '내 결혼식', () {
                context.pushNamed(
                  'my_wedding',
                );
              }),
              menuTile(
                  context, 'assets/icons/ic-more-horizontal.svg', '개인정보처리방침',
                  () {
                //
              }),
              menuTile(
                  context, 'assets/icons/ic-more-horizontal.svg', '서비스이용약관',
                  () {
                //
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget menuTile(
      BuildContext context, String svgpath, String label, Function()? onTap,
      [String? sublabel]) {
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 24,
              height: 24,
              margin: const EdgeInsets.only(right: 8),
              child: SvgPicture.asset(
                svgpath,
                fit: BoxFit.fitHeight,
                colorFilter: const ColorFilter.mode(
                  Color(0xFF1A1A1A),
                  BlendMode.srcIn,
                ),
              ),
            ),
            Flexible(
              child: Container(
                width: context.width(),
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
            ),
            sublabel != null
                ? Flexible(
                    child: Container(
                      margin: const EdgeInsets.only(
                        left: 12,
                      ),
                      color: Colors.transparent,
                      alignment: Alignment.centerRight,
                      child: Text(
                        sublabel,
                        style: const TextStyle(
                          color: Color(0xFF808080),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
