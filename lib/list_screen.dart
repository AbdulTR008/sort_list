import 'package:flutter/material.dart';
import 'package:sortlist/sample_data.dart';
import 'package:intl/intl.dart';

import 'model.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  TextEditingController? textController = TextEditingController();
  TextEditingController? dateController = TextEditingController();

  List<CustomerData> sortedList = [];

  void sortList(
      List<CustomerData> list, String? currentLocation, int currentDate) {
    list.sort((a, b) {
      DateTime dateTimeA = DateFormat('d-MMM-yyyy').parse(a.dateTime);
      DateTime dateTimeB = DateFormat('d-MMM-yyyy').parse(b.dateTime);

      int dateCategoryA = getDateCategory(dateTimeA.day);
      int dateCategoryB = getDateCategory(dateTimeB.day);
      int currentDateCategory = getDateCategory(currentDate);

      if (a.location.toLowerCase() == currentLocation &&
          b.location.toLowerCase() != currentLocation) {
        return -1;
      } else if (b.location.toLowerCase() == currentLocation &&
          a.location.toLowerCase() != currentLocation) {
        return 1;
      } else {
        if (dateCategoryA == currentDateCategory &&
            dateCategoryB != currentDateCategory) {
          return -1;
        } else if (dateCategoryB == currentDateCategory &&
            dateCategoryA != currentDateCategory) {
          return 1;
        } else {
          if (dateTimeA.hour == dateTimeB.hour) {
            return b.frequency.compareTo(a.frequency);
          } else {
            return dateTimeA.hour.compareTo(dateTimeB.hour);
          }
        }
      }
    });
    setState(() {});
  }

  int getDateCategory(int day) {
    if (day <= 10) {
      return 1;
    } else if (day <= 20) {
      return 2;
    } else {
      return 3;
    }
  }



  @override
  Widget build(BuildContext context) {

  

    return Scaffold(
      appBar: AppBar(
        title: const Text('List Sort'),
      ),
      backgroundColor: const Color.fromARGB(255, 169, 190, 200),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              
              decoration: const InputDecoration(
                  helperText: 'city',
                  border: OutlineInputBorder(),
                  disabledBorder: OutlineInputBorder()),
              controller: textController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                  helperText: 'date',
                  border: OutlineInputBorder(),
                  disabledBorder: OutlineInputBorder()),
              controller: dateController,
            ),
          ),
          ElevatedButton(
              onPressed: () =>
                  sortList(
                  sampleUserData,
                  textController?.text.toLowerCase(),
                  int.parse(dateController!.text.toString())),
              child: const Text('Search')),
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: sampleUserData.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(sampleUserData[index].name),
                      subtitle: Row(
                        children: [
                          Text(sampleUserData[index].receiverName),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                              'Rate ${sampleUserData[index].frequency.toString()}'),
                        ],
                      ),
                      trailing: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(sampleUserData[index].location),
                          Text('Date ${sampleUserData[index].dateTime}'),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}



// sort() {
//   sampleUserData.sort((a, b) {
//     // String dateCategoryA = getDateCategory('25-4-2024');
//     // String dateCategoryB = getDateCategory('29-2-2024');
//     // int dateCategoryComparison = dateCategoryA.compareTo(dateCategoryB);
//     // if (dateCategoryComparison != 0) {
//     //   return dateCategoryComparison;
//     // }
//     return b.frequency.compareTo(a.frequency);
//   });

//   print('Sorted Sample User Data:');
//   for (var data in sampleUserData) {
//     print(
//         '${data.name} | ${data.receiverName} | ${data.location} | ${data.frequency} | ${data.dateTime}');
//   }
//   setState(() {});
// }



  // void sortList(List<CustomerData> list, String? currentLocation) {
  //   list.sort((a, b) {
  //     DateTime dateTimeA = DateFormat('d-MMM-yyyy').parse(a.dateTime);
  //     DateTime dateTimeB = DateFormat('d-MMM-yyyy').parse(b.dateTime);

  //     if (a.location.toLowerCase() == currentLocation &&
  //         b.location.toLowerCase() != currentLocation) {
  //       return -1;
  //     } else if (b.location.toLowerCase() == currentLocation &&
  //         a.location.toLowerCase() != currentLocation) {
  //       return 1;
  //     } else {
  //       if (dateTimeA.hour == dateTimeB.hour) {
  //         return b.frequency.compareTo(a.frequency);
  //       } else {
  //         return dateTimeA.hour.compareTo(dateTimeB.hour);
  //       }
  //     }
  //   });
  //   final numbers = <String>['one', 'twoss', 'threeeee', '5', 'fourrr'];
  //   numbers.sort((a, b) {
  //     print('A $a');
  //     print('B $b');

  //     print(' First  ${a.length.compareTo(b.length)}');
  //     return a.length.compareTo(b.length);
  //   });

  //   print({numbers});
  //   setState(() {});
  // }