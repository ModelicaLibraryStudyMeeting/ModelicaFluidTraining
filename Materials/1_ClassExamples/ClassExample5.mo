package ClassExample5
  
  import SI=Modelica.SIunits;
  constant SI.Acceleration g = -1 * Modelica.Constants.g_n;

  // partial model
  partial model PartialMass
    parameter SI.Mass m = 1.0;
    parameter SI.Velocity v0 = 5.0;
    parameter SI.Position x0 = 0.0;
    SI.Force f;
    SI.Position x(start = x0);
    SI.Velocity v(start = v0);
  equation
    v = der(x);
    f = m * der(v);
  end PartialMass;

  // model
  model FreeFallMass extends PartialMass;
  equation
   f = m * g;
  end FreeFallMass;

  model SpringMass extends PartialMass(x0 = 1.0, v0 = 0.0);
    parameter SI.TranslationalSpringConstant k = 100;
  equation
   f = -k * x;
  end SpringMass;

end ClassExample5;

