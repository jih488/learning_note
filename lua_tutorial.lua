--[[ 
1 install(Linux Terminal): 
$ curl -O http://www.lua.org/ftp/lua-5.3.4.tar.gz
$ tar zxf lua-5.3.4.tar.gz
$ cd lua-5.3.4
$ make linux test
$ make install
Then you can use lua.
2 Programming
To use lua to program, there are three approachs:
1.1> interactive programming using terminal
$ lua -i
You will come to interactive programming environment. You can use in-built 'print' function to print the content.
> print("Hello World")
Hello World！
1.2> .lua file
create a .lua file, such as hello.lua, the content is:
print("Hello World")
then you can excute the file
$ lua hello.lua
Hello World！
1.3> script
create a .lua file and specify the interpreter, such as hello.lua, the content is:
#!/usr/local/bin/lua
print("Hello World")
then you can excute the script
$ ./hello.lua
--]]
-- lua is a dynamic typing language, you don't need to define variable type before you use it.
a = 10
print(a)  -- 10
-- in lua language, all variables are global by default. To create a local variable, use 'local'.
local a = 5  -- create a local variable, when the block ends, it will be destroyed.
print(a) -- 10
-- If you don't initianize a variable, its value is nil.
-- nil is a special variable and it means invalid in some way. In condition expressions, it is as false.
print(b)  -- nil
-- Data types: nil, boolen, number, string, function, userdata, thread, table.
-- The nil type includes nil itself. You can use 'type' to look up the data type.
print(type(b)) -- nil
-- The boolen type includes ture and flase, just like other programming languages. 
-- The number type represents real (double-precision floating-point) numbers. So 'a' is not an integer data.
print(type(a)  -- number
print(type(2.2e-6) -- number
-- many number
n1,n2 = 1,2    --n1=1, n2=2
n3,n4 = 3,4,5  --n1=3, n2=4
n5,n6 = 0      --n5=0, n6=nil. Pay attention the difference with other languages.
-- The string type uses single, double quotes or double square brackets to denote
string1 = 'this is string1'
string2 = "this is string2"
string3 = string1..' and '..string2  -- use '..' to connect string!
print(string3) --this is string1 and this is string2 
print(#string1) --15 , use '#' to get the string length.  
string4 = [[
cat
dog  ]]  -- it's convenient in some cases.
-- The table type implements associative arrays.
tab1 = {} --create a blank table.
tab1[1] = 'dog'
k = 'key'
tab1[k] = 'cat' 
print(tab1[k]) -- cat
-- Don't confuse a.x with a[x], a.x represents a['x'], that is, a table indexed by the string 'x'.
print(tab1.k)  -- nil , undefied tab1['k']  
-- when a numeric string invloves in the digital operations, lua will try convert it to number.    
print("2" + 6) -- 8.0
for x, y in pairs(tab1) do  
    print(x .. " : " .. y)  -- print the index and elements
end  
-- [[ Functions are first-class values in Lua. That means that functions can be stored in variables, 
passed as arguments to other functions, and returned as results. -- ]]
-- a simple example
function echo(x)  -- you can also use 'echo = function(x)' to create.
    print(x)
end
-- a  complex example  
function fcn2(n, fcn) -- you can also use 'fcn2 = function(n, fcn)' to create.
    n = fcn(n)
    if n == 0 then
        return 1
    else
        return n * fcn(n-1)
    end
end
fcn2_copy = fcn2  -- copy as a variable
print(fcn2_copy(-4, math.abs))  -- 12 , 'math.abs' is an in-built function to get the absolute value. 
-- For convenience, you can use anonymous function to pass function 
print(fcn2_copy(-4, function(x) return(math.abs(x)-1) end)) -- 3
