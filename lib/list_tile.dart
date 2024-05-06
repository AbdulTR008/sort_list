import 'dart:core';

class CustomerData {
  final String name;
  final String receiverName;
  final String location;
  final int frequency;
  final String dateTime;

  CustomerData({
    required this.name,
    required this.receiverName,
    required this.location,
    required this.frequency,
    required this.dateTime,
  });
}

void main() {
  // Sample data
  List<CustomerData> sampleUserData = [
    CustomerData(
      name: 'John Smith',
      receiverName: 'Coffee Shop',
      location: 'Chennai Central',
      frequency: 20,
      dateTime: '2-May-2024',
    ),
    CustomerData(
      name: 'Emily Jones',
      receiverName: 'Gym',
      location: 'Perungalatur',
      frequency: 3,
      dateTime: '2-May-2024',
    ),
    CustomerData(
      name: 'Charles Johnson',
      receiverName: 'Grocery Store',
      location: 'Kilpauk',
      frequency: 22,
      dateTime: '2-May-2024',
    ),
    // Add more sample data here...
  ];

  // Function to categorize date based on day of month
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

  // Function to sort sampleUserData
  sampleUserData.sort((a, b) {
    // Sort by location
    int locationComparison = a.location.compareTo(b.location);
    if (locationComparison != 0) {
      return locationComparison;
    }

    // Sort by date category
    String dateCategoryA = getDateCategory(a.dateTime);
    String dateCategoryB = getDateCategory(b.dateTime);
    int dateCategoryComparison = dateCategoryA.compareTo(dateCategoryB);
    if (dateCategoryComparison != 0) {
      return dateCategoryComparison;
    }

    // Sort by frequency (high to low)
    return b.frequency.compareTo(a.frequency);
  });

  // Print the sorted list
  print('Sorted Sample User Data:');
  for (var data in sampleUserData) {
    print(
        '${data.name} | ${data.receiverName} | ${data.location} | ${data.frequency} | ${data.dateTime}');
  }
}

