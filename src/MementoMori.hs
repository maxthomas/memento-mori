module MementoMori
    ( yearsAlive
    ) where

import Data.Time

yearsAlive :: (RealFloat a) => Day -> UTCTime -> a
yearsAlive date time
  | todayM == birthM && todayD == birthD = fromIntegral (todayY - birthY)
  | otherwise = realToFrac quotient
  where today = utctDay time
        (todayY, todayM, todayD) = toGregorian today
        (birthY, birthM, birthD) = toGregorian date
        daysAlive = diffDays today date
        quotient = toRational daysAlive / 365.24219
