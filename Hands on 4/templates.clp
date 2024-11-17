(deftemplate consumidor
  (slot id-consumidor)
  (slot nombre)
  (slot ciudad)
  (slot telefono)
)

(deftemplate producto
  (slot id-producto)
  (slot marca)
  (slot modelo)
  (slot categoria)
  (slot precio)
)

(deftemplate pedido
  (slot id-pedido)
  (slot id-consumidor)
  (multislot tarjeta)
)

(deftemplate producto-pedido
  (slot id-pedido)
  (slot id-producto)
  (slot cantidentificadorad (default 1))
)