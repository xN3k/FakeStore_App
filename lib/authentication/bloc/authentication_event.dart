part of 'authentication_bloc.dart';

abstract class AuthenticationEvent {
  AuthenticationEvent();
}

class AuthenticationSubscriptionRequest extends AuthenticationEvent {}

class AuthenticationLogoutPressed extends AuthenticationEvent {}
