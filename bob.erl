-module(bob).

-export([response_for/1]).

response_for([32|R]) ->
    response_for(R);
response_for([]) ->
    "Fine. Be that way!";
response_for(S) ->
    {ok,LowerCase} = re:compile("[a-z\xe0-\xff]"),
    {ok,UpperCase} = re:compile("[A-Z]"),
    {ok,EndsInQuestion} = re:compile("\\?$"),
    result(re:run(S,LowerCase),
	   re:run(S,UpperCase),
	   re:run(S,EndsInQuestion)).

result(nomatch,{match,_},_) ->
    "Whoa, chill out!";
result(_,_,{match,_}) ->
    "Sure.";
result(_,_,_) ->
    "Whatever.".
