package ClassExample3  // package
  constant Acceleration g = -9.8;

  // type
  type Acceleration = Real(quantity = "Acceleration", unit = "m/s2");  
  type Mass = Real(quantity = "Mass", unit = "kg");
  type Force = Real(quantity = "Force", unit = "N");
  type Velocity = Real(quantity = "Velocity", unit = "m/s");
  type Position = Real(quantity = "Length", unit = "m");
  type SpringConstant = Real(quantity = "Spring Constant", unit = "N/m");
  
  // record
  record State
    Position x;
    Velocity v;
  end State;

  // function
  function hookesLaw
    input Position x;
    input SpringConstant k;
    output Force f;
  algorithm
    f := -k*x;
  end hookesLaw;

  // connector
  connector RealInput = input Real "'input Real' as connector" annotation(
    Icon(graphics = {Polygon(origin = {9.76, 0}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, points = {{-109.757, 100}, {-109.757, -100}, {90.2428, 0}, {90.2428, 0}, {-109.757, 100}})}, coordinateSystem(initialScale = 0.1)));
  connector RealOutput = output Real "'output Real' as connector" annotation(
    Icon(graphics = {Polygon(origin = {9.76, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, points = {{-109.757, 100}, {-109.757, -100}, {90.2428, 0}, {-109.757, 100}})}, coordinateSystem(initialScale = 0.1)));

  // block
  block MassBlock
    parameter Mass m = 1.0;
    parameter State s0(x = 0, v = 0);
    State s(x(start = s0.x), v(start = s0.v));
    ClassExample3.RealInput f annotation(
      Placement(visible = true, transformation(origin = {-72, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-98, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ClassExample3.RealOutput x annotation(
      Placement(visible = true, transformation(origin = {62, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    s.v = der(s.x);
    f = m * der(s.v);
    x = s.x;
    annotation(
      Icon(coordinateSystem(initialScale = 0.1), graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}), Ellipse(origin = {5, -22}, fillColor = {128, 0, 128}, fillPattern = FillPattern.Sphere, extent = {{-65, 82}, {55, -38}}, endAngle = 360)}));
  end MassBlock;

  block SpringBlock
    parameter SpringConstant k = 1.0;
    RealInput x annotation(
      Placement(visible = true, transformation(origin = {-98, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-98, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    RealOutput f annotation(
      Placement(visible = true, transformation(origin = {102, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    f = hookesLaw(k,x);
    annotation(
      Icon(graphics = {Rectangle(origin = {-5, 5}, extent = {{-95, 95}, {105, -105}}), Line(origin = {5.94311, -0.08682}, points = {{-86, 0.257485}, {-56, 0.257485}, {-46, 20.2575}, {-26, -19.7425}, {-6, 20.2575}, {14, -19.7425}, {34, 20.2575}, {44, 0.25749}, {58, 0.25749}, {74, 0.25749}})}));
  end SpringBlock;

  // model
  model MassBlockTest
    parameter Mass m = 1.0;
    SpringBlock springBlock1(k = 100) annotation(
      Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MassBlock massBlock1(m = m, s0(x = 1.0, v = 0.0)) annotation(
      Placement(visible = true, transformation(origin = {22, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const(k = m * g) annotation(
      Placement(visible = true, transformation(origin = {-30, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MassBlock massBlock2(m = m, s0(x = 0, v = 5.0)) annotation(
      Placement(visible = true, transformation(origin = {22, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(const.y, massBlock2.f) annotation(
      Line(points = {{-19, 40}, {12, 40}}, color = {0, 0, 127}));
    connect(massBlock1.x, springBlock1.x) annotation(
      Line(points = {{32, 0}, {40, 0}, {40, -40}, {-54, -40}, {-54, 0}, {-40, 0}}));
    connect(springBlock1.f, massBlock1.f) annotation(
      Line(points = {{-20, 0}, {12, 0}}));
    annotation(
      Diagram(graphics = {Text(origin = {-14, 5}, extent = {{-10, 5}, {10, -5}}, textString = "f"), Text(origin = {-49, 7}, extent = {{-13, 1}, {21, -7}}, textString = "x"), Text(origin = {6, 5}, extent = {{-10, 5}, {10, -5}}, textString = "f"), Text(origin = {33, 9}, extent = {{-13, 1}, {21, -7}}, textString = "x")}));
  end MassBlockTest;


end ClassExample3;