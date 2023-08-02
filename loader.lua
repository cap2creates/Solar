local filedirec = "Solar/"
function githubRequest(url)
    if not isfile(filedirec..url) then
        writefile(filedirec..url,game:HttpGet("https://raw.githubusercontent.com/cap2creates/Solar/main/Solar/"..url,true))
    end
    return readfile(filedirec..url)
end
function load()
    local folder
    local lang = ".lua"
    local filenames = {
        "mainscript"..lang,
        "gui"..lang,
    }
    local dothingname = "mainscript"..lang
    if (not isfolder(filedirec)) then
        makefolder(filedirec)
    end
    folder = isfolder(filedirec)
    for number,filename in pairs(filenames) do
        if table.find(filenames,filename,1) and (not isfile(filedirec..filename)) then
            local suc, err = pcall(function() githubRequest(filename) end)
            if err then warn(err) end
        end
    end
    shared.GuiLibrary = loadstring(readfile(filedirec.."gui"..lang))()
    shared.MainScript = loadstring(readfile(filedirec.."mainscript"..lang))()
    return
end
load()
