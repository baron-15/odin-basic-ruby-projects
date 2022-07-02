def stock_picker(arr)
max = arr.min - arr.max
    for buy in 0..arr.length()-1
        for sell in buy..arr.length()-1
            if sell > buy
                if (arr[sell] - arr[buy] > max)
                    max = arr[sell] - arr[buy]
                    bestSell = sell
                    bestBuy = buy
                end
            end
        end
    end
result =[bestBuy, bestSell]
puts result
end

stock_picker([17,3,6,9,15,8,6,1,10])