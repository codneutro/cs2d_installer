
-- Collect Items
function fai_collect(id)
	
	-- Scan Timer
	vai_itemscan[id]=vai_itemscan[id]+1
	if vai_itemscan[id]>150 then
		vai_itemscan[id]=math.random(0,50)
		
		-- Not collecting yet AND not a zombie?
		if vai_mode[id]~=6 and not(player(id,"team")==1 and vai_set_gm==4) then
			-- Find and scan close items
			local items=closeitems(id,5)
			for i=1,#items do
				-- Not on same tile?
				if item(items[i],"x")~=player(id,"tilex") or item(items[i],"y")~=player(id,"tiley") then
					local itype=item(items[i],"type")
					local slot=itemtype(itype,"slot")
					if slot==1 then
						-- Primary
						if not fai_playerslotitems(id,1) and player(id,"team")~=3 then
							vai_mode[id]=6; vai_smode[id]=itype; vai_destx[id]=item(items[i],"x"); vai_desty[id]=item(items[i],"y"); break
						end
					elseif slot==2 then
						-- Secondary
						if not fai_playerslotitems(id,2) and player(id,"team")~=3 then
							vai_mode[id]=6; vai_smode[id]=itype; vai_destx[id]=item(items[i],"x"); vai_desty[id]=item(items[i],"y"); break
						end
					elseif slot==3 then
						-- Melee
						local items2=playerweapons(id)
						if not fai_contains(items2,itype) and player(id,"team")~=3 then
							vai_mode[id]=6; vai_smode[id]=itype; vai_destx[id]=item(items[i],"x"); vai_desty[id]=item(items[i],"y"); break
						end
					elseif slot==4 then
						-- Grenades
						local items2=playerweapons(id)
						if not fai_contains(items2,itype) and player(id,"team")~=3 then
							vai_mode[id]=6; vai_smode[id]=itype; vai_destx[id]=item(items[i],"x"); vai_desty[id]=item(items[i],"y"); break
						end
					elseif slot==5 then
						-- Special
						if itype==55 then
							-- Bomb
							if player(id,"team")==1 then
								vai_mode[id]=6; vai_smode[id]=itype; vai_destx[id]=item(items[i],"x"); vai_desty[id]=item(items[i],"y"); break
							end
						end
					elseif slot==0 then
						-- No Slot Items
						if itype==70 or itype==71 then
							-- Flags
							vai_mode[id]=6; vai_smode[id]=itype; vai_destx[id]=item(items[i],"x"); vai_desty[id]=item(items[i],"y"); break
						elseif itype>=66 and itype<=68 and player(id,"money")<16000 then
							-- Money
							vai_mode[id]=6; vai_smode[id]=itype; vai_destx[id]=item(items[i],"x"); vai_desty[id]=item(items[i],"y"); break
						elseif itype>=64 and itype<=65 and player(id,"health")<player(id,"maxhealth") then
							-- Health
							vai_mode[id]=6; vai_smode[id]=itype; vai_destx[id]=item(items[i],"x"); vai_desty[id]=item(items[i],"y"); break
						end
					end
				end
			end
		end
	end
end