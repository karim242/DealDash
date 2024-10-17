//state for forget password

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();

  @override
  List<Object> get props => [];
}

class ForgotPasswordInitial extends ForgotPasswordState {}

class ForgotPasswordLoading extends ForgotPasswordState {}
class ForgotPasswordLoaded extends ForgotPasswordState {
  final String message;

  const ForgotPasswordLoaded({required this.message});

  @override
  List<Object> get props => [message];
}
class ForgotPasswordError extends ForgotPasswordState {
  final String message;

  const ForgotPasswordError({required this.message});

  @override
  List<Object> get props => [message];
}