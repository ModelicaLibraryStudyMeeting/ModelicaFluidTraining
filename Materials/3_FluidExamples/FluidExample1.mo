package FluidExample1
  import Modelica.Media;
  import Modelica.Media.IdealGases.Common;

  model WaterMix1
    replaceable package Medium = Media.Water.StandardWater;
    inner Modelica.Fluid.System system annotation(
      Placement(visible = true, transformation(origin = {64, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Sources.MassFlowSource_T hotWater(redeclare package Medium = Medium,
      T = 370, nPorts = 1, use_m_flow_in = true) annotation(
      Placement(visible = true, transformation(origin = {-50, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Sources.MassFlowSource_T coldWater(redeclare package Medium = Medium,
      T = 280, m_flow = 0.2, nPorts = 1) annotation(
      Placement(visible = true, transformation(origin = {-50, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Pipes.StaticPipe pipe1(redeclare package Medium = Medium,
      diameter = 0.01, length = 1) annotation(
      Placement(visible = true, transformation(origin = {-18, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Pipes.StaticPipe pipe2(redeclare package Medium = Medium,
      diameter = 0.01, length = 1) annotation(
      Placement(visible = true, transformation(origin = {-16, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Pipes.StaticPipe pipe3(redeclare package Medium = Medium,
      diameter = 0.01414, length = 1) annotation(
      Placement(visible = true, transformation(origin = {16, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Sources.FixedBoundary ambient(redeclare package Medium = Medium,
      nPorts = 1, p = 101325) annotation(
      Placement(visible = true, transformation(origin = {74, 6}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Fluid.Sensors.TemperatureTwoPort temperature(redeclare package Medium = Medium) annotation(
      Placement(visible = true, transformation(origin = {46, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Ramp massFlow(duration = 10, height = 1.95, offset = 0.05) annotation(
      Placement(visible = true, transformation(origin = {-86, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(temperature.port_b, ambient.ports[1]) annotation(
      Line(points = {{56, 6}, {66, 6}, {66, 6}, {64, 6}}, color = {0, 127, 255}));
    connect(pipe3.port_b, temperature.port_a) annotation(
      Line(points = {{26, 6}, {36, 6}, {36, 6}, {36, 6}}, color = {0, 127, 255}));
    connect(pipe2.port_b, pipe3.port_a) annotation(
      Line(points = {{-6, -20}, {0, -20}, {0, 6}, {6, 6}, {6, 6}}, color = {0, 127, 255}));
    connect(pipe1.port_b, pipe3.port_a) annotation(
      Line(points = {{-8, 26}, {0, 26}, {0, 6}, {6, 6}, {6, 6}}, color = {0, 127, 255}));
    connect(coldWater.ports[1], pipe2.port_a) annotation(
      Line(points = {{-40, -20}, {-26, -20}, {-26, -20}, {-26, -20}}, color = {0, 127, 255}, thickness = 0.5));
    connect(hotWater.ports[1], pipe1.port_a) annotation(
      Line(points = {{-40, 26}, {-28, 26}, {-28, 26}, {-28, 26}}, color = {0, 127, 255}, thickness = 0.5));
    connect(massFlow.y, hotWater.m_flow_in) annotation(
      Line(points = {{-75, 34}, {-60, 34}}, color = {0, 0, 127}));
    annotation(
      experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.02),
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
  end WaterMix1;


  model TraceSubstanceMix1
    replaceable package Medium = Media.Water.StandardWater(extraPropertiesNames = {"chlorine"}, C_nominal = {0.005});
    inner Modelica.Fluid.System system annotation(
      Placement(visible = true, transformation(origin = {64, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Sources.MassFlowSource_T solution1(redeclare package Medium = Medium,
      C = {0.001}, T = 293.15, nPorts = 1, use_m_flow_in = true) annotation(
      Placement(visible = true, transformation(origin = {-50, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Sources.MassFlowSource_T solution2(redeclare package Medium = Medium,
      C = {0.05}, T = 293.15, m_flow = 0.2, nPorts = 1) annotation(
      Placement(visible = true, transformation(origin = {-50, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Pipes.StaticPipe pipe1(redeclare package Medium = Medium,
      diameter = 0.01, length = 1) annotation(
      Placement(visible = true, transformation(origin = {-18, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Pipes.StaticPipe pipe2(redeclare package Medium = Medium,
      diameter = 0.01, length = 1) annotation(
      Placement(visible = true, transformation(origin = {-16, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Pipes.StaticPipe pipe3(redeclare package Medium = Medium,
      diameter = 0.01414, length = 1) annotation(
      Placement(visible = true, transformation(origin = {16, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Sources.FixedBoundary ambient(redeclare package Medium = Medium,
      nPorts = 1, p = 101325) annotation(
      Placement(visible = true, transformation(origin = {74, 6}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Ramp massFlow(duration = 10, height = 1.95, offset = 0.05) annotation(
      Placement(visible = true, transformation(origin = {-86, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Sensors.TraceSubstancesTwoPort traceSubstance(redeclare package Medium = Medium,
      substanceName = "chlorine") annotation(
      Placement(visible = true, transformation(origin = {46, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(traceSubstance.port_b, ambient.ports[1]) annotation(
      Line(points = {{56, 6}, {66, 6}, {66, 6}, {64, 6}}, color = {0, 127, 255}));
    connect(pipe3.port_b, traceSubstance.port_a) annotation(
      Line(points = {{26, 6}, {36, 6}, {36, 6}, {36, 6}}, color = {0, 127, 255}));
    connect(pipe2.port_b, pipe3.port_a) annotation(
      Line(points = {{-6, -20}, {0, -20}, {0, 6}, {6, 6}, {6, 6}}, color = {0, 127, 255}));
    connect(pipe1.port_b, pipe3.port_a) annotation(
      Line(points = {{-8, 26}, {0, 26}, {0, 6}, {6, 6}, {6, 6}}, color = {0, 127, 255}));
    connect(solution2.ports[1], pipe2.port_a) annotation(
      Line(points = {{-40, -20}, {-26, -20}, {-26, -20}, {-26, -20}}, color = {0, 127, 255}, thickness = 0.5));
    connect(solution1.ports[1], pipe1.port_a) annotation(
      Line(points = {{-40, 26}, {-28, 26}, {-28, 26}, {-28, 26}}, color = {0, 127, 255}, thickness = 0.5));
    connect(massFlow.y, solution1.m_flow_in) annotation(
      Line(points = {{-75, 34}, {-60, 34}}, color = {0, 0, 127}));
    annotation(
      experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02),
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
  end TraceSubstanceMix1;


  package MyGas "Methane and Air"
    extends Common.MixtureGasNasa(mediumName = "MyGas",
      data = {Common.SingleGasesData.CH4, Common.SingleGasesData.N2, Common.SingleGasesData.O2},
      fluidConstants = {Common.FluidData.CH4, Common.FluidData.N2, Common.FluidData.O2},
      substanceNames = {"Methane", "Nitrogen", "Oxygen"},
      reference_X = {0.5, 0.4, 0.1});
    annotation(
      Documentation(info = "<html>

</html>"));
  end MyGas;


  model GasMix1
    replaceable package Medium = MyGas;
    inner Modelica.Fluid.System system annotation(
      Placement(visible = true, transformation(origin = {64, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Sources.MassFlowSource_T Methane(redeclare package Medium = Medium,
      T = 293.15, X = {1.0, 0.0, 0.0}, nPorts = 1, use_m_flow_in = true) annotation(
      Placement(visible = true, transformation(origin = {-50, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Sources.MassFlowSource_T Air(redeclare package Medium = Medium, T = 293.15,
      X = {0.0, 0.8, 0.2}, m_flow = 2.0e-4, nPorts = 1) annotation(
      Placement(visible = true, transformation(origin = {-50, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Pipes.StaticPipe pipe1(redeclare package Medium = Medium,
      diameter = 0.01, length = 1) annotation(
      Placement(visible = true, transformation(origin = {-18, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Pipes.StaticPipe pipe2(redeclare package Medium = Medium,
      diameter = 0.01, length = 1) annotation(
      Placement(visible = true, transformation(origin = {-16, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Pipes.StaticPipe pipe3(redeclare package Medium = Medium,
      diameter = 0.01414, length = 1) annotation(
      Placement(visible = true, transformation(origin = {16, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Sources.FixedBoundary ambient(redeclare package Medium = Medium,
      nPorts = 1, p = 101325) annotation(
      Placement(visible = true, transformation(origin = {74, 6}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Ramp massFlow(duration = 10, height = 1.95e-3, offset = 5.0e-5) annotation(
      Placement(visible = true, transformation(origin = {-86, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MassFractionsTwoPort1 massFraction(redeclare package Medium = Medium,
      substanceName = Medium.substanceNames[1]) annotation(
      Placement(visible = true, transformation(origin = {46, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(massFraction.port_b, ambient.ports[1]) annotation(
      Line(points = {{56, 6}, {66, 6}, {66, 6}, {64, 6}}, color = {0, 127, 255}));
    connect(pipe3.port_b, massFraction.port_a) annotation(
      Line(points = {{26, 6}, {36, 6}, {36, 6}, {36, 6}}, color = {0, 127, 255}));
    connect(pipe2.port_b, pipe3.port_a) annotation(
      Line(points = {{-6, -20}, {0, -20}, {0, 6}, {6, 6}, {6, 6}}, color = {0, 127, 255}));
    connect(pipe1.port_b, pipe3.port_a) annotation(
      Line(points = {{-8, 26}, {0, 26}, {0, 6}, {6, 6}, {6, 6}}, color = {0, 127, 255}));
    connect(Air.ports[1], pipe2.port_a) annotation(
      Line(points = {{-40, -20}, {-26, -20}, {-26, -20}, {-26, -20}}, color = {0, 127, 255}, thickness = 0.5));
    connect(Methane.ports[1], pipe1.port_a) annotation(
      Line(points = {{-40, 26}, {-28, 26}, {-28, 26}, {-28, 26}}, color = {0, 127, 255}, thickness = 0.5));
    connect(massFlow.y, Methane.m_flow_in) annotation(
      Line(points = {{-75, 34}, {-60, 34}}, color = {0, 0, 127}));
    annotation(
      experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02),
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
  end GasMix1;


  model MassFractionsTwoPort1 "Ideal two port sensor for mass fraction, This is a modified version of Modelica.Fluid.Sensors.MassFractionTwoPort in MSL3.2.2. Changed from Medium.nC to Medium.nX"
    extends Modelica.Fluid.Sensors.BaseClasses.PartialFlowSensor;
    extends Modelica.Icons.RotationalSensor;
    Modelica.Blocks.Interfaces.RealOutput Xi "Mass fraction in port medium" annotation(
      Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {0, 110}), iconTransformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {0, 110})));
    parameter String substanceName = "water" "Name of mass fraction";
  protected
    parameter Integer ind(fixed = false) "Index of species in vector of independent mass fractions";
  initial algorithm
    ind := -1;
    for i in 1:Medium.nX loop
      if Modelica.Utilities.Strings.isEqual(Medium.substanceNames[i], substanceName) then
        ind := i;
      end if;
    end for;
    assert(ind > 0, "Mass fraction '" + substanceName + "' is not present in medium '" + Medium.mediumName + "'.\n" + "Check sensor parameter and medium model.");
  equation
    if allowFlowReversal then
      Xi = Modelica.Fluid.Utilities.regStep(port_a.m_flow, port_b.Xi_outflow[ind], port_a.Xi_outflow[ind], m_flow_small);
    else
      Xi = port_b.Xi_outflow[ind];
    end if;
    annotation(
      defaultComponentName = "massFraction",
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{82, 122}, {0, 92}}, lineColor = {0, 0, 0}, textString = "Xi"), Line(points = {{0, 100}, {0, 70}}, color = {0, 0, 127}), Line(points = {{-100, 0}, {-70, 0}}, color = {0, 128, 255}), Line(points = {{70, 0}, {100, 0}}, color = {0, 128, 255})}),
      Documentation(info = "<html>
<p>
This component monitors the mass fraction of the passing fluid.
The sensor is ideal, i.e., it does not influence the fluid.
</p> </html>", revisions = "<html>
<ul>
<li>2011-12-14: Stefan Wischhusen: Initial Release.</li>
</ul>
</html>"));
  end MassFractionsTwoPort1;


  annotation(
    uses(Modelica(version = "3.2.2")));
end FluidExample1;
