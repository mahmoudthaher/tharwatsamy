import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/blocs/add_notes_bloc/add_notes_bloc_bloc.dart';
import 'package:notes_app/blocs/notes_bloc/notes_bloc_bloc.dart';
import 'package:notes_app/widgets/add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNotesBlocBloc(),
      child: BlocConsumer<AddNotesBlocBloc, AddNotesBlocState>(
        listener: (context, state) {
          if (state is AddNotesBlocSuccess) {
            BlocProvider.of<NotesBlocBloc>(context).add(FetchAllNote());
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNotesBlocLoading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: const SingleChildScrollView(
                child: AddNoteForm(),
              ),
            ),
          );
        },
      ),
    );
  }
}
