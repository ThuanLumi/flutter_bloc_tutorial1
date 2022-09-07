part of 'mybloc_bloc.dart';

abstract class MyblocState extends Equatable {
  const MyblocState();

  @override
  List<Object> get props => [];
}

class MyblocInitial extends MyblocState {}

class FormLoading extends MyblocState {}

class FormLoaded extends MyblocState {}
