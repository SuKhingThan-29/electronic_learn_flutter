part of 'quiz_bloc.dart';

abstract class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object> get props => [];
}

class QuizInitial extends QuizState {}

class OnTapSuccess extends QuizState {
  final int? onTapIndex;
  const OnTapSuccess({required this.onTapIndex});

  @override
  List<Object> get props => [onTapIndex!];
}

class GetQuizTypeLoading extends QuizState {}

class GetQuizTypeSuccess extends QuizState {
  final List<QuizTypeModel> quizTypeList;
  const GetQuizTypeSuccess({required this.quizTypeList});

  @override
  List<Object> get props => [quizTypeList];
}

class GetQuizTypeFailed extends QuizState {
  final String? message;
  const GetQuizTypeFailed(this.message);

  @override
  List<Object> get props => [message!];
}

class GetQuizQuestionListLoading extends QuizState {}

class GetQuizQuestionListSuccess extends QuizState {
  final List<QuizQuestionModel> quizQuestionList;
  const GetQuizQuestionListSuccess({required this.quizQuestionList});

  @override
  List<Object> get props => [quizQuestionList];
}

class GetQuizQuestionListFailed extends QuizState {
  final String? message;
  const GetQuizQuestionListFailed(this.message);

  @override
  List<Object> get props => [message!];
}
