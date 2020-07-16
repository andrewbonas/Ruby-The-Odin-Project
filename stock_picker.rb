market = [17,3,6,9,15,8,6,1,10]

def stock_picker(market)
    buy_sell= []
    profit = 0

    market.each_with_index do |buy, buy_idx|
        sell = market[buy_idx..-1]

    sell.each_with_index do |sell, sell_idx|
        sell_idx += buy_idx
        margin = sell - buy

            if margin > profit
                profit = margin
                buy_sell[0] = buy_idx
                buy_sell[1] = sell_idx
            end 
        end
    end
    return buy_sell
end

        
print stock_picker(market)

     