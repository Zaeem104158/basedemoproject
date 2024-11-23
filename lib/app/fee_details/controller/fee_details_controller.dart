// import 'package:get/get.dart';

// class FeeDetailsController extends GetxController {
//   final feeData = [
//     {
//       "id": 1,
//       'month': 'January',
//       'date': '06 May',
//       'totalFee': {"status": "Unpaid", "amount": 5000},
//       'extraFee': {"status": "Unpaid", "amount": 2000},
//       'lateCharges': {"status": "Unpaid", "amount": 1000},
//       'discount': {"status": "Apply", "amount": 2000},
//     },
//     {
//       "id": 2,
//       'month': 'February',
//       'date': '06 May',
//       'totalFee': {"status": "Unpaid", "amount": 10000},
//       'extraFee': {"status": "Paid", "amount": null},
//       'lateCharges': {"status": "Unpaid", "amount": 1000},
//       'discount': {"status": "Apply", "amount": 2000},
//     },
//     {
//       "id": 3,
//       'month': 'February',
//       'date': '12 May',
//       'totalFee': {"status": "Unpaid", "amount": 20000},
//       'extraFee': {"status": "Unpaid", "amount": 2000},
//       'lateCharges': {"status": "Paid", "amount": null},
//       'discount': {"status": "Apply", "amount": 2000},
//     },
//     {
//       "id": 4,
//       'month': 'February',
//       'date': '25 May',
//       'totalFee': {"status": "Unpaid", "amount": 30000},
//       'extraFee': {"status": "Unpaid", "amount": 2000},
//       'lateCharges': {"status": "Paid", "amount": null},
//       'discount': {"status": "Applied", "amount": null},
//     },
//     {
//       "id": 5,
//       'month': 'March',
//       'date': '06 May',
//       'totalFee': {"status": "Unpaid", "amount": 40000},
//       'extraFee': {"status": "Paid", "amount": null},
//       'lateCharges': {"status": "Paid", "amount": null},
//       'discount': {"status": "Applied", "amount": null},
//     },
//     {
//       "id": 6,
//       'month': 'March',
//       'date': '21 May',
//       'totalFee': {"status": "Paid", "amount": null},
//       'extraFee': {"status": "Paid", "amount": null},
//       'lateCharges': {"status": "Paid", "amount": null},
//       'discount': {"status": "Applied", "amount": null},
//     },
//     // Add more demo data
//   ];

//   var selectedFees = <int>{}.obs; // Tracks selected fee indices
//   var selectedItemFee = <String>{}.obs;
//   var totalSelectedFee = 0.obs,
//       totalSelectedMenuItemFee =
//           0.obs; // Tracks the total fee of selected items

//   void selectFee(int id, int fee) {
//     selectedFees.add(id);
//     totalSelectedFee.value += fee;
//   }

//   void selectItemTotalFee(String type, int fee) {
//     selectedItemFee.add(type);
//     totalSelectedMenuItemFee.value += fee;
//   }

//   void deselectItemTotalFee(String type, int fee) {
//     selectedItemFee.remove(type);
//     totalSelectedMenuItemFee.value -= fee;
//   }

//   void deselectFee(int id, int fee) {
//     selectedFees.remove(id);
//     totalSelectedFee.value -= fee;
//   }
// }

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
    // Add more fee data here...
  ];

  var selectedFees = <int>{}.obs; // Tracks selected fee indices
  var selectedItemFees =
      <int, Set<String>>{}.obs; // Tracks selected sub-items per fee
  var totalSelectedFee = 0.obs; // Total payable amount

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
