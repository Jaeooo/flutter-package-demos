import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class FlutterSlidableScreen extends StatelessWidget {
  FlutterSlidableScreen({super.key});

  int slidableKeyIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          slidableWidgetwithMotionType(
            motion: const ScrollMotion(),
          ),
          slidableWidgetwithMotionType(
            motion: const DrawerMotion(),
          ),
          slidableWidgetwithMotionType(
            motion: const BehindMotion(),
          ),
          slidableWidgetwithMotionType(
            motion: const StretchMotion(),
          ),
        ],
      ),
    );
  }

  slidableWidgetwithMotionType({required Widget motion}) {
    const validMotions = {
      ScrollMotion,
      DrawerMotion,
      BehindMotion,
      StretchMotion,
    };

    if (!validMotions.contains(motion.runtimeType)) {
      return const SizedBox.shrink();
    }

    return Slidable(
      key: ValueKey(slidableKeyIdx++),
      startActionPane: ActionPane(
        motion: motion,
        dismissible: DismissiblePane(onDismissed: () {}),
        children: [
          SlidableAction(
            onPressed: (ctx) {},
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
          SlidableAction(
            onPressed: (ctx) {},
            backgroundColor: const Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.share,
            label: 'Share',
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (ctx) {},
            backgroundColor: const Color(0xFF7BC043),
            foregroundColor: Colors.white,
            icon: Icons.archive,
            label: 'Archive',
          ),
          SlidableAction(
            onPressed: (ctx) {},
            backgroundColor: const Color(0xFF0392CF),
            foregroundColor: Colors.white,
            icon: Icons.save,
            label: 'Save',
          ),
        ],
      ),
      child: ListTile(
        title: Text('Slide me - ${motion.runtimeType}'),
      ),
    );
  }
}
