import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:new_project/chat_app/Constants.dart';
import 'package:new_project/chat_app/models/message_model.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  CollectionReference messages =
      FirebaseFirestore.instance.collection(KMessagesCollections);
  List<MessageModel> messagesList = [];

  void sendMessage({required String message, required String email}) {
    messages.add(
      {KMessage: message, KCreateAt: DateTime.now(), 'id': email},
    );
  }

  void getMessage() {
    messages.orderBy(KCreateAt, descending: true).snapshots().listen((event) {
      messagesList.clear();
      for (var doc in event.docs) {
        messagesList.add(MessageModel.fromJson(doc));
      }
      emit(ChatSuccess(messagesList: messagesList));
    });
  }

  @override
  void onChange(Change<ChatState> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }
}
