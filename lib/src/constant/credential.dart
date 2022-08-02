import 'dart:developer';

import 'package:connect_google_excel/src/API/api_variable.dart';
import 'package:connect_google_excel/src/constant/sheetscolumn.dart';
import 'package:connect_google_excel/src/home/display.dart';
import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';


class FlutterSheet {
  static const _credential = r"""
  --------------- Note: paste code from json file, which is given by google api ---------------
  """;

  static Worksheet?  _userSheet;

  static const _spredSheetId = "----------- Enter Spreadsheet Id from link Ex. https://docs.google.com/spreadsheets/d/-- Here is Id -- /edit#gid=0 -----------";

  static GSheets gsheets = GSheets(_credential);

  static Future init() async {
    try {
      final ss = await gsheets.spreadsheet(_spredSheetId);

      _userSheet = await _getWorksheet(spreadsheet: ss, title: "Sheet1");
      final firstRow = SheetsColumns.getColumns();
      _userSheet?.values.insertRow(1, firstRow);
      _userSheet?.values.allRows().then((value) => APIvariable.allData = value);
    } catch (e) {
      print("error -- " + e.toString());
    }
  }

  static Future<Worksheet?> _getWorksheet({
    required Spreadsheet spreadsheet,
    required String title
  }) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title);
    }
  }

  static Future insert(List<Map<String, dynamic>> rowList) async {
    print("--- $rowList");
    _userSheet?.values.map.appendRows(rowList);
  }

  static Future display() async {
    _userSheet?.values.allRows().then((value) => APIvariable.allData = value);
    // print("all data -- ${APIvariable.allData}");
  }

  static update(row, Map<String, dynamic> rowList) async {
    print("--- $rowList");
    _userSheet?.values.map.insertRow(row, rowList);
    await display();
  }

  static delete(id){
    _userSheet?.deleteRow(id);
  }

}
