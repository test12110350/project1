import 'package:flutter/material.dart';

void main() => runApp(const SalaryCalculatorApp());

class SalaryCalculatorApp extends StatelessWidget {
  const SalaryCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SalaryCalculatorScreen(),
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        scaffoldBackgroundColor: Colors.blueGrey[100],
      ),
    );
  }
}

class SalaryCalculatorScreen extends StatefulWidget {
  const SalaryCalculatorScreen({super.key});

  @override
  _SalaryCalculatorScreenState createState() => _SalaryCalculatorScreenState();
}

class _SalaryCalculatorScreenState extends State<SalaryCalculatorScreen> {
  final TextEditingController basicSalaryController = TextEditingController();
  final TextEditingController taxesController = TextEditingController();
  final TextEditingController nssfController = TextEditingController();
  final TextEditingController costOfLivingAllowanceController = TextEditingController();
  final TextEditingController transportationController = TextEditingController();
  double netSalary = 0.0;

  void calculateNetSalary() {
    int basicSalary = int.tryParse(basicSalaryController.text) ?? 0;
    double taxPercentage = double.tryParse(taxesController.text) ?? 0.0;
    int nssf = int.tryParse(nssfController.text) ?? 0;
    int costOfLivingAllowance = int.tryParse(costOfLivingAllowanceController.text) ?? 0;
    int transportation = int.tryParse(transportationController.text) ?? 0;

    double taxAmount = (basicSalary * taxPercentage) / 100.0;
    double totalDeductions = taxAmount + nssf;
    double netSalaryAfterDeductions = basicSalary - totalDeductions;
    netSalary = netSalaryAfterDeductions + costOfLivingAllowance + transportation;
    setState(() {});
  }

  void resetFields() {
    basicSalaryController.clear();
    taxesController.clear();
    nssfController.clear();
    costOfLivingAllowanceController.clear();
    transportationController.clear();
    netSalary = 0.0;
    setState(() {});
  }
//build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Payroll & Tax Calculator'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200.0,
                  child: TextField(
                    controller: basicSalaryController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Basic Salary',
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: 200.0,
                  child: TextField(
                    controller: taxesController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Taxes (%)',
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: 200.0,
                  child: TextField(
                    controller: nssfController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'NSSF',
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: 200.0,
                  child: TextField(
                    controller: costOfLivingAllowanceController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Cost of Living Allowance',
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: 200.0,
                  child: TextField(
                    controller: transportationController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Transportation',
                    ),
                  ),
                ),
                const SizedBox(height: 32.0),
                ElevatedButton(
                  onPressed: calculateNetSalary,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  child: const Text('Calculate'),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: resetFields,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black, backgroundColor: Colors.white,
                  ),
                  child: const Text('Reset'),
                ),
                const SizedBox(height: 32.0),
                Container(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Net Salary: $netSalary',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}