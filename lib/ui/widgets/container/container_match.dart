import 'package:flutter/material.dart';
import 'package:football_app/common/common.dart';
import 'package:football_app/ui/ui.dart';

class ContainerMatch extends StatelessWidget {
  final Match? matchData;

  const ContainerMatch({
    Key? key,
    this.matchData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 45.0),
      padding: const EdgeInsets.symmetric(
        horizontal: 25.0,
        vertical: 20.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Palette.greyLighten1.withOpacity(0.4),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                matchData?.homeTeamName ?? "-",
                style: FontHelper.h7Bold(),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Text(
                matchData?.awayTeamName ?? "-",
                style: FontHelper.h7Bold(),
              ),
            ],
          ),
          Text(
            matchData?.status ?? "-",
            style: FontHelper.h7Regular(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (matchData?.score?.fullTimeHomeTeam != null) ...[
                Text(
                  matchData?.score?.fullTimeHomeTeam.toString() ?? "-",
                  style: FontHelper.h7Bold(),
                ),
              ] else ...[
                Text(
                  "0",
                  style: FontHelper.h7Bold(),
                ),
              ],
              const SizedBox(
                height: 15.0,
              ),
              if (matchData?.score?.fullTimeAwayTeam != null) ...[
                Text(
                  matchData?.score?.fullTimeAwayTeam.toString() ?? "-",
                  style: FontHelper.h7Bold(),
                ),
              ] else ...[
                Text(
                  "0",
                  style: FontHelper.h7Bold(),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
