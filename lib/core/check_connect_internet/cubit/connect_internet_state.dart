
abstract class ConnectInternetState {}

class InternetInitial extends ConnectInternetState {}

class ConnectedState extends ConnectInternetState {
  final String message;

  ConnectedState({required this.message});
}

class NotConnectedState extends ConnectInternetState {
  final String message;

  NotConnectedState({required this.message});
}