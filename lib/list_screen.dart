import 'package:flutter/material.dart';
import 'package:sortlist/sample_data.dart';

import 'model.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  TextEditingController? textController = TextEditingController();

  List<CustomerData> sortedList = [];

  sortList({location}) {
    var dummyLocationList = [];
    String? searchInLowerText = textController?.text.toLowerCase();
    print(searchInLowerText.runtimeType);
    if (searchInLowerText != null && searchInLowerText != '') {
      
      dummyLocationList = sampleUserData.where((element) {
        return searchInLowerText == element.location.toLowerCase();
      }).toList();
      sampleUserData = dummyLocationList as List<CustomerData>;
    } else {
      return sampleUserData;
    }

    setState(() {});
  }

  /////////////////////////////////////

  ///
  String getDateCategory(String dateTime) {
    int day = int.parse(dateTime.split('-')[0]);
    if (day <= 10) {
      return '1-10';
    } else if (day <= 20) {
      return '11-20';
    } else {
      return '21-30';
    }
  }

////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 169, 190, 200),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  disabledBorder: OutlineInputBorder()),
              controller: textController,
            ),
          ),
          ElevatedButton(onPressed: sortList, child: const Text('Search')),
          Expanded(
            child: ListView.builder(
                itemCount: sampleUserData.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(sampleUserData[index].name),
                      subtitle: Row(
                        children: [
                          Text(sampleUserData[index].receiverName),
                          SizedBox(
                            width: 20,
                          ),
                          Text(sampleUserData[index].frequency.toString()),
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



// sortGpt() {
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
