package ClassExample2 // package

  constant Acceleration g = -9.8;

  // type
  type Acceleration = Real(quantity = "Acceleration", unit = "m/s2");  
  type Mass = Real(quantity = "Mass", unit = "kg");
  type Force = Real(quantity = "Force", unit = "N");
  type Velocity = Real(quantity = "Velocity", unit = "m/s");
  type Position = Real(quantity = "Length", unit = "m");

  // record
  record State
    Position x;
    Velocity v;
  end State;

  // model
  model MassB
    parameter Mass m = 1.0;
    parameter Force f = m * g;
    parameter State s0(x = 0, v = 5);
    State s(x(start = s0.x), v(start = s0.v));
  equation
    s.v = der(s.x);
    f = m * der(s.v);
  end MassB;

end ClassExample2;