#ifndef __T_MTime_H
#define __T_MTime_H

#include <string>

#include "types/types.h"


namespace mtime
{
	class TimeInterval;
	class DayTimeInterval;
};

namespace mtime
{
	// ���������� ����� ����������, ��������� � ������� ������� ������� (��� Windows) ���
	// � �������������� ���������� ������� � Linux.
	uint32_t  clockGetTime();

	// ���������� ����� �����������, ��������� � ������� �������������� ���������� �������.
	uint64_t  clockGetTimeEx(); 

};

#endif //__T_MTime_H
