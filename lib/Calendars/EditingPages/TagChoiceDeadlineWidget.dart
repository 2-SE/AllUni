import 'package:AllUni/Models/CalendarAppointmentsModel.dart';
import 'package:AllUni/Providers/DeadlineTagsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TagsChoiceDeadlineWidget extends StatefulWidget {
  final CalendarAppointment calendarAppointment;
  TagsChoiceDeadlineWidget({
    Key? key,
    required this.calendarAppointment,
  }) : super(key: key);

  @override
  State<TagsChoiceDeadlineWidget> createState() =>
      _TagsChoiceDeadlineWidgetState();
}

class _TagsChoiceDeadlineWidgetState extends State<TagsChoiceDeadlineWidget> {
  late String? myCustomTagName = "";
  late DeadlineTagsProvider deadlineTagsProvider;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    deadlineTagsProvider = context.read<DeadlineTagsProvider>();

    if (widget.calendarAppointment != null) {
      deadlineTagsProvider.tags.forEach((tagItem) {
        if (widget.calendarAppointment!.tagsNames.contains(tagItem.label)) {
          deadlineTagsProvider.changeTagValue(tagItem);
        }
      });
      List<String> customTags = deadlineTagsProvider.activatedTags
          .where((element) => deadlineTagsProvider.isCustomTag(element))
          .toList();
    }
    return Column(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: const [
//             Icon(
//               Icons.library_add_rounded,
//               size: 20,
//             ),
//             SizedBox(
//               width: 5,
//             ),
//             Text(
//               "Tags :",
//               style: TextStyle(
//                 fontSize: 16,
//                 decoration: TextDecoration.underline,
//               ),
//             ),
//             SizedBox(
//               width: 5,
//             ),
//           ],
//         ),
//         Row(
//           children: [
//             Expanded(
//               child: Wrap(
//                 alignment: WrapAlignment.start,
//                 spacing: 8,
//                 runSpacing: -4,
//                 children: [
// //TODO - DEADLINE TAGS - Problème à gérer -> Récupération de valeurs + ReEdit Display Actives Values
//                   ...context
//                       .watch<DeadlineTagsProvider>()
//                       .tags
//                       .map((tagItem) => InputChip(
//                           avatar: tagItem.showedIcon,
//                           label: Text(
//                             tagItem.label,
//                             style: TextStyle(
//                               fontWeight: FontWeight.normal,
//                               color:
//                                   tagItem.value ? Colors.white : Colors.black,
//                             ),
//                           ),
//                           padding: const EdgeInsets.symmetric(horizontal: 4),
//                           visualDensity: const VisualDensity(vertical: -2),
//                           showCheckmark: false,
//                           selectedColor: tagItem.selectedColor,
//                           selected: tagItem.value,
//                           onPressed: () {
//                             deadlineTagsProvider.changeTagValue(tagItem);
//                             widget.calendarAppointment.tagsNames =
//                                 deadlineTagsProvider.activatedTags;
//                           }))
//                       .toList(),
//
// //TODO - CUSTOM TAG (gérer le problème de validation)
//                   InputChip(
//                     avatar: (myCustomTagName.toString().isNotEmpty &&
//                             myCustomTagName != null)
//                         ? const Icon(
//                             Icons.drive_file_rename_outline_outlined,
//                             color: Colors.white,
//                           )
//                         : const Icon(
//                             Icons.circle_outlined,
//                             color: Colors.grey,
//                           ),
//                     label: Text(
//                       (myCustomTagName.toString().isNotEmpty &&
//                               myCustomTagName != null)
//                           ? myCustomTagName.toString()
//                           : "Personnalisé",
//                       style: TextStyle(
//                         fontWeight: FontWeight.normal,
//                         color: (myCustomTagName.toString().isNotEmpty &&
//                                 myCustomTagName != null)
//                             ? Colors.white
//                             : Colors.grey,
//                         decoration: (myCustomTagName.toString().isNotEmpty &&
//                                 myCustomTagName != null)
//                             ? null
//                             : TextDecoration.underline,
//                       ),
//                     ),
//                     padding: const EdgeInsets.symmetric(horizontal: 4),
//                     visualDensity: const VisualDensity(vertical: -2),
//                     showCheckmark: false,
//                     selectedColor: Colors.purple,
//                     selected: (myCustomTagName.toString().isNotEmpty &&
//                             myCustomTagName != null)
//                         ? true
//                         : false,
//                     onPressed: () async {
//                       var navigatorTagsNameResult =
//                           await Navigator.of(context).push(
//                         HeroDialogRequiredRoute(
//                           builder: (context) => Center(
//                             child:
//                                 CustomTagFieldPopUp(nameTag: myCustomTagName),
//                           ),
//                         ),
//                       );
//                       if (navigatorTagsNameResult.toString() != "" &&
//                           navigatorTagsNameResult != null) {
//                         setState(() {
//                           myCustomTagName = navigatorTagsNameResult as String;
//                         });
//                       } else {
//                         setState(() {
//                           myCustomTagName = null;
//                         });
//                       }
//                     },
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ],
        );
  }
}
