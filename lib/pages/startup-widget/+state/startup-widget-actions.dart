import 'package:tcc_app/models/user.dart';

class InitializeHive { }

class VerifyPreferences { }

class DeletePreferences { }

class UpdateUserPreferences {
  final User user;
  UpdateUserPreferences(this.user);
}

class SavePreferences {
  final User user;
  SavePreferences(this.user);
}