array = [4,3,78,2,0,2,57,500,56,2,11,58,4,10000]

def bubble_sort(array)
    while array.each_cons(2).any? {|a,b| a > b}
        
        array.each_with_index.map do |n, index|
            if array[index +1].nil?
                n
            break
            elsif n > array[index + 1]
                array[index], array[index + 1] = array[index + 1], array[index]
            end
        end
    end
    array
end


p bubble_sort(array)
