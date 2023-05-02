

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Shifter_Unit is
--  Port ( );
GENERIC (
      n       : positive := 32);
   PORT( 
      A       : IN     std_logic_vector (n-1 DOWNTO 0);
      SHAMT   : IN     std_logic_vector (4 DOWNTO 0);
      C_op    : IN     std_logic_vector (1 DOWNTO 0);
      R       : OUT    std_logic_vector (n-1 DOWNTO 0)
   );
end Shifter_Unit;

architecture Behavioral of Shifter_Unit is
    constant bits : positive := 32;
    signal lsl0, lsl1, lsl2, lsl3, lsl4 : std_logic_vector(n-1 downto 0);
    signal sr0, sr1, sr2, sr3, sr4 : std_logic_vector(n-1 downto 0);
    signal asr0, asr1, asr2, asr3, asr4 : std_logic_vector(n-1 downto 0);
    signal Fill : std_logic_vector(n-1 downto 0);
    
    
begin
    -- Logic Shift Left
    lsl0 <= A(30 downto 0) & '0' when SHAMT(0) = '1' else A;
    lsl1 <= (lsl0(n-3 downto 0) & "00") when (SHAMT(1) = '1') else lsl0;
    lsl2 <= (lsl1(n-5 downto 0) & "0000") when SHAMT(2) = '1' else lsl1;
    lsl3 <= lsl2(n-9 downto 0) & "00000000" when SHAMT(3) = '1' else lsl2;
    lsl4 <= lsl3(n-17 downto 0) & "0000000000000000" when SHAMT(4) = '1' else lsl3;
    
    --Shift Right
    Fill <= (others => C_op(0) and A(31));
    sr0 <= (Fill(0) & A(31 downto 1)) when SHAMT(0) = '1' else A;
    sr1 <= (Fill(1 downto 0) & sr0(n-1 downto 2)) when SHAMT(1) = '1' else sr0;
    sr2 <= (Fill(3 downto 0) & sr1(n-1 downto 4)) when SHAMT(2) = '1' else sr1;
    sr3 <= (Fill(7 downto 0) & sr2(n-1 downto 8)) when SHAMT(3) = '1' else sr2;
    sr4 <= (Fill(15 downto 0) & sr3(n-1 downto 16)) when SHAMT(4) = '1' else sr3;
    

    --mux 
    with C_op(1) select
        R <= lsl4 when '0',
             sr4 when '1',
             (others => '0') when others;
             
end Behavioral;