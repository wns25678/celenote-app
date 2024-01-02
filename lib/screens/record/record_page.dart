import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:celenote_app/database/dummy.dart';
import 'package:celenote_app/extension/extensions.dart';
import 'package:celenote_app/screens/record/bloc/record_bloc.dart';

class RecordPage extends StatelessWidget {
  final String recordid;
  const RecordPage({Key? key, required this.recordid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RecordBloc bloc = RecordBloc();

    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        surfaceTintColor: const Color(0xFFFFFFFF),
        toolbarHeight: 76,
        title: Text(
          '${Dummy.dummyFriends[int.parse(recordid)].name}과의 기록',
          style: const TextStyle(
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
      body: BlocBuilder<RecordBloc, RecordState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is RecordInitial) {
            bloc.add(FetchEvent());
          }
          if (state is RecordLoaded) {
            return SafeArea(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                ),
                itemCount: state.messages.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: context.width(),
                    alignment:
                        state.messages[index].senderid == int.parse(recordid)
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                    margin: const EdgeInsets.symmetric(
                      vertical: 9,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      constraints: BoxConstraints(
                        maxWidth: context.width(0.738),
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          state.messages[index].imagepath != null
                              ? Flexible(
                                  child: SizedBox(
                                    width: context.width(),
                                    height: 197,
                                    child: Image.asset(
                                      state.messages[index].imagepath!,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                )
                              : Container(),
                          Flexible(
                            child: Container(
                              width: context.width(),
                              margin: const EdgeInsets.symmetric(
                                vertical: 8,
                              ),
                              child: Text(
                                state.messages[index].message,
                                style: const TextStyle(
                                  color: Color(0xFF0F0F0F),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  height: 1,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: context.width(),
                            alignment: Alignment.centerRight,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 4,
                                horizontal: 8,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xCC333333),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                DateFormat('yyyy MM dd')
                                    .format(state.messages[index].senderDate),
                                style: const TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  height: 1.4,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
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
