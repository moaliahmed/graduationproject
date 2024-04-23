import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:graduation_project/calculator/component/text_form_fiels_component.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../core/color_manger.dart';
import '../../core/string_manager.dart';
import '../../crypto/domain/entities/crypto.dart';

class CalculatorTable extends StatefulWidget {
  const CalculatorTable({super.key, required this.currency});

  final List<Crypto> currency;

  @override
  State<CalculatorTable> createState() => _CalculatorTableState();
}

class _CalculatorTableState extends State<CalculatorTable> {
  TextEditingController numberController = TextEditingController();
  String input = '';

  @override
  Widget build(BuildContext context) {
    //print (numberController );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Coinmoney.png',
              color: Colors.white,
              height: 39,
            ),
            const Gap(10),
            Text(
              AppString.appName,
              style: TextStyle(
                  color: ColorManager.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            const Gap(55),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Gap(15),
            TextFormFieldComponent(
              onChanged: (p0) {
                setState(() {
                  input = p0;
                });
              },
              title: '',
              icons: Icons.currency_bitcoin_rounded,
              textEditingController: numberController,
            ),
            const Gap(20),
            Expanded(
                child: SfDataGrid(
              columns: buildGridColumns(),
              source: CurrencyDataSource(
                  currencies: widget.currency, numberController: input),
            ))
          ],
        ),
      ),
    );
  }
}

List<GridColumn> buildGridColumns() => <GridColumn>[
      GridColumn(
          columnName: CurrencyColumn.name.toString(),
          label: buildLabel('Name')),
      GridColumn(
          columnName: CurrencyColumn.dollar.toString(),
          label: buildLabel('Dollar')),
      GridColumn(
          columnName: CurrencyColumn.euro.toString(),
          label: buildLabel('Euro')),
      GridColumn(
          columnName: CurrencyColumn.yuan.toString(),
          label: buildLabel('Yuan')),
      GridColumn(
          columnName: CurrencyColumn.sar.toString(),
          label: buildLabel('Saudi Riyal')),
      GridColumn(
          columnName: CurrencyColumn.aed.toString(),
          label: buildLabel('Unit Arabia Emirates')),
      GridColumn(
          columnName: CurrencyColumn.aed.toString(),
          label: buildLabel('Pound sterling')),
      GridColumn(
          columnName: CurrencyColumn.aed.toString(),
          label: buildLabel('Kuwaiti Dinar')),
    ];

Widget buildLabel(String text) => Center(
        child: Text(
      text,
      overflow: TextOverflow.ellipsis,
    ));

enum CurrencyColumn { name, dollar, euro, yuan, sar, aed, gbp, kwd }

class CurrencyDataSource extends DataGridSource {
  late List<DataGridRow> _currency;
  String numberController;

  @override
  List<DataGridRow> get rows => _currency;

  CurrencyDataSource(
      {required List<Crypto> currencies, required this.numberController}) {
    buildDataGrid(currencies);
  }

  void buildDataGrid(List<Crypto> currencies) => _currency = currencies
      .map<DataGridRow>(
        (e) => DataGridRow(
            cells: CurrencyColumn.values
                .map(
                  (column) => DataGridCell<Crypto>(
                    columnName: column.toString(),
                    value: e,
                  ),
                )
                .toList()),
      )
      .toList();

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map((dataGridCell) {
      final Crypto crypto = dataGridCell.value;
      final column = CurrencyColumn.values
          .firstWhere((value) => value.toString() == dataGridCell.columnName);
      switch (column) {
        case CurrencyColumn.name:
          return buildIdRow(crypto);
        case CurrencyColumn.dollar:
          return buildDollarRow(crypto);
        case CurrencyColumn.euro:
          return buildEuroRow(crypto);
        case CurrencyColumn.yuan:
          return buildYuanRow(crypto);
        case CurrencyColumn.sar:
          return buildSARRow(crypto);
        case CurrencyColumn.aed:
          return buildAEDRow(crypto);
          case CurrencyColumn.gbp:
          return buildGBPRow(crypto);
          case CurrencyColumn.kwd:
          return buildKWDRow(crypto);
        default:
          return const Text('hello');
      }
    }).toList());
  }

  Widget buildIdRow(Crypto crypto) => Container(
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            Image.network(crypto.image!),
            const Gap(9),
            Expanded(
                child: Text(
              crypto.symbol!,
              style: TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
            )),
          ],
        ),
      );

  Widget buildDollarRow(Crypto crypto) {
    return numberController == ''
        ? Center(
            child: Text('${crypto.high24h!.toStringAsFixed(2)} \$'),
          )
        : Center(
            child: Text(
              (int.parse(numberController) * crypto.high24h!)
                  .toStringAsFixed(2),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          );
  }

  Widget buildEuroRow(Crypto crypto) {
    return numberController == ''
        ? Center(
            child: Text((crypto.high24h! * .92).toStringAsFixed(2)),
          )
        : Center(
            child: Text(
              (int.parse(numberController) * .92 * crypto.high24h!)
                  .toStringAsFixed(2),
            ),
          );
  }

  Widget buildYuanRow(Crypto crypto) {
    return numberController == ''
        ? Center(
            child: Text((crypto.high24h! * 7.2).toStringAsFixed(2)),
          )
        : Center(
            child: Text(
              ((int.parse(numberController) * 7.2) * crypto.high24h!)
                  .toStringAsFixed(2),
            ),
          );
  }

  Widget buildSARRow(Crypto crypto) {
    return numberController == ''
        ? Center(
            child: Text(
              (crypto.high24h! * 3.75).toStringAsFixed(2),
            ),
          )
        : Center(
            child: Text(
              ((int.parse(numberController) * 3.75) * crypto.high24h!)
                  .toStringAsFixed(2),
            ),
          );
  }

  Widget buildAEDRow(Crypto crypto) {
    return numberController == ''
        ? Center(
            child: Text(
              (crypto.high24h! * 3.68).toStringAsFixed(2),
            ),
          )
        : Center(
            child: Text(
              ((int.parse(numberController) * 3.68) * crypto.high24h!)
                  .toStringAsFixed(2),
            ),
          );
  }
  Widget buildGBPRow(Crypto crypto) {
    return numberController == ''
        ? Center(
            child: Text(
              (crypto.high24h! * .79).toStringAsFixed(2),
            ),
          )
        : Center(
            child: Text(
              ((int.parse(numberController) *.79) * crypto.high24h!)
                  .toStringAsFixed(2),
            ),
          );
  }
  Widget buildKWDRow(Crypto crypto) {
    return numberController == ''
        ? Center(
            child: Text(
              (crypto.high24h! * .31).toStringAsFixed(2),
            ),
          )
        : Center(
            child: Text(
              ((int.parse(numberController) *.31) * crypto.high24h!)
                  .toStringAsFixed(2),
            ),
          );
  }
}
