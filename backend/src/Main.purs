module Main where

import HTTPurple (class Generic, RouteDuplex', ServerM, mkRoute, ok, serve)
import HTTPurple as RG

data Route = Hello

derive instance Generic Route _

route :: RouteDuplex' Route
route = mkRoute
  { "Hello": RG.noArgs
  }

main :: ServerM
main =
  serve { port: 8080 } { route, router }
  where
  router { route: Hello } = ok "hello nixcon :3"
