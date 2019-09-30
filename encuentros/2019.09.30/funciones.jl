function nodes2dofs(nodes, degreesPerNode)
  n    = size(nodes[:])[1]
  dofs = vec( zeros(Int64, n*degreesPerNode, 1 ) ) ;
  for i in 1:n
    dofs[ (i-1)*degreesPerNode .+ (1:degreesPerNode) ] = (degreesPerNode*(nodes[i]-1)) .+ (1:degreesPerNode)
  end
  return dofs
end

function vecu2matu(vecu)
  println(size(vecu,1)[1]/2 )
  nnodes = trunc(Int, size(vecu,1)[1]/2 )
  #auxu =  zeros( (nnodes,2) )
  #auxu[1,:] = vecu
  matu = transpose( reshape(vecu,(2,nnodes)) )
  return matu
end
