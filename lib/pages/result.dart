import 'package:bucketapp/constants/images.dart';
import 'package:bucketapp/constants/texts.dart';
import 'package:bucketapp/model/jugaction.dart';
import 'package:bucketapp/model/jugmeasurer.dart';
import 'package:bucketapp/model/jugstep.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  final JugMeasurer measurer;

  const ResultPage(this.measurer);

  @override
  State<StatefulWidget> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  _imageAsset(String src) => Image.asset(
        src,
        fit: BoxFit.contain,
        width: 34,
        height: 34,
      );

  _icon(JugAction action, bool condition) => SizedBox(
      width: 20,
      child: condition
          ? Icon(
              action.icon,
              color: action.color,
              size: 24,
            )
          : const SizedBox());

  _item({required Widget? child}) => Container(
        constraints: const BoxConstraints(minHeight: 42),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1.0, color: Colors.blueGrey),
          ),
        ),
        padding: const EdgeInsets.all(8),
        child: child,
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
              children: [
                const TextSpan(text: Texts.solutionFor),
                TextSpan(
                  text: ' X: ${widget.measurer.x} ',
                  style: const TextStyle(fontWeight: FontWeight.w800),
                ),
                TextSpan(
                  text: ' Y: ${widget.measurer.y} ',
                  style: const TextStyle(fontWeight: FontWeight.w800),
                ),
                TextSpan(
                  text: ' Z: ${widget.measurer.z} ',
                  style: const TextStyle(fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),
          elevation: 2,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _dataTable(widget.measurer.bestSolution),
              ],
            ),
          ),
        ),
      );

  _dataTable(List<JugStep> steps) {
    double bucketsSize = 72;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _item(
          child: Row(
            children: [
              SizedBox(
                width: bucketsSize,
                child: Row(
                  children: [
                    const SizedBox(width: 8),
                    _imageAsset(Images.imgBucketX),
                  ],
                ),
              ),
              const SizedBox(width: 24),
              SizedBox(
                width: bucketsSize,
                child: _imageAsset(Images.imgBucketY),
              ),
              const Expanded(
                child: Text(
                  Texts.steps,
                  style: TextStyle(fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        ...steps.map(
          (step) => _item(
            child: Row(
              children: [
                SizedBox(
                  width: bucketsSize,
                  child: Row(
                    children: [
                      _icon(
                        step.action,
                        (step.action == JugAction.fillX ||
                            step.action == JugAction.emptyX),
                      ),
                      Text(
                        '${step.x}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: step.x == widget.measurer.z
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 44,
                  child: Row(children: [
                    _icon(
                      step.action,
                      (step.action == JugAction.transferX ||
                          step.action == JugAction.transferY),
                    ),
                  ]),
                ),
                SizedBox(
                  width: bucketsSize,
                  child: Row(
                    children: [
                      Text(
                        '${step.y}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: step.y == widget.measurer.z
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                      _icon(
                        step.action,
                        (step.action == JugAction.fillY ||
                            step.action == JugAction.emptyY),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "  ${step.action.text} ",
                        ),
                        if (steps.indexOf(step) == steps.length - 1)
                          const TextSpan(
                            text: Texts.solved,
                            style: TextStyle(fontWeight: FontWeight.w900),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
