module Windy::UI
class Window < Qt::Widget

  def initialize(parent = nil)
    super(parent)
    @quitButton = createButton(tr("&Quit"), SLOT('close()'))

    @connectionsLabel = Qt::Label.new
    @portLabel = Qt::Label.new(tr("Proxy port:"))
    @portText = createComboBox()

    createConnectionsTable()

    buttonsLayout = Qt::HBoxLayout.new
    buttonsLayout.addStretch()
    buttonsLayout.addWidget(@quitButton)

    mainLayout = Qt::GridLayout.new
    mainLayout.addWidget(@portLabel, 0, 0)
    mainLayout.addWidget(@portText, 0, 1, 1, 2)
    mainLayout.addWidget(@connectionsTable, 1, 0, 1, 3)
    mainLayout.addLayout(buttonsLayout, 2, 0, 1, 3)

    setLayout(mainLayout)
    setWindowTitle(tr("Windy"))
    resize(700, 300)
  end

  def createButton(text, member)
    button = Qt::PushButton.new(text)
    connect(button, SIGNAL('clicked()'), self, member)
    return button
  end

  def createComboBox(text = "")
    comboBox = Qt::ComboBox.new
    comboBox.editable = true
    comboBox.addItem(text)
    comboBox.setSizePolicy(Qt::SizePolicy::Expanding, Qt::SizePolicy::Preferred)
    return comboBox
  end

  def createConnectionsTable()
    @connectionsTable = Qt::TableWidget.new(0,4)
    labels = []
    labels << tr("URL") << tr("Verb") << tr("Local") << tr("Remote")
    @connectionsTable.horizontalHeaderLabels = labels
    @connectionsTable.horizontalHeader().setResizeMode(0, Qt::HeaderView::Stretch)
    @connectionsTable.verticalHeader().hide()
    @connectionsTable.showGrid = false
  end

end
end
