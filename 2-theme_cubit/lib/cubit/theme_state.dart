part of 'theme_cubit.dart';

enum AppTheme {
  dark,
  light,
}

class ThemeState extends Equatable {
  final AppTheme appTheme;
  const ThemeState({this.appTheme = AppTheme.light});

  @override
  List<Object> get props => [appTheme];

  factory ThemeState.initial() {
    return const ThemeState();
  }

  @override
  String toString() => 'ThemeState(randInt: $appTheme)';

  ThemeState copyWith({
    AppTheme? appTheme,
  }) {
    return ThemeState(
      appTheme: appTheme ?? this.appTheme,
    );
  }
}
