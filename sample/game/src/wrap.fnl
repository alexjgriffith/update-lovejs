(global _js_eval (fn [call] (fennel.eval call)))

(local json (require :lib.json))
(local js-http (require :js_http))
(js-http.init)

(local root (js-http.make :https://algg2024.alexjgriffith.com))

(local shell (require :lib.stdio))

(fn love.load []

  (root:request "handle" "/example" "GET" "{}" "")

  ;; (shell.start)
  )

(tset love.handlers :http_recieved
      (fn []
        (local json (require :lib.json))
        (local event (root:pop_event))
        (when event
          (pp (json.decode event)))))


(tset love.handlers :handle
      (fn [body headers]
        (pp [body headers])))


(var str "")

(fn love.update [dt]
  (local event (root:pop_event))
  (when event
    (local response (. (json.decode event) :response))
    (pp (json.decode response))
    (set str (fennel.view (json.decode (. (json.decode event) :response))))))

(fn love.draw []
  (love.graphics.print str))
