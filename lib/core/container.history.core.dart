import 'package:flutter/material.dart';
import 'package:flutter_search_book/components/history_list.component.dart';

class ContainerHistory extends StatefulWidget {
  const ContainerHistory({Key? key}) : super(key: key);

  @override
  State<ContainerHistory> createState() => _ContainerHistoryState();
}

class _ContainerHistoryState extends State<ContainerHistory> {
  @override
  Widget build(BuildContext context) {
    if (0 != 0){
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return HistoryList();
    }
  }
}
