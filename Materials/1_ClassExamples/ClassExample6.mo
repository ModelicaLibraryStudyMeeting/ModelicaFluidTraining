package ClassExample6
  import SI = Modelica.SIunits;
  constant SI.Acceleration g = -1 * Modelica.Constants.g_n;

  // model
  model MassC
    parameter SI.Mass m = 1.0;
    parameter SI.Velocity v0 = 0.0;
    parameter SI.Position x0 = 1.0;
    SI.Position x(start = x0);
    SI.Velocity v(start = v0);
    SI.Force f;
    AppliedForce af(k=100);

    // local model    
    model AppliedForce
      parameter SI.TranslationalSpringConstant k = 100;
      input SI.Position x;
      output SI.Force f;
    algorithm
      f := -k * x;
    end AppliedForce;
    
  equation
    v = der(x);
    f = m * der(v);
    x = af.x;
    f = af.f;
  end MassC;

end ClassExample6;
