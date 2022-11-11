extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String withAorAn() {
    return "${startsWith(RegExp(r'[a|e|i|o|u]', caseSensitive: false)) ? 'an' : 'a'} ${this}";
  }
}
