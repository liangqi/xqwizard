package net.elephantbase.ecco;

public class TestEcco {
	public static void main(String[] args) {
		String ecco = Ecco.index("C2.5N8+7N2+3R9.8R1.2P7+1R2+6N2+3P7+1C8.9R2.3C9-1N8+7A4+5C8.9");
		System.out.println(ecco);
		System.out.println(Ecco.opening(ecco));
		System.out.println(Ecco.variation(ecco));
		Ecco.setTraditional(true);
		System.out.println(Ecco.opening(ecco));
		System.out.println(Ecco.variation(ecco));
	}
}