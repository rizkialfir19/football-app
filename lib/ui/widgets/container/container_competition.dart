import 'package:flutter/material.dart';
import 'package:football_app/common/common.dart';
import 'package:football_app/ui/ui.dart';

class ContainerCompetition extends StatelessWidget {
  final Competition? data;
  final VoidCallback? action;

  const ContainerCompetition({
    Key? key,
    this.data,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => action != null ? action!.call() : null,
      child: Container(
        margin: const EdgeInsets.only(bottom: 45.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.0),
          border: Border.all(
            color: Palette.greyLighten1.withOpacity(0.4),
          ),
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Palette.greyLighten1.withOpacity(0.4),
                  ),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(18.0),
                  topRight: Radius.circular(18.0),
                ),
                // child: data?.area?.ensignUrl != null
                //     ? SvgPicture.network(
                //         data!.area!.ensignUrl!,
                //         fit: BoxFit.contain,
                //         placeholderBuilder: (BuildContext context) => Container(
                //           padding: const EdgeInsets.all(30.0),
                //           child: const CircularProgressIndicator(
                //             color: Palette.secondary,
                //           ),
                //         ),
                //       )
                //     : Image.asset(
                //         Images.iconFootball,
                //         fit: BoxFit.contain,
                //       ),
                child: Image.asset(
                  Images.iconFootball,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Column(
                children: [
                  Text(
                    data?.name ?? "-",
                    style: FontHelper.h6Bold(),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    data?.area?.name ?? "-",
                    style: FontHelper.h7Regular(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
