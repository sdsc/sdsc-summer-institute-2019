      program fusion
      implicit none

C     Fortran code to illustrate the impact of loop nesting order on the
C     performance of a 2D matrix addition.

      character(len=32) :: arg
      integer i, j, n
      integer clock1, clock2
      double precision, allocatable :: w(:), x(:), y (:), z(:)
      double precision elapsed_time, time

C     Get the array rank from command line
      call get_command_argument(1, arg)
      read(arg,*) n

C     Allocate arrays for arguments and result
      allocate(w(n*n), x(n*n), y(n*n), z(n*n))

C     Initialize the arrays x and y
      do i=1,n*n
         x(i) = i*1.1 + 1.0
         y(i) = i*3.3 + 2.0
      enddo


C     ---------- Guts of code start here --------
      call system_clock(clock1)
      do i=1,n*n
         z(i) = x(i) * y(i)
      enddo

      do i=1,n*n
         w(i) = z(i) + x(i) + y(i)
      enddo
      call system_clock(clock2)
      time = elapsed_time(clock1, clock2)
      write(*,*) 'n    = ', n
      write(*,*) 'time = ', time
C     ---------- Guts of code end here --------

      write(*,*), 'Sum(w) = ', sum(w)

      end program fusion

C     -------------------------------------------------------------------

      double precision function elapsed_time(c1, c2)
      implicit none

C     Return the elapsed time bewteen the clock counts c1 and
C     c2. Although c2 corresponds to a later time than c1, we need to
C     explicitly test for the possibility that the system clock had
C     rolled over.

      integer, intent(in) :: c1, c2
      integer ticks, clockrate, clockmax

      call system_clock(count_max=clockmax, count_rate=clockrate)

      ticks = c2-c1
      if(ticks < 0) then
         ticks = clockmax + ticks
      endif
      elapsed_time = dble(ticks)/dble(clockrate)

      return
      end function elapsed_time
