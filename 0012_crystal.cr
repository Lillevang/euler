
def getDivisors(n : Int32) 
    divisors = Array(Int32).new
    i = 1
    while (i * i <= n)
        if n % i == 0
            divisors << i
            if i != n / i
                divisors << (n / i).to_i
            end
        end
        i = i + 1
    end
    divisors
end


        
numbers = Array(Int32).new
found = false
cnt = 1
until found
    numbers << cnt
    triangularNumber = numbers.reduce{ |subtotal, i| subtotal + i }
    found = getDivisors(triangularNumber).size > 500;
    if found
        puts triangularNumber
    end
    cnt = cnt + 1    
end 
