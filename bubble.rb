def bubble_sort(arr)
    temp = 0;
    puts 'Initial array: ', arr.join(',')
    for i in (arr.length()-1).downto(0)
        for j in 1..i
            if arr[j-1] > arr[j]
                puts "Flipping #{arr[j-1]} and #{arr[j]}"
                temp = arr[j]
                arr[j] = arr[j-1]
                arr[j-1] = temp
                puts "New array:  ", arr.join(',')
            end
        end
    end
    puts "Final array ", arr.join(',')
end


bubble_sort([4,3,78,2,0,2])