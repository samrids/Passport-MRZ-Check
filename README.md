# Passport-MRZ-Check

  ==============================================================================
  Positions	Length	Characters	  Meaning
  1–9	      9	      alpha+num+<	  Passport number
  10	      1	      numeric	      Check digit over digits 1–9
  11–13	    3	      alpha+<	      Nationality (ISO 3166-1 alpha-3 code with modifications)
  14–19	    6	      numeric	      Date of birth (YYMMDD)
  20	      1	      num	          Check digit over digits 14–19
  21	      1	      alpha+<	      Sex (M, F or < for male, female or unspecified)
  22–27	    6	      numeric	      Expiration date of passport (YYMMDD)
  28	      1	      numeric	      Check digit over digits 22–27
  29–42	    14    	alpha+num+< 	Personal number (may be used by the issuing country as it desires)
  43	      1	      numeric+<	    Check digit over digits 29–42 (may be < if all characters are <)
  44	      1	      numeric     	Check digit over digits 1–10, 14–20, and 22–43
  ------------------------------------------------------------------------------
   weight of position 1 = 7
   weight of position 2 = 3
   weight of position 3 = 1
   The check digits shall be calculated on modulus 10 with a continuously
  repetitive weighting of 731 731 ..., as follows.
  ref.link: 
    https://en.wikipedia.org/wiki/Machine-readable_passport
    https://www.icao.int/publications/Documents/9303_p3_cons_en.pdf
  ------------------------------------------------------------------------------
  About weighting.
  each x position
  when x mod 3
  ...
  case x mod 3
  1 : weight = 7 set weight = 7
  2 : weight = 3 set weight = 3
  0 : weight = 1 (x mod 3 = 0 when position is 3 9 12 ... n, set weight = 1)
  ==============================================================================
