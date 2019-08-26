/***********************************************************************
*	File: system/condvar_linux.cpp
*	Author: Andrey Kolesnikov
*	Date: 28 dec 2005
***********************************************************************/

/*
$Log: condvar_linux.cpp,v $
Revision 1.4  2007/03/07 10:07:36  andreyk

Fixed GCC compile errors

Revision 1.3  2007/03/07 09:16:30  andreyk
��������� ������� timed_wait ��� �������� � ��������� �� �����������

Revision 1.2  2007/02/02 16:39:23  andreyk
*** empty log message ***

Revision 1.1  2006/04/19 17:00:03  mike
*** empty log message ***

Revision 1.4  2006/03/03 17:19:34  andreyk
� ������� ��������� private ������� ��������� ����������� ����������� � �������� ������������, �� ������� ����������.

Revision 1.3  2006/02/15 12:11:47  andreyk
����������� � ����, ���������� warning ��� ����������

Revision 1.2  2006/02/06 08:40:28  andreyk
� ����� ������ ������������ ��������� ��������� �����.

Revision 1.1  2005/12/28 14:34:34  andreyk

Building project under Linux

*/

#include "../condvar.h"

#include <pthread.h>
#include <time.h>


class ConditionVariableImpl
{

public:
	ConditionVariableImpl()
	{
		pthread_cond_init( &m_cond, NULL );
	}

	~ConditionVariableImpl()
	{
		pthread_cond_destroy( &m_cond );
	}

	void notify_one()
	{
		pthread_cond_signal( &m_cond );
	}

	void notify_all()
	{
		pthread_cond_broadcast( &m_cond );
	}

	void wait( Mutex::ScopedLock* const lock )
	{
		pthread_cond_wait( 
			&m_cond,
			reinterpret_cast<pthread_mutex_t*>( lock->m_mtx->m_mtxImpl ) );
	}


private:
	pthread_cond_t m_cond;

};


ConditionVariable::ConditionVariable()
:
	m_impl( new ConditionVariableImpl() )
{
}

ConditionVariable::~ConditionVariable()
{
	delete reinterpret_cast<ConditionVariableImpl*>(m_impl);
}

void ConditionVariable::notify_one() 
{
	reinterpret_cast<ConditionVariableImpl*>(m_impl)->notify_one();
}

void ConditionVariable::notify_all()
{
	reinterpret_cast<ConditionVariableImpl*>(m_impl)->notify_all();
}

void ConditionVariable::wait( Mutex::ScopedLock* const lock )
{
	reinterpret_cast<ConditionVariableImpl*>(m_impl)->wait( lock );
}

