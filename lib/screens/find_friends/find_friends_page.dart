import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:celenote_app/database/models/friend/friend_model.dart';
import 'package:celenote_app/extension/extensions.dart';
import 'package:celenote_app/screens/find_friends/bloc/friends_bloc.dart';

import '../../database/dummy.dart';

class FindFriendsPage extends StatelessWidget {
  const FindFriendsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FriendsBloc bloc = FriendsBloc();

    return BlocBuilder<FriendsBloc, FriendsState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is FriendsInitial) {
          bloc.add(FetchEvent());
        }
        if (state is FriendsLoaded) {
          return Scaffold(
            backgroundColor: const Color(0xFFFFFFFF),
            appBar: AppBar(
              backgroundColor: const Color(0xFFFFFFFF),
              surfaceTintColor: const Color(0xFFFFFFFF),
              toolbarHeight: 76,
              title: const Text(
                '친구찾기',
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
            body: SizedBox(
              width: context.width(),
              height: context.height(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: context.width(),
                    margin: const EdgeInsets.only(
                      left: 15,
                      right: 32,
                      top: 27,
                      bottom: 28,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF2F2F2),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                            right: 8,
                            top: 14,
                            bottom: 14,
                          ),
                          child: SvgPicture.asset(
                            'assets/icons/ic-search.svg',
                            colorFilter: const ColorFilter.mode(
                              Color(0xFF1A1A1A),
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            width: context.width(),
                            height: 48,
                            padding: const EdgeInsets.only(
                              right: 16,
                              top: 12,
                              bottom: 12,
                            ),
                            child: TextFormField(
                              style: const TextStyle(
                                color: Color(0xFF0F0F0F),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                height: 1,
                              ),
                              decoration: const InputDecoration(
                                hintText: 'Placeholder',
                                hintStyle: TextStyle(
                                  color: Color(0xFF0F0F0F),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  height: 1,
                                ),
                                contentPadding: EdgeInsets.zero,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.friends.length,
                      itemBuilder: (context, index) {
                        return friendTile(
                          context,
                          state.friends[index],
                          () async {
                            await context.pushNamed(
                              'record',
                              pathParameters: {
                                'recordid': '${state.friends[index].id}'
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget friendTile(
      BuildContext context, FriendModel friend, Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: context.width(),
        height: 80,
        color: Colors.transparent,
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 48,
              height: 48,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFF5EBF8),
                borderRadius: BorderRadius.circular(100),
              ),
              child: SvgPicture.asset(
                'assets/icons/profile.svg',
                colorFilter: const ColorFilter.mode(
                  Color(0xFF9B40BF),
                  BlendMode.srcIn,
                ),
              ),
            ),
            Flexible(
              child: Container(
                padding: const EdgeInsets.only(left: 12, right: 8),
                alignment: Alignment.centerLeft,
                child: Text(
                  friend.name,
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
