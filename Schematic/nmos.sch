v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 230 250 250 250 {
lab=GND}
N 250 220 250 250 {
lab=GND}
N 230 220 250 220 {
lab=GND}
C {devices/vsource.sym} 200 350 0 0 {name=VCC value=1.8 savecurrent=false}
C {devices/vsource.sym} 270 350 0 0 {name=Vin value=0 savecurrent=false}
C {devices/lab_pin.sym} 200 320 0 0 {name=p1 sig_type=std_logic lab=VCC}
C {devices/lab_pin.sym} 200 380 0 0 {name=p2 sig_type=std_logic lab=GND}
C {devices/lab_pin.sym} 270 320 0 0 {name=p3 sig_type=std_logic lab=Vin}
C {devices/lab_pin.sym} 270 380 0 0 {name=p4 sig_type=std_logic lab=GND
}
C {sky130_fd_pr/nfet_01v8.sym} 210 220 0 0 {name=M1
W=1
L=0.15
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {devices/gnd.sym} 230 250 0 0 {name=l1 lab=GND}
C {devices/lab_pin.sym} 190 220 0 0 {name=p6 sig_type=std_logic lab=Vin}
C {devices/res.sym} 230 160 0 0 {name=R1
value=1k
footprint=1206
device=resistor
m=1}
C {devices/lab_pin.sym} 230 130 0 0 {name=p5 sig_type=std_logic lab=VCC}
C {devices/lab_pin.sym} 230 190 0 0 {name=p7 sig_type=std_logic lab=Vout}
C {devices/code_shown.sym} 360 190 0 0 {name=s1 only_toplevel=false value=".lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.save all"}
C {devices/code_shown.sym} 350 280 0 0 {name=s3 only_toplevel=false value=".dc Vin 0 2.2 1m
.save all
.end"}
