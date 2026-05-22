
/* Top module */
module dpll(
    MainClock,
    Rst_n,
    SignalIn, 
    SignalOut
    );
    
    input  SignalIn;                // input signal
    input  MainClock;               // reference signal
    input  Rst_n;
    output SignalOut;               // output
    wire Positive, Negative;      // internal DPLL signals
    wire Lead, Lag;               // internal DPLL signals
    wire InputSignalEdge, OutputSignalEdge;
    wire Lock;
    wire SynchronousSignal;
    wire [15:0] PeriodCount;
    wire [15:0] DividerMaxValue;

    
    parameter DividerMultiple = 1;

    // phase comparator 
    phasecomparator inst_ph_cmp(.MainClock(MainClock), .Rst_n(Rst_n), .InputSignal(SignalIn),
                                .OutputSignal(SignalOut), .Lead(Lead), .Lag(Lag),
                                .InputSignalEdge(InputSignalEdge), .OutputSignalEdge(OutputSignalEdge),
                                .Lock(Lock), .SynchronousSignal(SynchronousSignal),
                                .PeriodCount(PeriodCount)
                                );
    /*
    // "Zero-Reset Random Walk Filter"
    randomwalkfilter inst_zrwf(.MainClock(MainClock), .Lead(Lead), .Lag(Lag),
                               .Positive(Positive), .Negative(Negative)
                               );
    */
    
	//    defparam inst_freqdiv.DividerMaxValue;
    
    // "Variable-Reset Random Walk Filter"
    variableresetrandomwalkfilter inst_zrwf(.MainClock(MainClock), .Lead(Lead), .Lag(Lag),
                               .Positive(Positive), .Negative(Negative)
                               );
    
    // controlled frequency divider
    freqdivider inst_freqdiv(.MainClock(MainClock), .FrequencyOut(SignalOut), .DividerMax(PeriodCount/DividerMultiple),
                               .Positive(Positive), .Negative(Negative), .DividerMaxValue(DividerMaxValue)
                               );
    
        

endmodule
