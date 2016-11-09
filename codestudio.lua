--[[
Code Studio by houseofkraft
This program is licensed under the MIT license as described on this page: https://opensource.org/licenses/MIT
You may use this program in your operating systems as long as you keep these lines
]]--

local files = {
  [1] = {
        "/codestudio/images/main",
        "https://raw.githubusercontent.com/CoolMan119/CodeStudio/master/images/main"
  }
}

-- Check if files exist
if fs.exists("codestudio") == false then
  -- Start downloading all the files
  local req
  for k,v in pairs(files) do
    print(v[1])
    req = http.get(v[2])
    file = fs.open(v[1], "w")
    file.write(req.readAll())
    file.close()
  end
end

-- Load images
main = paintutils.loadImage("main")

-- Functions
local function centerText(text)
  local x,y = term.getSize()
  local x2,y2 = term.getCursorPos()
  term.setCursorPos(math.ceil((x / 2) - (text:len() / 2)), y2)
  write(text)
end

-- Init
term.clear()
term.setCursorPos(1,1)
paintutils.drawImage(main, 1, 1)
os.sleep(1)
term.clear()
term.setCursorPos(1,1)
centerText("HouseCode")

