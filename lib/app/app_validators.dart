import '../localization/string_hardcoded.dart';
import 'package:form_field_validator/form_field_validator.dart';

abstract class AppValidators {
  static final RequiredValidator emptyFieldValidator =
      RequiredValidator(errorText: 'Empty field'.hardcoded);

  static final MultiValidator phoneValidator = MultiValidator([
    emptyFieldValidator,
    PatternValidator(r'^(8|\+[1-99])[\ ](\(\d{3}\))[\d\- ]{10}$',
        errorText: 'Phone is incorrect'.hardcoded)
  ]);

  static final EmailValidator emailValidator =
      EmailValidator(errorText: 'Email is incorrect'.hardcoded);
}
