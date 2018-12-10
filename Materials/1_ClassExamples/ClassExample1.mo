package ClassExample1 // package
  constant Acceleration g = -9.8;

  // type
  type Acceleration = Real(quantity = "Acceleration", unit = "m/s2");
  type Mass = Real(quantity = "Mass", unit = "kg");
  type Force = Real(quantity = "Force", unit = "N");
  type Velocity = Real(quantity = "Velocity", unit = "m/s");
  type Position = Real(quantity = "Length", unit = "m");
 
  // class
  class MassA
    parameter Mass m = 1.0;
    parameter Force f = m*g;
    parameter Velocity v0 = 5.0;
    parameter Position x0 = 0.0;
    Position x(start = x0);
    Velocity v(start = v0);
  equation
    v = der(x);
    f = m*der(v);
  end MassA;

end ClassExample1;