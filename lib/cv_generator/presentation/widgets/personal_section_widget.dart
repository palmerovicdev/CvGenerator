import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PersonalSectionFormWidget extends StatelessWidget {
  const PersonalSectionFormWidget({
    super.key,
    required this.sectionTitle,
    this.onEdit,
    required this.nameController,
    required this.lastNameController,
    required this.titleController,
    required this.contactFormWidgets,
    required this.size,
  });

  final String sectionTitle;
  final Size size;
  final void Function()? onEdit;
  final TextEditingController nameController;
  final TextEditingController lastNameController;
  final TextEditingController titleController;
  final List<PersonalSectionContactFormWidget> contactFormWidgets;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      child: Column(
        children: [
          const Gap(5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.025),
                child: SizedBox(
                  width: size.width * 0.45,
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      labelText: 'Name',
                    ),
                  ),
                ),
              ),
              const Gap(10),
              Padding(
                padding: EdgeInsets.only(right: size.width * 0.025),
                child: SizedBox(
                  width: size.width * 0.45,
                  child: TextFormField(
                    controller: lastNameController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      labelText: 'Last Name',
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Gap(10),
          SizedBox(
            width: size.width * 0.95,
            child: TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                labelText: 'Title',
              ),
            ),
          ),
          for (final contactFormWidget in contactFormWidgets)
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: SizedBox(
                width: size.width * 0.95,
                child: contactFormWidget,
              ),
            ),
        ],
      ),
    );
  }
}

class PersonalSectionContactFormWidget extends StatelessWidget {
  const PersonalSectionContactFormWidget({
    super.key,
    this.onEdit,
    required this.type,
    required this.valueController,
  });

  final void Function()? onEdit;
  final String type;
  final TextEditingController valueController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: valueController,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        labelText: type,
      ),
    );
  }
}