# CMOS Inverter
In this project we will study characteristics of a CMOS Inverter.

## Tools Used
- XSCHEM
- NGSPICE
- MAGIC
- SKY130
- NETGEN

## Installation of Tools
- CAUTION: Before installing these tools, you should have atleast 50GB free space in your disk.
- Follow this link to install all the tools: https://xschem.sourceforge.io/stefan/xschem_man/tutorial_xschem_sky130.html


## Why CMOS Inverter?
- Before studying CMOS, we should know why to use a CMOS as an inverter. Can't we just use  NMOS or PMOS for inversion?
- To know the answer, first simulate an NMOS and PMOS, then we'll see if it is good for inversion.

## NMOS Transistor
- Create a new folder using mkdir
- Copy xschemrc file into this folder using the command `cp /usr/local/share/pdk/sky130B/libs.tech/xschem/xschemrc .`
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
- NGSPICE command to plot this graph is `plot -vcc#branch`.

![Id v/s Vds](/Images/id_vds.png)

### Id v/s Vgs Characteristics
- In DC sweep, we write value as .dc Vin 0 2.2 1m VCC 0.3 1.8 0.3
- It means Id will be plotted against Vin (Vgs). Value of VCC is in x-axis from 0 to 2.2V with gap of 1mV.
- Vin (Vgs) takes value from 0.3 to 1.8 with the gap of 0.3.
- NGSPICE command to plot this graph is `plot -vcc#branch`.

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
- The W/L ratio of PMOS is 2.5 greater than the W/L ratio of NMOS. This is because when we equate the current equations of NMOS and PMOS, this ratio is equal to the ratio of electron mobility in NMOS and hole mobility in PMOS, which is around 2.5~3.
- The following is the schematic of a CMOS Inverter.

![CMOS Inverter Schematic](/Images/cmos.png)

### Voltage Transfer Characteristics
- DC sweep is used to plot VTC. Vin is varied from 0 to 2.2V with gap of 1mV.
- The point where Vin and Vout meet is called switching threshold point, Vm. In ideal cases it for the CMOS to be symmetric, it should be exactly at the middle (Vdd/2). For our case, it should be 0.9V. 
- Initially the W/L ratios are same in the simulation (1/0.15). But when we plot the VTC, we observe that Vm is 0.838V, which is less than 0.9V. To increase this either we can increase width of PMOS or decrease that of NMOS. Also, we have to keep the W/L ratios of PMOS to NMOS as 2.5. So, I have taken width of NMOS as 0.4 and width of PMOS as 1. By this, we get the value of Vm as 0.882V which is better than the previous case.
- To calculate Vm, we use the command: `meas dc vm when vin=vout in ngspice terminal`.

![Voltage Transfer Characteristics](/Images/vtc.png)

Now we calculate other parameters of CMOS: VOH, VOL, VIH, VIL
- VOH - Maximum output voltage when it is logic '1'.
- VOL - Minimun output voltage when it is logic '0'.
- VIH - Minimum input voltage that can be interpreted as logic '1' input.
- VIL - Maximum input voltage that can be interpreted as logic '0' input.
- VOH = 1.8V and VOL = 0V clearly.
- VIH and VIL are calculated at those points in the VTC where the gain is -1. Derivative of Vout should be -1.
- We define a variable gain = (abs(deriv(vout)) >= 1)*1.8
- Then we plot both gain and vout in same plot. The points where these two plots intersect are VIL and VIH.
- Command to find those points is: `meas VIL dc find vin when gain=1 cross=1`
			        `meas VIH dc find vin when gain=1 cross=last`
		
![VIL and VIH](/Images/vil_vih.png)

So, the calculated parameters are:
- VOH = 1.8V
- VOL = 0V
- VIL = 0.7475V
- VIH = 1.0044V
Noise Margin Formula
NML(Noise Margin for Low) - VIL - VOL = 0.7475 V
NMH(Noise Margin for HIGH) - VOH - VIH = 0.7956 V

### Transient Analysis
- The propagation delay of a CMOS is time taken from 50% of input to 50% of output. This can be calculated in two cases: tpHL and tpLH. The final propagation delay will be the average of these two times.
- Another parameter is the rise time and fall time. Rise time is the time from 10% of output to 90% of output.

![Delay](/Images/delay.png)

- We will calculate these parameters by doing the transient analysis of the CMOS inverter.
- For transient analysis we use - .tran .02n 10n in the code shown option. For Vin, we will take a pulse. It is generated using - pulse(0 1.8 0 .3n .3n 3n 6.6n).

![Transient Analysis](/Images/tran.png)

- From the transient analysis, we found that the propagation delay of the CMOS inverter is 29.14ps. The rise time is 56.14ps and the fall time is 46.2ps.

- The rise and fall time we calculated is for no load condition. If we attach a load capacitance to the output of the inverter, the rise and fall time will drastically increase because the capacitor will take time to charge and discharge.
- To decrease the rise and fall time when the load is connected, we can use two ways:
1. Increase clock period or decrease clock frequency.
2. Increase the width of NMOS & PMOS.

![CMOS Inverter with Load (Vout & Ids*1000 graph)](/Images/with_load.png)

### Power Analysis
- To calculate the power consumption for one cycle, we need to integrate VxI for one cycle.
- As V is constant (1.8V), we just need to integrate current in one cycle. We do this by the command: `meas trans curr_int integ vcc#branch from=20n to=60n`.
- The power consumption of the CMOS inverter at 0.5pF load is 1.63pW.
- The power consumption of a circuit can be reduced by reducing the switching of the output, which means optimized architecture.

### Layout Design using MAGIC
- The first step is to integrate MAGIC to Sky130 by the command: `magic  -rcfile /usr/local/share/pdk/sky130A/libs.tech/magic/sky130A.magicrc`.
- This command will open two windows, one is for layout and other one is a terminal.
- To enable the grid we use the command: `grid 50nm 50nm` (50nm because channel length of our NMOS and PMOS is 150nm which is multiple of 50nm).
- Use shift+z to zoom out and ctrl+z to zoom in.
- To create a box, we need two points: left bottom and right top. Click left button of mouse to select the left bottom corner of box and right button of mouse to select the right top corner of the box. To shift the box in only on the points of the grid use command: `snap user 50nm`.
- To check the DRC error use the command: `drc find`.
- The wafer given in the layout is p-type by default. To make a PMOS, we have to take n-well.
- After the well layer, we have a diffusion layer. n diffusion is created in the p-well (or p substrate) and p diffusion in the n well. Diffusion regions are also called the active regions and they form the sources and drains of the transistors.
- After the diffusion layer, we have our oxide layer (polysilicon).
- We use a metal layer above regions which we have to connect to other things. For diffusion layers we use LI (local interconnect) metal. The diffusion layer and the LI metal layer are at different stacks according to the layer stack below given by Skywater. To connect these two layers we use VIA. To connect p-diff or n-diff to li layer, we use pdc or ndc respectively.

![Skywater Layer Stack](/Images/layer_stack.png)

- Now, we make our gate for NMOS and PMOS. They will be n-diff and p-diff layers only, but we can't add n-diff and p-diff inside n-well and p-well. So, we use n-tap and p-tap instead. Here also we use a li metal layer above it. To connect it to n-tap and p-tap, we use ntapc and ptapc.
- We know that gate of PMOS is connected to VCC. So, we make the VCC using metal1 (m1) and connect it to the li metal below using MCON. Similarly we connect GND to gate of NMOS.
- Connect source terminal of PMOS to VCC using LI metal. 
- To check whether it is properly connected we can select the VCC and press S on keyboard. Keep pressing S, it will show where is VCC getting shorted in the whole layout. Press , to deselect.
- Similarly connect GND to source terminal of NMOS. Also, connect drain terminal of both NMOS and PMOS.
- Now we make VOUT and VIN terminals. VOUT terminal will be a metal1 (m1) layer, which will be connected to the LI using mcon. VIN is connected to polysilicon using polyc and then to LI using mcon.

#### Congrats!! Your layout is completed.

![CMOS Inverter Layout](/Images/layout.png)

- Now we extract the layout into a spice file. First use the command: `extract all`. This will create a .ext file. To convert it to spice file use command: `ext2spice file_name.ext`.

### LVS (Layout v/s Schematic)
- Here we compare netlists generated by Xschem and Magic.
- For this, we need to install a tool called NETGEN. 
- To install NETGEN, use the following commands
```
$  git clone git://opencircuitdesign.com/netgen
$  cd netgen
$  ./configure
$  sudo make
$  sudo make install 
```

- To perform the LVS use the commands `lvs file1.spice file2.spice setup.tcl`. Create a setup.tcl file in the same folder where we can give commands which will run during lvs.
- The output of lvs is a comp.out file, which shows the differences between the two netlists.

