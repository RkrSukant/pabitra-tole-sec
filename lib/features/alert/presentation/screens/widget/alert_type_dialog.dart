import 'package:flutter/material.dart';
import 'package:pabitra_security/shared/helpers/colors.dart';
import 'package:pabitra_security/shared/helpers/dimens.dart';
import 'package:pabitra_security/shared/helpers/text_styles.dart';
import 'package:pabitra_security/shared/helpers/utils.dart';

void showAlertTypeDialog(
  BuildContext context, {
  required List<String> houses,
  required Function(String type, String? house) onSelected,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppColors.primary,
        contentPadding: const EdgeInsets.symmetric(
            vertical: Dimens.spacing_16, horizontal: Dimens.spacing_8),
        title: Row(
          children: [
            const Expanded(
              child: Text(
                "Select Alert Type",
                style: textFFFFFFs16w600,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.close_rounded,
                size: Dimens.spacing_24,
                color: AppColors.whiteFFFFFF,
              ),
            )
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                    child: Divider(
                  height: Dimens.spacing_0_5,
                  color: AppColors.whiteFFFFFF.withAlpha(100),
                )),
                addHorizontalSpace(Dimens.spacing_8),
                const Text(
                  "Self",
                  style: textFFFFFFs12w400,
                ),
                addHorizontalSpace(Dimens.spacing_8),
                Expanded(
                    child: Divider(
                  height: Dimens.spacing_0_5,
                  color: AppColors.whiteFFFFFF.withAlpha(100),
                )),
              ],
            ),
            ListTile(
              title: Row(
                children: [
                  const Icon(
                    Icons.local_fire_department,
                    size: Dimens.spacing_24,
                    color: AppColors.whiteFFFFFF,
                  ),
                  addHorizontalSpace(Dimens.spacing_8),
                  const Text(
                    "Fire",
                    style: textFFFFFFs16w600,
                  ),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
                onSelected("FIRE", null);
              },
            ),
            ListTile(
              title: Row(
                children: [
                  const Icon(
                    Icons.medical_services_rounded,
                    size: Dimens.spacing_24,
                    color: AppColors.whiteFFFFFF,
                  ),
                  addHorizontalSpace(Dimens.spacing_8),
                  const Text(
                    "Medical Emergency",
                    style: textFFFFFFs16w600,
                  ),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
                onSelected("MEDICAL_EMERGENCY", null);
              },
            ),
            ListTile(
              title: Row(
                children: [
                  const Icon(
                    Icons.person,
                    size: Dimens.spacing_24,
                    color: AppColors.whiteFFFFFF,
                  ),
                  addHorizontalSpace(Dimens.spacing_8),
                  const Text(
                    "Theft",
                    style: textFFFFFFs16w600,
                  ),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
                onSelected("THEFT", null);
              },
            ),
            Row(
              children: [
                Expanded(
                    child: Divider(
                  height: Dimens.spacing_0_5,
                  color: AppColors.whiteFFFFFF.withAlpha(100),
                )),
                addHorizontalSpace(Dimens.spacing_8),
                const Text(
                  "Others",
                  style: textFFFFFFs12w400,
                ),
                addHorizontalSpace(Dimens.spacing_8),
                Expanded(
                    child: Divider(
                  height: Dimens.spacing_0_5,
                  color: AppColors.whiteFFFFFF.withAlpha(100),
                )),
              ],
            ),
            ListTile(
              title: Row(
                children: [
                  const Icon(
                    Icons.report_rounded,
                    size: Dimens.spacing_24,
                    color: AppColors.whiteFFFFFF,
                  ),
                  addHorizontalSpace(Dimens.spacing_8),
                  const Text(
                    "Report",
                    style: textFFFFFFs16w600,
                  ),
                ],
              ),
              onTap: () {
                showAlertReportDialog(context, houses, onSelected);
              },
            ),
          ],
        ),
      );
    },
  );
}

void showAlertReportDialog(BuildContext context, List<String> houses,
    Function(String, String?) callback) {
  String? selectedHouse;

  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            backgroundColor: AppColors.primary,
            contentPadding: const EdgeInsets.symmetric(
              vertical: Dimens.spacing_16,
              horizontal: Dimens.spacing_8,
            ),
            title: Row(
              children: [
                const Expanded(
                  child: Text(
                    "Select house number to report problem",
                    style: textFFFFFFs16w600,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.close_rounded,
                    size: Dimens.spacing_24,
                    color: AppColors.whiteFFFFFF,
                  ),
                )
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Divider(
                  height: Dimens.spacing_0_5,
                  color: AppColors.whiteFFFFFF.withAlpha(100),
                ),
                addVerticalSpace(Dimens.spacing_16),
              GestureDetector(
                onTap: () async {
                  final result = await showModalBottomSheet<String>(
                    context: context,
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    isScrollControlled: true,
                    builder: (context) {
                      String searchQuery = "";
                      List<String> filtered = List.from(houses);

                      return StatefulBuilder(
                        builder: (context, setState) {
                          return Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: Container(
                              padding: const EdgeInsets.all(Dimens.spacing_16),
                              height: 400,
                              child: Column(
                                children: [
                                  TextField(
                                    autofocus: true,
                                    style: textFFFFFFs14w400,
                                    decoration: const InputDecoration(
                                      hintText: 'Search house...',
                                      hintStyle: textFFFFFFs12w400,
                                      prefixIcon: Icon(Icons.search, color: AppColors.whiteFFFFFF),
                                      border: OutlineInputBorder(),
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        searchQuery = value.toLowerCase();
                                        filtered = houses
                                            .where((h) => h.toLowerCase().contains(searchQuery))
                                            .toList();
                                      });
                                    },
                                  ),
                                  const SizedBox(height: Dimens.spacing_16),
                                  Expanded(
                                    child: filtered.isEmpty
                                        ? const Center(
                                      child: Text("No matches found", style: textFFFFFFs14w400),
                                    )
                                        : ListView.builder(
                                      itemCount: filtered.length,
                                      itemBuilder: (context, index) {
                                        final house = filtered[index];
                                        return ListTile(
                                          title: Text(house, style: textFFFFFFs14w400),
                                          leading: const Icon(Icons.house, color: AppColors.whiteFFFFFF),
                                          onTap: () => Navigator.pop(context, house),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );

                  if (result != null) {
                    setState(() {
                      selectedHouse = result;
                    });
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.whiteFFFFFF.withAlpha(100),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.house_rounded, size: Dimens.spacing_16, color: AppColors.whiteFFFFFF),
                      addHorizontalSpace(Dimens.spacing_8),
                      Expanded(
                        child: Text(
                          selectedHouse ?? "Select House Number",
                          style: textFFFFFFs14w400,
                        ),
                      ),
                      const Icon(Icons.arrow_drop_down_rounded, color: AppColors.whiteFFFFFF),
                    ],
                  ),
                ),
              ),
              addVerticalSpace(Dimens.spacing_16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    callback("REPORT", selectedHouse);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonBlue,
                    minimumSize: const Size.fromHeight(Dimens.spacing_40),
                  ),
                  child: const Text(
                    "Send Alert",
                    style: textFFFFFFs16w600,
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

