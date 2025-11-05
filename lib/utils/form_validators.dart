class FormValidators {
  FormValidators._();

  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'メールアドレスを入力してください';
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(value)) {
      return '正しいメールアドレスを入力してください';
    }

    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'パスワードを入力してください';
    }

    if (value.length < 8) {
      return 'パスワードは8文字以上で入力してください';
    }

    if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)').hasMatch(value)) {
      return 'パスワードは英字と数字を含む必要があります';
    }

    return null;
  }

  static String? Function(String?) passwordConfirmationValidator(
    String originalPassword,
  ) {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return 'パスワード（確認）を入力してください';
      }

      if (value != originalPassword) {
        return 'パスワードが一致しません';
      }

      return null;
    };
  }

  static String? Function(String?) required(String fieldName) {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return '$fieldNameを入力してください';
      }
      return null;
    };
  }
  // static String? Function(String?) minLength(int min, {String? fieldName}) {
  //   return (String? value) {
  //     if (value == null || value.length < min) {
  //       return '${fieldName ?? 'この項目'}は$min文字以上で入力してください';
  //     }
  //     return null;
  //   };
  // }

  // static String? Function(String?) maxLength(int max, {String? fieldName}) {
  //   return (String? value) {
  //     if (value != null && value.length > max) {
  //       return '${fieldName ?? 'この項目'}は$max文字以内で入力してください';
  //     }
  //     return null;
  //   };
  // }

  // static String? numeric(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return '数値を入力してください';
  //   }

  //   if (!RegExp(r'^\d+$').hasMatch(value)) {
  //     return '数値のみ入力してください';
  //   }

  //   return null;
  // }

  // static String? phoneNumber(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return '電話番号を入力してください';
  //   }

  //   // ハイフンあり/なし両方対応
  //   final cleaned = value.replaceAll(RegExp(r'[-\s]'), '');

  //   if (!RegExp(r'^0\d{9,10}$').hasMatch(cleaned)) {
  //     return '正しい電話番号を入力してください';
  //   }

  //   return null;
  // }

  // static String? Function(String?) compose(
  //   List<String? Function(String?)> validators,
  // ) {
  //   return (String? value) {
  //     for (final validator in validators) {
  //       final error = validator(value);
  //       if (error != null) {
  //         return error;
  //       }
  //     }
  //     return null;
  //   };
  // }
}
