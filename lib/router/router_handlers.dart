import 'package:fluro/fluro.dart';
import 'package:landing_page/providers/page_provider.dart';
import 'package:landing_page/ui/pages/home_page.dart';
import 'package:provider/provider.dart';

final homeHandler = Handler(
  handlerFunc: (context, params) {
    final page = params['page']?.first;

    if (page != '/') {
      context?.read<PageProvider>().createScrollController(page!);
      return const HomePage();
    } else {
      return null;
    }
  },
);
