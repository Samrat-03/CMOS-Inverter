# CMOS Inverter
-In this project we will study characteristics of a CMOS Inverter.

## Tools Used
- XSCHEM
- NGSPICE
- MAGIC
- SKY130

## Installation of Tools
- CAUTION: Before installing these tools, you should have atleast 50GB free space in your disk.
- Follow this link to install all the tools: https://xschem.sourceforge.io/stefan/xschem_man/tutorial_xschem_sky130.html


## Why CMOS Inverter?
- Before studying CMOS, we should know why to use a CMOS as an inverter. Can't we just use  NMOS or PMOS for inversion?
- To know the answer, first simulate an NMOS and PMOS, then we'll see if it is good for inversion.

## NMOS Transistor
- Create a new folder using mkdir
- Copy xschemrc file into this folder using the command cp /usr/local/share/pdk/sky130B/libs.tech/xschem/xschemrc .
- Load Xterm and inside that terminal load xschem.
- Create a new schematic and save it inside the folder.
- To take components use command shift+i. 
- Some components like NMOS are to be taken from the PDK, because we are designing according to their requirements.
- To simulate the NMOS, take code_shown component and give values to it as shown in the figure.
- When the schematic is complete, create and save the netlist. Then simulate.
- NGSPICE terminal will open (if not configure it again).

![NMOS Schematic](/Images/nmos_schematic.png)

### Id v/s Vds Characteristics
- In DC sweep, we write value as .dc VCC 0 1.8 1m Vin 0 2.2 0.2
- It means Id will be plotted against VCC (Vds). Value of VCC is in x-axis from 0 to 1.8V with gap of 1mV.
- Vin (Vgs) takes value from 0 to 2.2 with the gap of 0.2.
- NGSPICE command to plot this graph is plot -vcc#graph.

![Id v/s Vds](/Images/id_vds.png)

### Id v/s Vgs Characteristics
- In DC sweep, we write value as .dc Vin 0 2.2 1m VCC 0.3 1.8 0.3
- It means Id will be plotted against Vin (Vgs). Value of VCC is in x-axis from 0 to 2.2V with gap of 1mV.
- Vin (Vgs) takes value from 0.3 to 1.8 with the gap of 0.3.
- NGSPICE command to plot this graph is plot -vcc#graph.

![Id v/s Vgs](/Images/id_vgs.png)

### Input Output Characteritics (NMOS)
- Now we will apply a pulse as input signal and plot the input output characteristics. 
- In this plot we see, when the input is LOW (0), output is HIGH (1). But when the input is HIGH (1), the output is not LOW (0). 
- NMOS is strong 0, weak 1. Weak 1 means it can't charge a capacitor fully. It can discharge fully.

![Vout v/s Vin (NMOS)](/Images/vout_vin_nmos.png)

### Input Output Characteristics (PMOS)
- Now we will apply a pulse as input signal and plot the input output characteristics. 
- In this plot we see, when the input is LOW (0), output is not HIGH (1). But when the input is HIGH (1), the output is LOW (0). 
- PMOS is strong 1, weak 0. Strong 1 means it can charge a capacitor fully. It can't discharge fully.

![Vout v/s Vin (PMOS)](/Images/vout_vin_pmos.png)


## CMOS
- For an inverter, we can't use NMOS or PMOS. But we can use a combination of them. NMOS can discharge a capacitor fully, while PMOS can charge a capacitor fully. Series of both of them will create an inverter for us, which can do both charge as well as discharge.
- PMOS is a pull up network, whereas NMOS is a pull down network.
- The following is the schematic of a CMOS Inverter.

![CMOS Inverter Schematic](/Images/cmos.png)

### Voltage Transfer Characteristics
- DC sweep is used to plot VTC. Vin is varied from 0 to 2.2V with gap of 1mV.

![Voltage Transfer Characteristics](/Images/vtc.png)



