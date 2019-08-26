
#ifndef _TERMINATABLE_THREAD_H
#define _TERMINATABLE_THREAD_H

class  Terminatable
{
public:
	virtual ~Terminatable();

	virtual void terminate() = 0;
};

class  TerminatableThread: public Terminatable
{
public:
	//! ����� �������� ������� ����� ���������� ������� run(thread) �� ������� ������������� �����
	TerminatableThread();
	//! ���������� ���������� ��������� ������ ����� � ���������� ������
	virtual ~TerminatableThread(); 

	//! ������ ������� �����. ������ ���� ������� ��������������� ����� �������� �������.
	static void run( TerminatableThread* const );

	void join();
    


protected:
	//! ������� ������� �����. ������ ���� ����������� � ��������.
	virtual void thread_main() = 0;

private:
	TerminatableThread( const TerminatableThread& );
	TerminatableThread& operator=( const TerminatableThread& );

	friend void threadProc( TerminatableThread* const ptr );
	void* const m_impl;
};

#endif //_TERMINATABLE_THREAD_H
