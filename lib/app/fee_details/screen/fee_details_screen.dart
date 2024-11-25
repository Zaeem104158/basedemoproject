import 'package:baseproj/common_widget/custome_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widget/scaffold_appandbottomnavbar.dart';
import '../../../core/color/app_colors.dart';
import '../controller/fee_details_controller.dart';

class FeeDetailsScreen extends GetView<FeeDetailsController> {
  const FeeDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithAppAndBottomBar(
      showDrawer: false,
      appbarTitle: "Fee Details",
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: FeeDetailsWidget(
                controller: controller,
              ),
            ),
            Obx(() {
              return Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: controller.selectedFees.isNotEmpty
                        ? () {
                            // Handle pay action
                            print(
                                "Total to pay: ₹ ${controller.totalSelectedFee}");
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 16),
                      backgroundColor: Colors.blue,
                      disabledBackgroundColor: Colors.grey,
                    ),
                    child: Text(
                      'Pay ₹ ${controller.totalSelectedFee}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class FeeDetailsWidget extends StatelessWidget {
  final FeeDetailsController controller;

  const FeeDetailsWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.feeData.length,
      itemBuilder: (context, index) {
        final fee = controller.feeData[index];

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4,
            child: Obx(() {
              final submenuTotal = controller.submenuTotals[index] ?? 0;
              return Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  backgroundColor: Color(0xFFd4f5ff),
                  collapsedBackgroundColor: Color(0xFFd4f5ff),
                  iconColor: Color(0xFFff5959),
                  collapsedIconColor: Color(0xFFff5959),
                  collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  tilePadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  onExpansionChanged: (value) =>
                      controller.setExpansion(index, value),
                  trailing: Column(
                    // mainAxisSize: MainAxisSize.max,
                    children: [
                      CustomeText(text: "${fee["date"]}"),
                      Icon(controller.expansionState[index] == true
                          ? Icons.keyboard_arrow_down_outlined
                          : Icons.keyboard_arrow_up)
                    ],
                  ),
                  leading: Checkbox(
                    value: controller.selectedFees.contains(index),
                    onChanged: (value) {
                      fee.forEach((key, val) {
                        if (val is Map && val['status'] != 'Paid') {
                          controller.toggleFeeSelection(
                            index,
                            key,
                            val['amount'] ?? 0,
                            value!,
                          );
                        }
                      });
                    },
                  ),
                  title: Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomeText(
                          text: 'School Fee for ${fee['month']}',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        CustomeText(
                          text: 'Payable Amount: ৳$submenuTotal',
                          style: Theme.of(context).textTheme.labelLarge,
                          // fontSize: 8,
                        ),
                        Chip(
                          color: WidgetStatePropertyAll(Color(0xFF12b264)),
                          label: CustomeText(
                            text: "Paid",
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Divider(
                          color: Colors.grey,
                        ),
                        ...buildDetailRows(fee, index)
                      ],
                    ),
                  ],
                ),
              );
            }),
          ),
        );
      },
    );
  }

  /// Build detail rows for each menu item
  List<Widget> buildDetailRows(Map<String, dynamic> fee, int index) {
    final fields = ['totalFee', 'extraFee', 'lateCharges', 'discount'];

    return fields.map((field) {
      final section = fee[field] as Map<String, dynamic>?;
      if (section == null) return const SizedBox.shrink();

      final isDisabled = section['status'] == 'Paid';
      final amount = section['amount'] ?? 0;

      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(
                  value: controller.isSubItemSelected(index, field),
                  onChanged: isDisabled
                      ? null
                      : (value) {
                          controller.toggleFeeSelection(
                            index,
                            field,
                            amount,
                            value!,
                          );
                        },
                ),
                Text(
                  field.replaceFirst(field[0], field[0].toUpperCase()),
                ),
              ],
            ),
            Text(
              isDisabled ? section['status'] : amount.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
    }).toList();
  }
}
