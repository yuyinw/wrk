wrk.method = "POST"
--wrk.method = "GET"
wrk.headers["Cookie"]="hadoop.auth=e=1631684786&p=root&s=62yefxrnmiZMhK4c2cqCqyk9X3%2FPGxa8XngA6q7ve%2F0%3D&t=TrueAuth&u=root"
wrk.body = '{"name":"kms1","iv":"hFlsT2lXL6vsLfqg1LI9zw","material":"CTko8R9i3PLYfziO5-OInQ"}'

request = function()
--path = "/kms/v1/keys/metadata?key=kms1&key=key002"
--path = "/kms/v1/key/key002"
--path = "/kms/v1/keyversion/key002@1/_eek?eek_op=decrypt"
--path = "/kms/v1/key/kms1/_currentversion"
--path = "/kms/v1/key/kms1/_eek?eek_op=generate&num_keys=100"
path = "/kms/v1/keyversion/kms1@1/_eek?eek_op=decrypt"
--path = "/kms/v1/keyversion/kms1@1/_eek?eek_op=reencrypt"
--path = "/kms/v1/keyversion/kms1@1"
--path = "/kms/v1/key/kms1/_versions"
--path = "/kms/v1/key/kms1/_metadata"
--path = "/kms/v1/keys/names"
return wrk.format("POST", path)
--return wrk.format("GET", path)
end

function response(status,headers,body)
        if status ~= 200 then 
                print(status)
                print(headers)
                print(body)
                wrk.thread:stop()
        end
end

