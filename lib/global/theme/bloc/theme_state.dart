part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  final List mProps;
  ThemeState([this.mProps = const []]);

  @override
  List<Object> get props => this.mProps;
}

class ThemeInitial extends ThemeState {
  final AppTheme theme;
  final bool isLight;

  ThemeInitial({
    this.theme = AppTheme.Dark,
    this.isLight = false,
  }) : super([theme, isLight]);
}
