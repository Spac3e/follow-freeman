--[[LICENSE:
_p_modules\lua\includes\modules\pon.luasrc

Copyright 08/24/2014 thelastpenguin
]]
local a={} _G.pon=a local b,c=type,table.Count local d=tonumber local e=string.format do local f,g=b,table.Count local h=d local i=string.format local j={} local k local l=0x0 j['table']=function(m,n,o,p) if p[n] then o[# o+0x1]=i('(%x)',p[n]) return  else l=l+0x1 p[n]=l end local q=# n local r=g(n)-q if (q==0x0 and r>0x0) then o[# o+0x1]='[' else o[# o+0x1]='{' if q>0x0 then for s=0x1,q do local t=n[s] if not t then continue end local u=f(t) if u=='string' then local v=p[t] if v then o[# o+0x1]=i('(%x)',v) else l=l+0x1 p[t]=l m.string(m,t,o,p) end else m[u](m,t,o,p) end end end end if r>0x0 then if q>0x0 then o[# o+0x1]='~' end for s,t in next,n do if ((f(s)~='number' or s<0x1) or s>q) then local u,v=f(s),f(t) if u=='string' then local w=p[s] if w then o[# o+0x1]=i('(%x)',w) else l=l+0x1 p[s]=l m.string(m,s,o,p) end else m[u](m,s,o,p) end if v=='string' then local w=p[t] if w then o[# o+0x1]=i('(%x)',w) else l=l+0x1 p[t]=l m.string(m,t,o,p) end else m[v](m,t,o,p) end end  end  end o[# o+0x1]='}' end local m=string.gsub j['string']=function(n,o,p) local q,r=m(o,';','\\;') if r==0x0 then p[# p+0x1]='\''..o..';' else p[# p+0x1]='"'..q..'";' end end j['number']=function(n,o,p) if o%0x1==0x0 then if o<0x0 then p[# p+0x1]=i('x%x;',- o) else p[# p+0x1]=i('X%x;',o) end else p[# p+0x1]=h(o)..';' end end j['boolean']=function(n,o,p) p[# p+0x1]=((o and 't') or 'f') end j['Vector']=function(n,o,p) p[# p+0x1]='v'..o.x..','..o.y..','..o.z..';' end j['Angle']=function(n,o,p) p[# p+0x1]='a'..o.p..','..o.y..','..o.r..';' end j['Entity']=function(n,o,p) p[# p+0x1]='E'..((IsValid(o) and o:EntIndex()..';') or '#') end j['Player']=j['Entity'] j['Vehicle']=j['Entity'] j['Weapon']=j['Entity'] j['NPC']=j['Entity'] j['NextBot']=j['Entity'] j['nil']=function() output[# output+0x1]='?' end j.__index=function(n) ErrorNoHalt('Type: '..n..' can not be encoded. Encoded as as pass-over value.') return j['nil'] end do local n,o=table.Empty,table.concat function a.encode(p) local q={} l=0x0 j['table'](j,p,q,{}) local r=o(q) return r end  end  end do local f=d local g,h,i,j=string.find,string.sub,string.gsub,string.Explode local k,l,m=Vector,Angle,Entity local n={} n['{']=function(o,p,q,r) local s={} r[# r+0x1]=s local t,u,v,w=0x1,nil,nil,nil while(true)do w=h(q,p,p) if (not w or w=='~') then p=p+0x1 break end if w=='}' then return p+0x1,s end p=p+0x1 p,u=o[w](o,p,q,r) s[t]=u t=t+0x1  end while(true)do v=h(q,p,p) if (not v or v=='}') then p=p+0x1 break end p=p+0x1 p,t=o[v](o,p,q,r) w=h(q,p,p) p=p+0x1 p,u=o[w](o,p,q,r) s[t]=u  end return p,s end n['[']=function(o,p,q,r) local s={} r[# r+0x1]=s local t,u,v,w=0x1,nil,nil,nil while(true)do v=h(q,p,p) if (not v or v=='}') then p=p+0x1 break end p=p+0x1 p,t=o[v](o,p,q,r) if not t then continue end w=h(q,p,p) p=p+0x1 p,u=o[w](o,p,q,r) s[t]=u  end return p,s end n['"']=function(o,p,q,r) local s=g(q,'";',p,true) local t=i(h(q,p,s-0x1),'\\;',';') p=s+0x2 r[# r+0x1]=t return p,t end n['\'']=function(o,p,q,r) local s=g(q,';',p,true) local t=h(q,p,s-0x1) p=s+0x1 r[# r+0x1]=t return p,t end n['n']=function(o,p,q,r) p=p-0x1 local s=g(q,';',p,true) local t=f(h(q,p,s-0x1)) p=s+0x1 return p,t end n['0']=n['n'] n['1']=n['n'] n['2']=n['n'] n['3']=n['n'] n['4']=n['n'] n['5']=n['n'] n['6']=n['n'] n['7']=n['n'] n['8']=n['n'] n['9']=n['n'] n['-']=n['n'] n['X']=function(o,p,q,r) local s=g(q,';',p,true) local t=f(h(q,p,s-0x1),0x10) p=s+0x1 return p,t end n['x']=function(o,p,q,r) local s=g(q,';',p,true) local t=- f(h(q,p,s-0x1),0x10) p=s+0x1 return p,t end n['(']=function(o,p,q,r) local s=g(q,')',p,true) local t=f(h(q,p,s-0x1),0x10) p=s+0x1 return p,r[t] end n['t']=function(o,p) return p,true end n['f']=function(o,p) return p,false end n['v']=function(o,p,q,r) local s=g(q,';',p,true) local t=h(q,p,s-0x1) p=s+0x1 local u=j(',',t,false) return p,k(f(u[0x1]),f(u[0x2]),f(u[0x3])) end n['a']=function(o,p,q,r) local s=g(q,';',p,true) local t=h(q,p,s-0x1) p=s+0x1 local u=j(',',t,false) return p,l(f(u[0x1]),f(u[0x2]),f(u[0x3])) end n['E']=function(o,p,q,r) if q[p]=='#' then p=p+0x1 return p,NULL else local s=g(q,';',p,true) local t=f(h(q,p,s-0x1)) p=s+0x1 return p,m(t) end end n['P']=function(o,p,q,r) local s=g(q,';',p,true) local t=f(h(q,p,s-0x1)) p=s+0x1 return p,(m(t) or NULL) end n['?']=function(o,p,q,r) return p+0x1,nil end function a.decode(o) local p,q=n[h(o,0x1,0x1)](n,0x2,o,{}) return q end  end 