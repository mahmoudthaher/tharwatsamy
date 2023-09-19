import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/nots_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotsCubit, NotsState>(
      builder: (context, state) {
        List<NoteModel> nots = BlocProvider.of<NotsCubit>(context).notes ?? [];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: nots.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: NoteItem(notes: nots[index]),
              );
            },
          ),
        );
      },
    );
  }
}
