import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class homeAja extends StatefulWidget {
  const homeAja({super.key});

  @override
  State<homeAja> createState() => _homeAjaState();
}

class _homeAjaState extends State<homeAja> {
  final webViewController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {
          debugPrint("on page : $url");
        },
        onPageFinished: (String url) {
          debugPrint("on page : $url");
        },
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url
              .startsWith('https://www.youtube.com/,instagram.com')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse('https://annur2.net'));

  @override
  Widget build(BuildContext context) {
    return PopScope(
      
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) {
          return print("Keluar dari Aplikasi");
        } else {
          return webViewController.goBack();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Website"),
        ),
        body: WebViewWidget(
          
          controller: webViewController),
      ),
    );
  }
}
