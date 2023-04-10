local mbar = hs.menubar.new(true, 'hbarprice')

function refreshPrice()
	mbar:setTitle("h: $....")
	status, body = hs.http.get('https://api.coinbase.com/v2/exchange-rates?currency=HBAR')

	if status ~= 200 then
		return
	end

	hs.timer.doAfter(1, function()
		prices = hs.json.decode(body)
		usdprice = prices.data.rates.USD
		mbar:setTitle(string.format("h: $%.4f", usdprice))
	end)
end

mbar:setTitle("h: $....")
mbar:setClickCallback(refreshPrice)
hs.timer.doEvery(30, refreshPrice):fire()
