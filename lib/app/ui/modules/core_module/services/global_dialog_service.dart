import 'package:flutter/material.dart';



class GlobalDialogService extends DialogService {
  BuildContext? get _context => GlobalScaffoldProvider.scaffoldKey.currentContext;

  @override
  void alertSnackBar(TextBuilder builder) {
    if (_context != null) {
      ScaffoldMessenger.of(_context!).showSnackBar(
        SnackBar(
          content: Text(builder(_context!)),
        ),
      );
    }
  }

  @override
  Future<T?> showDialog<T>(WidgetBuilder builder) async {
    if (_context != null) {
      return await showDialog<T>(
        (context) => builder(context),
      );
    }

    return null;
  }
}
