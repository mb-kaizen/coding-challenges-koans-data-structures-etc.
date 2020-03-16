# Convert the following string format into hash, object, or dictionary:

# "a.b.c.d=5&a.b.c.e=6&f.g=7"
# {a: {b: {c: {d:5, e:6}}}, f:{g:7}}


# Test Cases:

# convert("a.b.c=1&a.b.d=2") => {a:{b:{c:1, d:2}}
# convert("a.b.c.d=1&a.e=2&b.a=3&a.b.g=4") => {a: {b:{c:{d:1}, g: 4}, e: 2}, b:{a:3}}
# convert("a.b=5") => {a: {b:5}}

# Nested array approach

# test = ["a",["b", ["c", 3]]]
# p test[1][1][0]

# h1 = {a: {b: 5}}
# # p test
# p h1

# # a= "cruel world"
# # a.scan(/\w+/) {|w| print "<<#{w}>> " }

def string_to_hash(string)
    formatted_hash = {}
    array = []

    counter = 0
    reader = string.split("")

    while counter < reader.length
        if counter == 0
            array[0] = reader[counter]
            counter += 1
        elsif reader[counter] == "."
            counter += 1
            array[array.length-1][0] = reader[counter]
            p array
            return
        end
    end

    p array

end

string_to_hash("a.b=5")
