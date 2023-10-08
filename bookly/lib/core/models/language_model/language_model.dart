class LanguageModel {
  final int id;
  final String name;
  final String flag;
  final String languageCode;

  LanguageModel(
    this.id,
    this.name,
    this.flag,
    this.languageCode,
  );

  static List<LanguageModel> languageList() {
    return [
      LanguageModel(1, '🇺🇸', 'English', 'en'),
      LanguageModel(2, '🇯🇴', 'العربية', 'ar'),
    ];
  }
}
