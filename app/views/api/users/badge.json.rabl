object false
#@user, @campaign

node(:uid) {@user.id}
child :recipient do
  node(:type) {'email'}
  node(:hashed) {'false'}
  node(:identity) {@user.email}
end
node(:image) {@campaign.individual_badge.url(:large)}
node(:evidence) {"#{request.protocol}#{request.host_with_port}/users/#{@user.id}"}
node(:issuedOn) {@campaign.created_at}
node(:badge) {"#{request.protocol}#{request.host_with_port}/api/campaigns/#{@campaign.id}/badge.json"}
child :verify do
  node(:type) {'hosted'}
  node(:url) {"#{request.protocol}#{request.host_with_port}#{request.fullpath}"}
end
