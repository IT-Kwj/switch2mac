#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c3 [[id(0)]];
};

struct main0_out
{
    float4 m_25 [[user(locn1)]];
    float4 m_29 [[user(locn2)]];
    float4 m_27 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_22 [[attribute(0)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    bool _557 = false;
    bool _383 = false;
    bool _158 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _43 = in.m_22.x;
    float _45 = in.m_22.y;
    float _47 = -_45;
    float _49 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[33].y, (*spvDescriptorSet0.vp_c3)._m0[33].w);
    float _51 = fma(_43, (*spvDescriptorSet0.vp_c3)._m0[33].x, (*spvDescriptorSet0.vp_c3)._m0[33].z);
    float _53 = _49 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _55 = _49 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _57 = _49 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _59 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[5].x, _53);
    float _61 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[4].x, _55);
    float _63 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].x, _57);
    float _65 = _59 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _67 = _61 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _69 = _63 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _71 = _65 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _73 = _65 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _75 = _65 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _77 = _65 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _79 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[0].x, _71);
    float _81 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[1].x, _73);
    float _83 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[2].x, _75);
    float _85 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[3].x, _77);
    float _87 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[0].z, _79);
    float _89 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[1].z, _81);
    float _91 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[2].z, _83);
    float _93 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[3].z, _85);
    float _95 = _87 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _97 = _89 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _99 = _91 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _101 = _93 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _95;
    out.gl_Position.y = _97;
    out.gl_Position.z = _99;
    out.gl_Position.w = _101;
    int _104 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1073741824;
    bool _108 = _104 != 0;
    bool _110 = !_108;
    float _112 = _95;
    float _114 = _89;
    float _116 = _65;
    float _118 = _87;
    float _120 = _95;
    float _122 = _89;
    float _124 = _65;
    float _126 = _87;
    float _128 = _51;
    float _130 = _49;
    bool _136;
    float _142;
    float _148;
    float _152;
    float _156;
    if (!_110)
    {
        int _132 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _134 = _132 != 0;
        _136 = _134;
        if (_134)
        {
            _112 = _43;
        }
        float _138 = _112;
        float _140 = _138;
        _142 = _138;
        if (_134)
        {
            _114 = _45;
        }
        float _144 = _114;
        float _146 = _144;
        _148 = _144;
        if (_134)
        {
            _116 = _43;
        }
        float _150 = _116;
        _152 = _150;
        if (_134)
        {
            _118 = _45;
        }
        float _154 = _118;
        _156 = _154;
        _158 = _134;
        if (!_158)
        {
            float _160 = trunc(_43);
            int _162 = int(_160);
            float _164 = trunc(_45);
            int _166 = int(_164);
            int _168 = _166 << 1;
            int _170 = _168 + _162;
            int _172 = _170 << 4;
            bool _174 = _172 == 0;
            bool _176 = _172 == 16;
            bool _178 = _172 == 32;
            bool _180 = _172 == 48;
            float _182 = as_type<float>(_166);
            float _184 = as_type<float>(_172);
            if (_174)
            {
                _140 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _186 = _140;
            float _188 = _186;
            if (_174)
            {
                _146 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _190 = _146;
            float _192 = _190;
            if (_176)
            {
                _192 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _194 = _192;
            float _196 = _194;
            if (_174)
            {
                _182 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _198 = _182;
            float _200 = _198;
            if (_174)
            {
                _184 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _202 = _184;
            float _204 = _202;
            if (_176)
            {
                _188 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _206 = _188;
            float _208 = _206;
            if (_176)
            {
                _200 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _210 = _200;
            float _212 = _210;
            if (_178)
            {
                _212 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _214 = _212;
            float _216 = _214;
            if (_176)
            {
                _204 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _218 = _204;
            float _220 = _218;
            if (_178)
            {
                _208 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _222 = _208;
            float _224 = _222;
            if (_178)
            {
                _196 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _226 = _196;
            float _228 = _226;
            if (_178)
            {
                _220 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _230 = _220;
            float _232 = _230;
            if (_180)
            {
                _232 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _234 = _232;
            _156 = _234;
            if (_180)
            {
                _224 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _236 = _224;
            _142 = _236;
            if (_180)
            {
                _228 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _238 = _228;
            _148 = _238;
            if (_180)
            {
                _216 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _240 = _216;
            _152 = _240;
            _158 = true;
        }
    }
    else
    {
        int _242 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _244 = _242 != 0;
        _136 = _244;
        if (_244)
        {
            _120 = _43;
        }
        float _246 = _120;
        float _248 = _246;
        _142 = _246;
        if (_244)
        {
            _122 = _45;
        }
        float _250 = _122;
        float _252 = _250;
        _148 = _250;
        if (_244)
        {
            _124 = _43;
        }
        float _254 = _124;
        _152 = _254;
        if (_244)
        {
            _126 = _45;
        }
        float _256 = _126;
        _156 = _256;
        if (!_244)
        {
            float _258 = trunc(_43);
            int _260 = int(_258);
            float _262 = trunc(_45);
            int _264 = int(_262);
            int _266 = _264 * 2;
            int _268 = _266 + _260;
            int _270 = _268 << 4;
            uint _273 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
            bool _275 = _270 == 0;
            bool _277 = _270 == 16;
            bool _279 = _270 == 32;
            bool _281 = _270 == 48;
            int _283 = int(_273) & 15;
            float _285 = as_type<float>(_283);
            float _287 = as_type<float>(_270);
            if (_275)
            {
                _285 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _289 = _285;
            float _291 = _289;
            if (_275)
            {
                _248 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _293 = _248;
            float _295 = _293;
            if (_275)
            {
                _252 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _297 = _252;
            float _299 = _297;
            if (_275)
            {
                _287 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _301 = _287;
            float _303 = _301;
            if (_277)
            {
                _295 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _305 = _295;
            float _307 = _305;
            if (_279)
            {
                _307 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _309 = _307;
            float _311 = _309;
            if (_277)
            {
                _299 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _313 = _299;
            float _315 = _313;
            if (_277)
            {
                _303 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _317 = _303;
            float _319 = _317;
            if (_277)
            {
                _291 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _321 = _291;
            float _323 = _321;
            if (_279)
            {
                _315 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _325 = _315;
            float _327 = _325;
            if (_281)
            {
                _327 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _329 = _327;
            _148 = _329;
            if (_279)
            {
                _319 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _331 = _319;
            float _333 = _331;
            if (_279)
            {
                _323 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _335 = _323;
            _156 = _335;
            if (_281)
            {
                _311 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _337 = _311;
            _142 = _337;
            if (_281)
            {
                _333 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _339 = _333;
            _152 = _339;
            if (_281)
            {
                _156 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
        }
    }
    _158 = false;
    float _341 = _156;
    float _343 = _152;
    float _345 = _142;
    float _347 = _148;
    bool _349 = _136;
    bool _351 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _353 = !_351;
    float _355 = _343;
    float _357 = _341;
    float _359 = _345;
    float _361 = _347;
    float _363 = _343;
    float _365 = _341;
    float _379;
    float _381;
    if (!_353)
    {
        float _367 = _49 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _369 = _49 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _371 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[14].x, _367);
        float _373 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[15].x, _369);
        float _375 = _371 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _377 = _373 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _379 = _377;
        _381 = _375;
        _383 = true;
    }
    else
    {
        int _385 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _387 = _385 != 0;
        if (!_387)
        {
            _355 = _345;
        }
        float _389 = _355;
        float _391 = _389;
        _381 = _389;
        if (!_387)
        {
            _357 = _347;
        }
        float _393 = _357;
        bool _395 = !_387;
        float _397 = _393;
        _379 = _393;
        if (!_395)
        {
            if (!_349)
            {
                _391 = _345;
            }
            float _399 = _391;
            float _401 = _399;
            float _403 = _399;
            if (!_349)
            {
                _397 = _347;
            }
            float _405 = _397;
            bool _407 = !_349;
            float _409 = _405;
            float _411 = _405;
            if (!_407)
            {
                int _413 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _415 = _413 != 0;
                int _417 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _419 = _417 != 0;
                int _421 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _423 = _421 != 0;
                int _425 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _427 = _425 != 0;
                int _429 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _431 = _429 != 0;
                if (_415)
                {
                    _401 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _433 = _401;
                float _435 = _433;
                if (_415)
                {
                    _409 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _437 = _409;
                float _439 = _437;
                if (!_415)
                {
                    _435 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _441 = _435;
                if (!_415)
                {
                    _439 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _443 = _439;
                float _445 = _441 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _447 = _443 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_427)
                {
                    float _449 = _445 * _345;
                    _359 = _449;
                }
                float _451 = _359;
                float _453 = -_445;
                float _455 = _453 + 1.0;
                float _457 = _451;
                if (_431)
                {
                    float _459 = _447 * _347;
                    _361 = _459;
                }
                float _461 = _361;
                float _463 = -_447;
                float _465 = _463 + 1.0;
                float _467 = _461;
                if (_419)
                {
                    float _469 = _451 + _455;
                    _457 = _469;
                }
                float _471 = _457;
                if (_423)
                {
                    float _473 = _461 + _465;
                    _467 = _473;
                }
                float _475 = _467;
                _403 = _471;
                _411 = _475;
            }
            float _477 = _403;
            float _479 = _411;
            int _481 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _483 = _481 != 0;
            int _485 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _487 = _485 != 0;
            int _489 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _491 = _489 != 0;
            int _493 = as_type<int>(_477);
            int _495 = as_type<int>(_479);
            if (_487)
            {
                float _497 = -_477;
                float _499 = _497 + 1.0;
                _493 = as_type<int>(_499);
            }
            int _501 = _493;
            if (_491)
            {
                float _503 = -_479;
                float _505 = _503 + 1.0;
                _495 = as_type<int>(_505);
            }
            int _507 = _495;
            bool _509 = !_483;
            float _511 = _509 ? as_type<float>(_501) : as_type<float>(_507);
            bool _513 = !_483;
            float _515 = _513 ? as_type<float>(_507) : as_type<float>(_501);
            _379 = _515;
            _381 = _511;
        }
    }
    _383 = false;
    float _517 = _379;
    float _519 = _381;
    float _521 = _517 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _523 = _517 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    bool _525 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _527 = fma(_519, (*spvDescriptorSet0.vp_c3)._m0[8].x, _521);
    float _529 = fma(_519, (*spvDescriptorSet0.vp_c3)._m0[7].x, _523);
    float _531 = _527 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _533 = _529 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _535 = -_531;
    float _537 = _535 + 1.0;
    out.m_25.x = _533;
    out.m_25.y = _537;
    bool _539 = !_525;
    float _553;
    float _555;
    if (!_539)
    {
        float _541 = _49 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _543 = _49 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _545 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[18].x, _541);
        float _547 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[19].x, _543);
        float _549 = _545 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _551 = _547 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _553 = _551;
        _555 = _549;
        _557 = true;
    }
    else
    {
        int _559 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _561 = _559 != 0;
        if (!_561)
        {
            _128 = _343;
        }
        float _563 = _128;
        float _565 = _563;
        _555 = _563;
        if (!_561)
        {
            _130 = _341;
        }
        float _567 = _130;
        bool _569 = !_561;
        float _571 = _567;
        _553 = _567;
        if (!_569)
        {
            if (!_349)
            {
                _565 = _343;
            }
            float _573 = _565;
            float _575 = _573;
            int _577 = as_type<int>(_573);
            if (!_349)
            {
                _571 = _341;
            }
            float _579 = _571;
            bool _581 = !_349;
            float _583 = _579;
            float _585 = _579;
            if (!_581)
            {
                int _587 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _589 = _587 != 0;
                int _591 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _593 = _591 != 0;
                int _595 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _597 = _595 != 0;
                int _599 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _601 = _599 != 0;
                int _603 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _605 = _603 != 0;
                if (_589)
                {
                    _575 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _607 = _575;
                float _609 = _607;
                if (_589)
                {
                    _583 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _611 = _583;
                float _613 = _611;
                if (!_589)
                {
                    _609 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _615 = _609;
                if (!_589)
                {
                    _613 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _617 = _613;
                float _619 = _615 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _621 = _617 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_601)
                {
                    float _623 = _619 * _343;
                    _363 = _623;
                }
                float _625 = _363;
                float _627 = -_619;
                float _629 = _627 + 1.0;
                int _631 = as_type<int>(_625);
                if (_605)
                {
                    float _633 = _621 * _341;
                    _365 = _633;
                }
                float _635 = _365;
                float _637 = -_621;
                float _639 = _637 + 1.0;
                float _641 = _635;
                if (_593)
                {
                    float _643 = _625 + _629;
                    _631 = as_type<int>(_643);
                }
                int _645 = _631;
                if (_597)
                {
                    float _647 = _635 + _639;
                    _641 = _647;
                }
                float _649 = _641;
                _577 = _645;
                _585 = _649;
            }
            int _651 = _577;
            float _653 = _585;
            int _655 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _657 = _655 != 0;
            int _659 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _661 = _659 != 0;
            int _663 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _665 = _663 != 0;
            int _667 = _651;
            int _669 = as_type<int>(_653);
            if (_661)
            {
                float _671 = -as_type<float>(_651);
                float _673 = _671 + 1.0;
                _667 = as_type<int>(_673);
            }
            int _675 = _667;
            if (_665)
            {
                float _677 = -_653;
                float _679 = _677 + 1.0;
                _669 = as_type<int>(_679);
            }
            int _681 = _669;
            bool _683 = !_657;
            float _685 = _683 ? as_type<float>(_675) : as_type<float>(_681);
            bool _687 = !_657;
            float _689 = _687 ? as_type<float>(_681) : as_type<float>(_675);
            _553 = _689;
            _555 = _685;
        }
    }
    _557 = false;
    float _691 = _553;
    float _693 = _555;
    float _695 = _691 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _697 = _691 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    out.m_27.x = _43;
    out.m_27.y = _45;
    float _699 = fma(_693, (*spvDescriptorSet0.vp_c3)._m0[10].x, _695);
    float _701 = fma(_693, (*spvDescriptorSet0.vp_c3)._m0[9].x, _697);
    float _703 = _699 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _705 = _701 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _707 = -_703;
    float _709 = _707 + 1.0;
    out.m_29.x = _705;
    out.m_29.y = _709;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    bool _557 = false;
    bool _383 = false;
    bool _158 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _43 = in.m_22.x;
    float _45 = in.m_22.y;
    float _47 = -_45;
    float _49 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[33].y, (*spvDescriptorSet0.vp_c3)._m0[33].w);
    float _51 = fma(_43, (*spvDescriptorSet0.vp_c3)._m0[33].x, (*spvDescriptorSet0.vp_c3)._m0[33].z);
    float _53 = _49 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _55 = _49 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _57 = _49 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _59 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[5].x, _53);
    float _61 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[4].x, _55);
    float _63 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].x, _57);
    float _65 = _59 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _67 = _61 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _69 = _63 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _71 = _65 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _73 = _65 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _75 = _65 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _77 = _65 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _79 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[0].x, _71);
    float _81 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[1].x, _73);
    float _83 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[2].x, _75);
    float _85 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[3].x, _77);
    float _87 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[0].z, _79);
    float _89 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[1].z, _81);
    float _91 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[2].z, _83);
    float _93 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[3].z, _85);
    float _95 = _87 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _97 = _89 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _99 = _91 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _101 = _93 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _95;
    out.gl_Position.y = _97;
    out.gl_Position.z = _99;
    out.gl_Position.w = _101;
    int _104 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1073741824;
    bool _108 = _104 != 0;
    bool _110 = !_108;
    float _112 = _95;
    float _114 = _89;
    float _116 = _65;
    float _118 = _87;
    float _120 = _95;
    float _122 = _89;
    float _124 = _65;
    float _126 = _87;
    float _128 = _51;
    float _130 = _49;
    bool _136;
    float _142;
    float _148;
    float _152;
    float _156;
    if (!_110)
    {
        int _132 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _134 = _132 != 0;
        _136 = _134;
        if (_134)
        {
            _112 = _43;
        }
        float _138 = _112;
        float _140 = _138;
        _142 = _138;
        if (_134)
        {
            _114 = _45;
        }
        float _144 = _114;
        float _146 = _144;
        _148 = _144;
        if (_134)
        {
            _116 = _43;
        }
        float _150 = _116;
        _152 = _150;
        if (_134)
        {
            _118 = _45;
        }
        float _154 = _118;
        _156 = _154;
        _158 = _134;
        if (!_158)
        {
            float _160 = trunc(_43);
            int _162 = int(_160);
            float _164 = trunc(_45);
            int _166 = int(_164);
            int _168 = _166 << 1;
            int _170 = _168 + _162;
            int _172 = _170 << 4;
            bool _174 = _172 == 0;
            bool _176 = _172 == 16;
            bool _178 = _172 == 32;
            bool _180 = _172 == 48;
            float _182 = as_type<float>(_166);
            float _184 = as_type<float>(_172);
            if (_174)
            {
                _140 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _186 = _140;
            float _188 = _186;
            if (_174)
            {
                _146 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _190 = _146;
            float _192 = _190;
            if (_176)
            {
                _192 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _194 = _192;
            float _196 = _194;
            if (_174)
            {
                _182 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _198 = _182;
            float _200 = _198;
            if (_174)
            {
                _184 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _202 = _184;
            float _204 = _202;
            if (_176)
            {
                _188 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _206 = _188;
            float _208 = _206;
            if (_176)
            {
                _200 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _210 = _200;
            float _212 = _210;
            if (_178)
            {
                _212 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _214 = _212;
            float _216 = _214;
            if (_176)
            {
                _204 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _218 = _204;
            float _220 = _218;
            if (_178)
            {
                _208 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _222 = _208;
            float _224 = _222;
            if (_178)
            {
                _196 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _226 = _196;
            float _228 = _226;
            if (_178)
            {
                _220 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _230 = _220;
            float _232 = _230;
            if (_180)
            {
                _232 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _234 = _232;
            _156 = _234;
            if (_180)
            {
                _224 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _236 = _224;
            _142 = _236;
            if (_180)
            {
                _228 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _238 = _228;
            _148 = _238;
            if (_180)
            {
                _216 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _240 = _216;
            _152 = _240;
            _158 = true;
        }
    }
    else
    {
        int _242 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _244 = _242 != 0;
        _136 = _244;
        if (_244)
        {
            _120 = _43;
        }
        float _246 = _120;
        float _248 = _246;
        _142 = _246;
        if (_244)
        {
            _122 = _45;
        }
        float _250 = _122;
        float _252 = _250;
        _148 = _250;
        if (_244)
        {
            _124 = _43;
        }
        float _254 = _124;
        _152 = _254;
        if (_244)
        {
            _126 = _45;
        }
        float _256 = _126;
        _156 = _256;
        if (!_244)
        {
            float _258 = trunc(_43);
            int _260 = int(_258);
            float _262 = trunc(_45);
            int _264 = int(_262);
            int _266 = _264 * 2;
            int _268 = _266 + _260;
            int _270 = _268 << 4;
            uint _273 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
            bool _275 = _270 == 0;
            bool _277 = _270 == 16;
            bool _279 = _270 == 32;
            bool _281 = _270 == 48;
            int _283 = int(_273) & 15;
            float _285 = as_type<float>(_283);
            float _287 = as_type<float>(_270);
            if (_275)
            {
                _285 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _289 = _285;
            float _291 = _289;
            if (_275)
            {
                _248 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _293 = _248;
            float _295 = _293;
            if (_275)
            {
                _252 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _297 = _252;
            float _299 = _297;
            if (_275)
            {
                _287 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _301 = _287;
            float _303 = _301;
            if (_277)
            {
                _295 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _305 = _295;
            float _307 = _305;
            if (_279)
            {
                _307 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _309 = _307;
            float _311 = _309;
            if (_277)
            {
                _299 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _313 = _299;
            float _315 = _313;
            if (_277)
            {
                _303 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _317 = _303;
            float _319 = _317;
            if (_277)
            {
                _291 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _321 = _291;
            float _323 = _321;
            if (_279)
            {
                _315 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _325 = _315;
            float _327 = _325;
            if (_281)
            {
                _327 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _329 = _327;
            _148 = _329;
            if (_279)
            {
                _319 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _331 = _319;
            float _333 = _331;
            if (_279)
            {
                _323 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _335 = _323;
            _156 = _335;
            if (_281)
            {
                _311 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _337 = _311;
            _142 = _337;
            if (_281)
            {
                _333 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _339 = _333;
            _152 = _339;
            if (_281)
            {
                _156 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
        }
    }
    _158 = false;
    float _341 = _156;
    float _343 = _152;
    float _345 = _142;
    float _347 = _148;
    bool _349 = _136;
    bool _351 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _353 = !_351;
    float _355 = _343;
    float _357 = _341;
    float _359 = _345;
    float _361 = _347;
    float _363 = _343;
    float _365 = _341;
    float _379;
    float _381;
    if (!_353)
    {
        float _367 = _49 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _369 = _49 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _371 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[14].x, _367);
        float _373 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[15].x, _369);
        float _375 = _371 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _377 = _373 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _379 = _377;
        _381 = _375;
        _383 = true;
    }
    else
    {
        int _385 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _387 = _385 != 0;
        if (!_387)
        {
            _355 = _345;
        }
        float _389 = _355;
        float _391 = _389;
        _381 = _389;
        if (!_387)
        {
            _357 = _347;
        }
        float _393 = _357;
        bool _395 = !_387;
        float _397 = _393;
        _379 = _393;
        if (!_395)
        {
            if (!_349)
            {
                _391 = _345;
            }
            float _399 = _391;
            float _401 = _399;
            float _403 = _399;
            if (!_349)
            {
                _397 = _347;
            }
            float _405 = _397;
            bool _407 = !_349;
            float _409 = _405;
            float _411 = _405;
            if (!_407)
            {
                int _413 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _415 = _413 != 0;
                int _417 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _419 = _417 != 0;
                int _421 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _423 = _421 != 0;
                int _425 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _427 = _425 != 0;
                int _429 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _431 = _429 != 0;
                if (_415)
                {
                    _401 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _433 = _401;
                float _435 = _433;
                if (_415)
                {
                    _409 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _437 = _409;
                float _439 = _437;
                if (!_415)
                {
                    _435 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _441 = _435;
                if (!_415)
                {
                    _439 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _443 = _439;
                float _445 = _441 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _447 = _443 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_427)
                {
                    float _449 = _445 * _345;
                    _359 = _449;
                }
                float _451 = _359;
                float _453 = -_445;
                float _455 = _453 + 1.0;
                float _457 = _451;
                if (_431)
                {
                    float _459 = _447 * _347;
                    _361 = _459;
                }
                float _461 = _361;
                float _463 = -_447;
                float _465 = _463 + 1.0;
                float _467 = _461;
                if (_419)
                {
                    float _469 = _451 + _455;
                    _457 = _469;
                }
                float _471 = _457;
                if (_423)
                {
                    float _473 = _461 + _465;
                    _467 = _473;
                }
                float _475 = _467;
                _403 = _471;
                _411 = _475;
            }
            float _477 = _403;
            float _479 = _411;
            int _481 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _483 = _481 != 0;
            int _485 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _487 = _485 != 0;
            int _489 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _491 = _489 != 0;
            int _493 = as_type<int>(_477);
            int _495 = as_type<int>(_479);
            if (_487)
            {
                float _497 = -_477;
                float _499 = _497 + 1.0;
                _493 = as_type<int>(_499);
            }
            int _501 = _493;
            if (_491)
            {
                float _503 = -_479;
                float _505 = _503 + 1.0;
                _495 = as_type<int>(_505);
            }
            int _507 = _495;
            bool _509 = !_483;
            float _511 = _509 ? as_type<float>(_501) : as_type<float>(_507);
            bool _513 = !_483;
            float _515 = _513 ? as_type<float>(_507) : as_type<float>(_501);
            _379 = _515;
            _381 = _511;
        }
    }
    _383 = false;
    float _517 = _379;
    float _519 = _381;
    float _521 = _517 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _523 = _517 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    bool _525 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _527 = fma(_519, (*spvDescriptorSet0.vp_c3)._m0[8].x, _521);
    float _529 = fma(_519, (*spvDescriptorSet0.vp_c3)._m0[7].x, _523);
    float _531 = _527 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _533 = _529 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _535 = -_531;
    float _537 = _535 + 1.0;
    out.m_25.x = _533;
    out.m_25.y = _537;
    bool _539 = !_525;
    float _553;
    float _555;
    if (!_539)
    {
        float _541 = _49 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _543 = _49 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _545 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[18].x, _541);
        float _547 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[19].x, _543);
        float _549 = _545 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _551 = _547 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _553 = _551;
        _555 = _549;
        _557 = true;
    }
    else
    {
        int _559 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _561 = _559 != 0;
        if (!_561)
        {
            _128 = _343;
        }
        float _563 = _128;
        float _565 = _563;
        _555 = _563;
        if (!_561)
        {
            _130 = _341;
        }
        float _567 = _130;
        bool _569 = !_561;
        float _571 = _567;
        _553 = _567;
        if (!_569)
        {
            if (!_349)
            {
                _565 = _343;
            }
            float _573 = _565;
            float _575 = _573;
            int _577 = as_type<int>(_573);
            if (!_349)
            {
                _571 = _341;
            }
            float _579 = _571;
            bool _581 = !_349;
            float _583 = _579;
            float _585 = _579;
            if (!_581)
            {
                int _587 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _589 = _587 != 0;
                int _591 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _593 = _591 != 0;
                int _595 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _597 = _595 != 0;
                int _599 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _601 = _599 != 0;
                int _603 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _605 = _603 != 0;
                if (_589)
                {
                    _575 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _607 = _575;
                float _609 = _607;
                if (_589)
                {
                    _583 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _611 = _583;
                float _613 = _611;
                if (!_589)
                {
                    _609 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _615 = _609;
                if (!_589)
                {
                    _613 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _617 = _613;
                float _619 = _615 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _621 = _617 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_601)
                {
                    float _623 = _619 * _343;
                    _363 = _623;
                }
                float _625 = _363;
                float _627 = -_619;
                float _629 = _627 + 1.0;
                int _631 = as_type<int>(_625);
                if (_605)
                {
                    float _633 = _621 * _341;
                    _365 = _633;
                }
                float _635 = _365;
                float _637 = -_621;
                float _639 = _637 + 1.0;
                float _641 = _635;
                if (_593)
                {
                    float _643 = _625 + _629;
                    _631 = as_type<int>(_643);
                }
                int _645 = _631;
                if (_597)
                {
                    float _647 = _635 + _639;
                    _641 = _647;
                }
                float _649 = _641;
                _577 = _645;
                _585 = _649;
            }
            int _651 = _577;
            float _653 = _585;
            int _655 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _657 = _655 != 0;
            int _659 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _661 = _659 != 0;
            int _663 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _665 = _663 != 0;
            int _667 = _651;
            int _669 = as_type<int>(_653);
            if (_661)
            {
                float _671 = -as_type<float>(_651);
                float _673 = _671 + 1.0;
                _667 = as_type<int>(_673);
            }
            int _675 = _667;
            if (_665)
            {
                float _677 = -_653;
                float _679 = _677 + 1.0;
                _669 = as_type<int>(_679);
            }
            int _681 = _669;
            bool _683 = !_657;
            float _685 = _683 ? as_type<float>(_675) : as_type<float>(_681);
            bool _687 = !_657;
            float _689 = _687 ? as_type<float>(_681) : as_type<float>(_675);
            _553 = _689;
            _555 = _685;
        }
    }
    _557 = false;
    float _691 = _553;
    float _693 = _555;
    float _695 = _691 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _697 = _691 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    out.m_27.x = _43;
    out.m_27.y = _45;
    float _699 = fma(_693, (*spvDescriptorSet0.vp_c3)._m0[10].x, _695);
    float _701 = fma(_693, (*spvDescriptorSet0.vp_c3)._m0[9].x, _697);
    float _703 = _699 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _705 = _701 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _707 = -_703;
    float _709 = _707 + 1.0;
    out.m_29.x = _705;
    out.m_29.y = _709;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    bool _557 = false;
    bool _383 = false;
    bool _158 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _43 = in.m_22.x;
    float _45 = in.m_22.y;
    float _47 = -_45;
    float _49 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[33].y, (*spvDescriptorSet0.vp_c3)._m0[33].w);
    float _51 = fma(_43, (*spvDescriptorSet0.vp_c3)._m0[33].x, (*spvDescriptorSet0.vp_c3)._m0[33].z);
    float _53 = _49 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _55 = _49 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _57 = _49 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _59 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[5].x, _53);
    float _61 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[4].x, _55);
    float _63 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].x, _57);
    float _65 = _59 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _67 = _61 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _69 = _63 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _71 = _65 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _73 = _65 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _75 = _65 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _77 = _65 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _79 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[0].x, _71);
    float _81 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[1].x, _73);
    float _83 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[2].x, _75);
    float _85 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[3].x, _77);
    float _87 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[0].z, _79);
    float _89 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[1].z, _81);
    float _91 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[2].z, _83);
    float _93 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[3].z, _85);
    float _95 = _87 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _97 = _89 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _99 = _91 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _101 = _93 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _95;
    out.gl_Position.y = _97;
    out.gl_Position.z = _99;
    out.gl_Position.w = _101;
    int _104 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1073741824;
    bool _108 = _104 != 0;
    bool _110 = !_108;
    float _112 = _95;
    float _114 = _89;
    float _116 = _65;
    float _118 = _87;
    float _120 = _95;
    float _122 = _89;
    float _124 = _65;
    float _126 = _87;
    float _128 = _51;
    float _130 = _49;
    bool _136;
    float _142;
    float _148;
    float _152;
    float _156;
    if (!_110)
    {
        int _132 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _134 = _132 != 0;
        _136 = _134;
        if (_134)
        {
            _112 = _43;
        }
        float _138 = _112;
        float _140 = _138;
        _142 = _138;
        if (_134)
        {
            _114 = _45;
        }
        float _144 = _114;
        float _146 = _144;
        _148 = _144;
        if (_134)
        {
            _116 = _43;
        }
        float _150 = _116;
        _152 = _150;
        if (_134)
        {
            _118 = _45;
        }
        float _154 = _118;
        _156 = _154;
        _158 = _134;
        if (!_158)
        {
            float _160 = trunc(_43);
            int _162 = int(_160);
            float _164 = trunc(_45);
            int _166 = int(_164);
            int _168 = _166 << 1;
            int _170 = _168 + _162;
            int _172 = _170 << 4;
            bool _174 = _172 == 0;
            bool _176 = _172 == 16;
            bool _178 = _172 == 32;
            bool _180 = _172 == 48;
            float _182 = as_type<float>(_166);
            float _184 = as_type<float>(_172);
            if (_174)
            {
                _140 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _186 = _140;
            float _188 = _186;
            if (_174)
            {
                _146 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _190 = _146;
            float _192 = _190;
            if (_176)
            {
                _192 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _194 = _192;
            float _196 = _194;
            if (_174)
            {
                _182 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _198 = _182;
            float _200 = _198;
            if (_174)
            {
                _184 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _202 = _184;
            float _204 = _202;
            if (_176)
            {
                _188 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _206 = _188;
            float _208 = _206;
            if (_176)
            {
                _200 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _210 = _200;
            float _212 = _210;
            if (_178)
            {
                _212 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _214 = _212;
            float _216 = _214;
            if (_176)
            {
                _204 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _218 = _204;
            float _220 = _218;
            if (_178)
            {
                _208 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _222 = _208;
            float _224 = _222;
            if (_178)
            {
                _196 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _226 = _196;
            float _228 = _226;
            if (_178)
            {
                _220 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _230 = _220;
            float _232 = _230;
            if (_180)
            {
                _232 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _234 = _232;
            _156 = _234;
            if (_180)
            {
                _224 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _236 = _224;
            _142 = _236;
            if (_180)
            {
                _228 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _238 = _228;
            _148 = _238;
            if (_180)
            {
                _216 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _240 = _216;
            _152 = _240;
            _158 = true;
        }
    }
    else
    {
        int _242 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _244 = _242 != 0;
        _136 = _244;
        if (_244)
        {
            _120 = _43;
        }
        float _246 = _120;
        float _248 = _246;
        _142 = _246;
        if (_244)
        {
            _122 = _45;
        }
        float _250 = _122;
        float _252 = _250;
        _148 = _250;
        if (_244)
        {
            _124 = _43;
        }
        float _254 = _124;
        _152 = _254;
        if (_244)
        {
            _126 = _45;
        }
        float _256 = _126;
        _156 = _256;
        if (!_244)
        {
            float _258 = trunc(_43);
            int _260 = int(_258);
            float _262 = trunc(_45);
            int _264 = int(_262);
            int _266 = _264 * 2;
            int _268 = _266 + _260;
            int _270 = _268 << 4;
            uint _273 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
            bool _275 = _270 == 0;
            bool _277 = _270 == 16;
            bool _279 = _270 == 32;
            bool _281 = _270 == 48;
            int _283 = int(_273) & 15;
            float _285 = as_type<float>(_283);
            float _287 = as_type<float>(_270);
            if (_275)
            {
                _285 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _289 = _285;
            float _291 = _289;
            if (_275)
            {
                _248 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _293 = _248;
            float _295 = _293;
            if (_275)
            {
                _252 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _297 = _252;
            float _299 = _297;
            if (_275)
            {
                _287 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _301 = _287;
            float _303 = _301;
            if (_277)
            {
                _295 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _305 = _295;
            float _307 = _305;
            if (_279)
            {
                _307 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _309 = _307;
            float _311 = _309;
            if (_277)
            {
                _299 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _313 = _299;
            float _315 = _313;
            if (_277)
            {
                _303 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _317 = _303;
            float _319 = _317;
            if (_277)
            {
                _291 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _321 = _291;
            float _323 = _321;
            if (_279)
            {
                _315 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _325 = _315;
            float _327 = _325;
            if (_281)
            {
                _327 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _329 = _327;
            _148 = _329;
            if (_279)
            {
                _319 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _331 = _319;
            float _333 = _331;
            if (_279)
            {
                _323 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _335 = _323;
            _156 = _335;
            if (_281)
            {
                _311 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _337 = _311;
            _142 = _337;
            if (_281)
            {
                _333 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _339 = _333;
            _152 = _339;
            if (_281)
            {
                _156 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
        }
    }
    _158 = false;
    float _341 = _156;
    float _343 = _152;
    float _345 = _142;
    float _347 = _148;
    bool _349 = _136;
    bool _351 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _353 = !_351;
    float _355 = _343;
    float _357 = _341;
    float _359 = _345;
    float _361 = _347;
    float _363 = _343;
    float _365 = _341;
    float _379;
    float _381;
    if (!_353)
    {
        float _367 = _49 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _369 = _49 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _371 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[14].x, _367);
        float _373 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[15].x, _369);
        float _375 = _371 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _377 = _373 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _379 = _377;
        _381 = _375;
        _383 = true;
    }
    else
    {
        int _385 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _387 = _385 != 0;
        if (!_387)
        {
            _355 = _345;
        }
        float _389 = _355;
        float _391 = _389;
        _381 = _389;
        if (!_387)
        {
            _357 = _347;
        }
        float _393 = _357;
        bool _395 = !_387;
        float _397 = _393;
        _379 = _393;
        if (!_395)
        {
            if (!_349)
            {
                _391 = _345;
            }
            float _399 = _391;
            float _401 = _399;
            float _403 = _399;
            if (!_349)
            {
                _397 = _347;
            }
            float _405 = _397;
            bool _407 = !_349;
            float _409 = _405;
            float _411 = _405;
            if (!_407)
            {
                int _413 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _415 = _413 != 0;
                int _417 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _419 = _417 != 0;
                int _421 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _423 = _421 != 0;
                int _425 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _427 = _425 != 0;
                int _429 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _431 = _429 != 0;
                if (_415)
                {
                    _401 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _433 = _401;
                float _435 = _433;
                if (_415)
                {
                    _409 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _437 = _409;
                float _439 = _437;
                if (!_415)
                {
                    _435 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _441 = _435;
                if (!_415)
                {
                    _439 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _443 = _439;
                float _445 = _441 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _447 = _443 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_427)
                {
                    float _449 = _445 * _345;
                    _359 = _449;
                }
                float _451 = _359;
                float _453 = -_445;
                float _455 = _453 + 1.0;
                float _457 = _451;
                if (_431)
                {
                    float _459 = _447 * _347;
                    _361 = _459;
                }
                float _461 = _361;
                float _463 = -_447;
                float _465 = _463 + 1.0;
                float _467 = _461;
                if (_419)
                {
                    float _469 = _451 + _455;
                    _457 = _469;
                }
                float _471 = _457;
                if (_423)
                {
                    float _473 = _461 + _465;
                    _467 = _473;
                }
                float _475 = _467;
                _403 = _471;
                _411 = _475;
            }
            float _477 = _403;
            float _479 = _411;
            int _481 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _483 = _481 != 0;
            int _485 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _487 = _485 != 0;
            int _489 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _491 = _489 != 0;
            int _493 = as_type<int>(_477);
            int _495 = as_type<int>(_479);
            if (_487)
            {
                float _497 = -_477;
                float _499 = _497 + 1.0;
                _493 = as_type<int>(_499);
            }
            int _501 = _493;
            if (_491)
            {
                float _503 = -_479;
                float _505 = _503 + 1.0;
                _495 = as_type<int>(_505);
            }
            int _507 = _495;
            bool _509 = !_483;
            float _511 = _509 ? as_type<float>(_501) : as_type<float>(_507);
            bool _513 = !_483;
            float _515 = _513 ? as_type<float>(_507) : as_type<float>(_501);
            _379 = _515;
            _381 = _511;
        }
    }
    _383 = false;
    float _517 = _379;
    float _519 = _381;
    float _521 = _517 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _523 = _517 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    bool _525 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _527 = fma(_519, (*spvDescriptorSet0.vp_c3)._m0[8].x, _521);
    float _529 = fma(_519, (*spvDescriptorSet0.vp_c3)._m0[7].x, _523);
    float _531 = _527 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _533 = _529 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _535 = -_531;
    float _537 = _535 + 1.0;
    out.m_25.x = _533;
    out.m_25.y = _537;
    bool _539 = !_525;
    float _553;
    float _555;
    if (!_539)
    {
        float _541 = _49 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _543 = _49 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _545 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[18].x, _541);
        float _547 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[19].x, _543);
        float _549 = _545 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _551 = _547 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _553 = _551;
        _555 = _549;
        _557 = true;
    }
    else
    {
        int _559 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _561 = _559 != 0;
        if (!_561)
        {
            _128 = _343;
        }
        float _563 = _128;
        float _565 = _563;
        _555 = _563;
        if (!_561)
        {
            _130 = _341;
        }
        float _567 = _130;
        bool _569 = !_561;
        float _571 = _567;
        _553 = _567;
        if (!_569)
        {
            if (!_349)
            {
                _565 = _343;
            }
            float _573 = _565;
            float _575 = _573;
            int _577 = as_type<int>(_573);
            if (!_349)
            {
                _571 = _341;
            }
            float _579 = _571;
            bool _581 = !_349;
            float _583 = _579;
            float _585 = _579;
            if (!_581)
            {
                int _587 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _589 = _587 != 0;
                int _591 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _593 = _591 != 0;
                int _595 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _597 = _595 != 0;
                int _599 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _601 = _599 != 0;
                int _603 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _605 = _603 != 0;
                if (_589)
                {
                    _575 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _607 = _575;
                float _609 = _607;
                if (_589)
                {
                    _583 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _611 = _583;
                float _613 = _611;
                if (!_589)
                {
                    _609 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _615 = _609;
                if (!_589)
                {
                    _613 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _617 = _613;
                float _619 = _615 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _621 = _617 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_601)
                {
                    float _623 = _619 * _343;
                    _363 = _623;
                }
                float _625 = _363;
                float _627 = -_619;
                float _629 = _627 + 1.0;
                int _631 = as_type<int>(_625);
                if (_605)
                {
                    float _633 = _621 * _341;
                    _365 = _633;
                }
                float _635 = _365;
                float _637 = -_621;
                float _639 = _637 + 1.0;
                float _641 = _635;
                if (_593)
                {
                    float _643 = _625 + _629;
                    _631 = as_type<int>(_643);
                }
                int _645 = _631;
                if (_597)
                {
                    float _647 = _635 + _639;
                    _641 = _647;
                }
                float _649 = _641;
                _577 = _645;
                _585 = _649;
            }
            int _651 = _577;
            float _653 = _585;
            int _655 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _657 = _655 != 0;
            int _659 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _661 = _659 != 0;
            int _663 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _665 = _663 != 0;
            int _667 = _651;
            int _669 = as_type<int>(_653);
            if (_661)
            {
                float _671 = -as_type<float>(_651);
                float _673 = _671 + 1.0;
                _667 = as_type<int>(_673);
            }
            int _675 = _667;
            if (_665)
            {
                float _677 = -_653;
                float _679 = _677 + 1.0;
                _669 = as_type<int>(_679);
            }
            int _681 = _669;
            bool _683 = !_657;
            float _685 = _683 ? as_type<float>(_675) : as_type<float>(_681);
            bool _687 = !_657;
            float _689 = _687 ? as_type<float>(_681) : as_type<float>(_675);
            _553 = _689;
            _555 = _685;
        }
    }
    _557 = false;
    float _691 = _553;
    float _693 = _555;
    float _695 = _691 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _697 = _691 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    out.m_27.x = _43;
    out.m_27.y = _45;
    float _699 = fma(_693, (*spvDescriptorSet0.vp_c3)._m0[10].x, _695);
    float _701 = fma(_693, (*spvDescriptorSet0.vp_c3)._m0[9].x, _697);
    float _703 = _699 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _705 = _701 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _707 = -_703;
    float _709 = _707 + 1.0;
    out.m_29.x = _705;
    out.m_29.y = _709;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_25.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_25.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_25.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_25.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_27.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_27.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_27.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_27.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

