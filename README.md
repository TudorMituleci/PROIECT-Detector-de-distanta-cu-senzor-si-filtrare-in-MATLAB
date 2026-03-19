# PROIECT Detector de distanta cu senzor ultrasonic si filtrare digitala in MATLAB

# 1.REZUMAT

## 1.1 Descrierea proiectului
   Acest proiect implementeaza un sistem de detectare a distantei folosind un senzor ultrasonic HC-SR04 conectat la un Arduino Uno. Arduino masoara distanta fata de un obiect si transmite datele prin portul serial doar daca distanta este mai mica de 50 cm.
   In MATLAB, datele sunt citite in timp real, afisate grafic si trecute printr-un filtru de mediere pentru a elimina fluctuatiile si zgomotul din semnal. Sistemul permite vizualizarea simultana a semnalului original si a celui filtrat, oferind o reprezentare clara a variatiilor de distanta.
   Proiectul combina programarea embedded cu prelucrarea semnalului in MATLAB si poate fi extins in aplicatii precum roboti, sisteme de siguranta sau control automatizat.

## 1.2 Descrierea implementarii
1.Arduino Uno – colectare si trimitere date
  - Senzorul ultrasonic HC-SR04 este conectat la pinii digitali D2 (ECHO) si D3 (TRIG) ai placii Arduino Uno.
  - Codul Arduino genereaza un impuls de 10 microsecunde catre pinul TRIG, care declanseaza masurarea distantei de catre senzor.
  - Pinul ECHO receptioneaza semnalul de intoarcere, durata acestuia este folosita pentru a calcula distanta in centimetri.
  - Daca distanta masurata este mai mica sau egala cu 50 cm, valoarea este trimisa prin portul serial catre calculator prin comanda Serial.println().
  - Comunicarea seriala este configurata la 115200 bauds pentru transfer rapid si stabil.

2.MATLAB – citire, filtrare si afisare grafica
  -	In MATLAB, se stabileste conexiunea cu portul serial la care este conectat Arduino Uno (COM4).
  -	Se initializeaza doi vectori pentru stocarea semnalului brut si a celui filtrat.
  -	Se utilizeaza un filtru de mediere mobila pentru a reduce zgomotul din masuratori.
  -	Se construieste un grafic in timp real care afiseaza:
    -	semnalul original: albastru
    -	semnalul filtrat: rosu
  -	Afisarea se actualizeaza cu fiecare noua masuratoare folosind set(...) si drawnow.

3.Comunicare seriala Arduino–MATLAB
  - Arduino trimite distanta masurata sub forma de text numeric, urmat de un caracter de linie noua.
  -	In MATLAB, se foloseste configureTerminator(s, "LF") pentru a citi corect fiecare linie de date.
  -	Acest mecanism asigura sincronizarea dintre Arduino si MATLAB si permite prelucrarea in timp real a datelor primite.


# 2.PREZENTAREA PLATFORMEI HARDWARE

## 2.1 Caracteristici tehnice – Arduino Uno
	Placa de dezvoltare Arduino UNO R3 ATmega328P este o alegere excelenta pentru orice pasionat de electronica, programare și robotica. Aceasta placa open-source este o versiune actualizata a modelului clasic Arduino UNO, cu caracteristici imbunatatite și compatibilitate cu un numar mare de module de extensie. Cu un microcontroller ATmega328P la baza sa, placa are o memorie programabila de 32KB si poate fi programata prin intermediul mediului de dezvoltare Arduino.

Specificatii:
  - Tensiune de functionare: 5V
  - Tensiune de alimentare Jack: 7V – 12V
  - Pini de I/O: 14
  - Pini PWM: 6
  - Pini ADC: 8
  - Memorie flash: 32kb  
  - Comunicatie TWI, SPI si UART
  - Frecventa de functionare: 16 MHz

##2.2 Caracteristici tehnice – Senzor de distanta ultrasonic HC-SR04
  HC-SR04 este un model economic ce ofera masuratori fara contact, de la 2 cm la 400 cm, avand o acuratete de pana la 3mm. Fiecare modul HC-SR04 include un transmitator ultrasonic, un receptor si un circuit de control. Singurii pini care trebuie sa te preocupe sunt: VCC, Trig, Echo si GND.
Specificatii:
  - Tensiune de operare: 5V DC
  - Curent de operare: 15mA
  - Unghi de masurare: 15 grade
  - Distanta de variatie: 2cm – 4m


