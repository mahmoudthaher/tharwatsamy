import 'package:bookly/core/utils/functions/custom_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchCustomUrl(context, String? urL) async {
  if (urL != null) {
    Uri uri = Uri.parse(urL);
    try {
      !await launchUrl(uri);
    } catch (e) {
      customSnackBar(context, 'Cannot launch $urL');
    }
  }
}
