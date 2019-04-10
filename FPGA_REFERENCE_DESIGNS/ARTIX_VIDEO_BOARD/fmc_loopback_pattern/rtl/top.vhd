library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.AND_REDUCE;

library unisim;
use unisim.vcomponents.all;

entity top is
    port (        
       SYSCLK         : in  std_ulogic;
       SET_VADJ       : out std_ulogic_vector(1 downto 0);
       VADJ_EN        : out std_ulogic;
       -- SWITCHES AND BUTTONS
       SW0            : in std_ulogic;
       BTNC           : in std_ulogic;
       -- FMC_CLK
       CLK0_M2C_P     : out std_ulogic;
       CLK0_M2C_N     : out std_ulogic;
       CLK1_M2C_P     : in  std_ulogic;
       CLK1_M2C_N     : in  std_ulogic;
       -- FMC_LA
       LA_00_P        : in  std_ulogic;
       LA_00_N        : in  std_ulogic;
       LA_01_P        : out std_ulogic;
       LA_01_N        : out std_ulogic;
       LA_02_P        : out std_ulogic;
       LA_02_N        : out std_ulogic;
       LA_03_P        : in  std_ulogic;
       LA_03_N        : in  std_ulogic;
       LA_04_P        : out std_ulogic;
       LA_04_N        : out std_ulogic;
       LA_05_P        : out std_ulogic;
       LA_05_N        : out std_ulogic;
       LA_06_P        : in  std_ulogic;
       LA_06_N        : in  std_ulogic;
       LA_07_P        : out std_ulogic;
       LA_07_N        : out std_ulogic;
       LA_08_P        : in  std_ulogic;
       LA_08_N        : in  std_ulogic;
       LA_09_P        : out std_ulogic;
       LA_09_N        : out std_ulogic;
       LA_10_P        : in  std_ulogic;
       LA_10_N        : in  std_ulogic;
       LA_11_P        : out std_ulogic;
       LA_11_N        : out std_ulogic;
       LA_12_P        : in  std_ulogic;
       LA_12_N        : in  std_ulogic;
       LA_13_P        : out std_ulogic;
       LA_13_N        : out std_ulogic;
       LA_14_P        : in  std_ulogic;
       LA_14_N        : in  std_ulogic;
       LA_15_P        : out std_ulogic;
       LA_15_N        : out std_ulogic;
       LA_16_P        : in  std_ulogic;
       LA_16_N        : in  std_ulogic;
       LA_17_P        : out std_ulogic;
       LA_17_N        : out std_ulogic;
       LA_18_P        : out std_ulogic;
       LA_18_N        : out std_ulogic;
       LA_19_P        : out std_ulogic;
       LA_19_N        : out std_ulogic;
       LA_20_P        : in  std_ulogic;
       LA_20_N        : in  std_ulogic;
       LA_21_P        : out std_ulogic;
       LA_21_N        : out std_ulogic;
       LA_22_P        : in  std_ulogic;
       LA_22_N        : in  std_ulogic;
       LA_23_P        : in  std_ulogic;
       LA_23_N        : in  std_ulogic;
       LA_24_P        : out std_ulogic;
       LA_24_N        : out std_ulogic;
       LA_25_P        : in  std_ulogic;
       LA_25_N        : in  std_ulogic;
       LA_26_P        : out std_ulogic;
       LA_26_N        : out std_ulogic;
       LA_27_P        : in  std_ulogic;
       LA_27_N        : in  std_ulogic;
       LA_28_P        : out std_ulogic;
       LA_28_N        : out std_ulogic;
       LA_29_P        : in  std_ulogic;
       LA_29_N        : in  std_ulogic;
       LA_30_P        : out std_ulogic;
       LA_30_N        : out std_ulogic;
       LA_31_P        : in  std_ulogic;
       LA_31_N        : in  std_ulogic;
       LA_32_P        : out std_ulogic;
       LA_32_N        : out std_ulogic;
       LA_33_P        : in  std_ulogic;
       LA_33_N        : in  std_ulogic;
       LED            : out std_ulogic_vector(7 downto 0)
    );
end entity top;

architecture rtl of top is

   COMPONENT ila_0
   PORT (
      clk    : IN STD_LOGIC;
      probe0 : IN STD_LOGIC_VECTOR(33 DOWNTO 0); 
      probe1 : IN STD_LOGIC_VECTOR(33 DOWNTO 0)
   );
   END COMPONENT;

   signal clk            : std_ulogic; -- system clock 100 MHz
   
   signal outvector_q    : std_ulogic_vector(33 downto 0) := (others=>'0'); -- register for output pins
   signal invector       : std_ulogic_vector(33 downto 0);                  -- combines input pins to signal
   signal invector_q     : std_ulogic_vector(33 downto 0) := (others=>'0'); -- register for input signal

   signal btnc_q         : std_ulogic := '0'; -- input register for button
   signal btnc_pressed   : std_ulogic := '0'; -- register for debouncing button
   signal sw0_q          : std_ulogic := '0'; -- input register for switch

   signal pattern_state  : unsigned( 2 downto 0)          := to_unsigned(0,3);         -- pattern number to select output
   signal pattern_q      : std_ulogic_vector(33 downto 0) := (others=>'0');            -- pattern register for output pins
   signal state_count    : unsigned(31 downto 0)          := to_unsigned(0,32);        -- counter to delay states
   signal state_delay    : unsigned(31 downto 0)          := to_unsigned(12500000,32); -- 125ms @ 100 MHz
   signal led_q          : std_ulogic_vector(7 downto 0)  := (others=>'0');            -- LED output register

begin
         
   LA_01_P   <= outvector_q(0); --   : out std_ulogic;
   LA_01_N   <= outvector_q(1); --   : out std_ulogic; 
   LA_18_P   <= outvector_q(0); --   : out std_ulogic;
   LA_18_N   <= outvector_q(1); --   : out std_ulogic;

   CLK0_M2C_P   <= outvector_q(0); --   : out std_ulogic;
   CLK0_M2C_N   <= outvector_q(1); --   : out std_ulogic;
   invector(0)  <= CLK1_M2C_P;     --   : in  std_ulogic;
   invector(1)  <= CLK1_M2C_N;     --   : in  std_ulogic;

   LA_02_P      <= outvector_q(2); --   : out std_ulogic;
   LA_02_N      <= outvector_q(3); --   : out std_ulogic;
   invector(2)  <= LA_00_P;        --   : in  std_ulogic;
   invector(3)  <= LA_00_N;        --   : in  std_ulogic;

   LA_04_P     <= outvector_q(4); --   : out std_ulogic;
   LA_04_N     <= outvector_q(5); --   : out std_ulogic;
   invector(4) <= LA_03_P;        --   : in  std_ulogic;
   invector(5) <= LA_03_N;        --   : in  std_ulogic;

   LA_05_P     <= outvector_q(6); --   : out std_ulogic;
   LA_05_N     <= outvector_q(7); --   : out std_ulogic;
   invector(6) <= LA_06_P;        --   : in  std_ulogic;
   invector(7) <= LA_06_N;        --   : in  std_ulogic;


   LA_07_P     <= outvector_q(8); --   : out std_ulogic;
   LA_07_N     <= outvector_q(9); --   : out std_ulogic;
   invector(8) <= LA_08_P;        --   : in  std_ulogic;
   invector(9) <= LA_08_N;        --   : in  std_ulogic;

   LA_09_P      <= outvector_q(10); --   : out std_ulogic;
   LA_09_N      <= outvector_q(11); --   : out std_ulogic;
   invector(10) <= LA_10_P;         --   : in  std_ulogic;
   invector(11) <= LA_10_N;         --   : in  std_ulogic;

   LA_11_P      <= outvector_q(12); --   : out std_ulogic;
   LA_11_N      <= outvector_q(13); --   : out std_ulogic;
   invector(12) <= LA_12_P;         --   : in  std_ulogic;
   invector(13) <= LA_12_N;         --   : in  std_ulogic;

   LA_13_P      <= outvector_q(14);  --   : out std_ulogic;
   LA_13_N      <= outvector_q(15);  --   : out std_ulogic;
   invector(14) <= LA_14_P;          --   : in  std_ulogic;
   invector(15) <= LA_14_N;          --   : in  std_ulogic;

   LA_15_P      <= outvector_q(16); --   : out std_ulogic;
   LA_15_N      <= outvector_q(17); --   : out std_ulogic;
   invector(16) <= LA_16_P;         --   : in  std_ulogic;
   invector(17) <= LA_16_N;         --   : in  std_ulogic;

   LA_17_P      <= outvector_q(18); --   : out std_ulogic;
   LA_17_N      <= outvector_q(19); --   : out std_ulogic;
   invector(18) <= LA_23_P;         --   : in  std_ulogic;
   invector(19) <= LA_23_N;         --   : in  std_ulogic;

   LA_19_P      <= outvector_q(20); --   : out std_ulogic;
   LA_19_N      <= outvector_q(21); --   : out std_ulogic;
   invector(20) <= LA_20_P;         --   : in  std_ulogic;
   invector(21) <= LA_20_N;         --   : in  std_ulogic;

   LA_21_P      <= outvector_q(22); --   : out std_ulogic;
   LA_21_N      <= outvector_q(23); --   : out std_ulogic;
   invector(22) <= LA_22_P;         --   : in  std_ulogic;
   invector(23) <= LA_22_N;         --   : in  std_ulogic;

   LA_24_P      <= outvector_q(24); --   : out std_ulogic;
   LA_24_N      <= outvector_q(25); --   : out std_ulogic;
   invector(24) <= LA_25_P;         --   : in  std_ulogic;
   invector(25) <= LA_25_N;         --   : in  std_ulogic;

   LA_26_P      <= outvector_q(26); --   : out std_ulogic;
   LA_26_N      <= outvector_q(27); --   : out std_ulogic;
   invector(26) <= LA_27_P;         --   : in  std_ulogic;
   invector(27) <= LA_27_N;         --   : in  std_ulogic;

   LA_28_P      <= outvector_q(28); --   : out std_ulogic;
   LA_28_N      <= outvector_q(29); --   : out std_ulogic;
   invector(28) <= LA_29_P;         --   : in  std_ulogic;
   invector(29) <= LA_29_N;         --   : in  std_ulogic;

   LA_30_P      <= outvector_q(30); --   : out std_ulogic;
   LA_30_N      <= outvector_q(31); --   : out std_ulogic;
   invector(30) <= LA_31_P;         --   : in  std_ulogic;
   invector(31) <= LA_31_N;         --   : in  std_ulogic;

   LA_32_P      <= outvector_q(32); --   : out std_ulogic;
   LA_32_N      <= outvector_q(33); --   : out std_ulogic;
   invector(32) <= LA_33_P;         --   : in  std_ulogic;
   invector(33) <= LA_33_N;         --   : in  std_ulogic;
	   
   -- 00 (default) 	1.2 V
   -- 01 	1.8 V
   -- 10 	2.5 V
   -- 11 	3.3 V 
   SET_VADJ(1) <= '1';
   SET_VADJ(0) <= '1';
   VADJ_EN     <= '1'; --enabling the regulator 

   LED <= led_q;

   clk_buf : IBUFG
   port map (
       O   => clk,
       I   => SYSCLK
   );

   buffer_input_output : process(clk)   
   begin
      if(clk'event and clk='1') then   
         if  (sw0_q = '1') then
            outvector_q <= (others=>'1');
         else
            if (btnc_pressed = '0') then
               outvector_q <= (others=>'0');
            else
               outvector_q <= pattern_q;
            end if;
         end if;
         invector_q <= invector;
         btnc_q     <= BTNC;
         sw0_q      <= SW0;
      end if;
   end process;

   pattern_fsm : process(clk)   
   variable state_num : natural;
   begin
      if(clk'event and clk='1') then        
         -- each pattern will be checked when counter state_count reaches limit (=state_delay)         
         if (state_count = to_unsigned(0,state_count'length)) then
            if(btnc_q = '1' AND sw0_q='0') then
               -- start counter and debounce button
               state_count  <= state_count + 1;  
               btnc_pressed <= '1';             
            else
               -- no button action, idle state
               btnc_pressed  <= '0';
               pattern_state <= to_unsigned(0,pattern_state'length);
            end if;            
         else
            if (state_count = state_delay) then
               -- max is reached, hold counter
               state_count <= to_unsigned(0,state_count'length);
               -- check pattern in and put
               if (invector_q = outvector_q) then
                  -- pattern received, go to next pattern
                  pattern_state <= pattern_state + 1;
               end if;
            else
               -- count up to delay states
               state_count <= state_count + 1;
            end if;
         end if;

         -- state outputs
         state_num := to_integer(pattern_state);
         case state_num is
            when      0 => pattern_q <= b"00_0000_0000_0000_0000_0000_0000_0000_0000";                           
                           if (btnc_pressed = '1') then
                              led_q     <= b"0000_0001";                     -- running leds for different patterns
                           else
                              led_q     <= (others=>and_reduce(invector_q)); -- all leds on if invector_q is all 1 
                           end if;
            when      1 => pattern_q <= b"11_1111_1111_1111_1111_1111_1111_1111_1111";
                           led_q     <= b"0000_0010";
            when      2 => pattern_q <= b"01_0101_0101_0101_0101_0101_0101_0101_0101";
                           led_q     <= b"0000_0100";
            when      3 => pattern_q <= b"10_1010_1010_1010_1010_1010_1010_1010_1010";
                           led_q     <= b"0000_1000";
            when      4 => pattern_q <= b"11_0011_0011_0011_0011_0011_0011_0011_0011";
                           led_q     <= b"0001_0000";
            when      5 => pattern_q <= b"00_1100_1100_1100_1100_1100_1100_1100_1100";
                           led_q     <= b"0010_0000";
            when      6 => pattern_q <= b"11_1100_0011_1100_0011_1100_0011_1100_0011";
                           led_q     <= b"0100_0000";
            when      7 => pattern_q <= b"00_0011_1100_0011_1100_0011_1100_0011_1100";
                           led_q     <= b"1000_0000";
            when others => pattern_q <= b"00_0000_0000_0000_0000_0000_0000_0000_0000";
                           led_q     <= b"0000_0001";
         end case;
      end if;
   end process;

   ila_debugger : ila_0
   PORT MAP (
      clk       => clk,
	   probe0    => std_logic_vector(outvector_q), 
	   probe1    => std_logic_vector(invector_q)
   );

end architecture rtl;
