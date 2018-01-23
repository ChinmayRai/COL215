library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FTC_HXILINX_lab4_seven_segment_display is
generic(
    INIT : bit := '0'
    );

  port (
    Q   : out STD_LOGIC := '0';
    C   : in STD_LOGIC;
    CLR : in STD_LOGIC;
    T   : in STD_LOGIC
    );
end FTC_HXILINX_lab4_seven_segment_display;

architecture Behavioral of FTC_HXILINX_lab4_seven_segment_display is
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

----- CELL D2_4E_HXILINX_lab4_seven_segment_display -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity D2_4E_HXILINX_lab4_seven_segment_display is
  
port(
    D0  : out std_logic;
    D1  : out std_logic;
    D2  : out std_logic;
    D3  : out std_logic;

    A0  : in std_logic;
    A1  : in std_logic;
    E   : in std_logic
  );
end D2_4E_HXILINX_lab4_seven_segment_display;

architecture D2_4E_HXILINX_lab4_seven_segment_display_V of D2_4E_HXILINX_lab4_seven_segment_display is
  signal d_tmp : std_logic_vector(3 downto 0);
begin
  process (A0, A1, E)
  variable sel   : std_logic_vector(1 downto 0);
  begin
    sel := A1&A0;
    if( E = '0') then
    d_tmp <= "0000";
    else
      case sel is
      when "00" => d_tmp <= "0001";
      when "01" => d_tmp <= "0010";
      when "10" => d_tmp <= "0100";
      when "11" => d_tmp <= "1000";
      when others => NULL;
      end case;
    end if;
  end process; 

    D3 <= d_tmp(3);
    D2 <= d_tmp(2);
    D1 <= d_tmp(1);
    D0 <= d_tmp(0);

end D2_4E_HXILINX_lab4_seven_segment_display_V;
----- CELL AND6_HXILINX_lab4_seven_segment_display -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity AND6_HXILINX_lab4_seven_segment_display is
  
port(
    O  : out std_logic;

    I0  : in std_logic;
    I1  : in std_logic;
    I2  : in std_logic;
    I3  : in std_logic;
    I4  : in std_logic;
    I5  : in std_logic
  );
end AND6_HXILINX_lab4_seven_segment_display;

architecture AND6_HXILINX_lab4_seven_segment_display_V of AND6_HXILINX_lab4_seven_segment_display is
begin
  O <= I0 and I1 and I2 and I3 and I4 and I5;
end AND6_HXILINX_lab4_seven_segment_display_V;

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity enableswitchmux_MUSER_lab4_seven_segment_display is
   port ( e  : in    std_logic; 
          x0 : in    std_logic; 
          x1 : in    std_logic; 
          x2 : in    std_logic; 
          x3 : in    std_logic; 
          y0 : out   std_logic; 
          y1 : out   std_logic; 
          y2 : out   std_logic; 
          y3 : out   std_logic);
end enableswitchmux_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of enableswitchmux_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
begin
   XLXI_1 : AND2
      port map (I0=>e,
                I1=>x0,
                O=>y0);
   
   XLXI_2 : AND2
      port map (I0=>e,
                I1=>x1,
                O=>y1);
   
   XLXI_3 : AND2
      port map (I0=>e,
                I1=>x2,
                O=>y2);
   
   XLXI_4 : AND2
      port map (I0=>e,
                I1=>x3,
                O=>y3);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity select4_MUSER_lab4_seven_segment_display is
   port ( anode : in    std_logic_vector (3 downto 0); 
          b     : in    std_logic_vector (15 downto 0); 
          out0  : out   std_logic; 
          out1  : out   std_logic; 
          out2  : out   std_logic; 
          out3  : out   std_logic);
end select4_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of select4_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_23 : std_logic;
   signal XLXN_24 : std_logic;
   signal XLXN_25 : std_logic;
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
   component enableswitchmux_MUSER_lab4_seven_segment_display
      port ( e  : in    std_logic; 
             x0 : in    std_logic; 
             x1 : in    std_logic; 
             x2 : in    std_logic; 
             x3 : in    std_logic; 
             y0 : out   std_logic; 
             y1 : out   std_logic; 
             y2 : out   std_logic; 
             y3 : out   std_logic);
   end component;
   
   component OR4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR4 : component is "BLACK_BOX";
   
begin
   XLXI_1 : enableswitchmux_MUSER_lab4_seven_segment_display
      port map (e=>anode(0),
                x0=>b(0),
                x1=>b(1),
                x2=>b(2),
                x3=>b(3),
                y0=>XLXN_23,
                y1=>XLXN_44,
                y2=>XLXN_51,
                y3=>XLXN_52);
   
   XLXI_2 : enableswitchmux_MUSER_lab4_seven_segment_display
      port map (e=>anode(1),
                x0=>b(4),
                x1=>b(5),
                x2=>b(6),
                x3=>b(7),
                y0=>XLXN_24,
                y1=>XLXN_45,
                y2=>XLXN_50,
                y3=>XLXN_53);
   
   XLXI_3 : enableswitchmux_MUSER_lab4_seven_segment_display
      port map (e=>anode(2),
                x0=>b(8),
                x1=>b(9),
                x2=>b(10),
                x3=>b(11),
                y0=>XLXN_25,
                y1=>XLXN_46,
                y2=>XLXN_49,
                y3=>XLXN_54);
   
   XLXI_4 : enableswitchmux_MUSER_lab4_seven_segment_display
      port map (e=>anode(3),
                x0=>b(12),
                x1=>b(13),
                x2=>b(14),
                x3=>b(15),
                y0=>XLXN_43,
                y1=>XLXN_47,
                y2=>XLXN_48,
                y3=>XLXN_55);
   
   XLXI_5 : OR4
      port map (I0=>XLXN_43,
                I1=>XLXN_25,
                I2=>XLXN_24,
                I3=>XLXN_23,
                O=>out0);
   
   XLXI_6 : OR4
      port map (I0=>XLXN_47,
                I1=>XLXN_46,
                I2=>XLXN_45,
                I3=>XLXN_44,
                O=>out1);
   
   XLXI_7 : OR4
      port map (I0=>XLXN_48,
                I1=>XLXN_49,
                I2=>XLXN_50,
                I3=>XLXN_51,
                O=>out2);
   
   XLXI_8 : OR4
      port map (I0=>XLXN_55,
                I1=>XLXN_54,
                I2=>XLXN_53,
                I3=>XLXN_52,
                O=>out3);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity g_MUSER_lab4_seven_segment_display is
   port ( x0 : in    std_logic; 
          x1 : in    std_logic; 
          x2 : in    std_logic; 
          x3 : in    std_logic; 
          g  : out   std_logic);
end g_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of g_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_1  : std_logic;
   signal XLXN_2  : std_logic;
   signal XLXN_3  : std_logic;
   signal XLXN_4  : std_logic;
   signal XLXN_5  : std_logic;
   signal XLXN_6  : std_logic;
   signal XLXN_7  : std_logic;
   signal XLXN_8  : std_logic;
   signal XLXN_10 : std_logic;
   signal XLXN_11 : std_logic;
   component OR4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR4 : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component AND4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4 : component is "BLACK_BOX";
   
begin
   XLXI_1 : OR4
      port map (I0=>x3,
                I1=>x2,
                I2=>x1,
                I3=>XLXN_1,
                O=>XLXN_7);
   
   XLXI_2 : OR4
      port map (I0=>x3,
                I1=>XLXN_4,
                I2=>XLXN_3,
                I3=>XLXN_2,
                O=>XLXN_8);
   
   XLXI_3 : OR4
      port map (I0=>XLXN_6,
                I1=>XLXN_5,
                I2=>x1,
                I3=>x0,
                O=>XLXN_11);
   
   XLXI_5 : INV
      port map (I=>x0,
                O=>XLXN_1);
   
   XLXI_6 : INV
      port map (I=>x0,
                O=>XLXN_2);
   
   XLXI_7 : INV
      port map (I=>x1,
                O=>XLXN_3);
   
   XLXI_8 : INV
      port map (I=>x2,
                O=>XLXN_4);
   
   XLXI_9 : INV
      port map (I=>x2,
                O=>XLXN_5);
   
   XLXI_10 : INV
      port map (I=>x3,
                O=>XLXN_6);
   
   XLXI_11 : AND4
      port map (I0=>XLXN_11,
                I1=>XLXN_8,
                I2=>XLXN_7,
                I3=>XLXN_10,
                O=>g);
   
   XLXI_12 : OR4
      port map (I0=>x3,
                I1=>x2,
                I2=>x1,
                I3=>x0,
                O=>XLXN_10);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity f_MUSER_lab4_seven_segment_display is
   port ( x0 : in    std_logic; 
          x1 : in    std_logic; 
          x2 : in    std_logic; 
          x3 : in    std_logic; 
          f  : out   std_logic);
end f_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of f_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_1  : std_logic;
   signal XLXN_2  : std_logic;
   signal XLXN_3  : std_logic;
   signal XLXN_4  : std_logic;
   signal XLXN_5  : std_logic;
   signal XLXN_6  : std_logic;
   signal XLXN_7  : std_logic;
   signal XLXN_8  : std_logic;
   signal XLXN_9  : std_logic;
   signal XLXN_10 : std_logic;
   signal XLXN_12 : std_logic;
   signal XLXN_13 : std_logic;
   signal XLXN_14 : std_logic;
   signal XLXN_15 : std_logic;
   signal XLXN_16 : std_logic;
   component OR4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR4 : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component AND5
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND5 : component is "BLACK_BOX";
   
begin
   XLXI_2 : OR4
      port map (I0=>x3,
                I1=>x2,
                I2=>x1,
                I3=>XLXN_1,
                O=>XLXN_12);
   
   XLXI_3 : OR4
      port map (I0=>x3,
                I1=>x2,
                I2=>XLXN_2,
                I3=>x0,
                O=>XLXN_13);
   
   XLXI_4 : OR4
      port map (I0=>x3,
                I1=>x2,
                I2=>XLXN_4,
                I3=>XLXN_3,
                O=>XLXN_14);
   
   XLXI_5 : OR4
      port map (I0=>x3,
                I1=>XLXN_7,
                I2=>XLXN_6,
                I3=>XLXN_5,
                O=>XLXN_15);
   
   XLXI_6 : OR4
      port map (I0=>XLXN_10,
                I1=>XLXN_9,
                I2=>x1,
                I3=>XLXN_8,
                O=>XLXN_16);
   
   XLXI_8 : INV
      port map (I=>x0,
                O=>XLXN_1);
   
   XLXI_9 : INV
      port map (I=>x1,
                O=>XLXN_2);
   
   XLXI_10 : INV
      port map (I=>x0,
                O=>XLXN_3);
   
   XLXI_11 : INV
      port map (I=>x1,
                O=>XLXN_4);
   
   XLXI_12 : INV
      port map (I=>x0,
                O=>XLXN_5);
   
   XLXI_13 : INV
      port map (I=>x1,
                O=>XLXN_6);
   
   XLXI_14 : INV
      port map (I=>x2,
                O=>XLXN_7);
   
   XLXI_15 : INV
      port map (I=>x0,
                O=>XLXN_8);
   
   XLXI_16 : INV
      port map (I=>x2,
                O=>XLXN_9);
   
   XLXI_17 : INV
      port map (I=>x3,
                O=>XLXN_10);
   
   XLXI_18 : AND5
      port map (I0=>XLXN_16,
                I1=>XLXN_15,
                I2=>XLXN_14,
                I3=>XLXN_13,
                I4=>XLXN_12,
                O=>f);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity e_MUSER_lab4_seven_segment_display is
   port ( x0 : in    std_logic; 
          x1 : in    std_logic; 
          x2 : in    std_logic; 
          x3 : in    std_logic; 
          e  : out   std_logic);
end e_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of e_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   attribute HU_SET     : string ;
   signal XLXN_2  : std_logic;
   signal XLXN_3  : std_logic;
   signal XLXN_4  : std_logic;
   signal XLXN_5  : std_logic;
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
   signal XLXN_18 : std_logic;
   signal XLXN_19 : std_logic;
   component OR4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR4 : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component AND6_HXILINX_lab4_seven_segment_display
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             I5 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   attribute HU_SET of XLXI_23 : label is "XLXI_23_0";
begin
   XLXI_2 : OR4
      port map (I0=>x3,
                I1=>x2,
                I2=>x1,
                I3=>XLXN_2,
                O=>XLXN_19);
   
   XLXI_3 : OR4
      port map (I0=>x3,
                I1=>x2,
                I2=>XLXN_4,
                I3=>XLXN_3,
                O=>XLXN_18);
   
   XLXI_4 : OR4
      port map (I0=>x3,
                I1=>XLXN_5,
                I2=>x1,
                I3=>x0,
                O=>XLXN_17);
   
   XLXI_5 : OR4
      port map (I0=>x3,
                I1=>XLXN_8,
                I2=>x1,
                I3=>XLXN_7,
                O=>XLXN_16);
   
   XLXI_6 : OR4
      port map (I0=>x3,
                I1=>XLXN_11,
                I2=>XLXN_10,
                I3=>XLXN_9,
                O=>XLXN_15);
   
   XLXI_7 : OR4
      port map (I0=>XLXN_13,
                I1=>x2,
                I2=>x1,
                I3=>XLXN_12,
                O=>XLXN_14);
   
   XLXI_10 : INV
      port map (I=>x0,
                O=>XLXN_2);
   
   XLXI_11 : INV
      port map (I=>x0,
                O=>XLXN_3);
   
   XLXI_12 : INV
      port map (I=>x1,
                O=>XLXN_4);
   
   XLXI_13 : INV
      port map (I=>x2,
                O=>XLXN_5);
   
   XLXI_16 : INV
      port map (I=>x0,
                O=>XLXN_7);
   
   XLXI_17 : INV
      port map (I=>x2,
                O=>XLXN_8);
   
   XLXI_18 : INV
      port map (I=>x0,
                O=>XLXN_9);
   
   XLXI_19 : INV
      port map (I=>x1,
                O=>XLXN_10);
   
   XLXI_20 : INV
      port map (I=>x2,
                O=>XLXN_11);
   
   XLXI_21 : INV
      port map (I=>x0,
                O=>XLXN_12);
   
   XLXI_22 : INV
      port map (I=>x3,
                O=>XLXN_13);
   
   XLXI_23 : AND6_HXILINX_lab4_seven_segment_display
      port map (I0=>XLXN_14,
                I1=>XLXN_15,
                I2=>XLXN_16,
                I3=>XLXN_17,
                I4=>XLXN_18,
                I5=>XLXN_19,
                O=>e);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity d_MUSER_lab4_seven_segment_display is
   port ( x0 : in    std_logic; 
          x1 : in    std_logic; 
          x2 : in    std_logic; 
          x3 : in    std_logic; 
          d  : out   std_logic);
end d_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of d_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_2  : std_logic;
   signal XLXN_5  : std_logic;
   signal XLXN_6  : std_logic;
   signal XLXN_7  : std_logic;
   signal XLXN_8  : std_logic;
   signal XLXN_13 : std_logic;
   signal XLXN_14 : std_logic;
   signal XLXN_15 : std_logic;
   signal XLXN_16 : std_logic;
   signal XLXN_17 : std_logic;
   signal XLXN_18 : std_logic;
   signal XLXN_19 : std_logic;
   signal XLXN_20 : std_logic;
   signal XLXN_21 : std_logic;
   signal XLXN_22 : std_logic;
   signal XLXN_23 : std_logic;
   component OR4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR4 : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component AND5
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND5 : component is "BLACK_BOX";
   
begin
   XLXI_2 : OR4
      port map (I0=>x3,
                I1=>x2,
                I2=>x1,
                I3=>XLXN_13,
                O=>XLXN_2);
   
   XLXI_3 : OR4
      port map (I0=>x3,
                I1=>XLXN_14,
                I2=>x1,
                I3=>x0,
                O=>XLXN_5);
   
   XLXI_4 : OR4
      port map (I0=>x3,
                I1=>XLXN_17,
                I2=>XLXN_16,
                I3=>XLXN_15,
                O=>XLXN_6);
   
   XLXI_5 : OR4
      port map (I0=>XLXN_19,
                I1=>x2,
                I2=>XLXN_18,
                I3=>x0,
                O=>XLXN_7);
   
   XLXI_6 : OR4
      port map (I0=>XLXN_23,
                I1=>XLXN_22,
                I2=>XLXN_21,
                I3=>XLXN_20,
                O=>XLXN_8);
   
   XLXI_8 : INV
      port map (I=>x0,
                O=>XLXN_13);
   
   XLXI_9 : INV
      port map (I=>x2,
                O=>XLXN_14);
   
   XLXI_10 : INV
      port map (I=>x0,
                O=>XLXN_15);
   
   XLXI_11 : INV
      port map (I=>x1,
                O=>XLXN_16);
   
   XLXI_12 : INV
      port map (I=>x2,
                O=>XLXN_17);
   
   XLXI_13 : INV
      port map (I=>x1,
                O=>XLXN_18);
   
   XLXI_14 : INV
      port map (I=>x3,
                O=>XLXN_19);
   
   XLXI_15 : INV
      port map (I=>x0,
                O=>XLXN_20);
   
   XLXI_16 : INV
      port map (I=>x1,
                O=>XLXN_21);
   
   XLXI_17 : INV
      port map (I=>x2,
                O=>XLXN_22);
   
   XLXI_18 : INV
      port map (I=>x3,
                O=>XLXN_23);
   
   XLXI_19 : AND5
      port map (I0=>XLXN_8,
                I1=>XLXN_7,
                I2=>XLXN_6,
                I3=>XLXN_5,
                I4=>XLXN_2,
                O=>d);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity c_MUSER_lab4_seven_segment_display is
   port ( x0 : in    std_logic; 
          x1 : in    std_logic; 
          x2 : in    std_logic; 
          x3 : in    std_logic; 
          c  : out   std_logic);
end c_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of c_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_8  : std_logic;
   signal XLXN_9  : std_logic;
   signal XLXN_10 : std_logic;
   signal XLXN_11 : std_logic;
   signal XLXN_13 : std_logic;
   signal XLXN_14 : std_logic;
   signal XLXN_15 : std_logic;
   signal XLXN_16 : std_logic;
   signal XLXN_17 : std_logic;
   signal XLXN_18 : std_logic;
   signal XLXN_19 : std_logic;
   signal XLXN_20 : std_logic;
   signal XLXN_21 : std_logic;
   signal XLXN_22 : std_logic;
   component OR4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR4 : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component AND4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4 : component is "BLACK_BOX";
   
begin
   XLXI_2 : OR4
      port map (I0=>x3,
                I1=>x2,
                I2=>XLXN_13,
                I3=>x0,
                O=>XLXN_8);
   
   XLXI_3 : OR4
      port map (I0=>XLXN_15,
                I1=>XLXN_14,
                I2=>x1,
                I3=>x0,
                O=>XLXN_9);
   
   XLXI_4 : OR4
      port map (I0=>XLXN_22,
                I1=>XLXN_17,
                I2=>XLXN_16,
                I3=>x0,
                O=>XLXN_10);
   
   XLXI_5 : OR4
      port map (I0=>XLXN_21,
                I1=>XLXN_20,
                I2=>XLXN_19,
                I3=>XLXN_18,
                O=>XLXN_11);
   
   XLXI_8 : INV
      port map (I=>x1,
                O=>XLXN_13);
   
   XLXI_9 : INV
      port map (I=>x2,
                O=>XLXN_14);
   
   XLXI_10 : INV
      port map (I=>x3,
                O=>XLXN_15);
   
   XLXI_11 : INV
      port map (I=>x1,
                O=>XLXN_16);
   
   XLXI_12 : INV
      port map (I=>x2,
                O=>XLXN_17);
   
   XLXI_13 : INV
      port map (I=>x3,
                O=>XLXN_22);
   
   XLXI_14 : INV
      port map (I=>x0,
                O=>XLXN_18);
   
   XLXI_15 : INV
      port map (I=>x1,
                O=>XLXN_19);
   
   XLXI_16 : INV
      port map (I=>x2,
                O=>XLXN_20);
   
   XLXI_17 : INV
      port map (I=>x3,
                O=>XLXN_21);
   
   XLXI_23 : AND4
      port map (I0=>XLXN_11,
                I1=>XLXN_10,
                I2=>XLXN_9,
                I3=>XLXN_8,
                O=>c);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity b_MUSER_lab4_seven_segment_display is
   port ( x0 : in    std_logic; 
          x1 : in    std_logic; 
          x2 : in    std_logic; 
          x3 : in    std_logic; 
          b  : out   std_logic);
end b_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of b_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   attribute HU_SET     : string ;
   signal XLXN_1  : std_logic;
   signal XLXN_2  : std_logic;
   signal XLXN_3  : std_logic;
   signal XLXN_4  : std_logic;
   signal XLXN_5  : std_logic;
   signal XLXN_7  : std_logic;
   signal XLXN_12 : std_logic;
   signal XLXN_13 : std_logic;
   signal XLXN_14 : std_logic;
   signal XLXN_15 : std_logic;
   signal XLXN_16 : std_logic;
   signal XLXN_17 : std_logic;
   signal XLXN_18 : std_logic;
   signal XLXN_19 : std_logic;
   signal XLXN_20 : std_logic;
   signal XLXN_21 : std_logic;
   signal XLXN_22 : std_logic;
   signal XLXN_23 : std_logic;
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
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component AND6_HXILINX_lab4_seven_segment_display
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             I5 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   attribute HU_SET of XLXI_25 : label is "XLXI_25_1";
begin
   XLXI_2 : OR4
      port map (I0=>x3,
                I1=>XLXN_13,
                I2=>x1,
                I3=>XLXN_12,
                O=>XLXN_7);
   
   XLXI_3 : OR4
      port map (I0=>x3,
                I1=>XLXN_15,
                I2=>XLXN_14,
                I3=>x0,
                O=>XLXN_5);
   
   XLXI_4 : OR4
      port map (I0=>XLXN_18,
                I1=>x2,
                I2=>XLXN_17,
                I3=>XLXN_16,
                O=>XLXN_4);
   
   XLXI_5 : OR4
      port map (I0=>XLXN_20,
                I1=>XLXN_19,
                I2=>x1,
                I3=>x0,
                O=>XLXN_3);
   
   XLXI_6 : OR4
      port map (I0=>XLXN_23,
                I1=>XLXN_22,
                I2=>XLXN_21,
                I3=>x0,
                O=>XLXN_2);
   
   XLXI_7 : OR4
      port map (I0=>XLXN_27,
                I1=>XLXN_26,
                I2=>XLXN_25,
                I3=>XLXN_24,
                O=>XLXN_1);
   
   XLXI_9 : INV
      port map (I=>x0,
                O=>XLXN_12);
   
   XLXI_10 : INV
      port map (I=>x2,
                O=>XLXN_13);
   
   XLXI_11 : INV
      port map (I=>x1,
                O=>XLXN_14);
   
   XLXI_12 : INV
      port map (I=>x2,
                O=>XLXN_15);
   
   XLXI_13 : INV
      port map (I=>x0,
                O=>XLXN_16);
   
   XLXI_14 : INV
      port map (I=>x1,
                O=>XLXN_17);
   
   XLXI_15 : INV
      port map (I=>x3,
                O=>XLXN_18);
   
   XLXI_16 : INV
      port map (I=>x2,
                O=>XLXN_19);
   
   XLXI_17 : INV
      port map (I=>x3,
                O=>XLXN_20);
   
   XLXI_18 : INV
      port map (I=>x1,
                O=>XLXN_21);
   
   XLXI_19 : INV
      port map (I=>x2,
                O=>XLXN_22);
   
   XLXI_20 : INV
      port map (I=>x3,
                O=>XLXN_23);
   
   XLXI_21 : INV
      port map (I=>x0,
                O=>XLXN_24);
   
   XLXI_22 : INV
      port map (I=>x1,
                O=>XLXN_25);
   
   XLXI_23 : INV
      port map (I=>x2,
                O=>XLXN_26);
   
   XLXI_24 : INV
      port map (I=>x3,
                O=>XLXN_27);
   
   XLXI_25 : AND6_HXILINX_lab4_seven_segment_display
      port map (I0=>XLXN_1,
                I1=>XLXN_2,
                I2=>XLXN_3,
                I3=>XLXN_4,
                I4=>XLXN_5,
                I5=>XLXN_7,
                O=>b);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity a_MUSER_lab4_seven_segment_display is
   port ( x0 : in    std_logic; 
          x1 : in    std_logic; 
          x2 : in    std_logic; 
          x3 : in    std_logic; 
          a  : out   std_logic);
end a_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of a_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_3  : std_logic;
   signal XLXN_4  : std_logic;
   signal XLXN_5  : std_logic;
   signal XLXN_6  : std_logic;
   signal XLXN_11 : std_logic;
   signal XLXN_12 : std_logic;
   signal XLXN_13 : std_logic;
   signal XLXN_14 : std_logic;
   signal XLXN_15 : std_logic;
   signal XLXN_16 : std_logic;
   signal XLXN_17 : std_logic;
   signal XLXN_18 : std_logic;
   component OR4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR4 : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component AND4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4 : component is "BLACK_BOX";
   
begin
   XLXI_2 : OR4
      port map (I0=>x3,
                I1=>x2,
                I2=>x1,
                I3=>XLXN_11,
                O=>XLXN_3);
   
   XLXI_3 : OR4
      port map (I0=>x3,
                I1=>XLXN_12,
                I2=>x1,
                I3=>x0,
                O=>XLXN_4);
   
   XLXI_4 : OR4
      port map (I0=>XLXN_15,
                I1=>x2,
                I2=>XLXN_14,
                I3=>XLXN_13,
                O=>XLXN_5);
   
   XLXI_5 : OR4
      port map (I0=>XLXN_18,
                I1=>XLXN_17,
                I2=>x1,
                I3=>XLXN_16,
                O=>XLXN_6);
   
   XLXI_7 : INV
      port map (I=>x0,
                O=>XLXN_11);
   
   XLXI_8 : INV
      port map (I=>x2,
                O=>XLXN_12);
   
   XLXI_9 : INV
      port map (I=>x0,
                O=>XLXN_13);
   
   XLXI_10 : INV
      port map (I=>x1,
                O=>XLXN_14);
   
   XLXI_12 : INV
      port map (I=>x3,
                O=>XLXN_15);
   
   XLXI_13 : INV
      port map (I=>x0,
                O=>XLXN_16);
   
   XLXI_14 : INV
      port map (I=>x2,
                O=>XLXN_17);
   
   XLXI_15 : INV
      port map (I=>x3,
                O=>XLXN_18);
   
   XLXI_16 : AND4
      port map (I0=>XLXN_6,
                I1=>XLXN_5,
                I2=>XLXN_4,
                I3=>XLXN_3,
                O=>a);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity cathode_selector_MUSER_lab4_seven_segment_display is
   port ( x0      : in    std_logic; 
          x1      : in    std_logic; 
          x2      : in    std_logic; 
          x3      : in    std_logic; 
          cathode : out   std_logic_vector (6 downto 0));
end cathode_selector_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of cathode_selector_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_48 : std_logic;
   signal XLXN_49 : std_logic;
   signal XLXN_50 : std_logic;
   signal XLXN_51 : std_logic;
   signal XLXN_52 : std_logic;
   signal XLXN_53 : std_logic;
   signal XLXN_54 : std_logic;
   component a_MUSER_lab4_seven_segment_display
      port ( a  : out   std_logic; 
             x0 : in    std_logic; 
             x1 : in    std_logic; 
             x2 : in    std_logic; 
             x3 : in    std_logic);
   end component;
   
   component b_MUSER_lab4_seven_segment_display
      port ( b  : out   std_logic; 
             x0 : in    std_logic; 
             x1 : in    std_logic; 
             x2 : in    std_logic; 
             x3 : in    std_logic);
   end component;
   
   component c_MUSER_lab4_seven_segment_display
      port ( c  : out   std_logic; 
             x0 : in    std_logic; 
             x1 : in    std_logic; 
             x2 : in    std_logic; 
             x3 : in    std_logic);
   end component;
   
   component d_MUSER_lab4_seven_segment_display
      port ( d  : out   std_logic; 
             x0 : in    std_logic; 
             x1 : in    std_logic; 
             x2 : in    std_logic; 
             x3 : in    std_logic);
   end component;
   
   component e_MUSER_lab4_seven_segment_display
      port ( e  : out   std_logic; 
             x0 : in    std_logic; 
             x1 : in    std_logic; 
             x2 : in    std_logic; 
             x3 : in    std_logic);
   end component;
   
   component f_MUSER_lab4_seven_segment_display
      port ( f  : out   std_logic; 
             x0 : in    std_logic; 
             x1 : in    std_logic; 
             x2 : in    std_logic; 
             x3 : in    std_logic);
   end component;
   
   component g_MUSER_lab4_seven_segment_display
      port ( g  : out   std_logic; 
             x0 : in    std_logic; 
             x1 : in    std_logic; 
             x2 : in    std_logic; 
             x3 : in    std_logic);
   end component;
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
begin
   XLXI_1 : a_MUSER_lab4_seven_segment_display
      port map (x0=>x0,
                x1=>x1,
                x2=>x2,
                x3=>x3,
                a=>XLXN_48);
   
   XLXI_2 : b_MUSER_lab4_seven_segment_display
      port map (x0=>x0,
                x1=>x1,
                x2=>x2,
                x3=>x3,
                b=>XLXN_49);
   
   XLXI_3 : c_MUSER_lab4_seven_segment_display
      port map (x0=>x0,
                x1=>x1,
                x2=>x2,
                x3=>x3,
                c=>XLXN_50);
   
   XLXI_4 : d_MUSER_lab4_seven_segment_display
      port map (x0=>x0,
                x1=>x1,
                x2=>x2,
                x3=>x3,
                d=>XLXN_51);
   
   XLXI_5 : e_MUSER_lab4_seven_segment_display
      port map (x0=>x0,
                x1=>x1,
                x2=>x2,
                x3=>x3,
                e=>XLXN_52);
   
   XLXI_6 : f_MUSER_lab4_seven_segment_display
      port map (x0=>x0,
                x1=>x1,
                x2=>x2,
                x3=>x3,
                f=>XLXN_53);
   
   XLXI_7 : g_MUSER_lab4_seven_segment_display
      port map (x0=>x0,
                x1=>x1,
                x2=>x2,
                x3=>x3,
                g=>XLXN_54);
   
   XLXI_8 : INV
      port map (I=>XLXN_48,
                O=>cathode(0));
   
   XLXI_9 : INV
      port map (I=>XLXN_49,
                O=>cathode(1));
   
   XLXI_10 : INV
      port map (I=>XLXN_50,
                O=>cathode(2));
   
   XLXI_11 : INV
      port map (I=>XLXN_51,
                O=>cathode(3));
   
   XLXI_12 : INV
      port map (I=>XLXN_52,
                O=>cathode(4));
   
   XLXI_13 : INV
      port map (I=>XLXN_53,
                O=>cathode(5));
   
   XLXI_14 : INV
      port map (I=>XLXN_54,
                O=>cathode(6));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity dpacket_MUSER_lab4_seven_segment_display is
   port ( x : in    std_logic; 
          y : out   std_logic);
end dpacket_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of dpacket_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_1  : std_logic;
   signal XLXN_2  : std_logic;
   signal XLXN_3  : std_logic;
   signal XLXN_4  : std_logic;
   signal XLXN_5  : std_logic;
   signal XLXN_6  : std_logic;
   signal XLXN_7  : std_logic;
   signal XLXN_10 : std_logic;
   signal XLXN_11 : std_logic;
   signal XLXN_12 : std_logic;
   signal XLXN_13 : std_logic;
   signal XLXN_14 : std_logic;
   signal XLXN_15 : std_logic;
   signal XLXN_16 : std_logic;
   signal XLXN_17 : std_logic;
   signal XLXN_18 : std_logic;
   signal XLXN_19 : std_logic;
   signal XLXN_20 : std_logic;
   signal XLXN_21 : std_logic;
   signal XLXN_22 : std_logic;
   signal XLXN_23 : std_logic;
   signal XLXN_24 : std_logic;
   signal XLXN_26 : std_logic;
   signal XLXN_27 : std_logic;
   signal XLXN_28 : std_logic;
   signal XLXN_30 : std_logic;
   signal XLXN_32 : std_logic;
   signal XLXN_34 : std_logic;
   signal XLXN_36 : std_logic;
   signal XLXN_38 : std_logic;
   signal XLXN_40 : std_logic;
   signal XLXN_42 : std_logic;
   signal XLXN_43 : std_logic;
   signal y_DUMMY : std_logic;
   component FD
      generic( INIT : bit :=  '0');
      port ( C : in    std_logic; 
             D : in    std_logic; 
             Q : out   std_logic);
   end component;
   attribute BOX_TYPE of FD : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
begin
   y <= y_DUMMY;
   XLXI_2 : FD
      port map (C=>x,
                D=>XLXN_17,
                Q=>XLXN_1);
   
   XLXI_3 : FD
      port map (C=>XLXN_1,
                D=>XLXN_18,
                Q=>XLXN_2);
   
   XLXI_4 : FD
      port map (C=>XLXN_2,
                D=>XLXN_19,
                Q=>XLXN_3);
   
   XLXI_5 : FD
      port map (C=>XLXN_3,
                D=>XLXN_20,
                Q=>XLXN_4);
   
   XLXI_6 : FD
      port map (C=>XLXN_4,
                D=>XLXN_21,
                Q=>XLXN_5);
   
   XLXI_7 : FD
      port map (C=>XLXN_5,
                D=>XLXN_22,
                Q=>XLXN_6);
   
   XLXI_8 : FD
      port map (C=>XLXN_6,
                D=>XLXN_23,
                Q=>XLXN_7);
   
   XLXI_11 : FD
      port map (C=>XLXN_7,
                D=>XLXN_24,
                Q=>XLXN_26);
   
   XLXI_12 : FD
      port map (C=>XLXN_26,
                D=>XLXN_28,
                Q=>XLXN_27);
   
   XLXI_13 : FD
      port map (C=>XLXN_27,
                D=>XLXN_30,
                Q=>XLXN_10);
   
   XLXI_14 : FD
      port map (C=>XLXN_10,
                D=>XLXN_32,
                Q=>XLXN_11);
   
   XLXI_15 : FD
      port map (C=>XLXN_11,
                D=>XLXN_34,
                Q=>XLXN_12);
   
   XLXI_16 : FD
      port map (C=>XLXN_12,
                D=>XLXN_36,
                Q=>XLXN_13);
   
   XLXI_17 : FD
      port map (C=>XLXN_13,
                D=>XLXN_38,
                Q=>XLXN_14);
   
   XLXI_18 : FD
      port map (C=>XLXN_14,
                D=>XLXN_40,
                Q=>XLXN_15);
   
   XLXI_19 : FD
      port map (C=>XLXN_15,
                D=>XLXN_42,
                Q=>XLXN_16);
   
   XLXI_20 : FD
      port map (C=>XLXN_16,
                D=>XLXN_43,
                Q=>y_DUMMY);
   
   XLXI_21 : INV
      port map (I=>XLXN_1,
                O=>XLXN_17);
   
   XLXI_22 : INV
      port map (I=>XLXN_2,
                O=>XLXN_18);
   
   XLXI_23 : INV
      port map (I=>XLXN_3,
                O=>XLXN_19);
   
   XLXI_24 : INV
      port map (I=>XLXN_4,
                O=>XLXN_20);
   
   XLXI_25 : INV
      port map (I=>XLXN_5,
                O=>XLXN_21);
   
   XLXI_26 : INV
      port map (I=>XLXN_6,
                O=>XLXN_22);
   
   XLXI_27 : INV
      port map (I=>XLXN_7,
                O=>XLXN_23);
   
   XLXI_28 : INV
      port map (I=>XLXN_26,
                O=>XLXN_24);
   
   XLXI_29 : INV
      port map (I=>XLXN_27,
                O=>XLXN_28);
   
   XLXI_30 : INV
      port map (I=>XLXN_10,
                O=>XLXN_30);
   
   XLXI_31 : INV
      port map (I=>XLXN_11,
                O=>XLXN_32);
   
   XLXI_32 : INV
      port map (I=>XLXN_12,
                O=>XLXN_34);
   
   XLXI_33 : INV
      port map (I=>XLXN_13,
                O=>XLXN_36);
   
   XLXI_34 : INV
      port map (I=>XLXN_14,
                O=>XLXN_38);
   
   XLXI_35 : INV
      port map (I=>XLXN_15,
                O=>XLXN_40);
   
   XLXI_36 : INV
      port map (I=>XLXN_16,
                O=>XLXN_42);
   
   XLXI_37 : INV
      port map (I=>y_DUMMY,
                O=>XLXN_43);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity anode_clock_MUSER_lab4_seven_segment_display is
   port ( clk        : in    std_logic; 
          pushbutton : in    std_logic; 
          anode      : out   std_logic_vector (3 downto 0));
end anode_clock_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of anode_clock_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   attribute HU_SET     : string ;
   signal XLXN_2     : std_logic;
   signal XLXN_3     : std_logic;
   signal XLXN_4     : std_logic;
   signal XLXN_50    : std_logic;
   signal XLXN_52    : std_logic;
   signal XLXN_53    : std_logic;
   signal XLXN_54    : std_logic;
   signal XLXN_55    : std_logic;
   signal XLXN_58    : std_logic;
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component dpacket_MUSER_lab4_seven_segment_display
      port ( x : in    std_logic; 
             y : out   std_logic);
   end component;
   
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
   
   component D2_4E_HXILINX_lab4_seven_segment_display
      port ( A0 : in    std_logic; 
             A1 : in    std_logic; 
             E  : in    std_logic; 
             D0 : out   std_logic; 
             D1 : out   std_logic; 
             D2 : out   std_logic; 
             D3 : out   std_logic);
   end component;
   
   component FTC_HXILINX_lab4_seven_segment_display
      generic( INIT : bit :=  '0');
      port ( C   : in    std_logic; 
             CLR : in    std_logic; 
             T   : in    std_logic; 
             Q   : out   std_logic);
   end component;
   
   attribute HU_SET of XLXI_16 : label is "XLXI_16_2";
   attribute HU_SET of XLXI_22 : label is "XLXI_22_3";
   attribute HU_SET of XLXI_23 : label is "XLXI_23_4";
begin
   XLXN_50 <= '0';
   XLXN_53 <= '1';
   XLXI_1 : AND2
      port map (I0=>pushbutton,
                I1=>clk,
                O=>XLXN_3);
   
   XLXI_2 : AND2
      port map (I0=>XLXN_4,
                I1=>XLXN_58,
                O=>XLXN_2);
   
   XLXI_3 : dpacket_MUSER_lab4_seven_segment_display
      port map (x=>clk,
                y=>XLXN_58);
   
   XLXI_4 : OR2
      port map (I0=>XLXN_2,
                I1=>XLXN_3,
                O=>XLXN_52);
   
   XLXI_5 : INV
      port map (I=>pushbutton,
                O=>XLXN_4);
   
   XLXI_16 : D2_4E_HXILINX_lab4_seven_segment_display
      port map (A0=>XLXN_54,
                A1=>XLXN_55,
                E=>XLXN_53,
                D0=>anode(0),
                D1=>anode(1),
                D2=>anode(2),
                D3=>anode(3));
   
   XLXI_22 : FTC_HXILINX_lab4_seven_segment_display
      port map (C=>XLXN_52,
                CLR=>XLXN_50,
                T=>XLXN_53,
                Q=>XLXN_54);
   
   XLXI_23 : FTC_HXILINX_lab4_seven_segment_display
      port map (C=>XLXN_52,
                CLR=>XLXN_50,
                T=>XLXN_54,
                Q=>XLXN_55);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity lab4_seven_segment_display is
   port ( b          : in    std_logic_vector (15 downto 0); 
          clk        : in    std_logic; 
          pushbutton : in    std_logic; 
          anode      : out   std_logic_vector (3 downto 0); 
          cathode    : out   std_logic_vector (6 downto 0));
end lab4_seven_segment_display;

architecture BEHAVIORAL of lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal a          : std_logic_vector (3 downto 0);
   signal XLXN_24    : std_logic;
   signal XLXN_25    : std_logic;
   signal XLXN_26    : std_logic;
   signal XLXN_27    : std_logic;
   component anode_clock_MUSER_lab4_seven_segment_display
      port ( anode      : out   std_logic_vector (3 downto 0); 
             clk        : in    std_logic; 
             pushbutton : in    std_logic);
   end component;
   
   component cathode_selector_MUSER_lab4_seven_segment_display
      port ( cathode : out   std_logic_vector (6 downto 0); 
             x0      : in    std_logic; 
             x1      : in    std_logic; 
             x2      : in    std_logic; 
             x3      : in    std_logic);
   end component;
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component select4_MUSER_lab4_seven_segment_display
      port ( b     : in    std_logic_vector (15 downto 0); 
             anode : in    std_logic_vector (3 downto 0); 
             out0  : out   std_logic; 
             out1  : out   std_logic; 
             out2  : out   std_logic; 
             out3  : out   std_logic);
   end component;
   
begin
   XLXI_3 : anode_clock_MUSER_lab4_seven_segment_display
      port map (clk=>clk,
                pushbutton=>pushbutton,
                anode(3 downto 0)=>a(3 downto 0));
   
   XLXI_4 : cathode_selector_MUSER_lab4_seven_segment_display
      port map (x0=>XLXN_24,
                x1=>XLXN_25,
                x2=>XLXN_26,
                x3=>XLXN_27,
                cathode(6 downto 0)=>cathode(6 downto 0));
   
   XLXI_5 : INV
      port map (I=>a(0),
                O=>anode(0));
   
   XLXI_6 : INV
      port map (I=>a(1),
                O=>anode(1));
   
   XLXI_7 : INV
      port map (I=>a(2),
                O=>anode(2));
   
   XLXI_8 : INV
      port map (I=>a(3),
                O=>anode(3));
   
   XLXI_10 : select4_MUSER_lab4_seven_segment_display
      port map (anode(3 downto 0)=>a(3 downto 0),
                b(15 downto 0)=>b(15 downto 0),
                out0=>XLXN_24,
                out1=>XLXN_25,
                out2=>XLXN_26,
                out3=>XLXN_27);
   
end BEHAVIORAL;