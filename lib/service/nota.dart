import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_laundry/widgets/toast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pf;
import 'package:printing/printing.dart';

import 'date-formater.dart';
import 'money-formater.dart';

class Nota {
  Future create(BuildContext context, AsyncSnapshot snapshot) async {
    try {
      final pdf = pf.Document();
      final fontN = await PdfGoogleFonts.poppinsLight();
      final fontB = await PdfGoogleFonts.poppinsBold();
      final logoImage = await networkImage(
          'https://firebasestorage.googleapis.com/v0/b/golaundry-353cc.appspot.com/o/Images%2FLogo%2FApp%2Fgo-laundry-icon.png?alt=media&token=5a387e4f-113c-43f5-937b-95d9bf78211e');

      pdf.addPage(
        pf.Page(
            pageFormat: PdfPageFormat.roll57,
            build: (pf.Context context) {
              return pf.Container(
                color: PdfColors.white,
                child: pf.Column(
                  children: [
                    pf.Image(logoImage, height: 30),
                    pf.Text(
                      'Go-Laundry',
                      style: pf.TextStyle(
                        font: fontB,
                        fontSize: 10,
                        color: PdfColors.black,
                        fontWeight: pf.FontWeight.bold,
                      ),
                    ),
                    pf.Divider(
                      color: PdfColors.black,
                    ),
                    pf.SizedBox(
                      height: 5,
                    ),
                    pf.Row(
                      crossAxisAlignment: pf.CrossAxisAlignment.start,
                      mainAxisAlignment: pf.MainAxisAlignment.start,
                      children: [
                        pf.Column(
                          crossAxisAlignment: pf.CrossAxisAlignment.start,
                          mainAxisAlignment: pf.MainAxisAlignment.start,
                          children: [
                            pf.Text(
                              'Nama',
                              style: pf.TextStyle(
                                font: fontN,
                                fontSize: 8,
                                color: PdfColors.black,
                                fontWeight: pf.FontWeight.normal,
                              ),
                            ),
                            pf.Text(
                              'Pesan',
                              style: pf.TextStyle(
                                font: fontN,
                                fontSize: 8,
                                color: PdfColors.black,
                                fontWeight: pf.FontWeight.normal,
                              ),
                            ),
                            pf.Text(
                              'Ambil',
                              style: pf.TextStyle(
                                font: fontN,
                                fontSize: 8,
                                color: PdfColors.black,
                                fontWeight: pf.FontWeight.normal,
                              ),
                            ),
                            pf.Text(
                              'Jenis',
                              style: pf.TextStyle(
                                font: fontN,
                                fontSize: 8,
                                color: PdfColors.black,
                                fontWeight: pf.FontWeight.normal,
                              ),
                            ),
                            pf.Text(
                              'Berat',
                              style: pf.TextStyle(
                                font: fontN,
                                fontSize: 8,
                                color: PdfColors.black,
                                fontWeight: pf.FontWeight.normal,
                              ),
                            ),
                            pf.Text(
                              'Harga/Kg',
                              style: pf.TextStyle(
                                font: fontN,
                                fontSize: 8,
                                color: PdfColors.black,
                                fontWeight: pf.FontWeight.normal,
                              ),
                            ),
                            pf.Text(
                              'Alamat',
                              style: pf.TextStyle(
                                font: fontN,
                                fontSize: 8,
                                color: PdfColors.black,
                                fontWeight: pf.FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        pf.Column(
                          crossAxisAlignment: pf.CrossAxisAlignment.start,
                          mainAxisAlignment: pf.MainAxisAlignment.start,
                          children: [
                            pf.Row(
                              children: [
                                pf.Text(
                                  ' : ',
                                  style: pf.TextStyle(
                                    font: fontN,
                                    fontSize: 8,
                                    color: PdfColors.black,
                                    fontWeight: pf.FontWeight.normal,
                                  ),
                                ),
                                pf.Text(
                                  snapshot.data.data()["orderName"],
                                  style: pf.TextStyle(
                                    font: fontB,
                                    fontSize: 8,
                                    color: PdfColors.black,
                                    fontWeight: pf.FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            pf.Row(
                              children: [
                                pf.Text(
                                  ' : ',
                                  style: pf.TextStyle(
                                    font: fontN,
                                    fontSize: 8,
                                    color: PdfColors.black,
                                    fontWeight: pf.FontWeight.normal,
                                  ),
                                ),
                                pf.Text(
                                  dateFormater_2(snapshot.data
                                      .data()["orderTime"]
                                      .toDate()),
                                  style: pf.TextStyle(
                                    font: fontB,
                                    fontSize: 8,
                                    color: PdfColors.black,
                                    fontWeight: pf.FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            pf.Row(
                              children: [
                                pf.Text(
                                  ' : ',
                                  style: pf.TextStyle(
                                    font: fontN,
                                    fontSize: 8,
                                    color: PdfColors.black,
                                    fontWeight: pf.FontWeight.normal,
                                  ),
                                ),
                                pf.Text(
                                  snapshot.data.data()["orderTake"] != null
                                      ? dateFormater_2(snapshot.data
                                          .data()["orderTake"]
                                          .toDate())
                                      : "",
                                  style: pf.TextStyle(
                                    font: fontB,
                                    fontSize: 8,
                                    color: PdfColors.black,
                                    fontWeight: pf.FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            pf.Row(
                              children: [
                                pf.Text(
                                  ' : ',
                                  style: pf.TextStyle(
                                    font: fontN,
                                    fontSize: 8,
                                    color: PdfColors.black,
                                    fontWeight: pf.FontWeight.normal,
                                  ),
                                ),
                                pf.Text(
                                  "Laundry",
                                  style: pf.TextStyle(
                                    font: fontB,
                                    fontSize: 8,
                                    color: PdfColors.black,
                                    fontWeight: pf.FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            pf.Row(
                              children: [
                                pf.Text(
                                  ' : ',
                                  style: pf.TextStyle(
                                    font: fontN,
                                    fontSize: 8,
                                    color: PdfColors.black,
                                    fontWeight: pf.FontWeight.normal,
                                  ),
                                ),
                                pf.Text(
                                  "${snapshot.data.data()["orderMass"]} Kg",
                                  style: pf.TextStyle(
                                    font: fontB,
                                    fontSize: 8,
                                    color: PdfColors.black,
                                    fontWeight: pf.FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            pf.Row(
                              children: [
                                pf.Text(
                                  ' : ',
                                  style: pf.TextStyle(
                                    font: fontN,
                                    fontSize: 8,
                                    color: PdfColors.black,
                                    fontWeight: pf.FontWeight.normal,
                                  ),
                                ),
                                pf.Text(
                                  moneyFormater(
                                      snapshot.data.data()["orderPermass"]),
                                  style: pf.TextStyle(
                                    font: fontB,
                                    fontSize: 8,
                                    color: PdfColors.black,
                                    fontWeight: pf.FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            pf.Row(
                              crossAxisAlignment: pf.CrossAxisAlignment.start,
                              mainAxisAlignment: pf.MainAxisAlignment.start,
                              children: [
                                pf.Text(
                                  ' : ',
                                  style: pf.TextStyle(
                                    font: fontN,
                                    fontSize: 8,
                                    color: PdfColors.black,
                                    fontWeight: pf.FontWeight.normal,
                                  ),
                                ),
                                pf.SizedBox(
                                  width: 90,
                                  height: 30,
                                  child: pf.Text(
                                    snapshot.data.data()["orderAddress"],
                                    // overflow: pf.TextOverflow.,
                                    textAlign: pf.TextAlign.justify,
                                    style: pf.TextStyle(
                                      font: fontB,
                                      fontSize: 8,
                                      color: PdfColors.black,
                                      fontWeight: pf.FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    pf.SizedBox(
                      height: 5,
                    ),
                    pf.Divider(
                      color: PdfColors.black,
                    ),
                    pf.SizedBox(
                      height: 5,
                    ),
                    pf.Row(
                      crossAxisAlignment: pf.CrossAxisAlignment.start,
                      mainAxisAlignment: pf.MainAxisAlignment.start,
                      children: [
                        pf.Text(
                          'Total',
                          style: pf.TextStyle(
                            font: fontN,
                            fontSize: 8,
                            color: PdfColors.black,
                            fontWeight: pf.FontWeight.normal,
                          ),
                        ),
                        pf.Text(
                          ' : ',
                          style: pf.TextStyle(
                            font: fontN,
                            fontSize: 8,
                            color: PdfColors.black,
                            fontWeight: pf.FontWeight.normal,
                          ),
                        ),
                        pf.Text(
                          moneyFormater(snapshot.data.data()["orderPrice"]),
                          style: pf.TextStyle(
                            font: fontB,
                            fontSize: 8,
                            color: PdfColors.black,
                            fontWeight: pf.FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
      );

      final output = (await getApplicationDocumentsDirectory()).path;
      var path = "$output/nota-laundry.pdf";
      final file = File(path);
      await file.writeAsBytes(await pdf.save());

      // await pdf.save().then((value) => Get().to(
      //       context,
      //       notaViewer(path),
      //     ));

      await Printing.layoutPdf(
          format: PdfPageFormat.roll57,
          onLayout: (PdfPageFormat format) async => pdf.save());

      // ignore: use_build_context_synchronously
    } catch (e) {
      toast(context, "Cetak nota gagal !\n $e");
      print(e);
    }
  }
}
