import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/3%20project/cubit/basketball_satate.dart';

class BacektballCubit extends Cubit<BasktballState> {
  BacektballCubit() : super(TeamAIncrementPointerState());

  int numberCountTeamA = 0;
  int numberCountTeamB = 0;

  void teamIncrement({required String team, required int numberCount}) {
    if (team == 'A') {
      numberCountTeamA += numberCount;
      emit(TeamAIncrementPointerState());
    } else {
      numberCountTeamB += numberCount;
      emit(TeamBIncrementPointerState());
    }
  }

  void deleteNumbers() {
    numberCountTeamA = 0;
    numberCountTeamB = 0;
    emit(DeletePointerState());
  }
}
