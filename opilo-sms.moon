run = (msg,matches) ->
  if not is_admin(msg)
    return
  if matches[1] == "sms"
    file = assert(io.popen("python3 opilo-sms.py send #{matches[2]} \'#{matches[3]}\'", 'r'))
    output = file\read('*all')
    file\close()
    return output
  if matches[1] == "smscredit"
    file = assert(io.popen("python3 opilo-sms.py credits", 'r'))
    output = file\read('*all')
    file\close()
    return output

description = "*opilo SMS plugin*"
usage = "Send text messages using opilo.com api !"
patterns = {
  "^[!/#](sms) ([^%s]+) (.*)$"
  "^[!/#](smscredit)$"
}
return {
  :description
  :usage
  :patterns
  :run
}
