import 'package:cv_generator/cv_generator/domain/enums/section_type.dart';
import 'package:flutter/material.dart';

class CustomSectionWidget extends StatelessWidget {
  const CustomSectionWidget({super.key, this.title, this.type, this.children});

  final String? title;
  final SectionType? type;
  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    debugPrint('${children!.length}');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min, // Set mainAxisSize to min
      children: [
        title != null
            ? Text(
                title ?? '',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              )
            : const SizedBox(),
        if (children != null && type == SectionType.list)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: children!,
            ),
          ),
        if (children != null && type == SectionType.text)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: children!,
            ),
          ),
        if (children != null && type == SectionType.wrap)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Wrap(
              children: [
                for (var child in children!)
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).colorScheme.onSurface,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: child,
                    ),
                  ),
              ],
            ),
          ),
      ],
    );
  }
}