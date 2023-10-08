part of 'localization_bloc.dart';

class UpdateLanguage {
  final Locale currentLanguage;

  const UpdateLanguage({
    this.currentLanguage = const Locale('en'),
  });

  UpdateLanguage copyWith({
    Locale? currentLanguage,
  }) {
    return UpdateLanguage(
        currentLanguage: currentLanguage ?? this.currentLanguage);
  }
}
