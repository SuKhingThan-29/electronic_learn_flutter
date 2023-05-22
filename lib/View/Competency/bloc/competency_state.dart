part of 'competency_bloc.dart';

abstract class CompetencyState extends Equatable {
  const CompetencyState();

  @override
  List<Object> get props => [];
}

class CompetencyInitial extends CompetencyState {}

class OnTapSuccess extends CompetencyState {
  final int? onTapIndex;
  const OnTapSuccess({required this.onTapIndex});

  @override
  List<Object> get props => [onTapIndex!];
}

class GetCompetencyTypeLoading extends CompetencyState {}

class GetCompetencyTypeSuccess extends CompetencyState {
  final List<CompetencyTypeModel> competencyTypeList;
  const GetCompetencyTypeSuccess({required this.competencyTypeList});

  @override
  List<Object> get props => [competencyTypeList];
}

class GetCompetencyTypeFailed extends CompetencyState {
  final String? message;
  const GetCompetencyTypeFailed(this.message);

  @override
  List<Object> get props => [message!];
}

class GetCompetencyQuestionListLoading extends CompetencyState {}

class GetCompetencyQuestionListSuccess extends CompetencyState {
  final List<CompetencyQuestionModel> competencyQuestionList;
  const GetCompetencyQuestionListSuccess(
      {required this.competencyQuestionList});

  @override
  List<Object> get props => [competencyQuestionList];
}

class GetCompetencyQuestionListFailed extends CompetencyState {
  final String? message;
  const GetCompetencyQuestionListFailed(this.message);

  @override
  List<Object> get props => [message!];
}
