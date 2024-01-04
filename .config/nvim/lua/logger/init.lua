local n_ok, notify = pcall(require, "notify")
if n_ok then vim.notify = notify end

local lvls = vim.log.levels

---@class lc.Logger
local logger = {}

local function normalize(msg) return type(msg) == "string" and t(msg) or vim.inspect(msg) end

---@param msg any
logger.info = function(msg) logger.log(msg) end

---@param msg any
logger.warn = function(msg) logger.log(msg, lvls.WARN) end

---@param msg any
logger.error = function(msg) logger.log(msg, lvls.ERROR) end

---@param err lc.err
logger.err = function(err)
  if not err then return logger.error("error") end

  local msg = err.msg or ""
  local lvl = err.lvl or lvls.ERROR

  logger.log(msg, lvl)
end

return logger
