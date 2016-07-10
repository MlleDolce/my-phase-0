classical_composers = {
	Baroque: {
		early: {
			years: 1580-1630,
			composers: [
				"Jacopo Peri", 
				"Claudio Monteverdi"
				],
			new_trends: [
				"figured bass",
				"opera",
				"tonal harmony",
				],
			},
		middle: {
			years: 1630-1680,
			composers: [
				"Dieterich Buxtehude", 
				"Arcangelo Corelli",
				"Henry Purcell"
				],
			new_trends: [
				"contrasting dyanamics",
				"concerto grosso",
				],
			},
		late: {
			years: 1680-1730,
			composers: [
				"Antonio Vivaldi",
				"Georg Philipp Telemann",
				"J.S. Bach"
				],
			new_trends: [
				"polyphony",
				"dance suite"
				]
			}	
		},
	Classical: {
		Viennese_School: {
			1732-1809 => "Franz Joseph Haydn",
			1756-1791 => "Wolfgang Amadeus Mozart",
			1770-1827 => "Ludwig van Beethoven"
			},
		Classical_Romantics: {
			1782-1837 => "John Field",
			1786-1826 => "Carl Maria von Weber",
			1797-1828 => "Franz Schubert"
			}
		}
	}

p classical_composers[:Baroque][:middle][:composers][2]
p classical_composers[:Baroque][:late][:new_trends][0]
p classical_composers[:Classical][:Viennese_School][1732-1809]
