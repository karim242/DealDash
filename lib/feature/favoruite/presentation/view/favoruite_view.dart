import 'package:flutter/material.dart';

import '../../../home/presentation/data/data.dart';
import '../../../home/presentation/widget/sliver_grid_widget.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return favList.isEmpty
        ? const Center(child: Text("No Data"))
        : CustomScrollView(slivers: [
            SliverGridWidget(
              list: favList,
            ),
          ]);
  }
}
