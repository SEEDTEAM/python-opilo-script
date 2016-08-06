local function run(msg, matches)
  if not is_sudo(msg) then
    return "You're not admin"
  end
  if matches[1] == "sms" then
    local file = assert(io.popen("python3 opilo-sms.py send "..matches[2].." \'"..matches[3].."\'", 'r'))
    local output = file:read('*all')
    file:close()
    return output
  end
  if matches[1] == "smscredit" then
    local file = assert(io.popen("python3 opilo-sms.py credits", 'r'))
    local output = file:read('*all')
    file:close()
    return output
  end
  return
end
return {
  patterns = {
  "^[!/#](sms) ([^%s]+) (.*)$",
  "^[!/#](smscredit)$",
  },
  run = run
}
