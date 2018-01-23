library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity FTC_HXILINX_lab5_gcd is
generic(
    INIT : bit := '0'
    );
  port (
    Q   : out STD_LOGIC := '0';
    C   : in STD_LOGIC;
    CLR : in STD_LOGIC;
    T   : in STD_LOGIC
    );
end FTC_HXILINX_lab5_gcd;
architecture Behavioral of FTC_HXILINX_lab5_gcd is
signal q_tmp : std_logic := TO_X01(INIT);
begin
process(C, CLR)
begin
  if (CLR='1') then
    q_tmp <= '0';
  elsif (C'event and C = '1') then
    if(T='1') then
      q_tmp <= not q_tmp;
    end if;
  end if; 
end process;
Q <= q_tmp;
end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity OR6_HXILINX_lab5_gcd is
port(
    O  : out std_logic;
    I0  : in std_logic;
    I1  : in std_logic;
    I2  : in std_logic;
    I3  : in std_logic;
    I4  : in std_logic;
    I5  : in std_logic
  );
end OR6_HXILINX_lab5_gcd;
architecture OR6_HXILINX_lab5_gcd_V of OR6_HXILINX_lab5_gcd is
begin
-  O <=  (I0 or I1 or I2 or I3 or I4 or I5);
end OR6_HXILINX_lab5_gcd_V;
library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity M4_1E_HXILINX_lab5_gcd is
port(
    O   : out std_logic;
    D0  : in std_logic;
    D1  : in std_logic;
    D2  : in std_logic;
    D3  : in std_logic;
    E   : in std_logic;
    S0  : in std_logic;
    S1  : in std_logic
  );
end M4_1E_HXILINX_lab5_gcd;
architecture M4_1E_HXILINX_lab5_gcd_V of M4_1E_HXILINX_lab5_gcd is
begin
  process (D0, D1, D2, D3, E, S0, S1)
  variable sel : std_logic_vector(1 downto 0);
  begin
    sel := S1&S0;
    if( E = '0') then
    O <= '0';
    else
      case sel is
      when "00" => O <= D0;
      when "01" => O <= D1;
      when "10" => O <= D2;
      when "11" => O <= D3;
      when others => NULL;
      end case;
    end if;
    end process;
end M4_1E_HXILINX_lab5_gcd_V;
library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;
entity mycb_MUSER_lab5_gcd is
   port ( cbin  : in    std_logic_vector (3 downto 0);
          cbout : out   std_logic);
end mycb_MUSER_lab5_gcd;
architecture BEHAVIORAL of mycb_MUSER_lab5_gcd is
   attribute BOX_TYPE   : string ;
   attribute HU_SET     : string ;
   signal XLXN_4 : std_logic;
   signal XLXN_5 : std_logic;
   signal XLXN_6 : std_logic;
   signal XLXN_7 : std_logic;
   signal XLXN_8 : std_logic;
   signal XLXN_9 : std_logic;
   component AND4B2
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             I3 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B2 : component is "BLACK_BOX";
   component AND4B1
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             I3 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B1 : component is "BLACK_BOX";
   component AND4
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             I3 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4 : component is "BLACK_BOX";
   component OR6_HXILINX_lab5_gcd
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             I3 : in    std_logic;
             I4 : in    std_logic;
             I5 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute HU_SET of XLXI_8 : label is "XLXI_8_0";
begin
   XLXI_2 : AND4B2
      port map (I0=>cbin(3),
                I1=>cbin(1),
                I2=>cbin(2),
                I3=>cbin(0),
                O=>XLXN_4);
   XLXI_3 : AND4B2
      port map (I0=>cbin(3),
                I1=>cbin(0),
                I2=>cbin(1),
                I3=>cbin(2),
                O=>XLXN_5);
   XLXI_4 : AND4B1
      port map (I0=>cbin(2),
                I1=>cbin(0),
                I2=>cbin(3),
                I3=>cbin(1),
                O=>XLXN_6);
   XLXI_5 : AND4B2
      port map (I0=>cbin(1),
                I1=>cbin(0),
                I2=>cbin(3),
                I3=>cbin(2),
                O=>XLXN_7);
   XLXI_6 : AND4B1
      port map (I0=>cbin(0),
                I1=>cbin(3),
                I2=>cbin(2),
                I3=>cbin(1),
                O=>XLXN_8);
   XLXI_7 : AND4
      port map (I0=>cbin(3),
                I1=>cbin(2),
                I2=>cbin(0),
                I3=>cbin(1),
                O=>XLXN_9);
   XLXI_8 : OR6_HXILINX_lab5_gcd
      port map (I0=>XLXN_9,
                I1=>XLXN_8,
                I2=>XLXN_7,
                I3=>XLXN_6,
                I4=>XLXN_5,
                I5=>XLXN_4,
                O=>cbout);
end BEHAVIORAL;
library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;
entity cg_MUSER_lab5_gcd is
   port ( cgin  : in    std_logic_vector (3 downto 0);
          cgout : out   std_logic);
end cg_MUSER_lab5_gcd;
architecture BEHAVIORAL of cg_MUSER_lab5_gcd is
   attribute BOX_TYPE   : string ;
   signal XLXN_24 : std_logic;
   signal XLXN_25 : std_logic;
   signal XLXN_26 : std_logic;
   signal XLXN_27 : std_logic;
   component OR4
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             I3 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR4 : component is "BLACK_BOX";
   component AND4B4
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             I3 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B4 : component is "BLACK_BOX";
  
   component AND4B3
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             I3 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B3 : component is "BLACK_BOX";
  
   component AND4B1
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             I3 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B1 : component is "BLACK_BOX";
  
   component AND4B2
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             I3 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B2 : component is "BLACK_BOX";
begin
   XLXI_10 : OR4
      port map (I0=>XLXN_27,
                I1=>XLXN_26,
                I2=>XLXN_25,
                I3=>XLXN_24,
                O=>cgout);
   XLXI_11 : AND4B4
      port map (I0=>cgin(3),
                I1=>cgin(2),
                I2=>cgin(1),
                I3=>cgin(0),
                O=>XLXN_24);
   XLXI_12 : AND4B3
      port map (I0=>cgin(3),
                I1=>cgin(2),
                I2=>cgin(1),
                I3=>cgin(0),
                O=>XLXN_25);
   XLXI_13 : AND4B1
      port map (I0=>cgin(3),
                I1=>cgin(2),
                I2=>cgin(1),
                I3=>cgin(0),
                O=>XLXN_26);
   XLXI_14 : AND4B2
      port map (I0=>cgin(1),
                I1=>cgin(0),
                I2=>cgin(2),
                I3=>cgin(3),
                O=>XLXN_27);
end BEHAVIORAL;
library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;
entity cf_MUSER_lab5_gcd is
   port ( cfin  : in    std_logic_vector (3 downto 0);
          cfout : out   std_logic);
end cf_MUSER_lab5_gcd;
architecture BEHAVIORAL of cf_MUSER_lab5_gcd is
   attribute BOX_TYPE   : string ;
   signal XLXN_30 : std_logic;
   signal XLXN_31 : std_logic;
   signal XLXN_32 : std_logic;
   signal XLXN_33 : std_logic;
   signal XLXN_34 : std_logic;
   component OR5
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             I3 : in    std_logic;
             I4 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR5 : component is "BLACK_BOX";
   component AND4B3
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             I3 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B3 : component is "BLACK_BOX";
   component AND4B2
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             I3 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B2 : component is "BLACK_BOX";
   component AND4B1
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             I3 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B1 : component is "BLACK_BOX";
begin
   XLXI_10 : OR5
      port map (I0=>XLXN_30,
                I1=>XLXN_31,
                I2=>XLXN_32,
                I3=>XLXN_33,
                I4=>XLXN_34,
                O=>cfout);
   XLXI_11 : AND4B3
      port map (I0=>cfin(3),
                I1=>cfin(2),
                I2=>cfin(1),
                I3=>cfin(0),
                O=>XLXN_34);
   XLXI_12 : AND4B3
      port map (I0=>cfin(3),
                I1=>cfin(2),
                I2=>cfin(0),
                I3=>cfin(1),
                O=>XLXN_33);
   XLXI_13 : AND4B2
      port map (I0=>cfin(3),
                I1=>cfin(2),
                I2=>cfin(0),
                I3=>cfin(1),
                O=>XLXN_32);
   XLXI_14 : AND4B1
      port map (I0=>cfin(3),
                I1=>cfin(2),
                I2=>cfin(1),
                I3=>cfin(0),
                O=>XLXN_31);
   XLXI_15 : AND4B1
      port map (I0=>cfin(1),
                I1=>cfin(3),
                I2=>cfin(2),
                I3=>cfin(0),
                O=>XLXN_30);
end BEHAVIORAL;
library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;
entity ce_MUSER_lab5_gcd is
   port ( cein  : in    std_logic_vector (3 downto 0);
          ceout : out   std_logic);
end ce_MUSER_lab5_gcd;
architecture BEHAVIORAL of ce_MUSER_lab5_gcd is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal XLXN_33 : std_logic;
   signal XLXN_34 : std_logic;
   signal XLXN_35 : std_logic;
   signal XLXN_36 : std_logic;
   signal XLXN_37 : std_logic;
   signal XLXN_38 : std_logic;
   component OR6_HXILINX_lab5_gcd
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             I3 : in    std_logic;
             I4 : in    std_logic;
             I5 : in    std_logic;
             O  : out   std_logic);
   end component;
   component AND4B3
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             I3 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B3 : component is "BLACK_BOX";
   component AND4B2
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             I3 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B2 : component is "BLACK_BOX";
   component AND4B1
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             I3 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B1 : component is "BLACK_BOX";
   attribute HU_SET of XLXI_10 : label is "XLXI_10_1";
begin
   XLXI_10 : OR6_HXILINX_lab5_gcd
      port map (I0=>XLXN_38,
                I1=>XLXN_37,
                I2=>XLXN_36,
                I3=>XLXN_35,
                I4=>XLXN_34,
                I5=>XLXN_33,
                O=>ceout);
   XLXI_11 : AND4B3
      port map (I0=>cein(3),
                I1=>cein(2),
                I2=>cein(1),
                I3=>cein(0),
                O=>XLXN_33);
   XLXI_12 : AND4B2
      port map (I0=>cein(3),
                I1=>cein(2),
                I2=>cein(1),
                I3=>cein(0),
                O=>XLXN_34);
   XLXI_13 : AND4B3
      port map (I0=>cein(3),
                I1=>cein(1),
                I2=>cein(0),
                I3=>cein(2),
                O=>XLXN_35);
   XLXI_14 : AND4B2
      port map (I0=>cein(3),
                I1=>cein(1),
                I2=>cein(0),
                I3=>cein(2),
                O=>XLXN_36);
   XLXI_15 : AND4B1
      port map (I0=>cein(3),
                I1=>cein(2),
                I2=>cein(1),
                I3=>cein(0),
                O=>XLXN_37);
   XLXI_16 : AND4B2
      port map (I0=>cein(2),
                I1=>cein(1),
                I2=>cein(3),
                I3=>cein(0),
                O=>XLXN_38);
end BEHAVIORAL;
library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;
entity cd_MUSER_lab5_gcd is
   port ( cdin  : in    std_logic_vector (3 downto 0);
          cdout : out   std_logic);
end cd_MUSER_lab5_gcd;
architecture BEHAVIORAL of cd_MUSER_lab5_gcd is
   attribute BOX_TYPE   : string ;
   signal XLXN_18 : std_logic;
   signal XLXN_19 : std_logic;
   signal XLXN_20 : std_logic;
   signal XLXN_21 : std_logic;
   signal XLXN_22 : std_logic;
   component OR5
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             I3 : in    std_logic;
             I4 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR5 : component is "BLACK_BOX";
   component AND4B3
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             I3 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B3 : component is "BLACK_BOX";
   component AND4B1
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             I3 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B1 : component is "BLACK_BOX";
   component AND4B2
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             I3 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B2 : component is "BLACK_BOX";
   component AND4
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             I3 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4 : component is "BLACK_BOX";
begin
   XLXI_10 : OR5
      port map (I0=>XLXN_22,
                I1=>XLXN_21,
                I2=>XLXN_20,
                I3=>XLXN_19,
                I4=>XLXN_18,
                O=>cdout);
   XLXI_11 : AND4B3
      port map (I0=>cdin(3),
                I1=>cdin(2),
                I2=>cdin(1),
                I3=>cdin(0),
                O=>XLXN_18);
   XLXI_12 : AND4B3
      port map (I0=>cdin(3),
                I1=>cdin(1),
                I2=>cdin(0),
                I3=>cdin(2),
                O=>XLXN_19);
   XLXI_13 : AND4B1
      port map (I0=>cdin(3),
                I1=>cdin(0),
                I2=>cdin(1),
                I3=>cdin(2),
                O=>XLXN_20);
   XLXI_14 : AND4B2
      port map (I0=>cdin(0),
                I1=>cdin(2),
                I2=>cdin(3),
                I3=>cdin(1),
                O=>XLXN_21);
   XLXI_15 : AND4
      port map (I0=>cdin(3),
                I1=>cdin(2),
                I2=>cdin(1),
                I3=>cdin(0),
                O=>XLXN_22);
end BEHAVIORAL;
library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity cc_MUSER_lab5_gcd is
   port ( ccin  : in    std_logic_vector (3 downto 0);
          ccout : out   std_logic);
end cc_MUSER_lab5_gcd;

architecture BEHAVIORAL of cc_MUSER_lab5_gcd is
   attribute BOX_TYPE   : string ;
   signal XLXN_17 : std_logic;
   signal XLXN_18 : std_logic;
   signal XLXN_19 : std_logic;
   signal XLXN_20 : std_logic;
   component OR4
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             I3 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR4 : component is "BLACK_BOX";
  
   component AND4B3
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             I3 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B3 : component is "BLACK_BOX";
  
   component AND4B2
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             I3 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B2 : component is "BLACK_BOX";
  
   component AND4B1
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             I3 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B1 : component is "BLACK_BOX";
  
   component AND4
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             I3 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4 : component is "BLACK_BOX";
  
begin
   XLXI_10 : OR4
      port map (I0=>XLXN_20,
                I1=>XLXN_19,
                I2=>XLXN_18,
                I3=>XLXN_17,
                O=>ccout);
  
   XLXI_11 : AND4B3
      port map (I0=>ccin(3),
                I1=>ccin(2),
                I2=>ccin(0),
                I3=>ccin(1),
                O=>XLXN_17);
  
   XLXI_12 : AND4B2
      port map (I0=>ccin(1),
                I1=>ccin(0),
                I2=>ccin(2),
                I3=>ccin(3),
                O=>XLXN_18);
  
   XLXI_13 : AND4B1
      port map (I0=>ccin(0),
                I1=>ccin(3),
                I2=>ccin(2),
                I3=>ccin(1),
                O=>XLXN_19);
  
   XLXI_14 : AND4
      port map (I0=>ccin(3),
                I1=>ccin(2),
                I2=>ccin(1),
                I3=>ccin(0),
                O=>XLXN_20);
  
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity ca_MUSER_lab5_gcd is
   port ( cain  : in    std_logic_vector (3 downto 0);
          caout : out   std_logic);
end ca_MUSER_lab5_gcd;

architecture BEHAVIORAL of ca_MUSER_lab5_gcd is
   attribute BOX_TYPE   : string ;
   signal XLXN_10 : std_logic;
   signal XLXN_11 : std_logic;
   signal XLXN_12 : std_logic;
   signal XLXN_14 : std_logic;
   signal XLXN_17 : std_logic;
   signal XLXN_18 : std_logic;
   component AND3
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3 : component is "BLACK_BOX";
  
   component XOR2
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of XOR2 : component is "BLACK_BOX";
  
   component OR2
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
  
   component INV
      port ( I : in    std_logic;
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
  
begin
   XLXI_1 : AND3
      port map (I0=>XLXN_10,
                I1=>XLXN_12,
                I2=>XLXN_14,
                O=>XLXN_17);
  
   XLXI_2 : AND3
      port map (I0=>cain(0),
                I1=>XLXN_11,
                I2=>cain(3),
                O=>XLXN_18);
  
   XLXI_3 : XOR2
      port map (I0=>cain(2),
                I1=>cain(0),
                O=>XLXN_12);
  
   XLXI_4 : XOR2
      port map (I0=>cain(2),
                I1=>cain(1),
                O=>XLXN_11);
  
   XLXI_5 : OR2
      port map (I0=>XLXN_18,
                I1=>XLXN_17,
                O=>caout);
  
   XLXI_6 : INV
      port map (I=>cain(3),
                O=>XLXN_10);
  
   XLXI_7 : INV
      port map (I=>cain(1),
                O=>XLXN_14);
  
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity mycathode2_MUSER_lab5_gcd is
   port ( myx     : in    std_logic_vector (3 downto 0);
          cathode : out   std_logic_vector (6 downto 0));
end mycathode2_MUSER_lab5_gcd;

architecture BEHAVIORAL of mycathode2_MUSER_lab5_gcd is
   component ca_MUSER_lab5_gcd
      port ( cain  : in    std_logic_vector (3 downto 0);
             caout : out   std_logic);
   end component;
  
   component cc_MUSER_lab5_gcd
      port ( ccin  : in    std_logic_vector (3 downto 0);
             ccout : out   std_logic);
   end component;
  
   component cd_MUSER_lab5_gcd
      port ( cdin  : in    std_logic_vector (3 downto 0);
             cdout : out   std_logic);
   end component;
  
   component ce_MUSER_lab5_gcd
      port ( cein  : in    std_logic_vector (3 downto 0);
             ceout : out   std_logic);
   end component;
  
   component cf_MUSER_lab5_gcd
      port ( cfin  : in    std_logic_vector (3 downto 0);
             cfout : out   std_logic);
   end component;
  
   component cg_MUSER_lab5_gcd
      port ( cgin  : in    std_logic_vector (3 downto 0);
             cgout : out   std_logic);
   end component;
  
   component mycb_MUSER_lab5_gcd
      port ( cbin  : in    std_logic_vector (3 downto 0);
             cbout : out   std_logic);
   end component;
  
begin
   XLXI_1 : ca_MUSER_lab5_gcd
      port map (cain(3 downto 0)=>myx(3 downto 0),
                caout=>cathode(0));
  
   XLXI_3 : cc_MUSER_lab5_gcd
      port map (ccin(3 downto 0)=>myx(3 downto 0),
                ccout=>cathode(2));
  
   XLXI_4 : cd_MUSER_lab5_gcd
      port map (cdin(3 downto 0)=>myx(3 downto 0),
                cdout=>cathode(3));
  
   XLXI_5 : ce_MUSER_lab5_gcd
      port map (cein(3 downto 0)=>myx(3 downto 0),
                ceout=>cathode(4));
  
   XLXI_6 : cf_MUSER_lab5_gcd
      port map (cfin(3 downto 0)=>myx(3 downto 0),
                cfout=>cathode(5));
  
   XLXI_7 : cg_MUSER_lab5_gcd
      port map (cgin(3 downto 0)=>myx(3 downto 0),
                cgout=>cathode(6));
  
   XLXI_8 : mycb_MUSER_lab5_gcd
      port map (cbin(3 downto 0)=>myx(3 downto 0),
                cbout=>cathode(1));
  
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity myclock_MUSER_lab5_gcd is
   port ( clk : in    std_logic;
          q   : out   std_logic);
end myclock_MUSER_lab5_gcd;

architecture BEHAVIORAL of myclock_MUSER_lab5_gcd is
   attribute HU_SET     : string ;
   signal XLXN_2  : std_logic;
   signal XLXN_3  : std_logic;
   signal XLXN_4  : std_logic;
   signal XLXN_5  : std_logic;
   signal XLXN_6  : std_logic;
   signal XLXN_7  : std_logic;
   signal XLXN_8  : std_logic;
   signal XLXN_9  : std_logic;
   signal XLXN_10 : std_logic;
   signal XLXN_11 : std_logic;
   signal XLXN_12 : std_logic;
   signal XLXN_13 : std_logic;
   signal XLXN_14 : std_logic;
   signal XLXN_15 : std_logic;
   signal XLXN_16 : std_logic;
   signal XLXN_17 : std_logic;
   signal XLXN_35 : std_logic;
   signal XLXN_37 : std_logic;
   signal XLXN_38 : std_logic;
   signal XLXN_39 : std_logic;
   signal XLXN_40 : std_logic;
   signal XLXN_41 : std_logic;
   signal XLXN_42 : std_logic;
   signal XLXN_43 : std_logic;
   signal XLXN_44 : std_logic;
   signal XLXN_45 : std_logic;
   signal XLXN_46 : std_logic;
   signal XLXN_47 : std_logic;
   signal XLXN_48 : std_logic;
   signal XLXN_49 : std_logic;
   signal XLXN_50 : std_logic;
   signal XLXN_51 : std_logic;
   signal XLXN_52 : std_logic;
   signal XLXN_53 : std_logic;
   signal XLXN_54 : std_logic;
   signal XLXN_55 : std_logic;
   signal XLXN_56 : std_logic;
   signal XLXN_57 : std_logic;
   signal XLXN_58 : std_logic;
   signal XLXN_59 : std_logic;
   signal XLXN_60 : std_logic;
   signal XLXN_61 : std_logic;
   signal XLXN_62 : std_logic;
   signal XLXN_63 : std_logic;
   signal XLXN_64 : std_logic;
   signal XLXN_65 : std_logic;
   signal XLXN_66 : std_logic;
   component FTC_HXILINX_lab5_gcd
      generic( INIT : bit :=  '0');
      port ( C   : in    std_logic;
             CLR : in    std_logic;
             T   : in    std_logic;
             Q   : out   std_logic);
   end component;
  
   attribute HU_SET of XLXI_17 : label is "XLXI_17_2";
   attribute HU_SET of XLXI_19 : label is "XLXI_19_3";
   attribute HU_SET of XLXI_21 : label is "XLXI_21_4";
   attribute HU_SET of XLXI_23 : label is "XLXI_23_5";
   attribute HU_SET of XLXI_25 : label is "XLXI_25_6";
   attribute HU_SET of XLXI_27 : label is "XLXI_27_7";
   attribute HU_SET of XLXI_29 : label is "XLXI_29_8";
   attribute HU_SET of XLXI_31 : label is "XLXI_31_9";
   attribute HU_SET of XLXI_33 : label is "XLXI_33_10";
   attribute HU_SET of XLXI_35 : label is "XLXI_35_11";
   attribute HU_SET of XLXI_37 : label is "XLXI_37_12";
   attribute HU_SET of XLXI_39 : label is "XLXI_39_13";
   attribute HU_SET of XLXI_41 : label is "XLXI_41_14";
   attribute HU_SET of XLXI_43 : label is "XLXI_43_15";
   attribute HU_SET of XLXI_45 : label is "XLXI_45_16";
   attribute HU_SET of XLXI_47 : label is "XLXI_47_17";
  

begin
   XLXN_2 <= '0';
   XLXN_3 <= '0';
   XLXN_4 <= '0';
   XLXN_5 <= '0';
   XLXN_6 <= '0';
   XLXN_7 <= '0';
   XLXN_8 <= '0';
   XLXN_9 <= '0';
   XLXN_10 <= '0';
   XLXN_11 <= '0';
   XLXN_12 <= '0';
   XLXN_13 <= '0';
   XLXN_14 <= '0';
   XLXN_15 <= '0';
   XLXN_16 <= '0';
   XLXN_17 <= '0';
   XLXN_35 <= '1';
   XLXN_38 <= '1';
   XLXN_39 <= '1';
   XLXN_40 <= '1';
   XLXN_41 <= '1';
   XLXN_42 <= '1';
   XLXN_43 <= '1';
   XLXN_44 <= '1';
   XLXN_45 <= '1';
   XLXN_46 <= '1';
   XLXN_47 <= '1';
   XLXN_48 <= '1';
   XLXN_49 <= '1';
   XLXN_50 <= '1';
   XLXN_51 <= '1';
   XLXN_52 <= '1';
   XLXI_17 : FTC_HXILINX_lab5_gcd
      port map (C=>clk,
                CLR=>XLXN_2,
                T=>XLXN_35,
                Q=>XLXN_37);
  
   XLXI_19 : FTC_HXILINX_lab5_gcd
      port map (C=>XLXN_37,
                CLR=>XLXN_3,
                T=>XLXN_38,
                Q=>XLXN_53);
  
   XLXI_21 : FTC_HXILINX_lab5_gcd
      port map (C=>XLXN_53,
                CLR=>XLXN_4,
                T=>XLXN_39,
                Q=>XLXN_54);
  
   XLXI_23 : FTC_HXILINX_lab5_gcd
      port map (C=>XLXN_54,
                CLR=>XLXN_5,
                T=>XLXN_40,
                Q=>XLXN_64);
  
   XLXI_25 : FTC_HXILINX_lab5_gcd
      port map (C=>XLXN_64,
                CLR=>XLXN_6,
                T=>XLXN_44,
                Q=>XLXN_57);
  
   XLXI_27 : FTC_HXILINX_lab5_gcd
      port map (C=>XLXN_57,
                CLR=>XLXN_7,
                T=>XLXN_43,
                Q=>XLXN_56);
  
   XLXI_29 : FTC_HXILINX_lab5_gcd
      port map (C=>XLXN_56,
                CLR=>XLXN_8,
                T=>XLXN_42,
                Q=>XLXN_55);
  
   XLXI_31 : FTC_HXILINX_lab5_gcd
      port map (C=>XLXN_55,
                CLR=>XLXN_9,
                T=>XLXN_41,
                Q=>XLXN_65);
  
   XLXI_33 : FTC_HXILINX_lab5_gcd
      port map (C=>XLXN_65,
                CLR=>XLXN_10,
                T=>XLXN_45,
                Q=>XLXN_58);
  
   XLXI_35 : FTC_HXILINX_lab5_gcd
      port map (C=>XLXN_58,
                CLR=>XLXN_11,
                T=>XLXN_46,
                Q=>XLXN_59);
  
   XLXI_37 : FTC_HXILINX_lab5_gcd
      port map (C=>XLXN_59,
                CLR=>XLXN_12,
                T=>XLXN_47,
                Q=>XLXN_60);
  
   XLXI_39 : FTC_HXILINX_lab5_gcd
      port map (C=>XLXN_60,
                CLR=>XLXN_13,
                T=>XLXN_48,
                Q=>XLXN_66);
  
   XLXI_41 : FTC_HXILINX_lab5_gcd
      port map (C=>XLXN_66,
                CLR=>XLXN_14,
                T=>XLXN_52,
                Q=>XLXN_63);
  
   XLXI_43 : FTC_HXILINX_lab5_gcd
      port map (C=>XLXN_63,
                CLR=>XLXN_15,
                T=>XLXN_51,
                Q=>XLXN_62);
  
   XLXI_45 : FTC_HXILINX_lab5_gcd
      port map (C=>XLXN_62,
                CLR=>XLXN_16,
                T=>XLXN_50,
                Q=>XLXN_61);
  
   XLXI_47 : FTC_HXILINX_lab5_gcd
      port map (C=>XLXN_61,
                CLR=>XLXN_17,
                T=>XLXN_49,
                Q=>q);
  
end BEHAVIORAL;
library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity myclock2_MUSER_lab5_gcd is
   port ( clk2 : in    std_logic;
          q2   : out   std_logic);
end myclock2_MUSER_lab5_gcd;

architecture BEHAVIORAL of myclock2_MUSER_lab5_gcd is
   attribute HU_SET     : string ;
   signal XLXN_2  : std_logic;
   signal XLXN_35 : std_logic;
   signal XLXN_37 : std_logic;
   signal XLXN_53 : std_logic;
   signal XLXN_54 : std_logic;
   signal XLXN_55 : std_logic;
   signal XLXN_56 : std_logic;
   signal XLXN_57 : std_logic;
   signal XLXN_58 : std_logic;
   signal XLXN_59 : std_logic;
   signal XLXN_60 : std_logic;
   signal XLXN_61 : std_logic;
   signal XLXN_62 : std_logic;
   signal XLXN_63 : std_logic;
   signal XLXN_64 : std_logic;
   signal XLXN_65 : std_logic;
   signal XLXN_66 : std_logic;
   signal XLXN_67 : std_logic;
   signal XLXN_68 : std_logic;
   signal XLXN_69 : std_logic;
   signal XLXN_70 : std_logic;
   signal XLXN_71 : std_logic;
   signal XLXN_72 : std_logic;
   signal XLXN_73 : std_logic;
   signal XLXN_74 : std_logic;
   signal XLXN_75 : std_logic;
   signal XLXN_76 : std_logic;
   signal XLXN_77 : std_logic;
   
   component FTC_HXILINX_lab5_gcd
      generic( INIT : bit :=  '0');
      port ( C   : in    std_logic;
             CLR : in    std_logic;
             T   : in    std_logic;
             Q   : out   std_logic);
   end component;
  
   attribute HU_SET of XLXI_17 : label is "XLXI_17_2";
   attribute HU_SET of XLXI_19 : label is "XLXI_19_3";
   attribute HU_SET of XLXI_21 : label is "XLXI_21_4";
   attribute HU_SET of XLXI_23 : label is "XLXI_23_5";
   attribute HU_SET of XLXI_25 : label is "XLXI_25_6";
   attribute HU_SET of XLXI_27 : label is "XLXI_27_7";
   attribute HU_SET of XLXI_29 : label is "XLXI_29_8";
   attribute HU_SET of XLXI_31 : label is "XLXI_31_9";
   attribute HU_SET of XLXI_33 : label is "XLXI_33_10";
   attribute HU_SET of XLXI_35 : label is "XLXI_35_11";
   attribute HU_SET of XLXI_37 : label is "XLXI_37_12";
   attribute HU_SET of XLXI_39 : label is "XLXI_39_13";
   attribute HU_SET of XLXI_41 : label is "XLXI_41_14";
   attribute HU_SET of XLXI_43 : label is "XLXI_43_15";
   attribute HU_SET of XLXI_45 : label is "XLXI_45_16";
   attribute HU_SET of XLXI_47 : label is "XLXI_47_17";
  
   attribute HU_SET of XLXI_49 : label is "XLXI_49_18";
   attribute HU_SET of XLXI_51 : label is "XLXI_51_19";
   attribute HU_SET of XLXI_53 : label is "XLXI_53_20";
   attribute HU_SET of XLXI_55 : label is "XLXI_55_21";
   attribute HU_SET of XLXI_57 : label is "XLXI_57_22";
   attribute HU_SET of XLXI_59 : label is "XLXI_59_23";
   attribute HU_SET of XLXI_61 : label is "XLXI_61_24";
   attribute HU_SET of XLXI_63 : label is "XLXI_63_25";
   attribute HU_SET of XLXI_65 : label is "XLXI_65_26";
   attribute HU_SET of XLXI_67 : label is "XLXI_67_27";
   attribute HU_SET of XLXI_69 : label is "XLXI_69_28";
  
  

begin
   XLXN_2 <= '0';
  
   XLXN_35 <= '1';
  
   XLXI_17 : FTC_HXILINX_lab5_gcd
      port map (C=>clk2,
                CLR=>XLXN_2,
                T=>XLXN_35,
                Q=>XLXN_37);
  
   XLXI_19 : FTC_HXILINX_lab5_gcd
      port map (C=>XLXN_37,
                CLR=>XLXN_2,
                T=>XLXN_35,
                Q=>XLXN_53);
  
   XLXI_21 : FTC_HXILINX_lab5_gcd
      port map (C=>XLXN_53,
                CLR=>XLXN_2,
                T=>XLXN_35,
                Q=>XLXN_54);
  
   XLXI_23 : FTC_HXILINX_lab5_gcd
      port map (C=>XLXN_54,
                CLR=>XLXN_2,
                T=>XLXN_35,
                Q=>XLXN_64);
  
   XLXI_25 : FTC_HXILINX_lab5_gcd
      port map (C=>XLXN_64,
                CLR=>XLXN_2,
                T=>XLXN_35,
                Q=>XLXN_57);
  
   XLXI_27 : FTC_HXILINX_lab5_gcd
      port map (C=>XLXN_57,
                CLR=>XLXN_2,
                T=>XLXN_35,
                Q=>XLXN_56);
  
   XLXI_29 : FTC_HXILINX_lab5_gcd
      port map (C=>XLXN_56,
                CLR=>XLXN_2,
                T=>XLXN_35,
                Q=>XLXN_55);
  
   XLXI_31 : FTC_HXILINX_lab5_gcd
      port map (C=>XLXN_55,
                CLR=>XLXN_2,
                T=>XLXN_35,
                Q=>XLXN_65);
  
   XLXI_33 : FTC_HXILINX_lab5_gcd
      port map (C=>XLXN_65,
                CLR=>XLXN_2,
                T=>XLXN_35,
                Q=>XLXN_58);
  
   XLXI_35 : FTC_HXILINX_lab5_gcd
      port map (C=>XLXN_58,
                CLR=>XLXN_2,
                T=>XLXN_35,
                Q=>XLXN_59);
  
   XLXI_37 : FTC_HXILINX_lab5_gcd
      port map (C=>XLXN_59,
                CLR=>XLXN_2,
                T=>XLXN_35,
                Q=>XLXN_60);
  
   XLXI_39 : FTC_HXILINX_lab5_gcd
      port map (C=>XLXN_60,
                CLR=>XLXN_2,
                T=>XLXN_35,
                Q=>XLXN_66);
  
   XLXI_41 : FTC_HXILINX_lab5_gcd
      port map (C=>XLXN_66,
                CLR=>XLXN_2,
                T=>XLXN_35,
                Q=>XLXN_63);
  
   XLXI_43 : FTC_HXILINX_lab5_gcd
      port map (C=>XLXN_63,
                CLR=>XLXN_2,
                T=>XLXN_35,
                Q=>XLXN_62);
  
   XLXI_45 : FTC_HXILINX_lab5_gcd
      port map (C=>XLXN_62,
                CLR=>XLXN_2,
                T=>XLXN_35,
                Q=>XLXN_61);
  
   XLXI_47 : FTC_HXILINX_lab5_gcd
      port map (C=>XLXN_61,
                CLR=>XLXN_2,
                T=>XLXN_35,
                Q=>XLXN_67);
               
   XLXI_49 : FTC_HXILINX_lab5_gcd
      port map (C=>XLXN_67,
                CLR=>XLXN_2,
                T=>XLXN_35,
                Q=>XLXN_68);
               
  XLXI_51 : FTC_HXILINX_lab5_gcd
      port map (C=>XLXN_68,
                CLR=>XLXN_2,
                T=>XLXN_35,
                Q=>XLXN_69);
               
  XLXI_53 : FTC_HXILINX_lab5_gcd
      port map (C=>XLXN_69,
                CLR=>XLXN_2,
                T=>XLXN_35,
                Q=>XLXN_70);
               
  XLXI_55 : FTC_HXILINX_lab5_gcd
      port map (C=>XLXN_70,
                CLR=>XLXN_2,
                T=>XLXN_35,
                Q=>XLXN_71);
               
  XLXI_57 : FTC_HXILINX_lab5_gcd
      port map (C=>XLXN_71,
                CLR=>XLXN_2,
                T=>XLXN_35,
                Q=>XLXN_72);
               
  XLXI_59 : FTC_HXILINX_lab5_gcd
      port map (C=>XLXN_72,
                CLR=>XLXN_2,
                T=>XLXN_35,
                Q=>XLXN_73);
               
  XLXI_61 : FTC_HXILINX_lab5_gcd
      port map (C=>XLXN_73,
                CLR=>XLXN_2,
                T=>XLXN_35,
                Q=>XLXN_74);
               
  XLXI_63 : FTC_HXILINX_lab5_gcd
      port map (C=>XLXN_74,
                CLR=>XLXN_2,
                T=>XLXN_35,
                Q=>XLXN_75);
               
  XLXI_65 : FTC_HXILINX_lab5_gcd
      port map (C=>XLXN_75,
                CLR=>XLXN_2,
                T=>XLXN_35,
                Q=>XLXN_76);
               
  XLXI_67 : FTC_HXILINX_lab5_gcd
      port map (C=>XLXN_76,
                CLR=>XLXN_2,
                T=>XLXN_35,
                Q=>XLXN_77);
               
  XLXI_69 : FTC_HXILINX_lab5_gcd
      port map (C=>XLXN_77,
               CLR=>XLXN_2,
               T=>XLXN_35,
               Q=>q2);              
               
               
 
  
end BEHAVIORAL;
library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity mycounter2_MUSER_lab5_gcd is
   port ( myclock : in    std_logic;
          s       : out   std_logic_vector (1 downto 0));
end mycounter2_MUSER_lab5_gcd;

architecture BEHAVIORAL of mycounter2_MUSER_lab5_gcd is
   attribute HU_SET     : string ;
   signal XLXN_1  : std_logic;
   signal XLXN_2  : std_logic;
   signal XLXN_3  : std_logic;
   signal s_DUMMY : std_logic_vector (1 downto 0);
   component FTC_HXILINX_lab5_gcd
      generic( INIT : bit :=  '0');
      port ( C   : in    std_logic;
             CLR : in    std_logic;
             T   : in    std_logic;
             Q   : out   std_logic);
   end component;
  
   attribute HU_SET of XLXI_1 : label is "XLXI_1_18";
   attribute HU_SET of XLXI_2 : label is "XLXI_2_19";
begin
   XLXN_1 <= '0';
   XLXN_2 <= '0';
   XLXN_3 <= '1';
   s(1 downto 0) <= s_DUMMY(1 downto 0);
   XLXI_1 : FTC_HXILINX_lab5_gcd
      port map (C=>myclock,
                CLR=>XLXN_1,
                T=>XLXN_3,
                Q=>s_DUMMY(0));
  
   XLXI_2 : FTC_HXILINX_lab5_gcd
      port map (C=>myclock,
                CLR=>XLXN_2,
                T=>s_DUMMY(0),
                Q=>s_DUMMY(1));
  
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity myanode_MUSER_lab5_gcd is
   port ( s     : in    std_logic_vector (1 downto 0);
          anode : out   std_logic_vector (3 downto 0));
end myanode_MUSER_lab5_gcd;

architecture BEHAVIORAL of myanode_MUSER_lab5_gcd is
   attribute BOX_TYPE   : string ;
   signal a0    : std_logic;
   signal a1    : std_logic;
   signal a2    : std_logic;
   signal a3    : std_logic;
   component AND2
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
  
   component AND2B1
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2B1 : component is "BLACK_BOX";
  
   component AND2B2
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2B2 : component is "BLACK_BOX";
  
   component INV
      port ( I : in    std_logic;
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
  
begin
   XLXI_1 : AND2
      port map (I0=>s(0),
                I1=>s(1),
                O=>a3);
  
   XLXI_2 : AND2B1
      port map (I0=>s(1),
                I1=>s(0),
                O=>a1);
  
   XLXI_3 : AND2B1
      port map (I0=>s(0),
                I1=>s(1),
                O=>a2);
  
   XLXI_4 : AND2B2
      port map (I0=>s(1),
                I1=>s(0),
                O=>a0);
  
   XLXI_7 : INV
      port map (I=>a3,
                O=>anode(3));
  
   XLXI_8 : INV
      port map (I=>a1,
                O=>anode(1));
  
   XLXI_10 : INV
      port map (I=>a0,
                O=>anode(0));
  
   XLXI_11 : INV
      port map (I=>a2,
                O=>anode(2));
  
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity my_mux16_MUSER_lab5_gcd is
   port ( iinput  : in    std_logic_vector (15 downto 0);
          s       : in    std_logic_vector (1 downto 0);
          ooutput : out   std_logic_vector (3 downto 0));
end my_mux16_MUSER_lab5_gcd;

architecture BEHAVIORAL of my_mux16_MUSER_lab5_gcd is
   attribute HU_SET     : string ;
   signal XLXN_1  : std_logic;
   signal XLXN_2  : std_logic;
   signal XLXN_3  : std_logic;
   signal XLXN_4  : std_logic;
   component M4_1E_HXILINX_lab5_gcd
      port ( D0 : in    std_logic;
             D1 : in    std_logic;
             D2 : in    std_logic;
             D3 : in    std_logic;
             E  : in    std_logic;
             S0 : in    std_logic;
             S1 : in    std_logic;
             O  : out   std_logic);
   end component;
  
   attribute HU_SET of XLXI_1 : label is "XLXI_1_20";
   attribute HU_SET of XLXI_2 : label is "XLXI_2_21";
   attribute HU_SET of XLXI_3 : label is "XLXI_3_22";
   attribute HU_SET of XLXI_4 : label is "XLXI_4_23";
begin
   XLXN_1 <= '1';
   XLXN_2 <= '1';
   XLXN_3 <= '1';
   XLXN_4 <= '1';
   XLXI_1 : M4_1E_HXILINX_lab5_gcd
      port map (D0=>iinput(0),
                D1=>iinput(4),
                D2=>iinput(8),
                D3=>iinput(12),
                E=>XLXN_1,
                S0=>s(0),
                S1=>s(1),
                O=>ooutput(0));
   XLXI_2 : M4_1E_HXILINX_lab5_gcd
      port map (D0=>iinput(1),
                D1=>iinput(5),
                D2=>iinput(9),
                D3=>iinput(13),
                E=>XLXN_2,
                S0=>s(0),
                S1=>s(1),
                O=>ooutput(1));
   XLXI_3 : M4_1E_HXILINX_lab5_gcd
      port map (D0=>iinput(2),
                D1=>iinput(6),
                D2=>iinput(10),
                D3=>iinput(14),
                E=>XLXN_3,
                S0=>s(0),
                S1=>s(1),
                O=>ooutput(2));
   XLXI_4 : M4_1E_HXILINX_lab5_gcd
      port map (D0=>iinput(3),
                D1=>iinput(7),
                D2=>iinput(11),
                D3=>iinput(15),
                E=>XLXN_4,
                S0=>s(0),
                S1=>s(1),
                O=>ooutput(3));
end BEHAVIORAL;
library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;
entity my_subs_MUSER_lab5_gcd is
   port ( a_i  : in    std_logic_vector (7 downto 0);
          b_i  : in    std_logic_vector (7 downto 0);
          d_oo  : out    std_logic_vector (7 downto 0));
end my_subs_MUSER_lab5_gcd;
architecture BEHAVIORAL of my_subs_MUSER_lab5_gcd is
begin
    process(a_i , b_i)
    begin
        if a_i(3 DOWNTO 0)>=b_i(3 DOWNTO 0) then
            d_oo <= std_logic_vector(unsigned (a_i) - unsigned (b_i));
        else
            d_oo(3 DOWNTO 0) <= std_logic_vector("1010" + unsigned(a_i(3 DOWNTO 0)) - unsigned(b_i(3 DOWNTO 0)));
            d_oo(7 DOWNTO 4) <= std_logic_vector(unsigned(a_i(7 DOWNTO 4)) - unsigned(b_i(7 DOWNTO 4)) - "0001");
        END IF;
    end process;
end BEHAVIORAL;
library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;
entity lab5_gcd is
   port ( b_i        : in    std_logic_vector (7 downto 0);
          a_i        : in    std_logic_vector (7 downto 0);
          clk        : in    std_logic;
          pushbutton : in    std_logic;
          push_i     : in    std_logic;
          load       : out   std_logic;
          sub        : out   std_logic;
          op_valid   : out   std_logic;
          anode      : out   std_logic_vector (3 downto 0);
          cathode    : out   std_logic_vector (6 downto 0));
end lab5_gcd;
architecture BEHAVIORAL of lab5_gcd is
   signal XLXN_1     : std_logic_vector (3 downto 0);
   signal XLXN_4     : std_logic_vector (1 downto 0);
   signal c     : std_logic_vector (7 downto 0);
   signal d     : std_logic_vector (7 downto 0);
   signal d_o     : std_logic_vector (15 downto 0);
   signal XLXN_18    : std_logic;
   signal mlk,mlk1: Integer:=0;
   signal load1    : std_logic;
   signal sub1      : std_logic;
   signal op_valid1      : std_logic;
   signal clck         : std_logic;
   signal clock         : std_logic;
   signal XLXN_19    : std_logic;
   signal XLXN_20    : std_logic;
   signal XLXN_21    : std_logic;
 
   component my_mux16_MUSER_lab5_gcd
      port ( iinput  : in    std_logic_vector (15 downto 0);
             ooutput : out   std_logic_vector (3 downto 0);
             s       : in    std_logic_vector (1 downto 0));
   end component;
  
  
   component my_subs_MUSER_lab5_gcd
      port ( a_i  : in    std_logic_vector (7 downto 0);
              b_i  : in    std_logic_vector (7 downto 0);
              d_oo  : out    std_logic_vector (7 downto 0)
             );
   end component;
  
  
   component INV
      port ( I : in    std_logic;
             O : out   std_logic);
   end component;
    
   component myanode_MUSER_lab5_gcd
      port ( anode : out   std_logic_vector (3 downto 0);
             s     : in    std_logic_vector (1 downto 0));
   end component;
  
   component mycounter2_MUSER_lab5_gcd
      port ( myclock : in    std_logic;
             s       : out   std_logic_vector (1 downto 0));
   end component;
  
   component myclock_MUSER_lab5_gcd
      port ( clk : in    std_logic;
             q   : out   std_logic);
   end component;
    
   component myclock2_MUSER_lab5_gcd
      port ( clk2 : in    std_logic;
             q2  : out   std_logic);
   end component;
  
   component AND2B1
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             O  : out   std_logic);
   end component;
  -- attribute BOX_TYPE of AND2B1 : component is "BLACK_BOX";
  
   component AND2
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             O  : out   std_logic);
   end component;
 --  attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
  
   component OR2
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             O  : out   std_logic);
   end component;
 --  attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
  
  
  
    component OR4
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             I3 : in    std_logic;
             O  : out   std_logic);
   end component;
  -- attribute BOX_TYPE of OR4 : component is "BLACK_BOX";
    
   component mycathode2_MUSER_lab5_gcd
      port ( cathode : out   std_logic_vector (6 downto 0);
             myx     : in    std_logic_vector (3 downto 0));
   end component;
  
   begin
  
   process(c,d,pushbutton,clk,d_o,sub1,push_i,mlk,mlk1)
    begin
     
    if(a_i="00000000"   or b_i="00000000" or   (a_i(7) and (a_i(6) or a_i(5)))= '1' or (a_i(3) and (a_i(2) or a_i(1)))='1' or (b_i(7) and (b_i(6) or b_i(5)))='1' or (b_i(3) and (b_i(2) or b_i(1)))='1' ) then
       op_valid1 <= '0';
       op_valid <= '0';
       elsif(a_i = b_i) then
        op_valid1 <= '1';
        op_valid <= '1';
      else
       op_valid1 <= '1';
       op_valid <= '1';
      end if;
      op_valid <= op_valid1;
      if (op_valid1='1' and push_i='1') then
           load1 <= '1';
           load<=load1;
           c <= a_i;
           d <= b_i;
           d_o <= c & d;
           else
           load<='0';
           sub1<='1';
           sub <= sub1;
         end if;
         clock <= ((clck AND  NOT(pushbutton)) OR (clk AND pushbutton));
        
       d_o(15 downto 8) <= c;
       d_o(7 downto 0) <=d;
       if(c=d) then
       	sub1<='0';
       	sub<=sub1;
       end if; 
       if(clk='1' and clk'event)then
           mlk1<=mlk1+1;
           mlk<=mlk1 mod 8;
       end if;    
                 
       if(mlk=0) then       
       if (sub1='1') then
       		if(clock = '1' AND clock'EVENT) then
           
        	if(c(7 DOWNTO 4) >d(7 DOWNTO 4)) then
           
       		if(c(3 DOWNTO 0)>=d(3 DOWNTO 0)) then
                     
            c <= std_logic_vector(unsigned(c) -unsigned(d));
          else
            c(3 DOWNTO 0) <= std_logic_vector("1010" + unsigned(c(3 DOWNTO 0)) - unsigned(d(3 DOWNTO 0)));
            c(7 DowNTO 4) <= std_logic_vector(unsigned(c(7 DOWNTO 4)) - unsigned(d(7 DOWNTO 4))-"0001");
          end if;
                  
          elsif(c(7 DOWNTO 4) = d(7 DOWNTO 4)) then
          if(c(3 DOWNTO 0) > d(3 DOWNTO 0)) then 
          	c <= std_logic_vector(unsigned(c) -unsigned( d));                                                       
                                
          elsif(c(3 DOWNTO 0) < d(3 DOWNTO 0)) then                                                           
            d <= std_logic_vector(unsigned(d) -unsigned(c));                         
          else
            c<=c;                               
          end if;
              else
          if(d(3 DOWNTO 0)>=c(3 DOWNTO 0)) then
          d <= std_logic_vector(unsigned(d) -unsigned(c));
          else
          d(3 DOWNTO 0) <= std_logic_vector("1010" + unsigned(d(3 DOWNTO 0)) - unsigned(c(3 DOWNTO 0)));
          d(7 DowNTO 4) <= std_logic_vector(unsigned(d(7 DOWNTO 4)) - unsigned(c(7 DOWNTO 4))-"0001");
          end if;
         end if;
         end if;
         end if;
         end if;
         end process;
      XLXI_3 : my_mux16_MUSER_lab5_gcd
         port map (iinput(15 downto 0)=>d_o(15 downto 0),
                   s(1 downto 0)=>XLXN_4(1 downto 0),
                   ooutput(3 downto 0)=>XLXN_1(3 downto 0));  
      XLXI_4 : myanode_MUSER_lab5_gcd
         port map (s(1 downto 0)=>XLXN_4(1 downto 0),
                   anode(3 downto 0)=>anode(3 downto 0));
     
      XLXI_5 : mycounter2_MUSER_lab5_gcd
         port map (myclock=>XLXN_21,
                   s(1 downto 0)=>XLXN_4(1 downto 0));
     
      XLXI_10 : myclock_MUSER_lab5_gcd
         port map (clk=>clk,
                   q=>XLXN_18);
      XLXI_90 : myclock2_MUSER_lab5_gcd
         port map (clk2=>clk,
                   q2=>clck);
      XLXI_11 : AND2B1
         port map (I0=>pushbutton,
                   I1=>XLXN_18,
                   O=>XLXN_19);
     
      XLXI_12 : AND2
         port map (I0=>clk,
                   I1=>pushbutton,
                   O=>XLXN_20);
     
      XLXI_13 : OR2
         port map (I0=>XLXN_20,
                   I1=>XLXN_19,
                   O=>XLXN_21);            
      XLXI_14 : mycathode2_MUSER_lab5_gcd
         port map (myx(3 downto 0)=>XLXN_1(3 downto 0),
                   cathode(6 downto 0)=>cathode(6 downto 0));
     
   end BEHAVIORAL;