      program example
        implicit none
        integer n
        open(10, file='test.txt', status='old')
        read(10, *) n
        close(10)
        print *, 'The number in the test.txt is :', n
      end
