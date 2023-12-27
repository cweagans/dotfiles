local mbar = hs.menubar.new(true, "hbarprice")

function refreshPrice()
  mbar:setTitle("h: $....")
  status, body = hs.http.get("https://mainnet-public.mirrornode.hedera.com/api/v1/network/exchangerate")

  if status ~= 200 then
    return
  end

  hs.timer.doAfter(1, function()
    rates = hs.json.decode(body)
    cent_equiv = rates.current_rate.cent_equivalent
    hbar_equiv = rates.current_rate.hbar_equivalent
    usd = (cent_equiv / hbar_equiv) / 100
    mbar:setTitle(string.format("h: $%.4f", usd))
  end)
end

mbar:setTitle("h: $....")
mbar:setClickCallback(refreshPrice)
hs.timer.doEvery(30, refreshPrice):fire()
