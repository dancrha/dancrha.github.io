import 'package:flutter/material.dart';
import 'package:mvcr_agency_portal/custom_dropdown_button.dart';
import 'package:mvcr_agency_portal/main.dart';

class ReportDetails extends StatefulWidget {
  final Map<String, dynamic> report;

  ReportDetails({required this.report});

  @override
  _ReportDetailsState createState() => _ReportDetailsState();
}

class _ReportDetailsState extends State<ReportDetails> {
  List<String> assigneeItems = [
    'Stacy',
    'John',
    'Tom',
    'Emily'
  ]; // Add more assignees as needed
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
                  child: Image.asset('assets/images/logo-yrp.png'),
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
            containerWidth = constraints.maxWidth;
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
                        : 90,
                right: isMobile
                    ? 10
                    : isTablet
                        ? 20
                        : 90,
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
                    'Report Details',
                    style: TextStyle(
                      fontSize: 32,
                      //fontFamily: 'ArchivoNarrow',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildReportDetailsContainer(),
                  const SizedBox(height: 20),
                  _buildCollisionInfoContainer(),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildCollisionInfoContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 50),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Collision Information',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              //fontFamily: 'ArchivoNarrow',
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Wrap(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 80,
              runSpacing: 60,
              children: [
                _buildDetailColumn('Location of Collision',
                    widget.report['Location'] ?? 'N/A'),
                _buildDetailColumn(
                    'Time of Collision', widget.report['Time'] ?? 'N/A'),
                _buildDetailColumn(
                    'Weather Conditions', widget.report['Weather'] ?? 'N/A'),
                _buildDetailColumn('Road Conditions',
                    widget.report['RoadConditions'] ?? 'N/A'),
                _buildDetailColumn(
                    'Road Surface', widget.report['RoadSurface'] ?? 'N/A'),
                _buildDetailColumn('Pavement Markings?',
                    widget.report['PavementMarkings'] ?? 'N/A'),
                _buildDetailColumn(
                    'Vehicle Direction', widget.report[''] ?? 'N/A'),
                _buildDetailColumn(
                    'Damage to other property?', widget.report[''] ?? 'N/A'),
                _buildDetailColumn(
                    'Vehicle Parked?', widget.report[''] ?? 'N/A'),
              ],
            ),
          ),
          const SizedBox(height: 70),
          const Text(
            "Reporting Driver's Information",
            style: TextStyle(
              fontSize: 24,

              fontWeight: FontWeight.bold,
              //fontFamily: 'ArchivoNarrow',
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Wrap(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 80,
              runSpacing: 60,
              children: [
                _buildDetailColumn(
                    'Last Name', widget.report['Last Name'] ?? 'N/A'),
                _buildDetailColumn(
                    'First Name', widget.report['First Name'] ?? 'N/A'),
                _buildDetailColumn(
                    'Date of Birth', widget.report['Date of Birth'] ?? 'N/A'),
                _buildDetailColumn("Driver's Licence Number",
                    widget.report["Driver's Licence Number"] ?? 'N/A'),
                _buildDetailColumn(
                    "Province/State Driver's Licence Issued In:",
                    widget.report[
                            "Province/State Driver's Licence Issued In:"] ??
                        'N/A'),
                _buildDetailColumn(
                    'Address', widget.report['Address'] ?? 'N/A'),
                _buildDetailColumn('Apt #/Unit', widget.report[''] ?? 'N/A'),
                _buildDetailColumn('City/Town', widget.report[''] ?? 'N/A'),
                _buildDetailColumn(
                    'Province/State', widget.report[''] ?? 'N/A'),
                _buildDetailColumn(
                    'Postal Code/Zip Code', widget.report[''] ?? 'N/A'),
                _buildDetailColumn(
                    'Cell Phone Number', widget.report[''] ?? 'N/A'),
                _buildDetailColumn(
                    'Home Phone Number', widget.report[''] ?? 'N/A'),
                _buildDetailColumn(
                    'Business Phone Number', widget.report[''] ?? 'N/A'),
                _buildDetailColumn('Email', widget.report[''] ?? 'N/A'),
                _buildDetailColumn(
                    'Action at Time of Collision', widget.report[''] ?? 'N/A'),
                _buildDetailColumn(
                    'Wearing a seatbelt?', widget.report[''] ?? 'N/A'),
              ],
            ),
          ),
          const SizedBox(height: 70),
          const Text(
            "Reporting Driver's Vehicle Information",
            style: TextStyle(
              fontSize: 24,

              fontWeight: FontWeight.bold,
              //fontFamily: 'ArchivoNarrow',
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Wrap(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 80,
              runSpacing: 60,
              children: [
                _buildDetailColumn(
                    'Licence Plate', widget.report['Licence Plate'] ?? 'N/A'),
                _buildDetailColumn('Insurance Provider',
                    widget.report['Insurance Provider'] ?? 'N/A'),
                _buildDetailColumn(
                    'Policy Number', widget.report['Policy Number'] ?? 'N/A'),
                _buildDetailColumn(
                    "Vehicle Make", widget.report["Vehicle Make"] ?? 'N/A'),
                _buildDetailColumn(
                    "Vehicle Model", widget.report["Vehicle Model"] ?? 'N/A'),
                _buildDetailColumn(
                    "Vehicle Year", widget.report["Vehicle Year"] ?? 'N/A'),
                _buildDetailColumn(
                    'Vehicle Colour', widget.report['Vehicle Colour'] ?? 'N/A'),
              ],
            ),
          ),
          const SizedBox(height: 70),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 70),
            child: Text(
              "Area of Damage",
              style: TextStyle(
                fontSize: 22,

                fontWeight: FontWeight.bold,
                //fontFamily: 'ArchivoNarrow',
              ),
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70),
            child: Wrap(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 80,
              runSpacing: 60,
              children: [
                _buildDetailColumn(
                    'Vehicle towed?', widget.report['Vehicle towed?'] ?? 'N/A'),
                _buildDetailColumn('Towing company:',
                    widget.report['Towing company:'] ?? 'N/A'),
                _buildDetailColumn('Tow destination:',
                    widget.report['Tow destination:'] ?? 'N/A'),
                _buildDetailColumn('Was there a witness?',
                    widget.report['Was there a witness?'] ?? 'N/A'),
                _buildDetailColumn(
                    'Witness Name', widget.report['Witness Name'] ?? 'N/A'),
                _buildDetailColumn('Witness Phone Number',
                    widget.report['Witness Phone Number'] ?? 'N/A'),
              ],
            ),
          ),
          const SizedBox(height: 70),
          const Text(
            "Passenger(s) Information",
            style: TextStyle(
              fontSize: 24,

              fontWeight: FontWeight.bold,
              //fontFamily: 'ArchivoNarrow',
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDetailColumn('# of Passengers',
                    widget.report['# of Passengers'] ?? 'N/A'),
                const SizedBox(height: 60),
                Wrap(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  spacing: 80,
                  runSpacing: 60,
                  children: [
                    _buildDetailColumn(
                        'Last Name', widget.report['Last Name'] ?? 'N/A'),
                    _buildDetailColumn(
                        'First Name', widget.report['First Name'] ?? 'N/A'),
                    _buildDetailColumn(
                        'Phone Number', widget.report['Phone Number'] ?? 'N/A'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 70),
          const Text(
            "Reporting Driver's Statement",
            style: TextStyle(
              fontSize: 24,

              fontWeight: FontWeight.bold,
              //fontFamily: 'ArchivoNarrow',
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Wrap(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 80,
              runSpacing: 60,
              children: [
                _buildDetailColumn(
                    'Statement', widget.report['Statement'] ?? 'N/A'),
                _buildDetailColumn('Dash Camera Footage?',
                    widget.report['Dash Camera Footage?'] ?? 'N/A'),
              ],
            ),
          ),
          const SizedBox(height: 70),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 70),
            child: Text(
              "File Uploads",
              style: TextStyle(
                fontSize: 22,

                fontWeight: FontWeight.bold,
                //fontFamily: 'ArchivoNarrow',
              ),
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70),
            child: Wrap(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 80,
              runSpacing: 60,
              children: [
                _buildDetailColumn("Driver's Licence Front",
                    widget.report["Driver's Licence Front"] ?? 'N/A'),
                _buildDetailColumn('Proof of Insurance:',
                    widget.report['Proof of Insurance:'] ?? 'N/A'),
                _buildDetailColumn(
                    'Photos of Damage/other related images:',
                    widget.report['Photos of Damage/other related images:'] ??
                        'N/A'),
                _buildDetailColumn(
                    "Photos of other driver's documents:",
                    widget.report["Photos of other driver's documents:"] ??
                        'N/A'),
                _buildDetailColumn(
                    "Obtained other driver's information?",
                    widget.report["Obtained other driver's information?"] ??
                        'N/A'),
              ],
            ),
          ),
          const SizedBox(height: 70),
          const Text(
            "Other Driver's Information",
            style: TextStyle(
              fontSize: 24,

              fontWeight: FontWeight.bold,
              //fontFamily: 'ArchivoNarrow',
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Wrap(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 80,
              runSpacing: 60,
              children: [
                _buildDetailColumn(
                    'Last Name', widget.report['Last Name'] ?? 'N/A'),
                _buildDetailColumn(
                    'First Name', widget.report['First Name'] ?? 'N/A'),
                _buildDetailColumn(
                    'Date of Birth', widget.report['Date of Birth'] ?? 'N/A'),
                _buildDetailColumn("Driver's Licence Number",
                    widget.report["Driver's Licence Number"] ?? 'N/A'),
                _buildDetailColumn(
                    "Province/State Driver's Licence Issued In:",
                    widget.report[
                            "Province/State Driver's Licence Issued In:"] ??
                        'N/A'),
                _buildDetailColumn(
                    "Country Driver's Licence Issued In:",
                    widget.report["Country Driver's Licence Issued In:"] ??
                        'N/A'),
                _buildDetailColumn("Type of Licence:",
                    widget.report["Type of Licence:"] ?? 'N/A'),
                _buildDetailColumn("Country of residence:",
                    widget.report["Country of residence:"] ?? 'N/A'),
                _buildDetailColumn(
                    'Address', widget.report['Address'] ?? 'N/A'),
                _buildDetailColumn('Apt #/Unit', widget.report[''] ?? 'N/A'),
                _buildDetailColumn('City/Town', widget.report[''] ?? 'N/A'),
                _buildDetailColumn(
                    'Province/State', widget.report[''] ?? 'N/A'),
                _buildDetailColumn(
                    'Postal Code/Zip Code', widget.report[''] ?? 'N/A'),
                _buildDetailColumn(
                    'Cell Phone Number', widget.report[''] ?? 'N/A'),
                _buildDetailColumn(
                    'Home Phone Number', widget.report[''] ?? 'N/A'),
                _buildDetailColumn(
                    'Business Phone Number', widget.report[''] ?? 'N/A'),
                _buildDetailColumn('Email', widget.report[''] ?? 'N/A'),
                _buildDetailColumn(
                    'Action at Time of Collision', widget.report[''] ?? 'N/A'),
                _buildDetailColumn(
                    'Wearing a seatbelt?', widget.report[''] ?? 'N/A'),
              ],
            ),
          ),
          const SizedBox(height: 70),
          const Text(
            "Other Driver's Vehicle Information",
            style: TextStyle(
              fontSize: 24,

              fontWeight: FontWeight.bold,
              //fontFamily: 'ArchivoNarrow',
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Wrap(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 80,
              runSpacing: 60,
              children: [
                _buildDetailColumn(
                    'Licence Plate', widget.report['Licence Plate'] ?? 'N/A'),
                _buildDetailColumn('Insurance Provider',
                    widget.report['Insurance Provider'] ?? 'N/A'),
                _buildDetailColumn(
                    'Policy Number', widget.report['Policy Number'] ?? 'N/A'),
                _buildDetailColumn(
                    "Vehicle Make", widget.report["Vehicle Make"] ?? 'N/A'),
                _buildDetailColumn(
                    "Vehicle Model", widget.report["Vehicle Model"] ?? 'N/A'),
                _buildDetailColumn(
                    "Vehicle Year", widget.report["Vehicle Year"] ?? 'N/A'),
                _buildDetailColumn(
                    'Vehicle Colour', widget.report['Vehicle Colour'] ?? 'N/A'),
              ],
            ),
          ),
          const SizedBox(height: 70),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 70),
            child: Text(
              "Area of Damage",
              style: TextStyle(
                fontSize: 22,

                fontWeight: FontWeight.bold,
                //fontFamily: 'ArchivoNarrow',
              ),
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70),
            child: Wrap(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 80,
              runSpacing: 60,
              children: [
                _buildDetailColumn(
                    'Vehicle towed?', widget.report['Vehicle towed?'] ?? 'N/A'),
                _buildDetailColumn('Towing company:',
                    widget.report['Towing company:'] ?? 'N/A'),
                _buildDetailColumn('Tow destination:',
                    widget.report['Tow destination:'] ?? 'N/A'),
                _buildDetailColumn('Was there a witness?',
                    widget.report['Was there a witness?'] ?? 'N/A'),
                _buildDetailColumn(
                    'Witness Name', widget.report['Witness Name'] ?? 'N/A'),
                _buildDetailColumn('Witness Phone Number',
                    widget.report['Witness Phone Number'] ?? 'N/A'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReportDetailsContainer() {
    return Container(
      width: 1000,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildReportDetailsColumns('Occurrence Number',
                  widget.report['Occurrence Number'].toString()),
              _buildAssigneeDropdown(widget.report),
              _buildReportDetailsColumns(
                  'Submission Date', widget.report['Submission Date']),
              _buildReportDetailsColumns(
                  'Follow up Date', widget.report['Follow up Date']),
              _buildStatusDropdown(),
            ],
          ),
          if (widget.report['Status'] == 'Approved - Pending Submission') ...{
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                width: 230,
                child: ElevatedButton(
                  onPressed: () {
                    // Implement push to Versadex functionality
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color.fromRGBO(0, 61, 121, 1), // Background color
                    padding: const EdgeInsets.symmetric(
                        vertical: 18.0, horizontal: 10.0),
                  ),
                  child: const Text(
                    'PUSH TO VERSADEX',
                    style: TextStyle(
                      color: Colors.white, // White text
                      letterSpacing:
                          1.5, // Adjust letter spacing for better readability in all caps
                    ),
                  ),
                ),
              ),
            )
          }
        ],
      ),
    );
  }

  // Widget _buildReportDetailsContainer() {
  //   return Container(
  //     width: 1000,
  //     padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(15),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.grey.withOpacity(0.3),
  //           spreadRadius: 2,
  //           blurRadius: 5,
  //           offset: const Offset(0, 3),
  //         ),
  //       ],
  //       border: Border.all(color: Colors.grey.shade300),
  //     ),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Text(
  //               'Occurrence Number:',
  //               style: TextStyle(
  //                 fontWeight: FontWeight.bold,
  //                 fontSize: 16,
  //               ),
  //             ),
  //             Text(
  //               'Assignee:',
  //               style: TextStyle(
  //                 fontWeight: FontWeight.bold,
  //                 fontSize: 16,
  //               ),
  //             ),
  //             Text(
  //               'Submission Date:',
  //               style: TextStyle(
  //                 fontWeight: FontWeight.bold,
  //                 fontSize: 16,
  //               ),
  //             ),
  //             Text(
  //               'Follow up Date:',
  //               style: TextStyle(
  //                 fontWeight: FontWeight.bold,
  //                 fontSize: 16,
  //               ),
  //             ),
  //             Text(
  //               'Status:',
  //               style: TextStyle(
  //                 fontWeight: FontWeight.bold,
  //                 fontSize: 16,
  //               ),
  //             ),
  //             // _buildDetailColumn('Occurrence Number',
  //             //     widget.report['Occurrence Number'].toString()),
  //             // _buildAssigneeDropdown(widget.report),
  //             // _buildDetailColumn(
  //             //     'Submission Date', widget.report['Submission Date']),
  //             // _buildDetailColumn(
  //             //     'Follow up Date', widget.report['Follow up Date']),
  //             // _buildStatusDropdown(),
  //           ],
  //         ),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Text(
  //               widget.report['Occurrence Number'].toString(),
  //               style: TextStyle(
  //                 fontSize: 16,
  //               ),
  //             ),
  //             DropdownButton<String>(
  //               value: widget.report['Assignee'],
  //               items:
  //                   assigneeItems.map<DropdownMenuItem<String>>((String value) {
  //                 return DropdownMenuItem<String>(
  //                   value: value,
  //                   child: Text(value),
  //                 );
  //               }).toList(),
  //               onChanged: (String? newValue) {
  //                 setState(() {
  //                   widget.report['Assignee'] = newValue!;
  //                 });
  //               },
  //             ),
  //             Text(
  //               widget.report['Submission Date'],
  //               style: TextStyle(
  //                 fontSize: 16,
  //               ),
  //             ),
  //             Text(
  //               widget.report['Follow up Date'],
  //               style: TextStyle(
  //                 fontSize: 16,
  //               ),
  //             ),
  //             CustomDropdownButton(
  //               value: widget.report['Status'],
  //               items: const [
  //                 'Open',
  //                 'In Progress',
  //                 'On Hold',
  //                 'Approved - Pending Submission',
  //                 'Completed - Sent to Versadex',
  //                 'Rejected'
  //               ],
  //               onChanged: (String? newValue) {
  //                 setState(() {
  //                   widget.report['Status'] = newValue!;
  //                 });
  //               },
  //             ),
  //           ],
  //         ),
  //         if (widget.report['Status'] == 'Approved - Pending Submission') ...{
  //           const SizedBox(height: 30),
  //           Center(
  //             child: SizedBox(
  //               width: 400,
  //               child: ElevatedButton(
  //                 onPressed: () {
  //                   // Implement push to Versadex functionality
  //                 },
  //                 style: ElevatedButton.styleFrom(
  //                   backgroundColor:
  //                       const Color.fromRGBO(0, 61, 121, 1), // Background color
  //                   padding: const EdgeInsets.symmetric(
  //                       vertical: 18.0, horizontal: 10.0),
  //                 ),
  //                 child: const Align(
  //                   alignment: Alignment.center,
  //                   child: Text(
  //                     'PUSH TO VERSADEX',
  //                     style: TextStyle(
  //                       color: Colors.white, // White text
  //                       letterSpacing:
  //                           1.5, // Adjust letter spacing for better readability in all caps
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           )
  //         }
  //       ],
  //     ),
  //   );
  // }

  Widget _buildDetailColumn(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade700,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          value,
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildReportDetailsColumns(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          value,
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Text('$label: ', style: TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }

  Widget _buildAssigneeDropdown(Map<String, dynamic> report) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            'Assignee',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          DropdownButton<String>(
            value: report['Assignee'],
            items: assigneeItems.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                report['Assignee'] = newValue!;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildStatusDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        const Text(
          'Status',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 14),
        CustomDropdownButton(
          value: widget.report['Status'],
          items: const [
            'Open',
            'In Progress',
            'On Hold',
            'Approved - Pending Submission',
            'Completed - Sent to Versadex',
            'Rejected'
          ],
          onChanged: (String? newValue) {
            setState(() {
              widget.report['Status'] = newValue!;
            });
          },
        ),
      ],
    );
  }
}
