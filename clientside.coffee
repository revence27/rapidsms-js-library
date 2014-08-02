class ClientSide
  constructor: (doc) ->
    @doc  = $(doc)

  activateDates: (cn) ->
    for ad in $(".#{cn}", @doc)
      $(ad).datepicker()

class ThousandQueries
  constructor: (@reqdata) ->

  makeReq: (rid, cb) ->
    lxn   = document.location.toString().replace(/\/dashboards\//, '/json/')
    dest  = "#{lxn}.json"
    console.log "Request to: #{dest}"
    us    = this
    $.ajax(dest,
      data: {reqid: rid}
      success: ((dat, stt, req) ->
        cb(new ThousandResponse(dat))
      )
    )

class ThousandResponse
  constructor: (@respdata) ->

  lmps: (them) ->
    return (@respdata.lmps or @respdata.resp or them)

  average: () ->
    return @respdata.avg

  fetch: (them) ->
    return (@respdata.resp or them)
