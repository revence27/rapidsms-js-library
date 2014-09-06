$(() ->
  clt = new ClientSide(document)
  clt.activateDates 'activedate'
  deleteableColumns()
  # jigTheElements('.graphicard img', 20)
  condenseNavBar()
)

condenseNavBar = () ->
  nav = $('#navbar')
  nnv = $('<a class="navholder">Show Navigation</a>')
  nnv.hide()
  nnv.click(() ->
    nnv.hide('fast', () ->
      nav.show('fast')
    )
  )
  nav.parent().append(nnv)
  nav.hide('slow', () ->
    nnv.show()
  )

jigTheElements = (sel, deg) ->
  dem = $(sel)
  for it in dem
    got = $(it)
    cur = (deg / 2) - Math.floor(Math.random() * deg)
    got.css('transform', "rotate(#{cur}deg)")

deleteableColumns = () ->
  for t, i in $('.largetable thead th')
    td  = $(t)
    hd  = $('<a class="hider" href="javascript://dio.1st.ug/">x</a>')
    hd.attr 'title', "Hide the '#{td.text()}' column"
    hd.attr 'colpos', i
    hd.click((evt) ->
      sth = $(evt.target)
      pos = parseInt(sth.attr('colpos'))
      thd = sth.parent()
      tbl = thd.parent().parent().parent()
      for r in $('tr', tbl)
        for c, x in $('td', r)
          if pos == x
            $(c).hide('fast')
      thd.hide()
    )
    td.append ' '
    td.append hd
