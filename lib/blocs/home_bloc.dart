import 'package:rxdart/rxdart.dart';

class HomeBloc {
  final BehaviorSubject<String> _seachController = BehaviorSubject<String>();

  Stream<String> get outSeach => _seachController.stream; 

  void setSeach(String seach) {
    _seachController.add(seach);
  }

  void dispose() {
    _seachController.close();
  }
}
