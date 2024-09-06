!start. // initial goal

+!start : true
   <- .broadcast(tell, auction(service, flight_ticket(paris,athens,"15/12/2015")));
      .broadcast(tell, auction(service, flight_ticket(athens,paris,"18/12/2015")));
      .at("now + 10 seconds", {+!decide(flight_ticket(paris,athens,"15/12/2015"))});
      .at("now + 12 seconds", {+!decide(flight_ticket(athens,paris,"18/12/2015"))}).


+!decide(Service)
   :  .findall(b(V,A),bid(Service,V)[source(A)],L)  // L is a list of all bids, e.g.: [b(77.7,alice), b(91.7,giacomo), ...]
   <- .min(L,b(V,W));
      .print("Winner for ", Service, " is ",W," with ", V, ". Options=",L);
      .broadcast(tell, winner(Service,W)).

{ include("$jacamo/templates/common-cartago.asl") }
{ include("$jacamo/templates/common-moise.asl") }
{ include("$moise/asl/org-obedient.asl") }
