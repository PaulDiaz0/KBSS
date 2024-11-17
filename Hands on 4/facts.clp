(deffacts consumidores
  (consumidor (id-consumidor 1) (nombre "Carlos") (ciudad "CDMX") (telefono 5551234567))
  (consumidor (id-consumidor 2) (nombre "Ana") (ciudad "Jalisco") (telefono 5512345678))
  (consumidor (id-consumidor 3) (nombre "Lucia") (ciudad "Puebla") (telefono 5523456789))
  (consumidor (id-consumidor 4) (nombre "Raul") (ciudad "Guadalajara") (telefono 5559876543))
  (consumidor (id-consumidor 5) (nombre "Marta") (ciudad "Monterrey") (telefono 5534567890))
  (consumidor (id-consumidor 6) (nombre "Elena") (ciudad "Cancún") (telefono 5567890123))
  (consumidor (id-consumidor 7) (nombre "Felipe") (ciudad "Tijuana") (telefono 5578901234))
)


(deffacts productos
  (producto (id-producto 1) (marca Samsung) (modelo "Galaxy S23") (categoria Celular) (precio 23000))
  (producto (id-producto 2) (marca Dell)    (modelo "XPS 13")     (categoria Computadora) (precio 35000))
  (producto (id-producto 3) (marca Apple)  (modelo "15 PRO")    (categoria Celular) (precio 20000))
  (producto (id-producto 4) (marca Sony)    (modelo "Bravia 4K")  (categoria TV)         (precio 60000))
  (producto (id-producto 5) (marca Lenovo)  (modelo "ThinkPad X1") (categoria Computadora) (precio 28000))
  (producto (id-producto 6) (marca Samsung) (modelo "Galaxy Tab S7") (categoria Tablet)   (precio 24000))
  (producto (id-producto 7) (marca Fitbit)  (modelo "Charge 5")   (categoria Reloj)      (precio 4500))
)


(deffacts pedidoes
  (pedido (id-pedido 1) (id-consumidor 5) (tarjeta Banamex Oro))
  (pedido (id-pedido 2) (id-consumidor 5) (tarjeta Liverpool Visa))
  (pedido (id-pedido 3) (id-consumidor 2) (tarjeta Banorte Mastercard))
  (pedido (id-pedido 4) (id-consumidor 3) (tarjeta BBVA Mastercard))
  (pedido (id-pedido 5) (id-consumidor 1) (tarjeta BBVA Visa))
)

(deffacts productos-pedidoes
  (producto-pedido (id-pedido 1) (id-producto 1) (cantidentificadorad 1))
  (producto-pedido (id-pedido 1) (id-producto 7) (cantidentificadorad 1))

  (producto-pedido (id-pedido 2) (id-producto 2) (cantidentificadorad 1))

  (producto-pedido (id-pedido 3) (id-producto 3) (cantidentificadorad 1))
  (producto-pedido (id-pedido 3) (id-producto 6) (cantidentificadorad 1))

  (producto-pedido (id-pedido 4) (id-producto 7) (cantidentificadorad 1))

  (producto-pedido (id-pedido 5) (id-producto 2) (cantidentificadorad 1))
  (producto-pedido (id-pedido 5) (id-producto 5) (cantidentificadorad 1))
)