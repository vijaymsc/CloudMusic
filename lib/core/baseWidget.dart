import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseWidget<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child) builder;
  final Widget? child;
  final T model;
  final Function(T)? onModelReady;
  const BaseWidget(
      {Key? key,
      required this.builder,
      this.child,
      required this.model,
      this.onModelReady})
      : super(key: key);
  @override
  _BaseWidgetState<T> createState() => _BaseWidgetState<T>();
}

class _BaseWidgetState<T extends ChangeNotifier> extends State<BaseWidget<T>> {
  late BuildContext buildContext;
  late T model;

  @override
  void initState() {
    model = widget.model;
    if (widget.onModelReady != null) {
      widget.onModelReady!(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    buildContext = context;
    return ChangeNotifierProvider<T>(
        create: (context) => model,
        child: Consumer<T>(
          builder: widget.builder,
          child: widget.child,
        ));
  }
}

class ModelView<T extends ChangeNotifier> extends StatefulWidget {
  const ModelView({Key? key}) : super(key: key);

  @override
  ModelViewState<T> createState() => ModelViewState<T>();
}

class ModelViewState<T extends ChangeNotifier> extends State<ModelView<T>> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement buildr
    return const Placeholder();
  }
}
