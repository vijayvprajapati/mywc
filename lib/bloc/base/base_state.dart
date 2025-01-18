//base state class which contain common state

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class BaseState extends Equatable {
  const BaseState();
}

class BaseInitial extends BaseState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends BaseState {
  const LoadingState({this.isLoading = true});

  final bool isLoading;

  @override
  List<Object?> get props => [isLoading];
}

class SuccessState extends BaseState {
  const SuccessState({this.data});

  final dynamic data;

  @override
  List<Object?> get props => [data];
}

class FailedState extends BaseState {
  const FailedState({this.errMsg});

  final String? errMsg;

  @override
  List<Object?> get props => [errMsg];
}
