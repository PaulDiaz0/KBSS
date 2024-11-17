(assert (Enfermedad Rinitis DolorDeCabeza NarizTapada Cansancio OidosTapados))
(assert (Enfermedad Resfriado Fiebre Tos DolorDeGarganta Fatiga))
(assert (Enfermedad Neumonia DificultadRespiratoria Fiebre TosSeco Cansancio))
(assert (Enfermedad Bronquitis Tos ProduccionDeMucosidad DificultadRespiratoria Cansancio))
(assert (Enfermedad Alergia Estornudos OjosLlorosos CongestionNasal PicorDePiel))
(assert (Enfermedad Gripa Fiebre DolorDeCabeza OjoLloroso FlujoNasal))
(assert (Enfermedad InfeccionEstomacal Diarrea Fiebre DolorEstomacal Escalofrios))
(assert (Enfermedad InfeccionGarganta DolorDeCabeza CuerpoCortado Afonia Tos ))
(assert (Enfermedad Covid PerdidaDelGusto Fiebre DificultadRespiratoria Vomito))
(assert (Enfermedad Gastritis Nausea Saciedad Vomito Cansancio ))

(defrule arranque
(Enfermedad ?nombre ?s1 ?s2 ?s3 ?s4)
=>
(printout t "Enfermedad: " ?nombre "." crlf)
(printout t "Sintoma 1: " ?s1 "." crlf)
(printout t "Sintoma 2: " ?s2 "." crlf)
(printout t "Signo 1: " ?s3 "." crlf)
(printout t "Signo 2: " ?s4 "." crlf)
(printout t "**********" crlf)
)


(defrule filtrarEnfermedad
(Busqueda ?nombreBuscar)
(Enfermedad ?nombre ?s1 ?s2 ?s3 ?s4)
(test (eq ?nombre ?nombreBuscar))
=>
(printout t "Enfermedad: " ?nombre "." crlf)
(printout t "Sintoma 1: " ?s1 "." crlf)
(printout t "Sintoma 2: " ?s2 "." crlf)
(printout t "Signo 1: " ?s3 "." crlf)
(printout t "Signo 2: " ?s4 "." crlf)
)

(defrule filtrarSintoma1
(SintomaBusqueda ?nombreBuscar)
(Enfermedad ?nombre ?s1 ?s2 ?s3 ?s4)
(test (eq ?s1 ?nombreBuscar))
=>
(printout t "Para " ?s1 crlf)
(printout t "Enfermedad: " ?nombre "." crlf))

(defrule filtrarSintoma2
(SintomaBusqueda ?nombreBuscar)
(Enfermedad ?nombre ?s1 ?s2 ?s3 ?s4)
(test (eq ?s2 ?nombreBuscar))
=>
(printout t "Para " ?s2 crlf)
(printout t "Enfermedad: " ?nombre "." crlf))

(defrule filtrarSigno1
(SignoBuscar ?nombreBuscar)
(Enfermedad ?nombre ?s1 ?s2 ?s3 ?s4)
(test (eq ?s3 ?nombreBuscar))
=>
(printout t "Para " ?s3 crlf)
(printout t "Enfermedad: " ?nombre "." crlf))

(defrule filtrarSigno2
(SignoBuscar ?nombreBuscar)
(Enfermedad ?nombre ?s1 ?s2 ?s3 ?s4)
(test (eq ?s4 ?nombreBuscar))
=>
(printout t "Para " ?s4 crlf)
(printout t "Enfermedad: " ?nombre "." crlf)) 

(defrule eliminarEnfermedad
(eliminar ?n)
=>
(retract ?n))
