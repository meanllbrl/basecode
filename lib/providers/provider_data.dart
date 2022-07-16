import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderData with ChangeNotifier, DiagnosticableTreeMixin {
  static Widget provide({required Function(ProviderData data) state}) =>
      Consumer<ProviderData>(
        builder: (BuildContext context, data, Widget? child) {
          return state(data);
        },
      );
}
