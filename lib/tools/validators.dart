import 'package:frontend_job_recruitment/tools/string_extension.dart';

String? Function(String?) validateInput(String fieldName, Map<String, dynamic> validators) {
  return (value) {
    if (validators.containsKey('required') && (value == null || value.isEmpty)) {
      return 'Please enter ${fieldName.withAorAn()}';
    }

    if ((validators.containsKey('min')) && (value != null && double.parse(value) < validators['min'])) {
      return 'Cannot be less than ${validators["min"]}';
    }

    if ((validators.containsKey('max')) && (value != null && double.parse(value) > validators['max'])) {
      return 'Cannot be more than ${validators["max"]}';
    }

    return null;
  };
}
