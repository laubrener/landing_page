import 'package:flutter/material.dart';
import 'package:landing_page/providers/page_provider.dart';
import 'package:landing_page/ui/shared/custom_menu_item.dart';
import 'package:provider/provider.dart';

class CustomAppMenu extends StatefulWidget {
  const CustomAppMenu({super.key});

  @override
  State<CustomAppMenu> createState() => _CustomAppMenuState();
}

class _CustomAppMenuState extends State<CustomAppMenu>
    with SingleTickerProviderStateMixin {
  bool isOpen = false;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = context.read<PageProvider>();

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          isOpen ? controller.reverse() : controller.forward();
          setState(() {
            isOpen = !isOpen;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: 150,
          height: isOpen ? 308 : 50,
          color: Colors.black,
          child: Column(
            children: [
              _MenuTitle(isOpen: isOpen, controller: controller),
              if (isOpen) ...[
                CustomMenuItem(
                    text: 'Home',
                    onPressed: () {
                      pageProvider.goTo(0);
                      isOpen = false;
                      controller.reverse();
                      setState(() {});
                    },
                    delay: 50),
                CustomMenuItem(
                    text: 'About',
                    onPressed: () {
                      pageProvider.goTo(1);
                      isOpen = false;
                      controller.reverse();
                      setState(() {});
                    },
                    delay: 200),
                CustomMenuItem(
                    text: 'Contact',
                    onPressed: () {
                      pageProvider.goTo(2);
                      isOpen = false;
                      controller.reverse();
                      setState(() {});
                    },
                    delay: 350),
                CustomMenuItem(
                    text: 'Pricing',
                    onPressed: () {
                      pageProvider.goTo(3);
                      isOpen = false;
                      controller.reverse();
                      setState(() {});
                    },
                    delay: 500),
                CustomMenuItem(
                    text: 'Location',
                    onPressed: () {
                      pageProvider.goTo(4);
                      isOpen = false;
                      controller.reverse();
                      setState(() {});
                    },
                    delay: 650),
                const SizedBox(height: 8),
              ]
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuTitle extends StatelessWidget {
  const _MenuTitle({
    required this.isOpen,
    required this.controller,
  });

  final bool isOpen;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      child: Row(children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          width: isOpen ? 30 : 0,
        ),
        const Text('Menu', style: TextStyle(color: Colors.white, fontSize: 18)),
        const Spacer(),
        AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: controller,
          color: Colors.white,
        )
      ]),
    );
  }
}
