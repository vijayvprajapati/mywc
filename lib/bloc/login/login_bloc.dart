import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mywc/bloc/base/base_bloc.dart';
import 'package:mywc/bloc/base/base_state.dart';
import 'package:mywc/data/model/request/login/login_request.dart';

import '../../data/repository_impl/auth_repo.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends BaseBloc<LoginEvent, BaseState> {
  AuthRepoImpl? authRepoImpl;

  LoginBloc({this.authRepoImpl}) : super(BaseInitial()) {
    on<LoginInputEvent>((event, emit) async {
      emit(const LoadingState());
      try {
        final response = await authRepoImpl?.signIn(event.request);
        emit(const SuccessState(data: ''));
      } on DioException catch (e) {
        emit(FailedState(errMsg: e.message));
      } catch (e) {
        emit(FailedState(errMsg: e.toString()));
      }
    });
  }
}
