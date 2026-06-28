-- Auto-generated installer: Mech redstone computer (v0.7)
-- Self-contained installer. Run with: wget run <this-url>
local function b64dec(data)
  local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
  data = string.gsub(data, '[^'..b..'=]', '')
  return (data:gsub('.', function(x)
    if (x == '=') then return '' end
    local r,f='',(b:find(x)-1)
    for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
    return r
  end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
    if (#x ~= 8) then return '' end
    local c=0
    for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
    return string.char(c)
  end))
end
local files = {
  ["startup.lua"] = "LS0gQXV0b3N0YXJ0OiBtZWNoYW5pY2FsIGNyYWZ0ZXIgcmVkc3RvbmUgc3RhdGlvbgpzaGVsbC5ydW4oIm1lY2hfcmVkc3RvbmUiKQo=",
  ["mech_redstone.lua"] = "LS0gTWVjaGFuaWNhbCBDcmFmdGVyIHJlZHN0b25lIHN0YXRpb24uCi0tIFNpdHMgbmV4dCB0byBvbmUgTWVjaGFuaWNhbCBDcmFmdGVyIG9mIHRoZSA1eDUgZ3JpZC4gTGlzdGVucyBvbiByZWRuZXQgZm9yIGEKLS0gInB1bHNlIiBjb21tYW5kIGZyb20gdGhlIGNvbnRyb2wgY29tcHV0ZXIsIGVtaXRzIGEgYnJpZWYgcmVkc3RvbmUgcHVsc2Ugb24KLS0gZXZlcnkgc2lkZSBleGNlcHQgdGhlIG1vZGVtIHNpZGUgKG9uZSBzaWRlIHRvdWNoZXMgdGhlIGNyYWZ0ZXIgYW5kIHRyaWdnZXJzCi0tIHRoZSBjcmFmdCksIHRoZW4gcmVwbGllcyAiZG9uZSIuCgpsb2NhbCBQVUxTRV9USU1FID0gMC41ICAgICAgICAgIC0tIHNlY29uZHMgdGhlIHJlZHN0b25lIHN0YXlzIGhpZ2gKbG9jYWwgUFVMU0VfRVZFTlQgPSAicHVsc2UiICAgICAtLSBjb21tYW5kIHRoZSBjb250cm9sIGNvbXB1dGVyIHNlbmRzCmxvY2FsIERPTkVfUkVQTFkgID0gImRvbmUiCgotLSBGaW5kIGFuZCBvcGVuIHRoZSBtb2RlbSBmb3IgcmVkbmV0OyByZXR1cm4gdGhlIHNpZGUgaXQgaXMgb24uCmxvY2FsIGZ1bmN0aW9uIG9wZW5Nb2RlbSgpCiAgZm9yIF8sIHNpZGUgaW4gaXBhaXJzKHJlZHN0b25lLmdldFNpZGVzKCkpIGRvCiAgICBpZiBwZXJpcGhlcmFsLmdldFR5cGUoc2lkZSkgPT0gIm1vZGVtIiB0aGVuCiAgICAgIHJlZG5ldC5vcGVuKHNpZGUpCiAgICAgIHJldHVybiBzaWRlCiAgICBlbmQKICBlbmQKICBlcnJvcigiTm8gbW9kZW0gZm91bmQhIEF0dGFjaCBhIG1vZGVtIHRvIHRoaXMgY29tcHV0ZXIuIiwgMCkKZW5kCgpsb2NhbCBmdW5jdGlvbiBzZXRBbGxFeGNlcHQoc2tpcFNpZGUsIHZhbHVlKQogIGZvciBfLCBzaWRlIGluIGlwYWlycyhyZWRzdG9uZS5nZXRTaWRlcygpKSBkbwogICAgaWYgc2lkZSB+PSBza2lwU2lkZSB0aGVuCiAgICAgIHJlZHN0b25lLnNldE91dHB1dChzaWRlLCB2YWx1ZSkKICAgIGVuZAogIGVuZAplbmQKCmxvY2FsIG1vZGVtU2lkZSA9IG9wZW5Nb2RlbSgpCnNldEFsbEV4Y2VwdChtb2RlbVNpZGUsIGZhbHNlKSAgLS0gZW5zdXJlIHdlIHN0YXJ0IHdpdGggcmVkc3RvbmUgb2ZmCgp0ZXJtLmNsZWFyKCkKdGVybS5zZXRDdXJzb3JQb3MoMSwgMSkKcHJpbnQoIk1lY2hhbmljYWwgQ3JhZnRlciByZWRzdG9uZSBzdGF0aW9uIikKcHJpbnQoIkNvbXB1dGVyIElEOiAiIC4uIG9zLmdldENvbXB1dGVySUQoKSkKcHJpbnQoIk1vZGVtIG9uIHNpZGU6ICIgLi4gbW9kZW1TaWRlKQpwcmludCgiV2FpdGluZyBmb3IgcHVsc2UgY29tbWFuZHMuLi4iKQoKd2hpbGUgdHJ1ZSBkbwogIGxvY2FsIHNlbmRlcklELCBtc2cgPSByZWRuZXQucmVjZWl2ZSgpCiAgaWYgbXNnID09IFBVTFNFX0VWRU5UIHRoZW4KICAgIHByaW50KCJbIiAuLiB0ZXh0dXRpbHMuZm9ybWF0VGltZShvcy50aW1lKCksIHRydWUpIC4uICJdIFB1bHNlIGZyb20gIiAuLiBzZW5kZXJJRCkKICAgIHNldEFsbEV4Y2VwdChtb2RlbVNpZGUsIHRydWUpCiAgICBzbGVlcChQVUxTRV9USU1FKQogICAgc2V0QWxsRXhjZXB0KG1vZGVtU2lkZSwgZmFsc2UpCiAgICByZWRuZXQuc2VuZChzZW5kZXJJRCwgRE9ORV9SRVBMWSkKICBlbHNlaWYgbXNnID09ICJwaW5nIiB0aGVuCiAgICAtLSBDb25uZWN0aXZpdHkgY2hlY2sgdGhhdCBkb2VzIE5PVCBmaXJlIHJlZHN0b25lIChzYWZlIGR1cmluZyB0ZXN0cykuCiAgICByZWRuZXQuc2VuZChzZW5kZXJJRCwgInBvbmciKQogIGVuZAplbmQK",
}
term.clear() term.setCursorPos(1,1)
print('Installing: Mech redstone computer (v0.7)')
for path, data in pairs(files) do
  local dir = path:match('^(.*)/[^/]+$')
  if dir and not fs.exists(dir) then fs.makeDir(dir) end
  local h = fs.open(path, 'w')
  h.write(b64dec(data))
  h.close()
  print('  + ' .. path)
end
print('')
print('Done! Type: reboot')
