import 'package:crypto/details/widgets/chart_button.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChartListViewButtons extends ConsumerStatefulWidget {
  const ChartListViewButtons({super.key});

  @override
  ConsumerState<ChartListViewButtons> createState() =>
      _ChartListViewButtonsState();
}

class _ChartListViewButtonsState extends ConsumerState<ChartListViewButtons> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      // decoration: BoxDecoration(border: Border(bottom: )),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ChartButton(
            dayTitle: '5D',
            titleIndex: 0,
          ),
          ChartButton(
            dayTitle: '15D',
            titleIndex: 1,
          ),
          ChartButton(
            dayTitle: '30D',
            titleIndex: 2,
          ),
          ChartButton(
            dayTitle: '45D',
            titleIndex: 3,
          ),
          ChartButton(
            dayTitle: '90D',
            titleIndex: 4,
          ),
        ],
      ),
    );
  }
}
