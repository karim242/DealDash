import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/check_connect_internet/cubit/connect_internet_cubit.dart';
import '../../../../core/check_connect_internet/cubit/connect_internet_state.dart';
import '../../../../core/widget/ui_not_connectinternet_widget.dart';
import '../../../home/data/data.dart';
import '../../../home/presentation/widget/sliver_grid_widget.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectInternetCubit, ConnectInternetState>(
        builder: (context, state) {
      if (state is NotConnectedState) {
        return const UINotConnectInterNetWidget();
      }
      return favList.isEmpty
          ? const Center(child: Text("No Data"))
          : CustomScrollView(
              slivers: [
                SliverGridWidget(
                  list: favList,
                ),
              ],
            );
    });
  }
}
