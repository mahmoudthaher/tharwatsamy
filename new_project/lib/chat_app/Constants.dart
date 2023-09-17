// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

const KPrimaryColor = Color(0xFF2B475E);
const KLogo = 'lib/chat_app/assets/images/scholar.png';
const KMessagesCollections = 'messages';
const KMessage = 'message';
const KCreateAt = 'CreatedAt';

void showEasyLoading() {
  EasyLoading.show(
    status: 'loading...',
    maskType: EasyLoadingMaskType.black,
  );
}

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}
