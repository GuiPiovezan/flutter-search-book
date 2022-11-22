import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Icon? icon;
  final bool? isDrawer;
  final BuildContext context;

  const AppBarCustom({
    Key? key,
    this.title,
    this.icon,
    this.isDrawer = false,
    required this.context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(80),
      child: Container(
        decoration: const BoxDecoration(color: Color.fromARGB(255, 33, 150, 243)),
        child: AppBar(
          flexibleSpace: Center(
            child: Container(
              height: MediaQuery.of(context).size.height,
              margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: icon ?? Container(),
                  ),
                  Text(
                    title ?? "",
                    style: const TextStyle(
                      color: Color.fromARGB(255, 240, 240, 240),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.black,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
          ),
          backgroundColor: const Color.fromARGB(0, 255, 255, 255),
          leading: isDrawer!
              ? Builder(
                  builder: (BuildContext context) {
                    return Container(
                      // margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                      child: IconButton(
                        icon: const Icon(
                          Icons.menu,
                          color: Color.fromARGB(255, 240, 240, 240),
                        ),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        tooltip: MaterialLocalizations.of(context)
                            .openAppDrawerTooltip,
                      ),
                    );
                  },
                )
              : Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    );
                  },
                ),
          automaticallyImplyLeading: false,
          // centerTitle: true,
          shadowColor: const Color.fromARGB(0, 255, 255, 255),
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(MediaQuery.of(context).size.height / 16);
}
