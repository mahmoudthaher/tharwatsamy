import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/core/utils/functions/launch_url.dart';
import 'package:bookly/core/widget/custom_button.dart';
import 'package:bookly/main.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: isArabic() ? arabic(context) : anotherLanguage(context),
    );
  }

  Row anotherLanguage(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            backgroundColor: Colors.white,
            textColor: Colors.black,
            text: S.of(context).customButtonFree,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
          ),
        ),
        Expanded(
          child: CustomButton(
            onPressed: () async {
              launchCustomUrl(context, bookModel.volumeInfo.previewLink!);
            },
            backgroundColor: const Color(0xffEf8262),
            textColor: Colors.white,
            text: getText(bookModel, context),
            fontSize: 16,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
        ),
      ],
    );
  }

  Row arabic(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            backgroundColor: Colors.white,
            textColor: Colors.black,
            text: S.of(context).customButtonFree,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
        ),
        Expanded(
          child: CustomButton(
            onPressed: () async {
              launchCustomUrl(context, bookModel.volumeInfo.previewLink!);
            },
            backgroundColor: const Color(0xffEf8262),
            textColor: Colors.white,
            text: getText(bookModel, context),
            fontSize: 16,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
          ),
        ),
      ],
    );
  }

  String getText(BookModel bookModel, BuildContext context) {
    if (bookModel.volumeInfo.previewLink == null) {
      return S.of(context).customButtonNotAvailable;
    } else {
      return S.of(context).customButtonPreview;
    }
  }
}
