part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  final List mProps;
  ThemeEvent([this.mProps = const []]);

  @override
  List<Object> get props => this.mProps;
}

class ChangeTheme extends ThemeEvent {
  final AppTheme theme;
  final bool isLight;

  ChangeTheme({
    this.theme,
    this.isLight,
  }) : super([
          theme,
          isLight,
        ]);
}
