class NapalValidator {
  static String? requiredValidation(String? value, {String? message}) {
    if ((value != null && value.isEmpty)) {
      return message ?? "Ce Champs est obligatoire!";
    }
    return null;
  }

  static String? stringValidation(String? value, {String? message, String? validationMessage}) {
    if ((value == null || value.isEmpty)) {
      return message ?? "Ce Champs est obligatoire!";
    }

    if (!RegExp(r'^[A-Za-zÀ-ÖØ-öø-ÿ\s]{2,}$').hasMatch(value)) {
      return validationMessage ?? "Le formta n'est pas invalide!";
    }
    return null;
  }

  static String? emailValidation(String? value, {String? message, String? validationMessage}) {
    if ((value == null || value.isEmpty)) {
      return message ?? "Ce Champs est obligatoire!";
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return validationMessage ?? "Le formta n'est pas invalide!";
    }
    return null;
  }

  static String? senegalPhoneValidation(String? value, {String? message, String? validationMessage}) {
    if (value == null || value.isEmpty || value == "") {
      return message ?? "Ce Champs est obligatoire!";
    }
    else if (!RegExp(r'^(77|76|70|75|78)[0-9]{7}$').hasMatch(value)) {
      return validationMessage ??"Le formta du numéro de téléphone n'est pas invalide!";
    }
    return null;
  }

  static String? passwordValidation(String? value, {String? message, String? validationMessage}) {
    if (value == null || value.isEmpty) {
      return message ?? "Ce Champs est obligatoire!";
    }
    if (value.length < 6) {
      return validationMessage ??"Le formta du mot de passe n'est pas invalide!";
    }
    return null;
  }

  static String? requiredSelectValidation(AbstractSingleSelectModel? value, {String? message}) {
    if ((value == null || value.value == null)) {
      return message ?? "Ce Champs est obligatoire!";
    }
    return null;
  }
}

abstract class AbstractSingleSelectModel {
  String? value;
}
