v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 370 460 370 490 {
lab=Vout}
N 330 430 330 520 {
lab=Vin}
N 370 550 370 580 {
lab=GND}
N 290 470 330 470 {
lab=Vin}
N 370 480 430 480 {
lab=Vout}
N 370 370 370 400 {
lab=VCC}
N 370 520 450 520 {
lab=GND}
N 450 520 450 560 {
lab=GND}
N 370 560 450 560 {
lab=GND}
N 370 430 440 430 {
lab=VCC}
N 440 390 440 430 {
lab=VCC}
N 370 390 440 390 {
lab=VCC}
N 430 500 480 500 {
lab=Vout}
N 430 480 430 500 {
lab=Vout}
C {devices/vsource.sym} 440 660 0 0 {name=VCC value=1.8 savecurrent=false}
C {devices/vsource.sym} 510 660 0 0 {name=Vin value="pulse(0 1.8 0 .3n .3n 20n 40n)" savecurrent=false}
C {devices/lab_pin.sym} 440 630 0 0 {name=p1 sig_type=std_logic lab=VCC}
C {devices/lab_pin.sym} 440 690 0 0 {name=p2 sig_type=std_logic lab=GND}
C {devices/lab_pin.sym} 510 630 0 0 {name=p3 sig_type=std_logic lab=Vin}
C {devices/lab_pin.sym} 510 690 0 0 {name=p4 sig_type=std_logic lab=GND
}
C {devices/code_shown.sym} 570 430 0 0 {name=s1 only_toplevel=false value=".lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.save all"}
C {devices/code_shown.sym} 560 520 0 0 {name=s3 only_toplevel=false value=".tran .02n 80n
.save all
.end"}
C {sky130_fd_pr/nfet_01v8.sym} 350 520 0 0 {name=M1
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
C {sky130_fd_pr/pfet_01v8.sym} 350 430 0 0 {name=M2
W=2
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
C {devices/lab_pin.sym} 370 580 0 0 {name=p5 sig_type=std_logic lab=GND}
C {devices/lab_pin.sym} 290 470 0 0 {name=p6 sig_type=std_logic lab=Vin}
C {devices/lab_pin.sym} 430 480 0 1 {name=p7 sig_type=std_logic lab=Vout}
C {devices/lab_pin.sym} 370 370 0 1 {name=p8 sig_type=std_logic lab=VCC}
C {devices/parax_cap.sym} 480 510 0 0 {name=C1 gnd=0 value=0.5p m=1}
