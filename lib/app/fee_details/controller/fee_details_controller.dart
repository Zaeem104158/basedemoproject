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
  var totalSelectedFee = 0.obs;

  void toggleFeeSelection(
      int feeIndex, String type, int amount, bool isSelected) {
    selectedItemFees.putIfAbsent(feeIndex, () => <String>{});

    if (isSelected) {
      selectedItemFees[feeIndex]!.add(type);
      totalSelectedFee.value += amount;
    } else {
      selectedItemFees[feeIndex]!.remove(type);
      totalSelectedFee.value -= amount;
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
}
