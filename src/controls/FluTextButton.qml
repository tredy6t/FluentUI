﻿import QtQuick 2.15
import QtQuick.Controls 2.15
import FluentUI 1.0

Button {

    property bool disabled: false

    property color normalColor: FluTheme.isDark ? FluTheme.primaryColor.lighter : FluTheme.primaryColor.dark
    property color hoverColor: FluTheme.isDark ? Qt.darker(normalColor,1.3) : Qt.lighter(normalColor,1.3)
    property color disableColor: FluTheme.isDark ? Qt.rgba(82/255,82/255,82/255,1) : Qt.rgba(199/255,199/255,199/255,1)
    property bool textBold: true

    id: control
    topPadding:5
    bottomPadding:5
    leftPadding:15
    rightPadding:15
    enabled: !disabled
    focusPolicy:Qt.TabFocus

    Keys.onSpacePressed: control.visualFocus&&clicked()

    background: Item{
        FluFocusRectangle{
            visible: control.visualFocus
            radius:8
        }
    }
    contentItem: FluText {
        text: control.text
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.bold: control.textBold
        color: {
            color:{
                if(disabled){
                    return disableColor
                }
                return hovered ? hoverColor :normalColor
            }
        }
    }
}
