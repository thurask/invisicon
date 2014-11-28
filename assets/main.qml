import bb.cascades 1.4
import bb.platform 1.3
import bb.system 1.2

Page {
    attachedObjects: [
        HomeScreen {
            id: homeScreen
        },
        SystemToast {
            id: toast
            body: qsTr("Added!") + Retranslate.onLanguageChanged
        }
    ]
    Container {
        Button {
            text: qsTr("Add blank icon") + Retranslate.onLanguageChanged
            onClicked: {
                homeScreen.addShortcut("asset:///images/blank.png","\uFEFF","bogusuri://");
                //blank.png is a transparent PNG square
                // \uFEFF is the secret sauce character; appears as whitespace but isn't removed by the QString::simplify() inside addShortcut()
                //URI does nothing, unless tapping on blank icon is supposed to do something
                toast.show()
            }
            horizontalAlignment: HorizontalAlignment.Center
        }
    }
}
