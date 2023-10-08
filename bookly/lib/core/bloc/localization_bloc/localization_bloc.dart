import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'localization_event.dart';
part 'localization_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, UpdateLanguage> {
  LocalizationBloc() : super(const UpdateLanguage()) {
    on<LocalizationEvent>(
      (event, emit) {
        if (event is ChangeLanguageEvent) {
          emit(state.copyWith(currentLanguage: event.newLanguage));
        }
      },
    );
  }
}
