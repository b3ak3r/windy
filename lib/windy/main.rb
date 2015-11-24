require 'Qt'
require 'windy/ui'

app = Qt::Application.new(ARGV)
window = Windy::UI::Window.new
window.show
app.exec
