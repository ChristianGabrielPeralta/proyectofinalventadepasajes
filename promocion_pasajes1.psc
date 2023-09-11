//3) Una aerolínea pone a la venta pasajes aéreos en promoción, 
//para ello determina dos destinos posibles ROMA y BERLIN, 
//codificados como ROM y BER respectivamente.
//Para la venta se debe ingresar además si es primera o turista.
//Si se venden mas de 5 pasajes en una sola operación, 
//se le aplica un descuento del 15%
//El algoritmo debe pedir el destino, la categoría y la 
//cantidad de pasajes a comprar. Se corta el ingreso de datos a procesar
//cuando en destino se ingrese "FIN"

//Costo de pasajes: Primera $2300, Turista $1950
//Desarrollar un algoritmo que permita calcular:
//1) Cuántos pasajes se vendieron para cada uno de los destinos
//2) Cuanto representa el porcentaje de ROMA sobre el total recaudado.
//3) Cuál fue el destino que mas recaudó.
//4) Total de pasajes con descuento a BERLIN

Algoritmo promocion_pasajes
	definir destino, cat, mas_recaudo Como Caracter
	definir primera, turista,cant, cant_rom, cant_ber, cant_ber_desc, cant_total, monto_rom, monto_ber, monto_total como entero 
	
	primera = 2300
	turista = 1950
	
	escribir "Ingrese el destino que desea adquirir la promocion (ROM/BER). FIN para terminar"
	leer destino 
	destino = mayusculas(destino)
	mientras destino <> "ROM" y destino <> "BER" y destino <>"FIN" hacer
		escribir "Destino no valido para la promocion. Reingrese"
		leer destino
		destino = mayusculas(destino)
	FinMientras
	
	cant_rom = 0 
	cant_ber = 0
	monto_rom = 0
	monto_ber = 0
	cant_ber_desc = 0 
	
	mientras destino <> "FIN" Hacer
		escribir "Ingrese la clase que desea adquirir (PRIMERA/TURISTA)"
		leer cat
		cat = mayusculas(cat)
		mientras cat <> "PRIMERA" y cat <> "TURISTA" hacer
			escribir "Clase no valida. Reingrese."
			leer cat
			cat = mayusculas(cat)
		FinMientras

		escribir " Ingrese la cantidad de pasajes que desea adquirir"
		leer cant
		mientras cant < 0 Hacer
			escribir "la cantidad de pasajes no puede ser negativa. Reingrese"
			leer cant
		FinMientras

		
		segun destino hacer
			"ROM":
				cant_rom = cant_rom + cant
				segun cat hacer
					"PRIMERA":
						segun cant hacer
							1,2,3,4,5:
								monto_rom = monto_rom + (cant*primera)
							De Otro Modo
								monto_rom = monto_rom + (cant*(primera*0.85))
						FinSegun
					"TURISTA":
						segun cant hacer
							1,2,3,4,5:
								monto_rom = monto_rom + (cant*turista)
							De Otro Modo:
								monto_rom = monto_rom + (cant*turista*0.85)
						FinSegun
				FinSegun
				
			"BER":	
				cant_ber = cant_ber + cant
				segun cat hacer
					"PRIMERA":
						segun cant hacer
							1,2,3,4,5:
								monto_ber = monto_ber + (cant*primera)
							De Otro Modo:
								monto_ber = monto_ber + (cant*primera*0.85)
								cant_ber_desc = cant_ber_desc + cant
						FinSegun
					"TURISTA":
						segun cant hacer
							1,2,3,4,5:
								monto_ber = monto_ber + (cant*turista)
							De Otro Modo:
								monto_ber = monto_ber + (cant*turista*0.85)
								cant_ber_desc = cant_ber_desc + cant
						FinSegun
				FinSegun
		FinSegun
		
		escribir "Ingrese el destino que desea adquirir la promocion (ROM/BER). FIN para terminar"
		leer destino 
		destino = mayusculas(destino)
		mientras destino <> "ROM" y destino <> "BER" y destino <>"FIN" hacer
			escribir "Destino no valido para la promocion. Reingrese"
			leer destino
			destino = mayusculas(destino)
		FinMientras
		
	FinMientras
	
	cant_total = cant_rom + cant_ber
	monto_total = monto_rom + monto_ber
	
	si monto_rom > monto_ber Entonces
		mas_recaudo = "ROMA"
	SiNo
		si monto_rom == monto_ber Entonces
			escribir "ambos montos fueron iguales"
			mas_recaudo = "Ambos montos fueron iguales"
		SiNo
			mas_recaudo = "BERLIN"
		finsi 	
	FinSi
	
	escribir "1) Total pasajes a ROMA: ", cant_rom, " pasajes"
	escribir "1) Total pasajes a BERLIN: ", cant_ber, " pasajes"
	escribir "2) El % de ROMA sobre el total recaudado es de: ", redon((monto_rom/monto_total)* 100), " %"
	escribir "2) El % de BERLIN sobre el total recaudado es de: ", redon((monto_ber/monto_total)* 100), " %"
	escribir "3) el destino que mas recaudo es: ", mas_recaudo
	escribir "4) La cantidad de pasajes con descuento a Berlin es de: ", cant_ber_desc
FinAlgoritmo
