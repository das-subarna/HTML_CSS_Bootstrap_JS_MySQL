use irctc;

select trainname as 'Train',source as 'Originating Station',destination as 'Final Station' from train
where trainno in( 
	select distinct(t.trainno) from schedule t, schedule s
		where t.trainno = s.trainno
		and t.station="new delhi"
		and s.station="sealdah");