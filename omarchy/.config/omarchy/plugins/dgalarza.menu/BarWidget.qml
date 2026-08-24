import QtQuick
import qs.Ui

BarWidget {
  id: root
  moduleName: "omarchy.menu"

  implicitWidth: button.implicitWidth
  implicitHeight: button.implicitHeight

  WidgetButton {
    id: button
    anchors.fill: parent
    bar: root.bar
    text: " "
    labelVisible: false
    hasVisualContent: true
    fixedWidth: 27
    horizontalMargin: 0
    tooltipText: "Open menu"
    clip: true

    Image {
      anchors.centerIn: parent
      width: 16
      height: 16
      source: Qt.resolvedUrl("assets/damian-galarza-logo-mark.svg")
      fillMode: Image.PreserveAspectFit
      smooth: true
      mipmap: true
    }

    onPressed: function(button) {
      if (!root.bar) return
      if (button === Qt.RightButton) root.bar.run("xdg-terminal-exec")
      else root.bar.run("omarchy-shell shell toggle omarchy.menu '{\"menu\":\"root\"}'")
    }
  }
}
