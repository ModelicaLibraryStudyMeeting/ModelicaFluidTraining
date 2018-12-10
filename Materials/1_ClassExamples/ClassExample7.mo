package ClassExample7
  import SI = Modelica.SIunits;
  constant SI.Acceleration g = -1 * Modelica.Constants.g_n;

  // force models
  partial model PartialForce
    input SI.Position x;
    output SI.Force f;
  end PartialForce;

  model SpringForce extends PartialForce;
    parameter SI.TranslationalSpringConstant k = 1;  
  algorithm
    f := -k * x;
  end SpringForce;
  
  model GravityForce extends PartialForce;
    parameter SI.Mass m = 1.0;
  algorithm
    f := m * g;
  end GravityForce;
  
  // mass models
  model PartialMass
    parameter SI.Mass m = 1.0;
    parameter SI.Velocity v0 = 5.0;
    parameter SI.Position x0 = 0.0;
    SI.Position x(start = x0);
    SI.Velocity v(start = v0);
    SI.Force f;
    AppliedForce af;
    replaceable model AppliedForce = PartialForce;
  equation
    v = der(x);
    f = m * der(v);
    x = af.x;
    f = af.f;
  end PartialMass;
  
  model SpringMass
  extends PartialMass(m = 1.0, x0 =1.0, v0 = 0.0, redeclare model AppliedForce = SpringForce(k = 100));
  end SpringMass;

  model FreeFallMass
  extends PartialMass(m = 1.0, v0=5.0, x0=0.0, redeclare model AppliedForce = GravityForce(m=1.0));
  end FreeFallMass;

end ClassExample7;
