function ll_obj(params;xs=X,ys=Y)
    n = size(X)[1]
    k = Integer(size(X)[2]/2) + 1    
    
    #case 1, y2 comes first
    util11 = params[1] .+ xs[:,1].*params[2]  .+ ys[:,2].*params[3]
    util21 = params[4] .+ xs[:,2].*params[5]
    
    ll_game1 = exp.(util11).^(ys[:,1])./(1 .+ exp.(util11))
    ll_game1 = ll_game1 .* exp.(util21).^(ys[:,2])./(1 .+ exp.(util21))
    
    #case 2, y1 comes first
    util12 = params[1] .+ xs[:,1].*params[2]  
    util22 = params[4] .+ xs[:,2].*params[5] .+ ys[:,1].*params[6]
    
    ll_game2 = exp.(util12).^(ys[:,1])./(1 .+ exp.(util12))
    ll_game2 = ll_game2 .* exp.(util22).^(ys[:,2])./(1 .+ exp.(util22))
    
    lambda = exp(params[7])/(1+exp(params[7]))
    
    #need to adjust for 11?
    util13 = params[1] .+ xs[:,1].*params[2]  .+ ys[:,2].*params[3]
    util23 = params[4] .+ xs[:,2].*params[5] .+ ys[:,1].*params[6]
    ll_game3 = exp.(util13).^(ys[:,1])./(1 .+ exp.(util13))
    ll_game3 = ll_game3 .* exp.(util23).^(ys[:,2])./(1 .+ exp.(util23))
    
    ll = (1 .- ys[:,1].*ys[:,2]) .* (lambda .* ll_game1 + (1-lambda) .* ll_game2) + ys[:,1].*ys[:,2] .*ll_game3
    
    return -sum(log.(ll))    
end


function ll_obj(params;xs=X,ys=Y)
    n = size(X)[1]
    k = Integer(size(X)[2]/2) + 1
    
    p = []
    
    for bound=[[0,0],[1,1],[0,1],[1,0]]
        util1 = params[1] .+ xs[:,1].*params[2]  .+ bound[2].*params[3]
        util2 = params[4] .+ xs[:,2].*params[5]  .+ bound[1].*params[6]
        bound = exp.(util1).^(bound[1])./(1 .+ exp.(util1))
        bound = bound .* exp.(util2).^(bound[2])./(1 .+ exp.(util2))
        append!(p,[bound])
    end
    
    
    p00 = (1 .- ys[:,1]).*(1 .- ys[:,2])
    p11 = ys[:,1].*ys[:,2]
    p10 = ys[:,1].* (1 .- ys[:,2])
    p01 = (1 .- ys[:,1]) .* ys[:,2]
    
    
    lambda = exp(params[7])/(1+exp(params[7]))
    
    ll = p00 .* log.(p[1]) .+ p11 .* log.(p[2])
    ll = ll .+ p01 .* log.( lambda .* p[3] .+ (1 .-lambda) .* p[4] )
    ll = ll .+ p10 .* log. ( lambda .* p[3] .+ (1 .-lambda) .* p[4])
    return -sum(ll)
end




function ll_obj(params;xs=X,ys=Y)
    n = size(X)[1]
    k = Integer(size(X)[2]/2) + 1
    
    p = []
    
    for bound=[[0,0],[1,1],[0,1],[1,0]]
        util1 = params[1] .+ xs[:,1].*params[2]  .+ bound[2].*params[3]
        util2 = params[4] .+ xs[:,2].*params[5]  .+ bound[1].*params[6]
        bound = exp.(util1).^(bound[1])./(1 .+ exp.(util1))
        bound = bound .* exp.(util2).^(bound[2])./(1 .+ exp.(util2))
        append!(p,[bound])
    end
    
    
    p00 = (1 .- ys[:,1]).*(1 .- ys[:,2])
    p11 = ys[:,1].*ys[:,2]
    p10 = ys[:,1].* (1 .- ys[:,2])
    p01 = (1 .- ys[:,1]) .* ys[:,2]
    
    
    lambda = exp(params[7])/(1+exp(params[7]))
    #println(1 .- p[1] .- p[2] .- p[4])
    ll = p00 .* log.(p[1]) + p11 .* log.(p[2])
    ll = p01 .* log.(lambda .* p[3] + (1-lambda).*(1 .- p[1] .- p[2] .- p[4] ) )
    ll = p10 .* log.((1-lambda) .* p[4] + lambda.*(1 .- p[1] .- p[2] .- p[3] ) )
    return -sum(ll)    
end