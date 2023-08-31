pragma circom 2.0.0;

/*This circuit template checks that c is the multiplication of a and b.*/  

template CircomCircuit () {  

   // Input Signal
   signal input A;
   signal input B;

   // Signal from gates
   signal x;
   signal y;

   // Final Signal 
   signal output q;

   // Component gates used to create custom curcuit
   component ANDg = AND();
   component NOTg = NOT();
   component ORg = OR();

   // Circuit Logic
   ANDg.A <== A;
   ANDg.B <== B;
   x <== ANDg.out;

   NOTg.in <== B;
   y <== NOTg.out;

   ORg.a <== x;
   ORg.b <== y;
   q <== ORg.out;

}

template AND() {
    signal input A;
    signal input B;
    signal output out;

    out <== A*B;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}

template OR() {
    signal input A;
    signal input B;
    signal output out;

    out <== A + B - A*B;
}

component main = CircomCircuit();
