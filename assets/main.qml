/*
* Shaishad copyrights 2015
 */

import bb.cascades 1.4
import bb.platform 1.3
import bb.system 1.2

Page {
    //--------------------- Add this following code---------------------------------//
    attachedObjects: [
        HomeScreen {
            id: homeScreen
        },
        SystemToast {
            id: toast
            body: qsTr("Added!") + Retranslate.onLanguageChanged
        }
    ]
    //-------------------------------Add this too----------------------------------------//
    titleBar: TitleBar {
        title: "Invisibicon"

    }
    Container {
        verticalAlignment: VerticalAlignment.Center

        horizontalAlignment: HorizontalAlignment.Center
        layout: DockLayout {

        }
        //-----------------------------Copy This code ---------------------------------------//
        Button {
            text: qsTr("Add blank icon") + Retranslate.onLanguageChanged
            onClicked: {
                homeScreen.addShortcut("asset:///images/blank.png", "\uFEFF", "bogusuri://");
                toast.show()
            }
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
        }
        //-----------------------------------------ends here---------------------------------------------//
    }
    
    
}
