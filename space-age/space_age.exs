defmodule SpaceAge do
# added by default meaning the planet names
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :neptune | :uranus
# base seconds per earth year for calculations
  @seconds_per_earth_year 31557600
# Used to determine roughly how many earth years are in another planets year
  @orbital_periods HashDict.new([
    mercury: 0.2408467,
    venus: 0.61519726,
    earth: 1,
    mars: 1.8808158,
    jupiter: 11.862615,
    saturn: 29.447498,
    uranus: 84.016846,
    neptune: 164.79132
  ])

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(:earth, seconds) do
  # What I think it does
  # divide's the seconds by the seconds per earth year to determine how many of their seconds are in an earth year

  # What it actually does
  # 

    seconds / @seconds_per_earth_year
  end

  def age_on(planet, seconds) do
  # What I think it does
  # used to determine the time, calls ageon and orbital period

  # What it actually does
  # 
  
    age_on(:earth, seconds) / orbital_period(planet)
  end

  defp orbital_period(planet) do
  # What I think it does
  # returns with associated key through the use of Dict.fetch!, Dict.fetch! is old and deprecated so not optimal to use NEED TO FIND AN ALTERNATIVE, 
  # last up to date in V 1.0.5

  # What it actually does
  # 
  
    Dict.fetch!(@orbital_periods, planet)
  end

end