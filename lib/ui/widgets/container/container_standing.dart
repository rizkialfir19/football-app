import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football_app/common/common.dart';
import 'package:football_app/ui/ui.dart';

class ContainerStanding extends StatelessWidget {
  final Standing? singleData;
  final int index;

  const ContainerStanding({
    Key? key,
    this.singleData,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: Row(
            children: [
              Text(
                "${index + 1}",
                style: FontHelper.h7Regular(),
              ),
              const SizedBox(
                width: 5.0,
              ),
              SvgPicture.network(
                singleData?.team?.crestUrl ?? Images.imageNetworkPlaceholder,
                fit: BoxFit.contain,
                height: 25.0,
                width: 25.0,
                placeholderBuilder: (BuildContext context) => Container(
                  height: 25.0,
                  width: 25.0,
                  padding: const EdgeInsets.all(5.0),
                  child: const CircularProgressIndicator(
                    color: Palette.secondary,
                  ),
                ),
              ),
              const SizedBox(
                width: 5.0,
              ),
              Expanded(
                child: Text(
                  singleData?.team?.name ?? "-",
                  style: FontHelper.h7Regular(),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  singleData?.points.toString() ?? "-",
                  style: FontHelper.h7Regular(),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  singleData?.playedGames.toString() ?? "-",
                  style: FontHelper.h7Regular(),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  singleData?.won.toString() ?? "-",
                  style: FontHelper.h7Regular(),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  singleData?.draw.toString() ?? "-",
                  style: FontHelper.h7Regular(),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  singleData?.lost.toString() ?? "-",
                  style: FontHelper.h7Regular(),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  singleData?.goalsFor.toString() ?? "-",
                  style: FontHelper.h7Regular(),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  singleData?.goalsAgainst.toString() ?? "-",
                  style: FontHelper.h7Regular(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
