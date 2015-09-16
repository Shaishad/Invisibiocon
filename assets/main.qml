/*
 * Copyright (c) 2011-2015 BlackBerry Limited.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import bb.cascades 1.4
import bb.platform 1.3
import bb.system 1.2

Page {
    Menu.definition: MenuDefinition {
        actions: [
            ActionItem {
                title: "Share App"
                imageSource: "asset:///images/share-2-icon.png"
                attachedObjects: [
                    Invocation {
                        id: share
                        query: InvokeQuery {
                            mimeType: "text/plain"
                            data: "I invite you to download the Invisibicon. It creates the invisible icons on Home screen. Download Now http://appworld.blackberry.com/webstore/content/59963491"
                        }
                    }
                ]
                onTriggered: {
                    share.trigger("bb.action.SHARE")
                }
            },
            ActionItem {
                title: "Wallz Wall"
                imageSource: "asset:///images/balanced-icon-flat.png"
                onTriggered: {
                    homeScreen.setWallpaper("asset:///wallz/wallz.jpg")
                }
            },
            ActionItem {
                title: "Invis Wall"
                imageSource: "asset:///images/awesome-info.png"
                onTriggered: {
                    homeScreen.setWallpaper("asset:///wallz/Screen.png")
                }
                
            },
            ActionItem {
                title: "BBM Channel"
                imageSource: "asset:///images/head_channels.png"
                attachedObjects:[
                    Invocation {
                        id: bbm
                        query: InvokeQuery {
                            mimeType: "channel/bbm"
                            uri: "bbmc:C003AB450"
                        }
                    }
                ]
                
                onTriggered: {
                    bbm.trigger("bb.action.OPENBBMCHANNEL")
                }
            }
        ]
    }
    attachedObjects: [
        HomeScreen {
            id: homeScreen
        },
        SystemToast {
            id: toast
            body: qsTr("Added!") + Retranslate.onLanguageChanged
        }
    ]
    titleBar: TitleBar {
        title: "Invisibicon"

    }
    Container {
        verticalAlignment: VerticalAlignment.Center

        horizontalAlignment: HorizontalAlignment.Center
        layout: DockLayout {

        }
        Button {
            text: qsTr("Add blank icon") + Retranslate.onLanguageChanged
            onClicked: {
                homeScreen.addShortcut("asset:///images/blank.png", "\uFEFF", "bogusuri://");
                toast.show()
            }
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
            color: Color.DarkGreen
            scaleX: 2.0
            scaleY: 2.0
        }
    }
    
    actions: [
        ActionItem {
            ActionBar.placement: ActionBarPlacement.Signature
            imageSource: "asset:///images/i.png"
            title: "About"
            attachedObjects: [
                Sheet {
                    id: sheet
                    
                    Page {
                        titleBar: TitleBar {
                            title: qsTr("About")
                            dismissAction: ActionItem {
                                title: "Back"
                                onTriggered: {
                                    sheet.close()
                                }
                            }
                        
                        }
                        Container {
                            layout: StackLayout {
                                orientation: LayoutOrientation.TopToBottom
                            
                            }
                            ImageView {
                                imageSource: "asset:///images/awesome-info.png"
                                scalingMethod: ScalingMethod.AspectFit
                                verticalAlignment: VerticalAlignment.Center
                                horizontalAlignment: HorizontalAlignment.Center

                            }
                            Label {
                                multiline: true
                                textFormat: TextFormat.Auto
                                text: "About"
                                verticalAlignment: VerticalAlignment.Center
                                horizontalAlignment: HorizontalAlignment.Center
                                textStyle.textAlign: TextAlign.Center
                                textStyle.fontSize: FontSize.Medium
                                textStyle.fontStyle: FontStyle.Normal
                                textStyle.fontWeight: FontWeight.Bold

                            }
                            Label {
                                textStyle.textAlign: TextAlign.Center
                                text: "© 2015 Invisibicon. By Shaishad"
                                verticalAlignment: VerticalAlignment.Center
                                horizontalAlignment: HorizontalAlignment.Center
                              

                            }
                            Label {
                                text: qsTr("This App Helps you or makes a Invisible Icon on your Home Screen and with out any name or app support. \r\nThanks for Downloading\r\nHope you like it\r\n\r\n Follow Me <html> <a href='http://twitter.com/syedshaishad'>Twitter</a></html> <html> <a href='http://instagram.com/syedshaishad'>Instagram</a></html>")
                                multiline: true
                                textFormat: TextFormat.Html
                                verticalAlignment: VerticalAlignment.Center
                                horizontalAlignment: HorizontalAlignment.Center
                                
                                textStyle.textAlign: TextAlign.Center

                            }

                        }
                    }

                }
            ]
            onTriggered: {

                sheet.open()
            }

        },
        ActionItem {
            title: "Rate App"
            ActionBar.placement: ActionBarPlacement.OnBar
            attachedObjects: [
                Invocation {
                    id: rapp
                    query: InvokeQuery {
                        mimeType: "review/appworld"
                        uri: "appworld://content/59963491"
                        invokeTargetId: "sys.appworld"

                    }

                }
            ]
            onTriggered: {
                rapp.trigger("bb.action.OPEN")
            }
            imageSource: "asset:///images/star-icon-vector.jpg"

        },
        ActionItem {
            title: "More App"
            ActionBar.placement: ActionBarPlacement.OnBar
            attachedObjects: [
                Invocation {
                    id: mapps
                    query: InvokeQuery {
                        invokeTargetId: "sys.appworld"
                        uri: "appworld://vendor/93696"
                        mimeType: "vendor/appworld"
                        invokeActionId: ""
                    }
                }
            ]
            onTriggered: {
                mapps.trigger("bb.action.OPEN")
            }
            imageSource: "asset:///images/logo_blackberryworld.png"

        }
    ]
}