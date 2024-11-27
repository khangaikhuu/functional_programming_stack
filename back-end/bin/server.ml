open Dream

let hello_handler = 
  fun request ->
    Dream.json {|{"message": "Hello from OCaml!"}|}

let cors_middleware = 
  fun handler request ->
    handler request
    |> Promise.map @@ fun response ->
      response
      |> Dream.add_header "Access-Control-Allow-Origin" "*"
      |> Dream.add_header "Access-Control-Allow-Headers" "Content-Type"

let () =
  Dream.run
  @@ Dream.logger
  @@ cors_middleware
  @@ Dream.router [
    Dream.get "/" hello_handler;
    Dream.get "/api/health" (fun _ -> Dream.json {|{"status": "ok"}|});

    Dream.options "**" (fun _ -> Dream.empty |> Dream.with_status 204);
  ]
