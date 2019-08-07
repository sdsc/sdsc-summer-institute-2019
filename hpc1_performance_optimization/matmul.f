      program blocking
      implicit none

C     Fortran code to illustrate effects of blocking for addition of matrix to
C     transpose of a matrix
C     
C     Z = X + YT
C     
C     Usage: blocking n
C            n = array dimension

      character(len=32) :: arg
      integer i, j, k, ii, jj, kk, tile, n
      integer clock1, clock2
      double precision, allocatable :: x(:,:), y (:,:), z(:,:)
      double precision elapsed_time, time

C     Get the array rank from command line
      call get_command_argument(1, arg)
      read(arg,*) n

C     Allocate arrays for arguments and result
      allocate(x(n,n), y(n,n), z(n,n))

C     Initialize the arrays x, y and z
      do j=1,n
         do i=1,n
            x(i,j) = i*1.1 + j*2.2
            y(i,j) = i*3.3 + j*4.4
            z(i,j) = 0.0
         enddo
      enddo

C     Matrix multiplication
      call system_clock(clock1)
      do j=1,n
         do k=1,n
            do i=1,n
               z(i,j) = z(i,j) + x(i,k) * y(k,j)
            enddo
         enddo
      enddo
      call system_clock(clock2)
      time = elapsed_time(clock1, clock2)
      
C     Add arrays X and YT using tiling
c      call system_clock(clock1)
c      tile = 128
c      do jj=1,n,tile
c         do kk=1,n,tile
c            do ii=1,n,tile
c               do j=jj,min(n, jj+tile-1)
c                  do k=kk,min(n, kk+tile-1)
c                     do i=ii,min(n, ii+tile-1)
c                        z(i,j) = z(i,j) + x(i,k) * y(k,j)
c                     enddo
c                  enddo
c               enddo
c            enddo
c         enddo
c      enddo
c      call system_clock(clock2)
c      time = elapsed_time(clock1, clock2)


C     Following code prevents compiler from optimizing away matrix
C     addition operation. Leaves open the possibility that the results
C     will be used
      if (z(1,1) == -1.0) then
         open (3,file="z.out",form="unformatted",access="sequential")
         write(3) z
      endif

      write(*,*) 'n    = ', n
      write(*,*) 'time = ', time

      end program blocking

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
