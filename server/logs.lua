Fivemanage = {}

--- @type string
Fivemanage._apiKey = ""
Fivemanage._url = ""

Fivemanage.Info = "info"
Fivemanage.Warn = "warn"
Fivemanage.Error = "error"
Fivemanage.Fatal = "fatal"

Fivemanage.__init = function(self)
  self._apiKey = "" --GetConvar("FIVEMANAGE_LOGS_TOKEN", "")
end

---@param token string
function Fivemanage:sendHttpReq(data)
  print("Sending HTTP request to FiveManage API...")

  PerformHttpRequest(self._url, function() end, 'POST', json.encode(data), {
    ['Authorization'] = self._apiKey,
    ['Content-Type'] = 'application/json'
  })
end

function Fivemanage:LogMessage(level, message, metadata)

  local data = {
    message = message,
    level = level,
    metadata = metadata or nil
  }

  self:sendHttpReq(data)
end

Fivemanage:__init()

exports("LogMessage", function(level, message, metadata)
  Fivemanage:LogMessage(level, message, metadata)
end)