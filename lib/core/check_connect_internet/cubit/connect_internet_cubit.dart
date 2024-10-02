
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'connect_internet_state.dart';

class ConnectInternetCubit extends Cubit<ConnectInternetState> {
  StreamSubscription? _subscription;
  ConnectInternetCubit() : super(InternetInitial());

  void connected() {
    emit(ConnectedState(message: "Connected"));
  }

  void notConnected() {
    emit(NotConnectedState(message: "Not Connected internet"));
  }

  void checkConnection() {
    _subscription = Connectivity()
        .onConnectivityChanged
        .listen(( result) {
      if (result.contains( ConnectivityResult.wifi) ||
          result .contains( ConnectivityResult.mobile)) {
        connected();
      } else {
        notConnected();
      }
    });
  }

  @override
  Future<void> close() {
    _subscription!.cancel();
    return super.close();
  }
}


