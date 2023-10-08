part of 'localization_bloc.dart';

sealed class LocalizationEvent extends Equatable {
  const LocalizationEvent();

  @override
  List<Object> get props => [];
}

class ChangeLanguageEvent extends LocalizationEvent {
  final Locale newLanguage;

  const ChangeLanguageEvent(this.newLanguage);
}
