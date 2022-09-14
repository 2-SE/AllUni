import 'package:AllUni/Models/CalendarAppointmentsModel.dart';
import 'package:AllUni/Providers/PlanningTagsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TagsChoicePlanningWidget extends StatefulWidget {
  final CalendarAppointment calendarAppointment;
  TagsChoicePlanningWidget({
    Key? key,
    required this.calendarAppointment,
  }) : super(key: key);

  @override
  State<TagsChoicePlanningWidget> createState() =>
      _TagsChoicePlanningWidgetState();
}

class _TagsChoicePlanningWidgetState extends State<TagsChoicePlanningWidget> {
  late String? myCustomTagName = "";
  late PlanningTagsProvider planningTagsProvider;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    planningTagsProvider = context.read<PlanningTagsProvider>();

    if (widget.calendarAppointment != null) {
      context.read<PlanningTagsProvider>().tags.forEach((tagItem) {
        if (widget.calendarAppointment!.tagsNames.contains(tagItem.label)) {
          planningTagsProvider.changeTagValue(tagItem);
        }
      });
      List<String> customTags = planningTagsProvider.activatedTags
          .where((element) => planningTagsProvider.isCustomTag(element))
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
// //TODO - PLANNING TAGS - Problème à gérer -> Récupération de valeurs + ReEdit Display Actives Values
//                   ...context
//                       .watch<PlanningTagsProvider>()
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
//                             planningTagsProvider.changeTagValue(tagItem);
//                             widget.calendarAppointment.tagsNames =
//                                 planningTagsProvider.activatedTags;
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
//                             child: CustomTagFieldPopUp(
//                               nameTag: myCustomTagName,
//                             ),
//                           ),
//                         ),
//                       );
//
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
