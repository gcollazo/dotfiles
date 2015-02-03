{CompositeDisposable} = require 'atom'

module.exports = Overscroll =
  activate: (state) ->
    @cd = new CompositeDisposable

    @cd.add atom.workspace.observeTextEditors (editor) =>
      return if editor.mini

      editor.displayBuffer.getScrollHeight = ->
        lineHeight = @getLineHeightInPixels()
        return 0 unless lineHeight > 0

        scrollHeight = (50 + @getLineCount()) * lineHeight
        if @height? and @configSettings.scrollPastEnd
          scrollHeight = scrollHeight + @height - (lineHeight * 3)

        scrollHeight

      editor.displayBuffer.getVisibleRowRange = ->
        return [0, 0] unless @getLineHeightInPixels() > 0

        heightInLines = Math.ceil(@getHeight() / @getLineHeightInPixels()) + 1
        startRow = Math.min(@getLineCount(), Math.floor(@getScrollTop() / @getLineHeightInPixels()))
        endRow = Math.min(@getLineCount(), startRow + heightInLines)

        [startRow, endRow]


  deactivate: ->
    @cd.dispose()
