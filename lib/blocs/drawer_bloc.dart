import 'package:rxdart/rxdart.dart';

class DrawerBloc {
  final BehaviorSubject<int> _pageController = BehaviorSubject<int>.seeded(0);

  int _page = 0;
  Stream<int> get outPage => _pageController.stream;

  void setPage(int page) {
    if (_page == page) {
      return;
    }
    _page = page;
    _pageController.add(page);
  }

  void dispose() {
    _pageController.close();
  }
}
