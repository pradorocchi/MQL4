//--------------------------------------------------------------------
// Errors.mqh
// ������������ ��� ������������� � �������� ������� � �������� MQL4.
//--------------------------------------------------------------- 1 --
// ������� ��������� ������.
// ������������ ��������:
// true  - ���� ������ ����������� (�.�. ����� ���������� ������)
// false - ���� ������ ����������� (�.�. ��������� ������)
//--------------------------------------------------------------- 2 --
bool Errors(int Error)                    // ���������������� �������
  {
   // Error             // ����� ������   
   if(Error==0)
      return(false);                      // ��� ������
   Inform(15,Error);                      // ���������
//--------------------------------------------------------------- 3 --
   switch(Error)
     {   // ����������� ������:
      case 129:         // ������������ ����
      case 135:         // ���� ����������
         RefreshRates();                  // ������� ������
         return(true);                    // ������ �����������
      case 136:         // ��� ���. ��� ����� ���.
         while(RefreshRates()==false)     // �� ������ ����
            Sleep(1);                     // �������� � �����
         return(true);                    // ������ �����������
      case 146:         // ���������� �������� ������
         Sleep(500);                      // ������� �������
         RefreshRates();                  // ������� ������
         return(true);                    // ������ �����������
         // ����������� ������:
      case 2 :          // ����� ������
      case 5 :          // ������ ������ ����������� ���������
      case 64:          // ���� ������������
      case 133:         // �������� ���������
      default:          // ������ ��������
         return(false);                   // ����������� ������
     }
//--------------------------------------------------------------- 4 --
  }
//--------------------------------------------------------------------