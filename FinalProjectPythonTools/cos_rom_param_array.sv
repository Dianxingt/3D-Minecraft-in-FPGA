module cos_rom (
    input logic [8:0] angle, // Input angle from 0 to 359
    output int cos_value // Output cos value * 2^16
);

    // Define a parameter array for cos values
    parameter int COS_VALUES [0:359] = '{
        65536,
        65526,
        65496,
        65446,
        65376,
        65286,
        65176,
        65047,
        64898,
        64729,
        64540,
        64331,
        64103,
        63856,
        63589,
        63302,
        62997,
        62672,
        62328,
        61965,
        61583,
        61183,
        60763,
        60326,
        59870,
        59395,
        58903,
        58393,
        57864,
        57319,
        56755,
        56175,
        55577,
        54963,
        54331,
        53683,
        53019,
        52339,
        51643,
        50931,
        50203,
        49460,
        48702,
        47929,
        47142,
        46340,
        45525,
        44695,
        43852,
        42995,
        42125,
        41243,
        40347,
        39440,
        38521,
        37589,
        36647,
        35693,
        34728,
        33753,
        32768,
        31772,
        30767,
        29752,
        28729,
        27696,
        26655,
        25606,
        24550,
        23486,
        22414,
        21336,
        20251,
        19160,
        18064,
        16961,
        15854,
        14742,
        13625,
        12504,
        11380,
        10252,
        9120,
        7986,
        6850,
        5711,
        4571,
        3429,
        2287,
        1143,
        0,
        -1143,
        -2287,
        -3429,
        -4571,
        -5711,
        -6850,
        -7986,
        -9120,
        -10252,
        -11380,
        -12504,
        -13625,
        -14742,
        -15854,
        -16961,
        -18064,
        -19160,
        -20251,
        -21336,
        -22414,
        -23486,
        -24550,
        -25606,
        -26655,
        -27696,
        -28729,
        -29752,
        -30767,
        -31772,
        -32767,
        -33753,
        -34728,
        -35693,
        -36647,
        -37589,
        -38521,
        -39440,
        -40347,
        -41243,
        -42125,
        -42995,
        -43852,
        -44695,
        -45525,
        -46340,
        -47142,
        -47929,
        -48702,
        -49460,
        -50203,
        -50931,
        -51643,
        -52339,
        -53019,
        -53683,
        -54331,
        -54963,
        -55577,
        -56175,
        -56755,
        -57319,
        -57864,
        -58393,
        -58903,
        -59395,
        -59870,
        -60326,
        -60763,
        -61183,
        -61583,
        -61965,
        -62328,
        -62672,
        -62997,
        -63302,
        -63589,
        -63856,
        -64103,
        -64331,
        -64540,
        -64729,
        -64898,
        -65047,
        -65176,
        -65286,
        -65376,
        -65446,
        -65496,
        -65526,
        -65536,
        -65526,
        -65496,
        -65446,
        -65376,
        -65286,
        -65176,
        -65047,
        -64898,
        -64729,
        -64540,
        -64331,
        -64103,
        -63856,
        -63589,
        -63302,
        -62997,
        -62672,
        -62328,
        -61965,
        -61583,
        -61183,
        -60763,
        -60326,
        -59870,
        -59395,
        -58903,
        -58393,
        -57864,
        -57319,
        -56755,
        -56175,
        -55577,
        -54963,
        -54331,
        -53683,
        -53019,
        -52339,
        -51643,
        -50931,
        -50203,
        -49460,
        -48702,
        -47929,
        -47142,
        -46340,
        -45525,
        -44695,
        -43852,
        -42995,
        -42125,
        -41243,
        -40347,
        -39440,
        -38521,
        -37589,
        -36647,
        -35693,
        -34728,
        -33753,
        -32768,
        -31772,
        -30767,
        -29752,
        -28729,
        -27696,
        -26655,
        -25606,
        -24550,
        -23486,
        -22414,
        -21336,
        -20251,
        -19160,
        -18064,
        -16961,
        -15854,
        -14742,
        -13625,
        -12504,
        -11380,
        -10252,
        -9120,
        -7986,
        -6850,
        -5711,
        -4571,
        -3429,
        -2287,
        -1143,
        0,
        1143,
        2287,
        3429,
        4571,
        5711,
        6850,
        7986,
        9120,
        10252,
        11380,
        12504,
        13625,
        14742,
        15854,
        16961,
        18064,
        19160,
        20251,
        21336,
        22414,
        23486,
        24550,
        25606,
        26655,
        27696,
        28729,
        29752,
        30767,
        31772,
        32768,
        33753,
        34728,
        35693,
        36647,
        37589,
        38521,
        39440,
        40347,
        41243,
        42125,
        42995,
        43852,
        44695,
        45525,
        46340,
        47142,
        47929,
        48702,
        49460,
        50203,
        50931,
        51643,
        52339,
        53019,
        53683,
        54331,
        54963,
        55577,
        56175,
        56755,
        57319,
        57864,
        58393,
        58903,
        59395,
        59870,
        60326,
        60763,
        61183,
        61583,
        61965,
        62328,
        62672,
        62997,
        63302,
        63589,
        63856,
        64103,
        64331,
        64540,
        64729,
        64898,
        65047,
        65176,
        65286,
        65376,
        65446,
        65496,
        65526
    };

    // Assign cos_value based on the input angle
    assign cos_value = COS_VALUES[angle];
endmodule
