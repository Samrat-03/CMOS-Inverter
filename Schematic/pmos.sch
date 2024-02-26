v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 460 470 490 470 {
lab=Vin}
N 530 410 530 440 {
lab=VCC}
N 530 560 530 580 {
lab=GND}
N 530 470 550 470 {
lab=VCC}
N 550 440 550 470 {
lab=VCC}
N 530 440 550 440 {
lab=VCC}
N 560 510 570 510 {
lab=Vout}
N 560 500 560 510 {
lab=Vout}
N 530 500 560 500 {
lab=Vout}
C {devices/vsource.sym} 360 650 0 0 {name=VCC value=1.8 savecurrent=false}
C {devices/vsource.sym} 460 650 0 0 {name=Vin1 value="pulse(0 1.8 1ns 1ns 1ns 5ns 10ns)" savecurrent=false}
C {devices/lab_pin.sym} 360 620 0 0 {name=p1 sig_type=std_logic lab=VCC}
C {devices/lab_pin.sym} 360 680 0 0 {name=p2 sig_type=std_logic lab=GND}
C {devices/lab_pin.sym} 460 620 0 0 {name=p3 sig_type=std_logic lab=Vin}
C {devices/lab_pin.sym} 460 680 0 0 {name=p4 sig_type=std_logic lab=GND
}
C {sky130_fd_pr/pfet_01v8.sym} 510 470 0 0 {name=M1
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
model=pfet_01v8
spiceprefix=X
}
C {devices/lab_pin.sym} 460 470 0 0 {name=p5 sig_type=std_logic lab=Vin}
C {devices/lab_pin.sym} 530 410 0 1 {name=p6 sig_type=std_logic lab=VCC
}
C {devices/res.sym} 530 530 0 0 {name=R1
value=1k
footprint=1206
device=resistor
m=1}
C {devices/lab_pin.sym} 530 580 0 1 {name=p7 sig_type=std_logic lab=GND}
C {devices/code_shown.sym} 620 460 0 0 {name=s1 only_toplevel=false value=".lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.save all"}
C {devices/code_shown.sym} 610 550 0 0 {name=s3 only_toplevel=false value=".tran 0.1n 100n
.save all
.end"}
C {devices/lab_pin.sym} 570 510 0 1 {name=p8 sig_type=std_logic lab=Vout}
