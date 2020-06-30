import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Window 2.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.12

ApplicationWindow {
    visible: true
    width: 480
    height: 640
    title: qsTr("Tabs")

    SwipeView {
        id: swipeView
        anchors.fill: parent
        //currentIndex: tabBar.currentIndex

        Page{
            id: page1
            header:
                ToolBar{
                anchors.top: parent.top
                background: Rectangle{
                    implicitHeight: 50
                    width: parent.width
                    color: "#727cf5"
                    Image{
                        id:hmg4
                        source: "qrc:/exam.png"
                        //anchors.right: txt4.left
                        anchors.rightMargin: 6
                        width: 30
                        height: 20
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left

                    }
                    Text {
                        id: txt4
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.pointSize: 16
                        font.family: "Helvetica"
                        font.italic: true
                        color: "black"
                        text: "Заметки"

                    }

                }
            }
ColumnLayout{
    anchors.fill: parent
            GridView{
                id: grid
                visible: true
                Layout.fillHeight: true
                Layout.fillWidth: true
                enabled: true
                clip: true
                anchors.margins: 10
                cellHeight: 150
                cellWidth: 150



                //spacing: 10

                delegate: Item {
                    height: grid.cellHeight
                    width: grid.cellWidth

                    Rectangle{
                    color: "#57bfff"
                    anchors.fill: parent
    //                height: grid.cellHeight
    //                width: grid.cellWidth
                    border.color: "#2baeff"
                    anchors.margins: 5
                    border.width: 2
                    radius: 10
                    ColumnLayout{
                            anchors.fill: parent
//                            Rectangle{
//                                id:rect
//                                border.color: "grey"
//                                radius: 2
                            Label{ // заголовок
                                color: "black"
                                text: model_head
                                Layout.fillHeight: true
                                Layout.preferredWidth: 100
                                Layout.margins: 20
                                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                            }
                           // }
                            Label{ // Описание
                                color: "black"
                                text: model_body
                                Layout.fillHeight: true
                                Layout.preferredWidth: 100
                                Layout.margins: 20
                                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                            }

                    }
                    }
                }
                model: ListModel{
                    id: model_exam
                    ListElement{

                        model_head: "Заголовок 1"
                        model_body: "10:00 11 июн 2020"
                    }
                    ListElement{

                        model_head: "Заголовок 2"
                        model_body: "10:01 11 июн 2020"
                    }

                }


            }//gv
}
            Button{
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                anchors.margins: 15
                Material.background: Material.Cyan
                text: "+"

                    onClicked: swipeView.currentIndex = 1

            }
        }
        Page{
            id: page2
            header:
                ToolBar{
                anchors.top: parent.top
                background: Rectangle{
                    implicitHeight: 50
                    width: parent.width
                    color: "#727cf5"
                    Button{
                        id:hmg42
                        //source: "qrc:/exam.png"
                        //anchors.right: txt4.left
                        anchors.rightMargin: 6
                        width: 70
                        height: 50
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        //icon.source:  "qrc:/exam2.png"
                        text:"<-"
                        flat:true
                        font.bold: true
                        Material.foreground: "black"
                        anchors.margins: 5

                            onClicked:{
                                swipeView.currentIndex = 0
                                txtedit.clear();
                                txtArea.clear();

                       }


                    }
                    Text {
                        id: txt42
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.pointSize: 16
                        font.family: "Helvetica"
                        font.italic: true
                        color: "black"
                        text: "Редактирование"

                    }

                }
            }
            ColumnLayout{
                anchors.fill: parent
                Button{
                    id:btn2
                    Material.background: Material.Cyan
                    text: "Сохранить"
                    anchors.right: parent.right
                    anchors.margins: 15
                    onClicked: {
                        model_exam.append({"model_head" : txtedit.text,
                                          "model_body": txtArea.text});
                        txtedit.clear();
                        txtArea.clear();
                    }

                }
                Text{
                    id: txt21
                    text: "Заголовок:"
                    font.pixelSize: 20
                    Layout.leftMargin: 15
                }
                TextField{
                    placeholderText: qsTr("Заголовок заметки")
                    id: txtedit
                    Layout.fillWidth: true
                    Layout.margins: 15
                    wrapMode: Text.WrapAtWordBoundaryOrAnywhere

                }
                Text{
                    id: txt22
                    text: "Текст Заметки"
                    font.pixelSize: 20
                    Layout.leftMargin: 15
                }
                TextArea{
                    id:txtArea
                    placeholderText: qsTr("Заметка")
                    Layout.fillHeight: true
                    font.pixelSize: 14
                    Layout.margins: 15
                    //Layout.fillWidth: true
                    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                    Layout.preferredWidth:   Math.round(parent.width * 0.92)

                }

            }

        }


    }

//    footer: TabBar {
//        id: tabBar
//        currentIndex: swipeView.currentIndex

//        TabButton {
//            text: qsTr("Page 1")
//        }
//        TabButton {
//            text: qsTr("Page 2")
//        }
//    }

    Drawer{
        id: dr1
        width: parent.width * 0.5
        height: parent.height
        dragMargin: 50
        ColumnLayout{
            anchors.fill: parent
            Text{
                id:txtdr1
                text: "Заметки"
                font.pixelSize: 5 * Screen.pixelDensity
                //anchors.horizontalCenter: parent.horizontalCenter
            }
            Text{
               id:txtdr2
               text: "Экзамеционное задание"
              // wrapMode: Text.WordWrap
               //readOnly: true
            }
            Image{
                id:imgdr1
            }
            Text{
                id:txtdr3
                text: "Автор: "
            }
            Text{
                id: txtdr4
                text: "Ссылка"
            }

        }


    }
}
