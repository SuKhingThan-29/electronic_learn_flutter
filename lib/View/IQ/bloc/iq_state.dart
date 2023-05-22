part of 'iq_bloc.dart';

abstract class IQState extends Equatable {
  const IQState();

  @override
  List<Object> get props => [];
}

class IqInitial extends IQState {}

class OnTapSuccess extends IQState {
  final int? onTapIndex;
  const OnTapSuccess({required this.onTapIndex});

  @override
  List<Object> get props => [onTapIndex!];
}

class GetIQTypeLoading extends IQState {}

class GetIQTypeSuccess extends IQState {
  final List<IQTypeModel> iqTypeList;
  const GetIQTypeSuccess({required this.iqTypeList});

  @override
  List<Object> get props => [iqTypeList];
}

class GetIQTypeFailed extends IQState {
  final String? message;
  const GetIQTypeFailed(this.message);

  @override
  List<Object> get props => [message!];
}

class GetIQQuestionListLoading extends IQState {}

class GetIQQuestionListSuccess extends IQState {
  final List<IQQuestionModel> iqQuestionList;
  const GetIQQuestionListSuccess({required this.iqQuestionList});

  @override
  List<Object> get props => [iqQuestionList];
}

class GetIQQuestionListFailed extends IQState {
  final String? message;
  const GetIQQuestionListFailed(this.message);

  @override
  List<Object> get props => [message!];
}
