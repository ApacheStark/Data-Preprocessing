###ARRANGE THE MANGE
#arrange(df, col1, col2) where col1 is the primary arrangement and col2 is the secondary, as so

# Define dtc, where flights are cancelled
dtc <- filter(hflights, Cancelled == 1, !is.na(DepDelay))

# Arrange dtc by departure delays
View(arrange(dtc, DepDelay))

# Arrange dtc so that cancellation reasons are grouped
arrange(dtc, CancellationCode) #NOTE: CancellationCode is a factor, but will still use levels to determine order

# Arrange dtc according to carrier and departure delays
arrange(dtc, UniqueCarrier, DepDelay)

# Arrange according to carrier and decreasing departure delays
arrange(hflights, UniqueCarrier, desc(DepDelay))

# Arrange flights by total delay (normal order).
arrange(hflights, DepDelay + ArrDelay)
