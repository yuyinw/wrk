wrk.method = "POST"
wrk.path = "/kms/v1/keys"
wrk.headers["Cookie"] = "hadoop.auth=e=1631684786&p=root&s=62yefxrnmiZMhK4c2cqCqyk9X3%2FPGxa8XngA6q7ve%2F0%3D&t=TrueAuth&u=root"
wrk.headers["Content-Type"] = "application/json"

loginmap = {}
counter = 0
function init(args)

        for line in io.lines("lu.txt") do
                --print(line)
                loginmap[counter] = line
                counter = counter + 1
        end
        counter = 0
end

request = function()

        counter = counter+1
   
        if( counter < 100000 )
        then
                wrk.body = loginmap[counter-1]
                --wrk.body = '{"cipher":"SM4/CTR/NoPadding","name":"kmskey1","length":128}'
                --print(wrk.body)
                --print(wrk.path)
                --print(wrk.method)
                --wrk.headers["Cookie"]="hadoop.auth=e=1631684786&p=root&s=62yefxrnmiZMhK4c2cqCqyk9X3%2FPGxa8XngA6q7ve%2F0%3D&t=TrueAuth&u=root"
                
               return  wrk.format("POST",wrk.path,wrk.headers,wrk.body)
        end
        
end


function response(status, headers, body)
   if status ~= 201 then
                print(status)
                print(headers)
                print(body)
                wrk.thread:stop()
        end
end
