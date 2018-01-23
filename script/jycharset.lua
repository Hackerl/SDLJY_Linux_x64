local iconv = require("iconv")
function createIconv(from,to,text)
  local cd = iconv.new(to .. "//TRANSLIT", from);
  local ostr, err = cd:iconv(text);
  if err == iconv.ERROR_INCOMPLETE then
    return "ERROR: Incomplete input.";
  elseif err == iconv.ERROR_INVALID then
    return "ERROR: Invalid input.";
  elseif err == iconv.ERROR_NO_MEMORY then
    return "ERROR: Failed to allocate memory.";
  elseif err == iconv.ERROR_UNKNOWN then
    return "ERROR: There was an unknown error.";
  end
  return ostr;
end

function change_charsert(str, flag)
    if flag == 0 then
        return createIconv("big5" , "utf-8", str);
    elseif flag == 1 then
        return createIconv("utf-8" , "big5", str);
    elseif flag == 2 then
        return createIconv("big5" , "unicode", str);
    else
        return createIconv("utf-8" , "unicode", str);
    end
end

-- 获取utf8应该占用的宽度,一个汉子宽2格,英文字母宽1格,utf8编码长度不定所以转为gbk直接获取长度
-- gbk中汉字2字节 英文1字节
function get_show_width(input)
    return #createIconv("utf-8" , "gbk", input);
end
