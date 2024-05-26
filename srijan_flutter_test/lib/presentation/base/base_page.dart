import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:srijan_flutter_test/generated/l10n.dart';
import 'package:srijan_flutter_test/presentation/base/base_page_extensions.dart';
import 'package:srijan_flutter_test/presentation/base/base_page_state.dart';
import 'package:srijan_flutter_test/presentation/base/base_page_view_model.dart';
import 'package:srijan_flutter_test/presentation/base/base_widget.dart';
import 'package:srijan_flutter_test/presentation/utils/error_parser.dart';

/// Every Page/View should be inherited from this
abstract class BasePage<VM extends BasePageViewModel> extends StatefulWidget {
  const BasePage({super.key});
}

abstract class BasePageState<VM extends BasePageViewModel,
    T extends BasePage<VM>> extends CoreBasePageState<VM, T> {
  /// Declare and initialization of viewModel for the page
  ProviderBase<VM> provideBase();
}

abstract class BaseStatefulPage<VM extends BasePageViewModel,
    B extends BasePage<VM>> extends BasePageState<VM, B> {
  @override
  void onBaseModelReady(VM model) {
    super.onBaseModelReady(model);
    model.error.listen((event) {
      showShortToast(
        ErrorParser.getLocalisedStringError(
          error: event,
          localisedHelper: S.of(context),
        ),
      );
    });
    model.toast.listen((message) {
      showShortToast(message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<VM>(
        providerBase: provideBase(),
        onModelReady: onBaseModelReady,
        builder: (BuildContext context, VM? model, Widget? child) {
          return getLayout();
        });
  }
}

abstract class BasePageViewWidget<T extends BasePageViewModel> extends Widget {
  final ProviderBase<T> providerBase;

  const BasePageViewWidget(this.providerBase, {super.key});

  @protected
  Widget build(BuildContext context, T model);

  @override
  DataProviderElement<T> createElement() => DataProviderElement<T>(
        this,
        providerBase,
      );
}

class DataProviderElement<T extends BasePageViewModel>
    extends ComponentElement {
  final ProviderBase<T> providerBase;

  DataProviderElement(
    BasePageViewWidget<T> super.widget,
    this.providerBase,
  );

  @override
  BasePageViewWidget<T> get widget => super.widget as BasePageViewWidget<T>;

  @override
  Widget build() {
    return BaseWidget<T>(
      providerBase: providerBase,
      builder: (context, model, child) {
        return widget.build(this, model!);
      },
    );
  }
}
