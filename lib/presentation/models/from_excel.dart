import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../common/custom_pluto_column.dart';
import '../resources/color_manager.dart';
import '../resources/responsive.dart';
import '../resources/styles_manager.dart';

class OrderFromExcel {
  int? serial;
  String? reciverName;
  int? reciverPhone;
  String? reciverNote;
  String? city;
  String? area;
  String? address;
  String? orderContent;
  int? ordQty;
  int? orderAmt;

  OrderFromExcel(
      {this.serial,
        this.reciverName,
        this.reciverPhone,
        this.reciverNote,
        this.city,
        this.area,
        this.address,
        this.orderContent,
        this.ordQty,
        this.orderAmt});

  OrderFromExcel.fromJson(Map<String, dynamic> json) {
    serial = json['Serial'];
    reciverName = json['Reciver name'];
    reciverPhone = json['Reciver phone'];
    reciverNote = json['Reciver note'];
    city = json['City'];
    area = json['Area'];
    address = json['Address'];
    orderContent = json['Order_Content'];
    ordQty = json['Ord_Qty'];
    orderAmt = json['Order_Amt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Serial'] = serial;
    data['Reciver name'] = reciverName;
    data['Reciver phone'] = reciverPhone;
    data['Reciver note'] = reciverNote;
    data['City'] = city;
    data['Area'] = area;
    data['Address'] = address;
    data['Order_Content'] = orderContent;
    data['Ord_Qty'] = ordQty;
    data['Order_Amt'] = orderAmt;
    return data;
  }



  Map<String, PlutoCell> _row(OrderFromExcel model) {
    return {
      'no': PlutoCell(value: ''),
      'name': PlutoCell(value: '${model.reciverName}'),
      'phone': PlutoCell(value: '${model.reciverPhone}'),
      'location': PlutoCell(value: '${model.city} - ${model.area}\n${model.address}'),
      'content': PlutoCell(value: '${model.orderContent}'),
      'Ord_Qty': PlutoCell(value: '${model.ordQty}'),
      'Order_Amt': PlutoCell(value: '${model.orderAmt}'),
      'details': PlutoCell(value: '${model.reciverNote}'),



      'action': PlutoCell(value: '${model.serial}'),
      'final': PlutoCell(value: ''),
    };
  }

  List<PlutoRow> getRows(List<OrderFromExcel> mList) {
    return mList.map((e) => PlutoRow(cells: _row(e))).toList();
  }

  List<PlutoColumn> getColumns(BuildContext context) {
    return [
      customPlutoColumn(title: '#', field: 'no', width: 50,
          renderer: (c) {
            return Align(
              alignment: Alignment.center,
              child: Text(
                ( c.rowIdx+1).toString(),
                maxLines: 2,
                style: getMediumStyle(color: ColorManager.darkGrey),
              ),
            );
          }),


      customPlutoColumn(title: 'اسم المستلم', field: 'name', width:  140  ),
      customPlutoColumn(title: 'رقم هاتف', field: 'phone', width:   140 ),
      customPlutoColumn(title: 'المدينة-المنطقة / العنون', field: 'location', width:   220 ),
      customPlutoColumn(title: 'محتوي الشحنة', field: 'content', width:   220 ),
      customPlutoColumn(title: 'عدد العناصر', field: 'Ord_Qty', width:   100 ),
      customPlutoColumn(title: 'اجمالي السعر', field: 'Order_Amt', width:   100 ),
      customPlutoColumn(title: 'تفاصيل اضافيه', field: 'details', width:   140 ),

      customPlutoColumn(
          title: 'خيارات',
          field: 'action',
          width:110,
          renderer: (c) {
            return Align(
              alignment: Alignment.center,
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                IconButton(
                  icon: const Icon(
                    Icons.edit,
                  ),
                  onPressed: () {},
                  iconSize: 18,
                  color: Colors.green,
                  padding: const EdgeInsets.all(0),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.delete_forever,
                  ),
                  onPressed: () {
                    print(c.cell.value.toString());
                  },
                  iconSize: 18,
                  color: Colors.red,
                  padding: const EdgeInsets.all(0),
                )
              ]),
            );
          }),
      customPlutoColumn(title: '', field: 'final', width: 0),
    ];
  }
}