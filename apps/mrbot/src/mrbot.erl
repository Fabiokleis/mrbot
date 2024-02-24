-module(mrbot).
-export([main/0]).

-define(CHANNEL_ID, 1210705820598145057).

mr_boto() ->
    io:format("Hello from mr.Boto~n").

loop(Msgs) ->
    case 'Elixir.Nostrum.Api':get_channel_messages(?CHANNEL_ID, 1) of
	{ok, Messages} -> Messages; %io:format("~p~n", [Messages])
	Anything -> {error, Anything}
    end.

main() ->
    mr_boto(),
    io:format("~p~n", ['Elixir.Nostrum.Api':get_current_user()]),
    [H|_] = loop([]),
    case 'Elixir.Nostrum.Api':get_channel_message(?CHANNEL_ID, maps:get(id, H)) of
	{ok, Msg} -> io:format("~p~n", [Msg]);
	_ -> err
    end.
    
    %%'Elixir.Nostrum.Api':create_message(?CHANNEL_ID, <<"hello from mr.Boto">>),
