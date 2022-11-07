# Define common units shared by ITR ingest notebooks
from pint import set_application_registry, Quantity
from pint_pandas import PintType
from openscm_units import unit_registry

PintType.ureg = unit_registry
ureg = unit_registry
set_application_registry(unit_registry)

def __init__():
    # openscm_units doesn't make it easy to set preprocessors.  This is one way to do it.
    unit_registry.preprocessors=[
         lambda s1: s1.replace('passenger km', 'passenger_km'),
         lambda s2: s2.replace('BoE', 'boe'),
    ]

    ureg.define("CO2e = CO2 = CO2eq = CO2_eq")
    ureg.define("Fe = [iron] = Steel")
    ureg.define("iron = Fe")
    ureg.define("Al = [aluminum] = Aluminum")
    ureg.define("Cu = [copper] = Copper")
    ureg.define("aluminum = Al")
    ureg.define("Cement = [cement]")
    ureg.define("cement = Cement")

    # These are for later
    ureg.define('fraction = [] = frac')
    ureg.define('percent = 1e-2 frac = pct = percentage')
    ureg.define('ppm = 1e-6 fraction')

    ureg.define("USD = [currency]")
    ureg.define("EUR = nan USD")
    ureg.define("JPY = nan USD")

    ureg.define("btu = Btu")
    ureg.define("boe = 5.712 GJ")

    # Transportation activity

    ureg.define("vehicle = [vehicle] = v")
    ureg.define("passenger = [passenger] = p = pass")
    ureg.define("vkm = vehicle * kilometer")
    ureg.define("pkm = passenger * kilometer")
    ureg.define("tkm = tonne * kilometer")

    ureg.define('hundred = 1e2')
    ureg.define('thousand = 1e3')
    ureg.define('million = 1e6')
    ureg.define('billion = 1e9')
    ureg.define('trillion = 1e12')
    ureg.define('quadrillion = 1e15')