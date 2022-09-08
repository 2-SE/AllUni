import 'package:AllUni/Calendars/Editing/CustomTagFieldPopUp.dart';
import 'package:AllUni/Providers/PlanningTagsProvider.dart';
import 'package:AllUni/Utils/HeroDialogRequired.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TagsChoicePlanningWidget extends StatefulWidget {
  late String? myCustomTagName;
  TagsChoicePlanningWidget({
    Key? key,
    this.myCustomTagName,
  }) : super(key: key);

  @override
  State<TagsChoicePlanningWidget> createState() =>
      _TagsChoicePlanningWidgetState();
}

class _TagsChoicePlanningWidgetState extends State<TagsChoicePlanningWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Wrap(
            alignment: WrapAlignment.start,
            spacing: 8,
            runSpacing: -4,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(
                    Icons.library_add_rounded,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Tags :",
                    style: TextStyle(
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
              ...context
                  .watch<PlanningTagsProvider>()
                  .tags
                  .map((tagItem) => InputChip(
                      avatar: tagItem.showedIcon,
                      label: Text(
                        tagItem.label,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: tagItem.value ? Colors.white : Colors.black,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      visualDensity: const VisualDensity(vertical: -2),
                      showCheckmark: false,
                      selectedColor: tagItem.selectedColor,
                      selected: tagItem.value,
                      onPressed: () {
                        Provider.of<PlanningTagsProvider>(context,
                                listen: false)
                            .changeTagValue(tagItem);
                      }))
                  .toList(),
              InputChip(
                avatar: (widget.myCustomTagName.toString().isNotEmpty &&
                        widget.myCustomTagName != null)
                    ? const Icon(
                        Icons.drive_file_rename_outline_outlined,
                        color: Colors.white,
                      )
                    : const Icon(
                        Icons.circle_outlined,
                        color: Colors.grey,
                      ),
                label: Text(
                  (widget.myCustomTagName.toString().isNotEmpty &&
                          widget.myCustomTagName != null)
                      ? widget.myCustomTagName.toString()
                      : "Personnalisé",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: (widget.myCustomTagName.toString().isNotEmpty &&
                            widget.myCustomTagName != null)
                        ? Colors.white
                        : Colors.grey,
                    decoration: (widget.myCustomTagName.toString().isNotEmpty &&
                            widget.myCustomTagName != null)
                        ? null
                        : TextDecoration.underline,
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 4),
                visualDensity: const VisualDensity(vertical: -2),
                showCheckmark: false,
                selectedColor: Colors.purple,
                selected: (widget.myCustomTagName.toString().isNotEmpty &&
                        widget.myCustomTagName != null)
                    ? true
                    : false,
                onPressed: () async {
                  var navigatorTagsNameResult =
                      await Navigator.of(context).push(
                    HeroDialogRequiredRoute(
                      builder: (context) => Center(
                        child: CustomTagFieldPopUp(
                          nameTag: widget.myCustomTagName,
                        ),
                      ),
                    ),
                  );

                  if (navigatorTagsNameResult.toString() != "" &&
                      navigatorTagsNameResult != null) {
                    setState(() {
                      widget.myCustomTagName =
                          navigatorTagsNameResult as String;
                    });
                  } else {
                    setState(() {
                      widget.myCustomTagName = null;
                    });
                  }
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
