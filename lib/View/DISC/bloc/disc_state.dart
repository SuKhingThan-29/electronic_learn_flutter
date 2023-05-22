// ignore_for_file: camel_case_types

part of 'disc_bloc.dart';

abstract class DISCState extends Equatable {
  const DISCState();

  @override
  List<Object> get props => [];
}

class DiscInitial extends DISCState {}

class OnTapSuccess extends DISCState {
  final int? onTapIndex;

  const OnTapSuccess({required this.onTapIndex});

  @override
  List<Object> get props => [onTapIndex!];
}

class GetDISCTypeLoading extends DISCState {}

class GetDISCTypeSuccess extends DISCState {
  final List<DISCTypeModel> discTypeList;
  const GetDISCTypeSuccess({required this.discTypeList});

  @override
  List<Object> get props => [discTypeList];
}

class GetDISCTypeFailed extends DISCState {
  final String? message;
  const GetDISCTypeFailed(this.message);

  @override
  List<Object> get props => [message!];
}

class GetDISCQuestionListLoading extends DISCState {}

class GetDISCQuestionListSuccess extends DISCState {
  final List<DISCQuestionModel> discQuestionList;
  const GetDISCQuestionListSuccess({required this.discQuestionList});

  @override
  List<Object> get props => [discQuestionList];
}

class GetDISCQuestionListFailed extends DISCState {
  final String? message;
  const GetDISCQuestionListFailed(this.message);

  @override
  List<Object> get props => [message!];
}
