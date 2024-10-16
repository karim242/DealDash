import 'package:dealdash/feature/notification/logic/notification_cubit.dart';
import 'package:dealdash/feature/notification/logic/notification_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/check_connect_internet/cubit/connect_internet_cubit.dart';
import '../../../../core/check_connect_internet/cubit/connect_internet_state.dart';
import '../../../../core/widget/ui_not_connectinternet_widget.dart';
import '../../data/model/notification_item_model.dart';
import '../widget/notification_card.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<NotificationCubit>().getAllNotifications();
    return BlocBuilder<ConnectInternetCubit, ConnectInternetState>(
      builder: (context, state) {
        if (state is NotConnectedState) {
          return const UINotConnectInterNetWidget();
        }
        return BlocBuilder<NotificationCubit, NotificationState>(
          builder: (context, state) {
            if (state is NotificationLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is NotificationSuccess) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Notification'),
                  centerTitle: true,
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.black,
                ),
                body: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.builder(
                    itemCount: state.response.data.length,
                    itemBuilder: (context, index) {
                      return NotificationCard(offerDetails: state.response.data[index].data);
                    },
                  ),
                ),
              );
            } else if (state is NotificationFailure) {
              return Center(
                  child: Text('No Notification yet: ${state.errorMessage}'));
            } else {
              return Container(); // الحالة الأولية
            }
          },
        );

      },
    );
  }
}
