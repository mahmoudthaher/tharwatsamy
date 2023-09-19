import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/nots_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            CustomAppBar(
              title: 'Edit Notes',
              icon: Icons.check,
              onPressed: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.subTitle = content ?? widget.note.subTitle;
                widget.note.save();
                BlocProvider.of<NotesCubit>(context).fetchAllNote();
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 50),
            CustomTextField(
              hintText: widget.note.title,
              onChanged: (value) {
                title = value;
              },
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hintText: widget.note.subTitle,
              maxLines: 5,
              onChanged: (vlaue) {
                content = vlaue;
              },
            )
          ],
        ),
      ),
    );
  }
}
