"""Define common unites shared by ITR ingest notebooks."""

from openscm_units import unit_registry
from pint import Context, set_application_registry
from pint_pandas import PintType

PintType.ureg = unit_registry
ureg = unit_registry
set_application_registry(unit_registry)

# Try to insert these definitions only once...
if "Steel" not in ureg:
    print("Initializing common units...")
    # openscm_units doesn't make it easy to set preprocessors.
    # This is one way to do it.
    unit_registry.preprocessors = [
        lambda s1: s1.replace("passenger km", "passenger_km"),
    ]

    ureg.define("CO2e = CO2 = CO2eq = CO2_eq")
    ureg.define("Fe = [iron] = Steel")
    ureg.define("iron = Fe")
    ureg.define("Al = [aluminum] = Aluminum")
    ureg.define("Cu = [copper] = Copper")
    ureg.define("aluminum = Al")
    ureg.define("Cement = [cement]")
    ureg.define("cement = Cement")
    ureg.define("Coal = [coal]")

    # These are for later
    ureg.define("fraction = [] = frac")
    ureg.define("percent = 1e-2 frac = pct = percentage")
    ureg.define("ppm = 1e-6 fraction")

    ureg.define("USD = [currency]")
    ureg.define("EUR = nan USD")
    ureg.define("JPY = nan USD")

    ureg.define("btu = Btu")
    ureg.define("boe = 5.712 GJ = BoE")
    ureg.define("Mbbl = 1000 bbl")
    ureg.define("MMbbl = 1000000 bbl")

    ureg.define("scf = ft**3")
    ureg.define("mscf = 1000 scf = Mscf")
    ureg.define("mmscf = 1000000 scf = MMscf")
    ureg.define("bcm = 1000000000 m**3")

    # Transportation activity

    ureg.define("vehicle = [vehicle] = v")
    ureg.define("passenger = [passenger] = p = pass")
    ureg.define("vkm = vehicle * kilometer")
    ureg.define("pkm = passenger * kilometer")
    ureg.define("tkm = tonne * kilometer")

    ureg.define("hundred = 1e2")
    ureg.define("thousand = 1e3")
    ureg.define("million = 1e6")
    ureg.define("billion = 1e9")
    ureg.define("trillion = 1e12")
    ureg.define("quadrillion = 1e15")

    i7y = Context("intensity")
    i7y.add_transformation("Mscf CH4", "kg CO2e", lambda ureg, x: x * ureg("54.87 kg CO2") / ureg("Mscf CH4"))
    i7y.add_transformation("g CH4", "g CO2e", lambda ureg, x: x * ureg("44 g CO2e") / ureg("16 g CH4"))
    i7y.add_transformation("t Coal", "MJ", lambda ureg, x: x * ureg("29288 MJ") / ureg("t Coal"))
    i7y.add_transformation("t Coal", "t CO2e", lambda ureg, x: x * ureg("2.86 t CO2e") / ureg("t Coal"))
    ureg.add_context(i7y)
    ureg.enable_contexts("intensity")
