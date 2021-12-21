import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/common/common.dart';
import 'package:football_app/core/core.dart';
import 'package:football_app/ui/ui.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabCubit, DetailTab>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Palette.white,
          extendBody: true,
          appBar: AppBar(
            backgroundColor: Palette.backgroundDark,
            title: const Text("Detail Competition"),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Palette.backgroundDark,
            selectedItemColor: Palette.primary,
            unselectedItemColor: Palette.grey,
            selectedLabelStyle: FontHelper.h9Regular(
              color: Palette.primary,
            ),
            unselectedLabelStyle: FontHelper.h9Regular(
              color: Palette.grey,
            ),
            showUnselectedLabels: true,
            onTap: (index) => context.read<TabCubit>().changeTab(
                  tab: DetailTab.values[index],
                ),
            currentIndex: DetailTab.values.indexOf(state),
            items: [
              BottomNavigationBarItem(
                icon: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: Opacity(
                    opacity: 0.5,
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 2.0),
                      child: const Icon(
                        Icons.timeline,
                        color: Palette.greyLighten1,
                      ),
                    ),
                  ),
                ),
                activeIcon: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 2.0),
                    child: const Icon(
                      Icons.timeline,
                      color: Palette.primary,
                    ),
                  ),
                ),
                label: 'Standings',
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: Opacity(
                    opacity: 0.5,
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 2.0),
                      child: const Icon(
                        Icons.watch_later_outlined,
                        color: Palette.greyLighten1,
                      ),
                    ),
                  ),
                ),
                activeIcon: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 2.0),
                    child: const Icon(
                      Icons.watch_later_rounded,
                      color: Palette.primary,
                    ),
                  ),
                ),
                label: 'Matches',
              ),
            ],
          ),
          body: _buildContent(state),
        );
      },
    );
  }

  Widget _buildContent(DetailTab state) {
    if (state == DetailTab.standing) {
      return const SafeArea(
        child: StandingScreen(),
      );
    }
    if (state == DetailTab.match) {
      return const SafeArea(
        child: MatchScreen(),
      );
    }

    return Container();
  }
}
