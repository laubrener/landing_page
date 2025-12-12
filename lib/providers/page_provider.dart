import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class PageProvider extends ChangeNotifier {
  PageController scrollController = PageController();

  final List<String> _pages = [
    'home',
    'about',
    'contact',
    'pricing',
    'location'
  ];
  int _currentIndex = 0;

  createScrollController(String routerName) {
    scrollController = PageController(initialPage: getPageIndex(routerName));

    html.document.title = _pages[getPageIndex(routerName)];

    scrollController.addListener(() {
      final index = scrollController.page ?? 0;

      if (index != _currentIndex) {
        html.window.history
            .replaceState(null, '', '#/${_pages[index.round()]}');
        _currentIndex = index.round();
        html.document.title = _pages[_currentIndex];
      }
    });
  }

  int getPageIndex(String routerName) {
    return _pages.contains(routerName) ? _pages.indexOf(routerName) : 0;
  }

  goTo(int page) {
    scrollController.animateToPage(
      page,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
