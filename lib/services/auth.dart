import 'package:event_ticket_checker/services/storage.dart';

class AuthService {
  final StorageService _storageService;

  AuthService({required StorageService storageService})
      : _storageService = storageService;

  login() {
    /////login logic
    _storageService.write('user', 'data');
  }

  logout() {
    //logout logic
    _storageService.deleteAll();
  }
}
