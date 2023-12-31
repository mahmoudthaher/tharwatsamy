import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/blocs/add_notes_bloc/add_notes_bloc.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/color_list_view.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> globalKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(height: 32),
          CustomTextField(
            hintText: 'Title',
            onSaved: (vlaue) {
              title = vlaue;
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            hintText: 'Content',
            maxLines: 5,
            onSaved: (vlaue) {
              subTitle = vlaue;
            },
          ),
          const SizedBox(height: 32),
          const ColorListView(),
          const SizedBox(height: 32),
          BlocBuilder<AddNotesBloc, AddNotesState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNotesBlocSuccess ? true : false,
                onTap: () {
                  addNote(context);
                },
              );
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  void addNote(BuildContext context) {
    if (globalKey.currentState!.validate()) {
      globalKey.currentState!.save();
      var cuttentDate = DateTime.now();
      var formattedCurrentDate = DateFormat('dd-MM-yyyy').format(cuttentDate);

      var noteModel = NoteModel(
          title: title!,
          subTitle: subTitle!,
          date: formattedCurrentDate,
          color: Colors.blue.value);
      BlocProvider.of<AddNotesBloc>(context).add(AddNote(note: noteModel));
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}
