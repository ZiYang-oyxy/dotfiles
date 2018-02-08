
struct debug_count {
	long long t1;
	long long t2;
	long tdiff;
	long tmax;
	long tmin;
	long ttot;
	int cnt;
};

static struct debug_count lcore_dbg[4];
#define DBG lcore_dbg[lcore_id]



DBG.t1 = rte_rdtsc();

// do something

DBG.t2 = rte_rdtsc();
DBG.tdiff = DBG.t2 - DBG.t1;
DBG.ttot += DBG.tdiff;
DBG.cnt++;

if (DBG.tmax == 0) {
	DBG.tmax = DBG.tmin = DBG.tdiff;
} else {
	if (DBG.tdiff > DBG.tmax) {
		DBG.tmax = DBG.tdiff;
	}
	if (DBG.tdiff < DBG.tmin) {
		DBG.tmin = DBG.tdiff;
	}
}

if (DBG.cnt % 1000 == 0) {
	printf("#%d cnt=%d ttot=%ld tmax=%ld tmin=%ld\n",
			lcore_id, DBG.cnt, DBG.ttot, DBG.tmax, DBG.tmin);
	DBG.ttot = 0;
	DBG.cnt = 0;
	DBG.tmax = 0;
	DBG.tmin = 0;
}
