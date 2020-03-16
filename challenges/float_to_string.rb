# Write a function that takes a float and returns a string representation of it. The string should be comma-delimited and handle negative numbers and numbers with fractional parts. 


def to_comma(float)
    formatted_string = ""
    pre_decimal, post_decimal = float.to_s.split(".")

    pre_decimal.split("").reverse.each_with_index do |elem, i|
        formatted_string.prepend "," if i % 3 == 0 && i > 0 && elem != "-"
        formatted_string.prepend elem
    end   

    formatted_string << "." + post_decimal unless post_decimal.nil?
    
    return formatted_string
end

# ---- Test Cases ----
to_comma(100)          #=> "100" 
to_comma(50000)        #=> "50,000" 
to_comma(0)            #=> "0" 
to_comma(1234567)      #=> "1,234,567" 
to_comma(1234567.1239) #=> "1,234,567.1231" 
to_comma(1234.1)       #=> "1,234.1" 
to_comma(-22234.1)     #=> "-22,234.1" 
to_comma(-122234.1)    #=> "-122,234.1”


# Think about implementing it through a stack
