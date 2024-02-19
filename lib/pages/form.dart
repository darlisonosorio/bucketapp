import 'package:bucketapp/constants/images.dart';
import 'package:bucketapp/constants/texts.dart';
import 'package:bucketapp/model/jugmeasurer.dart';
import 'package:bucketapp/pages/result.dart';
import 'package:bucketapp/widgets/nosolutiondialog.dart';
import 'package:bucketapp/widgets/textfield.dart';
import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _xController = TextEditingController();
  final _yController = TextEditingController();
  final _zController = TextEditingController();

  _submit() {
    final measurer = JugMeasurer(
      x: int.parse(_xController.text),
      y: int.parse(_yController.text),
      z: int.parse(_zController.text),
    );

    if (measurer.bestSolution.isEmpty) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (contextDialog) => const NoSolutionDialog(),
      );
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ResultPage(measurer),
        ),
      );
    }
  }

  _imageAsset(String src) => Image.asset(src, fit: BoxFit.contain, width: 32);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Texts.appName),
        elevation: 2,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Center(
                child: Text(
                  Texts.typeTheGallonsCapacity,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              const SizedBox(height: 18.0),
              AppTextField(
                key: const Key('x_field'),
                icon: _imageAsset(Images.imgBucketX),
                label: Texts.labelBucketX,
                controller: _xController,
              ),
              const SizedBox(height: 18.0),
              AppTextField(
                key: const Key('y_field'),
                icon: _imageAsset(Images.imgBucketY),
                label: Texts.labelBucketY,
                controller: _yController,
              ),
              const SizedBox(height: 18.0),
              AppTextField(
                key: const Key('z_field'),
                icon: _imageAsset(Images.imgBucket),
                label: Texts.labelZ,
                controller: _zController,
              ),
              const SizedBox(height: 32.0),
              SizedBox(
                height: 40,
                child: ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyan,
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text(
                    Texts.btnCalculateSolution,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
