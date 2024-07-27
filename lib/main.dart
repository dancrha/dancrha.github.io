import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MVCR Online Form',
      home: DashboardPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int? _hoveredRowIndex;
  final double _scaleFactor = 1.03; // Scale factor for hover effect
  List<Map<String, dynamic>> reports = [
    {
      'Occurrence Number': 2,
      'Assignee': 'Stacy',
      'Submission Date': '2024/07/10',
      'Status': 'Open',
      'Follow up Date': '2024/07/10',
    },
    {
      'Occurrence Number': 1,
      'Assignee': 'John',
      'Submission Date': '2024/07/10',
      'Follow up Date': '2024/07/10',
      'Status': 'In Progress',
    },
    {
      'Occurrence Number': 3,
      'Assignee': 'Tom',
      'Submission Date': '2024/07/10',
      'Status': 'On Hold',
      'Follow up Date': '2024/07/10',
    },
    {
      'Occurrence Number': 3,
      'Assignee': 'Tom',
      'Submission Date': '2024/07/10',
      'Status': 'Approved - Pending Submission',
      'Follow up Date': '2024/07/10',
    },
    {
      'Occurrence Number': 3,
      'Assignee': 'Tom',
      'Submission Date': '2024/07/10',
      'Status': 'Completed - Sent to Versadex',
      'Follow up Date': '2024/07/10',
    },
    {
      'Occurrence Number': 3,
      'Assignee': 'Tom',
      'Submission Date': '2024/07/10',
      'Status': 'Rejected',
      'Follow up Date': '2024/07/10',
    },
    {
      'Occurrence Number': 3,
      'Assignee': 'Tom',
      'Submission Date': '2024/07/10',
      'Status': 'Completed - Sent to Versadex',
      'Follow up Date': '2024/07/10',
    },
    {
      'Occurrence Number': 3,
      'Assignee': 'Tom',
      'Submission Date': '2024/07/10',
      'Status': 'Completed - Sent to Versadex',
      'Follow up Date': '2024/07/10',
    },
    {
      'Occurrence Number': 3,
      'Assignee': 'Tom',
      'Submission Date': '2024/07/10',
      'Status': 'Completed - Sent to Versadex',
      'Follow up Date': '2024/07/10',
    },
    {
      'Occurrence Number': 3,
      'Assignee': 'Tom',
      'Submission Date': '2024/07/10',
      'Status': 'Completed - Sent to Versadex',
      'Follow up Date': '2024/07/10',
    },
    {
      'Occurrence Number': 3,
      'Assignee': 'Tom',
      'Submission Date': '2024/07/10',
      'Status': 'Completed - Sent to Versadex',
      'Follow up Date': '2024/07/10',
    },
    {
      'Occurrence Number': 3,
      'Assignee': 'Tom',
      'Submission Date': '2024/07/10',
      'Status': 'Completed - Sent to Versadex',
      'Follow up Date': '2024/07/10',
    },
    {
      'Occurrence Number': 3,
      'Assignee': 'Tom',
      'Submission Date': '2024/07/10',
      'Status': 'Completed - Sent to Versadex',
      'Follow up Date': '2024/07/10',
    },
    {
      'Occurrence Number': 3,
      'Assignee': 'Tom',
      'Submission Date': '2024/07/10',
      'Status': 'Completed - Sent to Versadex',
      'Follow up Date': '2024/07/10',
    },
    {
      'Occurrence Number': 3,
      'Assignee': 'Tom',
      'Submission Date': '2024/07/10',
      'Status': 'Completed - Sent to Versadex',
      'Follow up Date': '2024/07/10',
    },
    {
      'Occurrence Number': 3,
      'Assignee': 'Tom',
      'Submission Date': '2024/07/10',
      'Status': 'Completed - Sent to Versadex',
      'Follow up Date': '2024/07/10',
    },
  ];

  String? selectedFilter;
  bool sortAscending = true;

  Color getStatusColor(String status) {
    switch (status) {
      case 'Open':
        return Colors.grey;
      case 'In Progress':
        return Colors.yellow.shade700;
      case 'Approved - Pending Submission':
        return Colors.blue.shade700;
      case 'Completed - Sent to Versadex':
        return Colors.green;
      case 'On Hold':
        return Colors.yellow.shade900;
      case 'Rejected':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth <= 600;
    bool isTablet = screenWidth > 600 && screenWidth <= 800;
    bool isDesktop = screenWidth > 800;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90.0),
        child: Container(
          width: double.infinity,
          height: 90.0,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(0, 61, 121, 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: 35,
                top: 6,
                child: SizedBox(
                  width: 95,
                  height: 95,
                  child: Image.asset(
                    'assets/images/logo-yrp.png',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: LayoutBuilder(builder: (context, constraints) {
          double containerWidth = constraints.maxWidth * 0.9;

          if (constraints.maxWidth < 1200) {
            containerWidth =
                constraints.maxWidth; // Snap to screen width if less than 600
          }
          return Center(
            child: Container(
              width: containerWidth,
              padding: EdgeInsets.only(
                top: 40.0,
                bottom: 20,
                left: isMobile
                    ? 10
                    : isTablet
                        ? 20
                        : 80,
                right: isMobile
                    ? 10
                    : isTablet
                        ? 20
                        : 80,
              ),
              margin: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Motor Vehicle Collision Report Submissions',
                    style: TextStyle(
                      fontSize: 32,
                      fontFamily: 'ArchivoNarrow',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // const SizedBox(height: 20),
                  // const Text(
                  //   'Welcome to the Motor Vehicle Collision Report submission dashboard. This is where you can work on report submissions.',
                  // ),
                  const SizedBox(
                    height: 30,
                  ),
                  Wrap(
                    children: [
                      Wrap(
                        spacing: 20,
                        children: [
                          TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.filter_list,
                                color: Colors.white),
                            label: const Text('Filter',
                                style: TextStyle(color: Colors.white)),
                            style: TextButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(0, 61, 121, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 18),
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.sort, color: Colors.white),
                            label: Text('Sort',
                                style: TextStyle(color: Colors.white)),
                            style: TextButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(0, 61, 121, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 18),
                            ),
                          ),
                          const DropdownMenu(
                            width: 300,
                            dropdownMenuEntries: [],
                            label: Text('Search by:'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Header row
                                _buildTableRow(
                                  -1, // No hover effect for header
                                  [
                                    _buildHeaderCell('Occurrence #'),
                                    _buildHeaderCell('Assignee'),
                                    _buildHeaderCell('Submission Date'),
                                    _buildHeaderCell('Follow up Date'),
                                    _buildHeaderCell('Status'),
                                  ],
                                  isHeader: true,
                                ),
                                ...reports.asMap().entries.map((entry) {
                                  int idx = entry.key;
                                  Map<String, dynamic> report = entry.value;

                                  return _buildTableRow(
                                    idx,
                                    [
                                      Text(report['Occurrence Number']
                                          .toString()),
                                      Text(report['Assignee']),
                                      Text(report['Submission Date']),
                                      Text(report['Follow up Date']),
                                      Container(
                                        width: 100,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        height: 35,
                                        decoration: BoxDecoration(
                                          color:
                                              getStatusColor(report['Status']),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(
                                                  0.1), // Light shadow
                                              spreadRadius: 1,
                                              blurRadius: 5,
                                              offset: Offset(0,
                                                  3), // Horizontal and vertical offset
                                            ),
                                          ],
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            IconButton(
                                              icon: Icon(
                                                report['Status'] ==
                                                        'Completed - Sent to Versadex'
                                                    ? Icons.check_circle
                                                    : report['Status'] == 'Open'
                                                        ? Icons
                                                            .radio_button_unchecked
                                                        : report['Status'] ==
                                                                'Approved - Pending Submission'
                                                            ? Icons.task_alt
                                                            : report['Status'] ==
                                                                    'On Hold'
                                                                ? Icons
                                                                    .pause_circle_outline
                                                                : report['Status'] ==
                                                                        'Rejected'
                                                                    ? Icons
                                                                        .cancel
                                                                    : Icons
                                                                        .radio_button_checked,
                                                size: 20,
                                              ),
                                              color: Colors.white,
                                              onPressed: () {
                                                // Define what happens when the icon button is pressed
                                              },
                                            ),
                                            Text(
                                              report['Status'],
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  );
                                }).toList(),
                              ],
                            )),
                      )),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildHeaderCell(String text) {
    return Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.bold),
    );
  }

  Widget _buildTableRow(int idx, List<Widget> cells, {bool isHeader = false}) {
    return MouseRegion(
      onEnter: isHeader
          ? null
          : (_) {
              setState(() {
                _hoveredRowIndex = idx;
              });
            },
      onExit: isHeader
          ? null
          : (_) {
              setState(() {
                _hoveredRowIndex = null;
              });
            },
      child: AnimatedContainer(
        duration: const Duration(
            milliseconds: 200), // Duration for the scaling effect
        transform: Matrix4.identity()
          ..scale(_hoveredRowIndex == idx ? _scaleFactor : 1.0),
        transformAlignment: Alignment.center,
        decoration: BoxDecoration(
          color: isHeader
              ? Colors.transparent
              : _hoveredRowIndex == idx
                  ? Color.fromARGB(255, 199, 230, 255)
                  : (idx % 2 == 0
                      ? Colors.grey[200]
                      : Colors.white), // Alternating row colors
          borderRadius: BorderRadius.circular(12.0), // Rounded corners
          // boxShadow: _hoveredRowIndex == idx
          //     ? [
          //         BoxShadow(
          //           color: Colors.black.withOpacity(0.2), // Shadow color
          //           spreadRadius: 1,
          //           blurRadius: 5,
          //           offset: const Offset(0, 3), // Shadow offset
          //         ),
          //       ]
          //     : [], // Apply shadow only when hovered
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: cells.map((cell) {
            return Expanded(
              child: Container(
                padding: const EdgeInsets.all(8),
                child: cell,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class ReportDetailsPage extends StatelessWidget {
  final Map<String, dynamic> report;

  const ReportDetailsPage({Key? key, required this.report}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Occurrence Number: ${report['Occurrence Number']}'),
            Text('Job: ${report['Assignee']}'),
            Text('Manager: ${report['Submission Date']}'),
            Text('Status: ${report['Status']}'),
            Text('Type: ${report['Follow up Date']}'),
          ],
        ),
      ),
    );
  }
}
