import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:celenote_app/database/dummy.dart';
import 'package:celenote_app/extension/extensions.dart';
import 'package:celenote_app/screens/my_wedding/bloc/my_wedding_bloc.dart';

class MyWeddingPage extends StatelessWidget {
  const MyWeddingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyWeddingBloc bloc = MyWeddingBloc();

    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        surfaceTintColor: const Color(0xFFFFFFFF),
        toolbarHeight: 76,
        title: const Text(
          '내 결혼식',
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
      body: BlocBuilder<MyWeddingBloc, MyWeddingState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is MyWeddingInitial) {
            bloc.add(FetchEvent());
          }
          if (state is MyWeddingLoaded) {
            return SafeArea(
              child: Container(
                width: context.width(),
                height: context.height(),
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
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
                                    '하객 수',
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
                                    '1986',
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
                                    '금액',
                                    style: TextStyle(
                                      color: Color(0x66000000),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      height: 1.4,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        child: Text(
                                          '22728만원',
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
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  child: Text(
                                    '디지털 화환',
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
                                    '902',
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
                    Flexible(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.mywedding.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: context.width(),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            decoration: const BoxDecoration(
                              color: Color(0xFFFFFFFF),
                              border: Border(
                                top: BorderSide(
                                  color: Color(0xFFF2F2F2),
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 64,
                                  height: 64,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF808080),
                                    border: Border.all(
                                      width: 1,
                                      strokeAlign:
                                          BorderSide.strokeAlignOutside,
                                      color: const Color(0xFF808080),
                                    ),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.asset(
                                      'assets/images/profile.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Container(
                                    width: context.width(),
                                    margin: const EdgeInsets.only(
                                      left: 12,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                          width: context.width(),
                                          child: Text(
                                            Dummy
                                                .dummyFriends[state
                                                    .mywedding[index].senderid]
                                                .name,
                                            style: const TextStyle(
                                              color: Color(0xFF0F0F0F),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              height: 1.36,
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: SizedBox(
                                            width: context.width(),
                                            child: Text(
                                              '${NumberFormat('###,###,###,###').format(state.mywedding[index].amount).replaceAll(' ', '')}원',
                                              style: const TextStyle(
                                                color: Color(0xFF808080),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                height: 1.36,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: context.width(),
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            DateFormat('yyyy.MM.dd').format(
                                              state.mywedding[index].senderdate,
                                            ),
                                            style: const TextStyle(
                                              color: Color(0xFF808080),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              height: 1.36,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
