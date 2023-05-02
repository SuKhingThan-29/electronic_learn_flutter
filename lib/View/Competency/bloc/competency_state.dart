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
