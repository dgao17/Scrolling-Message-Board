----------------------------------------------------------------------------------
-- Company: University at Buffalo
-- Engineer: Dee Gao
-- 
-- Create Date: 05/03/2020 07:10:16 PM
-- Design Name: 
-- Module Name: message_board - Behavioral
-- Project Name: CSE490 Project 2
-- Target Devices: Basys 3
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity message_board is
    port (  
            clk                 : in STD_LOGIC;                                                             -- system clock                                                                                                                   
            seg                 : out STD_LOGIC_VECTOR(6 downto 0);                                         -- ssd cathodes
            an                  : out STD_LOGIC_VECTOR(3 downto 0);                                         -- ssd anodes
            btnL, btnR          : in STD_LOGIC; 
            btnU,btnD           : in STD_LOGIC;                                                             -- push buttons
            btnC                : in STD_LOGIC
         );
end message_board;

architecture message_board of message_board is
constant msg_len        : integer := 8;
constant msg            : string (msg_len downto 1) := "boop    ";
constant msg2           : string (msg_len downto 1) := "poob    ";
signal char             : character;
signal displayed_msg    : string(msg_len downto 1) := msg;                                                  -- 4-letter msg that gets displayed on the SSD                                                                                                          
signal msg_counter      : integer := 8;  

-- signal shift1           : string (8 downto 1); 

signal one_sec_counter  : std_logic_vector(27 downto 0);
signal one_sec_enable   : std_logic;

signal speed            : std_logic_vector(27 downto 0) := x"5F5E0FF";                                          -- original speed
constant fast_speed     : std_logic_vector(27 downto 0) := x"47868BD";                                          -- (original speed / 4) * 3      
constant slow_speed     : std_logic_vector(27 downto 0) := x"BEBC1FE";                                          -- original speed * 2
-- signal speed_counter    : std_logic_vector(31 downto 0) := (others => '0');                                  -- counter for the speed; initialized to 0 first 

signal ssd              : std_logic_vector(6 downto 0);
signal anode_counter    : std_logic_vector(1 downto 0);                                                     -- 2 bit counter for turning on each anode
signal refresh_counter  : std_logic_vector(24 downto 0);                                                    -- refresh rate counter

signal button_pressed  : std_logic_vector(1 downto 0);
begin

-- process to establish the refresh rate of 10.5ms 
process(clk)
begin
    if(rising_edge(clk)) then
        refresh_counter <= refresh_counter + 1;
     end if;
 end process;
 
-- update the 2-bit anode counter to activate each anode 
anode_counter <= refresh_counter (18 downto 17); 

-- assign each char to its respective ssd pattern based on the siekoo alphabet 
process(char)
begin
    case char is        
        when '0' => ssd <= "1000000";     -- 0
        when '1' => ssd <= "1111001";     -- 1
        when '2' => ssd <= "0100100";     -- 2
        when '3' => ssd <= "0110000";     -- 3
        when '4' => ssd <= "0011001";     -- 4
        when '5' => ssd <= "0010010";     -- 5
        when '6' => ssd <= "0000010";     -- 6
        when '7' => ssd <= "1111000";     -- 7
        when '8' => ssd <= "0000000";     -- 8
        when '9' => ssd <= "0010000";     -- 9

        -- letters A to Z
        when 'a' => ssd <= "0100000";    -- a
        when 'b' => ssd <= "0000011";    -- b
        when 'c' => ssd <= "0100111";    -- c
        when 'd' => ssd <= "0100001";    -- d
        when 'e' => ssd <= "0000110";    -- e
        when 'f' => ssd <= "0001110";    -- f
        when 'g' => ssd <= "1000010";    -- g
        when 'h' => ssd <= "0001011";    -- h
        when 'i' => ssd <= "1101110";    -- i
        when 'j' => ssd <= "0110010";    -- j
        when 'k' => ssd <= "0001010";    -- k
        when 'l' => ssd <= "1000111";    -- l
        when 'm' => ssd <= "0101010";    -- m
        when 'n' => ssd <= "0101011";    -- n
        when 'o' => ssd <= "0100011";    -- o
        when 'p' => ssd <= "0001100";    -- p
        when 'q' => ssd <= "0011000";    -- q
        when 'r' => ssd <= "0101111";    -- r
        when 's' => ssd <= "1010001";    -- s
        when 't' => ssd <= "0000111";    -- t
        when 'u' => ssd <= "1100011";    -- u
        when 'v' => ssd <= "1010101";    -- v
        when 'w' => ssd <= "0010101";    -- w
        when 'x' => ssd <= "1101011";    -- x
        when 'y' => ssd <= "0010001";    -- y
        when 'z' => ssd <= "1100100";    -- z
        when others => ssd <= "1111111"; -- blank
    end case;
end process;
 
-- process for going to the previous/next message when the up/down buttons are pressed
-- process for changing the speed when pressing the left/right buttons 
process
variable down_button_pressed  : std_logic;                                                       
variable up_button_pressed    : std_logic;
variable left_button_pressed  : std_logic;
variable right_button_pressed : std_logic;

begin
    if rising_edge(btnD) then
       down_button_pressed := '1';
    end if;
    
    if rising_edge(btnU) then
        up_button_pressed := '1';
    end if;
    
    if down_button_pressed = '1' then
        displayed_msg <= msg2;
        down_button_pressed := '0';
    end if;
    
    if up_button_pressed = '1' then
        displayed_msg <= msg;
        up_button_pressed := '0';
    end if;

    if rising_edge(btnL) then
        left_button_pressed := '1';
    end if;
    
    if rising_edge(btnR) then
        right_button_pressed := '1';
    end if;
    
    if left_button_pressed = '1' then
        speed <= slow_speed;
        left_button_pressed := '0';
    end if;
    
    if right_button_pressed = '1' then
        speed <= fast_speed;
        right_button_pressed := '0';
    end if;
end process;

-- process for generating speed to scroll the messages 
process(clk)
begin
    if rising_edge(clk) then
            if one_sec_counter >= speed then
                one_sec_counter <= (others => '0');
            else
                one_sec_counter <= one_sec_counter + 1;
            end if;
        end if;
end process;

one_sec_enable <= '1' when one_sec_counter = speed else '0';

-- process for the message counter to shift each letter over for the scrolling effect 
process(clk)
begin
    if msg_counter = 0 then
        msg_counter <= msg_len;
    end if;
    
    if rising_edge(clk) then
        if one_sec_enable = '1' then
            msg_counter <= msg_counter - 1;
        end if;
    end if;
end process;

-- activate each anode depending on the value of the counter  
process(anode_counter)  
begin
    case anode_counter is
        when "00" => an <= "1110";
            char <= displayed_msg(msg_counter);                                    -- assign char to the first letter
            seg <= ssd;                                                            -- assign the correct led pattern to seg to be displayed      
        when "01" => an <= "1101";
            char <= displayed_msg(msg_counter - 1);
            seg <=ssd;                
        when "10" => an <= "1011";
            char <= displayed_msg(msg_counter - 2);   
            seg <= ssd;                   
        when "11" => an <= "0111";
            char <= displayed_msg(msg_counter - 3);
            seg <= ssd;          
        when others => an <= "1111";
    end case;
end process;

end message_board;
