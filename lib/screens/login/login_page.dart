import 'package:celenote_app/extension/extensions.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(children: [
            Image.asset(
              'assets/images/splash.png',
              width: context.width(0.7),
            ),
            Padding(
              padding: EdgeInsets.only(left: context.width(0.05)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '결혼식을 더욱 특별하게!',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(155, 63, 191, 0.8),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                  Padding(
                    padding: EdgeInsets.only(right: context.width(0.05)),
                    child: const FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '결혼식 계획부터 축의금 관리까지 한 번에 관리하고',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(111, 111, 111, 1),
                            ),
                          ),
                          Text(
                            '더 많은 사랑과 기억을 만들어 보세요!',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(111, 111, 111, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Image.asset(
                              'assets/images/kiss.png',
                              height: 160,
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ]),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Wrap(
              runSpacing: 10,
              children: [
                GestureDetector(
                  onTap: () {
                    debugPrint('login_kakao');
                  },
                  child: Image.asset('assets/images/login_kakao.png'),
                ),
                GestureDetector(
                  onTap: () {
                    debugPrint('login_apple');
                  },
                  child: Image.asset('assets/images/login_apple.png'),
                ),
                const Center(
                  child: Text(
                    '- 또는 -',
                    style: TextStyle(color: Color(0xFF0F0F0F)),
                  ),
                ),
                Center(
                  child: Wrap(
                    spacing: 20,
                    children: [
                      GestureDetector(
                        onTap: () {
                          debugPrint('login_naver');
                        },
                        child: Image.asset(
                          'assets/images/login_naver.png',
                          width: 50,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          debugPrint('login_google');
                        },
                        child: Image.asset(
                          'assets/images/login_google.png',
                          width: 50,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          debugPrint('login_facebook');
                        },
                        child: Image.asset(
                          'assets/images/login_facebook.png',
                          width: 50,
                        ),
                      ),
                    ],
                  ),
                ),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Wrap(
                      spacing: 10,
                      children: [
                        Text('이메일로 회원가입'),
                        Text('|'),
                        Text('이메일로 로그인'),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
