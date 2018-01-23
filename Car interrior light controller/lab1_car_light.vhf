--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : lab1_car_light.vhf
-- /___/   /\     Timestamp : 07/28/2017 15:33:56
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family artix7 -flat -suppress -vhdl /home/dual/cs5160615/lab1_car_light/lab1_car_light.vhf -w /home/dual/cs5160615/lab1_car_light/lab1_car_light.sch
--Design Name: lab1_car_light
--Device: artix7
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity lab1_car_light is
   port ( D1      : in    std_logic; 
          D2      : in    std_logic; 
          D3      : in    std_logic; 
          D4      : in    std_logic; 
          SW_DOOR : in    std_logic; 
          SW_OFF  : in    std_logic; 
          SW_ON   : in    std_logic; 
          INVALID : out   std_logic; 
          LIGHT   : out   std_logic);
end lab1_car_light;

architecture BEHAVIORAL of lab1_car_light is
   attribute BOX_TYPE   : string ;
   signal FGK     : std_logic;
   signal XLXN_4  : std_logic;
   signal XLXN_6  : std_logic;
   signal XLXN_9  : std_logic;
   signal XLXN_11 : std_logic;
   signal XLXN_14 : std_logic;
   signal XLXN_15 : std_logic;
   signal XLXN_16 : std_logic;
   signal XLXN_18 : std_logic;
   signal XLXN_19 : std_logic;
   signal XLXN_23 : std_logic;
   signal XLXN_26 : std_logic;
   component OR4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR4 : component is "BLACK_BOX";
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component OR2L
      port ( O   : out   std_logic; 
             SRI : in    std_logic; 
             DI  : in    std_logic);
   end component;
   attribute BOX_TYPE of OR2L : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component OR3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR3 : component is "BLACK_BOX";
   
   component XOR3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of XOR3 : component is "BLACK_BOX";
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
begin
   XLXI_1 : OR4
      port map (I0=>D4,
                I1=>D3,
                I2=>D2,
                I3=>D1,
                O=>XLXN_4);
   
   XLXI_2 : AND2
      port map (I0=>SW_DOOR,
                I1=>XLXN_4,
                O=>XLXN_6);
   
   XLXI_3 : OR2L
      port map (DI=>XLXN_6,
                SRI=>SW_ON,
                O=>XLXN_9);
   
   XLXI_5 : AND2
      port map (I0=>XLXN_11,
                I1=>XLXN_9,
                O=>XLXN_19);
   
   XLXI_7 : INV
      port map (I=>SW_OFF,
                O=>XLXN_11);
   
   XLXI_8 : AND2
      port map (I0=>SW_ON,
                I1=>SW_OFF,
                O=>XLXN_14);
   
   XLXI_9 : AND2
      port map (I0=>SW_DOOR,
                I1=>SW_ON,
                O=>XLXN_15);
   
   XLXI_10 : AND2
      port map (I0=>SW_OFF,
                I1=>SW_DOOR,
                O=>XLXN_16);
   
   XLXI_11 : OR3
      port map (I0=>XLXN_16,
                I1=>XLXN_15,
                I2=>XLXN_14,
                O=>FGK);
   
   XLXI_12 : INV
      port map (I=>FGK,
                O=>XLXN_18);
   
   XLXI_14 : AND2
      port map (I0=>XLXN_18,
                I1=>XLXN_19,
                O=>LIGHT);
   
   XLXI_15 : XOR3
      port map (I0=>SW_DOOR,
                I1=>SW_ON,
                I2=>SW_OFF,
                O=>XLXN_26);
   
   XLXI_21 : INV
      port map (I=>XLXN_26,
                O=>XLXN_23);
   
   XLXI_22 : OR2
      port map (I0=>XLXN_23,
                I1=>FGK,
                O=>INVALID);
   
end BEHAVIORAL;


