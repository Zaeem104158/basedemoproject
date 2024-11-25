import 'dart:developer';

import 'package:get/get.dart';

class FeeDetailsController extends GetxController {
  final feeData = [
    {
      "id": 1,
      'month': 'January',
      'date': '06 May',
      'totalFee': {"status": "Unpaid", "amount": 5000},
      'extraFee': {"status": "Unpaid", "amount": 2000},
      'lateCharges': {"status": "Unpaid", "amount": 1000},
      'discount': {"status": "Apply", "amount": 2000},
    },
    {
      "id": 2,
      'month': 'February',
      'date': '06 May',
      'totalFee': {"status": "Unpaid", "amount": 1000},
      'extraFee': {"status": "Paid", "amount": null},
      'lateCharges': {"status": "Unpaid", "amount": 100},
      'discount': {"status": "Apply", "amount": 200},
    },
  ];

  var selectedFees = <int>{}.obs;
  var selectedItemFees = <int, Set<String>>{}.obs;
  var expansionState = <int, bool>{}.obs;
  var totalSelectedFee = 0.obs;
  var submenuSelectedTotalFee = 0.obs;
  var submenuTotals = <int, int>{}.obs;
  void toggleFeeSelection(
      int feeIndex, String type, int amount, bool isSelected) {
    selectedItemFees.putIfAbsent(feeIndex, () => <String>{});

    if (isSelected) {
      selectedItemFees[feeIndex]!.add(type);

      // Update totalSelectedFee
      totalSelectedFee.value += amount;

      // Update submenu total for the feeIndex
      submenuTotals[feeIndex] = (submenuTotals[feeIndex] ?? 0) + amount;
    } else {
      selectedItemFees[feeIndex]!.remove(type);

      // Update totalSelectedFee
      totalSelectedFee.value -= amount;

      // Update submenu total for the feeIndex
      submenuTotals[feeIndex] = (submenuTotals[feeIndex] ?? 0) - amount;

      // Remove submenu total if it becomes zero
      if (submenuTotals[feeIndex] == 0) {
        submenuTotals.remove(feeIndex);
      }
    }

    if (selectedItemFees[feeIndex]!.isEmpty) {
      selectedFees.remove(feeIndex);
    } else {
      selectedFees.add(feeIndex);
    }
  }

  bool isSubItemSelected(int feeIndex, String type) {
    return selectedItemFees[feeIndex]?.contains(type) ?? false;
  }

  void setExpansion(int index, bool value) {
    expansionState[index] = value;
  }
}













/* int calculateSubmenuTotal(int feeIndex) {
    final fee = feeData[feeIndex];
    int total = 0;

    for (var key in ['totalFee', 'extraFee', 'lateCharges', 'discount']) {
      final subItem = fee[key] as Map<String, dynamic>?;
      if (subItem != null && subItem['amount'] != null) {
        total += subItem['amount'] as int;
      }
    }

    //submenuTotalFee.value = total;
    return total;
  }
*/