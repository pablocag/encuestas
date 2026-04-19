import 'package:flutter/widgets.dart';

class FFIcons {
  FFIcons._();

  static const String _smilesFamily = 'Smiles';

  // Smiles
  static const IconData kemoHappy = IconData(0xe800, fontFamily: _smilesFamily);
  static const IconData kemoUnhappy =
      IconData(0xe802, fontFamily: _smilesFamily);
  static const IconData kemoSleep = IconData(0xe803, fontFamily: _smilesFamily);
  static const IconData kemoDispleased =
      IconData(0xe80a, fontFamily: _smilesFamily);
  static const IconData kemoAngry = IconData(0xe80d, fontFamily: _smilesFamily);
}
