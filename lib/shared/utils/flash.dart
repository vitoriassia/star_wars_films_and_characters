import 'package:flutter/material.dart';
import 'package:flash/flash.dart';

void _showTopFlash(
    {required BuildContext context,
    required Color color,
    required String title,
    required String text}) {
  showFlash(
    context: context,
    duration: const Duration(seconds: 5),
    persistent: true,
    builder: (_, controller) {
      return Flash(
        controller: controller,
        backgroundColor: color,
        brightness: Brightness.light,
        style: FlashStyle.grounded,
        position: FlashPosition.top,
        child: FlashBar(
          title: Text(title,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          message: Text(text, style: TextStyle(color: Colors.white)),
          primaryAction: TextButton(
            onPressed: () => controller.dismiss(),
            child: Text('OK', style: TextStyle(color: Colors.white)),
          ),
        ),
      );
    },
  );
}

void showSuccess({required BuildContext context, required String text}) {
  _showTopFlash(
      context: context,
      color: Colors.green[900]!,
      title: 'Sucesso',
      text: text);
}

void showError({required BuildContext context, required String text}) {
  _showTopFlash(
      context: context, color: Colors.red[900]!, title: 'Erro', text: text);
}

void showWarning({required BuildContext context, required String text}) {
  _showTopFlash(
      context: context, color: Colors.blue, title: 'Alerta', text: text);
}

void showInfo({required BuildContext context, required String text}) {
  _showTopFlash(
      context: context, color: Colors.grey, title: 'Informação', text: text);
}
