(defrule consumidor-no-compra
  (consumidor (id-consumidor ?ic) (nombre ?n))
  (not (pedido (id-consumidor ?ic)))
  =>
  (printout t "Regla-01: El consumidor " ?n " no ha realizado ninguna compra." crlf)
)

(defrule rebaja-consumidor-no-compra
  (consumidor (id-consumidor ?ic) (nombre ?n))
  (not (pedido (id-consumidor ?ic)))
  =>
  (assert (invocar-rebaja ?ic 5))
  (printout t "Regla-02: El consumidor " ?n " tiene un 5% de rebaja para su primera compra." crlf)
)

(defrule invocar-consumidor-rebaja
  ?lcd <- (invocar-rebaja ?ic ?d)
  (consumidor (id-consumidor ?ic) (nombre ?n) (telefono ?t))
  =>
  (printout t "Regla-03: Llamando al consumidor " ?n " al telefono " ?t " para ofrecerle una rebaja del " ?d "%." crlf)
  (retract ?lcd)
)

(defrule mostrar-productos-apple
  (producto (marca Apple) (modelo ?m))
  =>
  (printout t "Regla-04: Producto de Apple: " ?m "." crlf)
)

(defrule mostrar-productos-computadora
  (producto (categoria Computadora) (marca ?ma) (modelo ?mo) (precio ?p))
  =>
  (printout t "Regla-05: Computadora de " ?ma ", modelo " ?mo ", cuesta $" ?p "." crlf)
)

(defrule mostrar-productos-menos-18
  (producto (marca ?ma) (modelo ?mo) (precio ?p & : (< ?p 18000)))
  =>
  (printout t "Regla-06: Producto Barato (< $18,000) de " ?ma ", modelo " ?mo " cuesta $" ?p "." crlf)
)

(defrule mostrar-ciudad-consumidores
  (consumidor (nombre ?n) (ciudad ?c))
  =>
  (printout t "Regla-07: El consumidor " ?n " vive en " ?c "." crlf)
)

(defrule mostrar-productos-mas-18
  (producto (marca ?ma) (modelo ?mo) (precio ?p & : (> ?p 18000)))
  =>
  (printout t "Regla-08: Producto Caro (> $18,000) de " ?ma ", modelo " ?mo " cuesta $" ?p "." crlf)
)

(defrule mostrar-productos-menos-comprados
  (producto (id-producto ?ip) (marca ?ma) (modelo ?mo))
  (not (producto-pedido (id-producto ?ip)))
  =>
  (printout t "Regla-09: Producto menos comprado: " ?ma " " ?mo "." crlf)
)

(defrule mostrar-productos-precio
  (producto (id-producto ?ip) (marca ?ma) (modelo ?mo) (precio ?p))
  =>
  (printout t "Regla-10: " ?ip " | " ?ma " | " ?mo " | " ?p crlf)
)

(defrule rebaja-consumidor-dos-compras
  (consumidor (id-consumidor ?ic) (nombre ?n))
  (pedido (id-consumidor ?ic) (id-pedido ?io1))
  (pedido (id-consumidor ?ic) (id-pedido ?io2 & : (neq ?io1 ?io2)))
  =>
  (assert (invocar-rebaja ?ic 10))
  (printout t "Regla-11: El consumidor " ?n " tiene un 10% de rebaja para su tercera compra." crlf)
)

(defrule meses-sin-intereses-bbva
  (pedido (id-pedido ?io) (id-consumidor ?ic) (tarjeta BBVA ?g))
  (consumidor (id-consumidor ?ic) (nombre ?n))
  =>
  (printout t "Regla-12: El pedido " ?io " del consumidor " ?n " tiene 12 MSI por BBVA." crlf)
)

(defrule rebaja-dos-productos-misma-marca
  (pedido (id-pedido ?io) (id-consumidor ?ic))
  (consumidor (id-consumidor ?ic) (nombre ?n))
  (producto-pedido (id-pedido ?io) (id-producto ?ip1))
  (producto-pedido (id-pedido ?io) (id-producto ?ip2))
  (producto (id-producto ?ip1) (marca ?ma))
  (producto (id-producto ?ip2) (marca ?ma & : (neq ?ip1 ?ip2)))
  =>
  (assert (invocar-rebaja ?ic 15))
  (printout t "Regla-13: El pedido " ?io " del consumidor " ?n " tiene un 15% de rebaja por tener dos productos de la marca " ?ma "." crlf)
)

(defrule mostrar-productos-pedido
  (pedido (id-pedido ?io) (id-consumidor ?ic))
  (producto-pedido (id-pedido ?io) (id-producto ?ip))
  (producto (id-producto ?ip) (marca ?ma) (modelo ?mo))
  =>
  (printout t "Regla-14: Producto de El pedido " ?io ": " ?ma " " ?mo "." crlf)
)
(defrule invocar-consumidor-seguro
  ?lcs <- (invocar-seguro ?ic)
  (consumidor (id-consumidor ?ic) (nombre ?n) (telefono ?t))
  =>
  (printout t "Regla-15: Llamando al consumidor " ?n " al telefono " ?t " para ofrecerle un seguro." crlf)
  (retract ?lcs)
)

(defrule rebaja-dos-productos-misma-categoria
  (pedido (id-pedido ?io) (id-consumidor ?ic))
  (consumidor (id-consumidor ?ic) (nombre ?n))
  (producto-pedido (id-pedido ?io) (id-producto ?ip1))
  (producto-pedido (id-pedido ?io) (id-producto ?ip2))
  (producto (id-producto ?ip1) (categoria ?ca))
  (producto (id-producto ?ip2) (categoria ?ca & : (neq ?ip1 ?ip2)))
  =>
  (assert (invocar-rebaja ?ic 15))
  (printout t "Regla-16: El pedido " ?io " del consumidor " ?n " tiene un 15% de rebaja por tener dos productos de la categoria " ?ca "." crlf)
)

(defrule rebaja-consumidor-primera-pedido
  (pedido (id-consumidor ?ic) (id-pedido 1))
  (consumidor (id-consumidor ?ic) (nombre ?n))
  =>
  (assert (invocar-rebaja ?ic 50))
  (printout t "Regla-17: El consumidor " ?n " tiene un 50% de rebaja por haber hecho la primera pedido de la tienda." crlf)
)

(defrule rebaja-mica-protector
  (pedido (id-pedido ?io) (id-consumidor ?ic))
  (producto-pedido (id-pedido ?io) (id-producto ?ip))
  (producto (id-producto ?ip) (categoria Celular))
  (consumidor (id-consumidor ?ic) (nombre ?n))
  =>
  (assert (invocar-rebaja ?ic 20))
  (printout t "Regla-18: El consumidor " ?n " tiene un 20% de rebaja en una mica y un protector de pantalla por comprar un celular." crlf)
)

(defrule rebaja-consumidor-hermosillo
  (consumidor (id-consumidor ?ic) (nombre ?n) (ciudad "Hermosillo"))
  =>
  (assert (invocar-rebaja ?ic 10))
  (printout t "Regla-19: El consumidor " ?n " tiene un 10% de rebaja por vivir en Hermosillo." crlf)
)

(defrule seguro-consumidor-computadora
  (pedido (id-pedido ?io) (id-consumidor ?ic))
  (producto-pedido (id-pedido ?io) (id-producto ?ip))
  (producto (id-producto ?ip) (modelo ?m) (categoria Computadora))
  (consumidor (id-consumidor ?ic) (nombre ?n))
  =>
  (assert (invocar-seguro ?ic))
  (printout t "Regla-20: El consumidor " ?n " compro una Computadora " ?m ", se le ofrecera un seguro." crlf)
)
