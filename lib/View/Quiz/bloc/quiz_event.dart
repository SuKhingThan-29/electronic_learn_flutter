part of 'quiz_bloc.dart';

abstract class QuizEvent extends Equatable {
  const QuizEvent();

  @override
  List<Object> get props => [];
}

class OnTapEvent extends QuizEvent {
  final int? onTapIndex;
  const OnTapEvent({required this.onTapIndex});
}
