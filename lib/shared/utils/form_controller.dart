import 'package:flutter/widgets.dart';

class FormController {
  var key = GlobalKey<FormState>();

  bool validate() {
    var form = key.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else
      return false;
  }
}
