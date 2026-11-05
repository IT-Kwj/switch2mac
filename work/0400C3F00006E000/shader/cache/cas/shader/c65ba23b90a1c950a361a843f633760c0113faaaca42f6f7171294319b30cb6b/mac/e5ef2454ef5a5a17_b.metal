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
    float4 m_27 [[user(locn2)]];
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
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    bool _661 = false;
    bool _471 = false;
    bool _160 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _41 = in.m_22.x;
    float _43 = in.m_22.y;
    float _45 = -_43;
    float _47 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[33].y, (*spvDescriptorSet0.vp_c3)._m0[33].w);
    float _49 = fma(_41, (*spvDescriptorSet0.vp_c3)._m0[33].x, (*spvDescriptorSet0.vp_c3)._m0[33].z);
    float _51 = _47 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _53 = _47 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _55 = _47 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _57 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[5].x, _51);
    float _59 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[4].x, _53);
    float _61 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[6].x, _55);
    float _63 = _57 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _65 = _59 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _67 = _61 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _69 = _63 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _71 = _63 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _73 = _63 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _75 = _63 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _77 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[0].x, _69);
    float _79 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[1].x, _71);
    float _81 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[2].x, _73);
    float _83 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[3].x, _75);
    float _85 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[0].z, _77);
    float _87 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[1].z, _79);
    float _89 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[2].z, _81);
    float _91 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[3].z, _83);
    float _93 = _85 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _95 = _87 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _97 = _89 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _99 = _91 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _93;
    out.gl_Position.y = _95;
    out.gl_Position.z = _97;
    out.gl_Position.w = _99;
    int _102 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1073741824;
    bool _106 = _102 != 0;
    bool _108 = !_106;
    float _110 = _93;
    float _112 = _85;
    float _114 = _87;
    float _116 = _63;
    float _118 = _93;
    float _120 = _87;
    float _122 = _85;
    float _124 = _63;
    float _126 = _43;
    float _128 = _41;
    float _130 = _47;
    bool _136;
    float _142;
    float _146;
    float _152;
    float _158;
    if (!_108)
    {
        int _132 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _134 = _132 != 0;
        _136 = _134;
        if (_134)
        {
            _110 = _41;
        }
        float _138 = _110;
        float _140 = _138;
        _142 = _138;
        if (_134)
        {
            _112 = _43;
        }
        float _144 = _112;
        _146 = _144;
        if (_134)
        {
            _114 = 1.0;
        }
        float _148 = _114;
        float _150 = _148;
        _152 = _148;
        if (_134)
        {
            _116 = 1.0;
        }
        float _154 = _116;
        float _156 = _154;
        _158 = _154;
        _160 = _134;
        if (!_160)
        {
            float _162 = trunc(_41);
            int _164 = int(_162);
            float _166 = trunc(_43);
            int _168 = int(_166);
            int _170 = _168 * 2;
            int _172 = _170 + _164;
            int _174 = _172 << 4;
            bool _176 = _174 == 0;
            bool _178 = _174 == 16;
            bool _180 = _174 == 32;
            bool _182 = _174 == 48;
            float _184 = as_type<float>(_174);
            float _186 = as_type<float>(_164);
            float _188 = as_type<float>(_168);
            if (_176)
            {
                _140 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _190 = _140;
            float _192 = _190;
            if (_176)
            {
                _150 = (*spvDescriptorSet0.vp_c3)._m0[14].w;
            }
            float _194 = _150;
            float _196 = _194;
            if (_176)
            {
                _184 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _198 = _184;
            float _200 = _198;
            if (_178)
            {
                _192 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _202 = _192;
            float _204 = _202;
            if (_176)
            {
                _186 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _206 = _186;
            float _208 = _206;
            if (_176)
            {
                _188 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _210 = _188;
            float _212 = _210;
            if (_178)
            {
                _212 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _214 = _212;
            float _216 = _214;
            if (_176)
            {
                _156 = (*spvDescriptorSet0.vp_c3)._m0[18].w;
            }
            float _218 = _156;
            float _220 = _218;
            if (_178)
            {
                _200 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _222 = _200;
            float _224 = _222;
            if (_178)
            {
                _196 = (*spvDescriptorSet0.vp_c3)._m0[15].w;
            }
            float _226 = _196;
            float _228 = _226;
            if (_180)
            {
                _228 = (*spvDescriptorSet0.vp_c3)._m0[16].w;
            }
            float _230 = _228;
            float _232 = _230;
            if (_178)
            {
                _208 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _234 = _208;
            float _236 = _234;
            if (_178)
            {
                _220 = (*spvDescriptorSet0.vp_c3)._m0[19].w;
            }
            float _238 = _220;
            float _240 = _238;
            if (_180)
            {
                _204 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _242 = _204;
            float _244 = _242;
            if (_182)
            {
                _244 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _246 = _244;
            _142 = _246;
            if (_180)
            {
                _224 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _248 = _224;
            float _250 = _248;
            if (_180)
            {
                _236 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _252 = _236;
            float _254 = _252;
            if (_180)
            {
                _216 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _256 = _216;
            float _258 = _256;
            if (_182)
            {
                _258 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _260 = _258;
            _126 = _260;
            if (_180)
            {
                _240 = (*spvDescriptorSet0.vp_c3)._m0[20].w;
            }
            float _262 = _240;
            float _264 = _262;
            if (_182)
            {
                _250 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _266 = _250;
            _146 = _266;
            if (_182)
            {
                _232 = (*spvDescriptorSet0.vp_c3)._m0[17].w;
            }
            float _268 = _232;
            _152 = _268;
            if (_182)
            {
                _254 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _270 = _254;
            _128 = _270;
            if (_182)
            {
                _264 = (*spvDescriptorSet0.vp_c3)._m0[21].w;
            }
            float _272 = _264;
            _158 = _272;
            _160 = true;
        }
    }
    else
    {
        int _274 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _276 = _274 != 0;
        _136 = _276;
        if (_276)
        {
            _118 = _41;
        }
        float _278 = _118;
        float _280 = _278;
        _142 = _278;
        if (_276)
        {
            _120 = 1.0;
        }
        float _282 = _120;
        float _284 = _282;
        _152 = _282;
        if (_276)
        {
            _122 = _43;
        }
        float _286 = _122;
        _146 = _286;
        if (_276)
        {
            _124 = 1.0;
        }
        float _288 = _124;
        _158 = _288;
        if (!_276)
        {
            float _290 = trunc(_41);
            int _292 = int(_290);
            float _294 = trunc(_43);
            int _296 = int(_294);
            int _298 = _296 << 1;
            int _300 = _298 + _292;
            int _302 = _300 << 4;
            uint _305 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
            bool _307 = _302 == 0;
            bool _309 = _302 == 16;
            bool _311 = _302 == 32;
            bool _313 = _302 == 48;
            int _315 = int(_305) & 15;
            bool _317 = _315 != 13;
            float _319 = as_type<float>(_292);
            float _321 = as_type<float>(_296);
            float _323 = as_type<float>(_302);
            float _325 = as_type<float>(_315);
            if (_307)
            {
                _280 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _327 = _280;
            float _329 = _327;
            if (_307)
            {
                _319 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _331 = _319;
            float _333 = _331;
            if (_307)
            {
                _321 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _335 = _321;
            float _337 = _335;
            if (_309)
            {
                _333 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _339 = _333;
            float _341 = _339;
            if (_309)
            {
                _337 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _343 = _337;
            float _345 = _343;
            if (_311)
            {
                _341 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _347 = _341;
            float _349 = _347;
            if (_311)
            {
                _345 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _351 = _345;
            _126 = _351;
            if (_313)
            {
                _349 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _353 = _349;
            float _355 = _353;
            if (_307)
            {
                _284 = (*spvDescriptorSet0.vp_c3)._m0[14].w;
            }
            float _357 = _284;
            float _359 = _357;
            if (_307)
            {
                _323 = (*spvDescriptorSet0.vp_c3)._m0[18].w;
            }
            float _361 = _323;
            float _363 = _361;
            if (!_317)
            {
                _325 = _353;
            }
            float _365 = _325;
            float _367 = _365;
            if (_317)
            {
                _367 = _353;
            }
            float _369 = _367;
            _146 = _369;
            if (_307)
            {
                _355 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _371 = _355;
            float _373 = _371;
            if (_309)
            {
                _329 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _375 = _329;
            float _377 = _375;
            if (_311)
            {
                _377 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _379 = _377;
            float _381 = _379;
            if (_309)
            {
                _359 = (*spvDescriptorSet0.vp_c3)._m0[15].w;
            }
            float _383 = _359;
            float _385 = _383;
            if (_309)
            {
                _373 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _387 = _373;
            float _389 = _387;
            if (_309)
            {
                _363 = (*spvDescriptorSet0.vp_c3)._m0[19].w;
            }
            float _391 = _363;
            float _393 = _391;
            if (_311)
            {
                _385 = (*spvDescriptorSet0.vp_c3)._m0[16].w;
            }
            float _395 = _385;
            float _397 = _395;
            if (_311)
            {
                _389 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _399 = _389;
            float _401 = _399;
            if (_311)
            {
                _393 = (*spvDescriptorSet0.vp_c3)._m0[20].w;
            }
            float _403 = _393;
            float _405 = _403;
            if (_313)
            {
                _405 = (*spvDescriptorSet0.vp_c3)._m0[21].w;
            }
            float _407 = _405;
            _158 = _407;
            if (_313)
            {
                _381 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _409 = _381;
            _142 = _409;
            if (_313)
            {
                _397 = (*spvDescriptorSet0.vp_c3)._m0[17].w;
            }
            float _411 = _397;
            _152 = _411;
            if (_313)
            {
                _401 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _413 = _401;
            _128 = _413;
            if (_313)
            {
                _126 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
        }
    }
    _160 = false;
    float _415 = _126;
    float _417 = _128;
    float _419 = _146;
    float _421 = _142;
    float _423 = _152;
    bool _425 = _136;
    float _427 = _158;
    bool _429 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _431 = !_429;
    float _433 = _419;
    float _435 = _415;
    float _437 = _417;
    float _439 = _421;
    float _441 = _419;
    float _443 = _415;
    float _445 = _417;
    float _465;
    int _467;
    float _469;
    if (!_431)
    {
        float _447 = _47 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _449 = _47 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _451 = _47 * (*spvDescriptorSet0.vp_c3)._m0[17].y;
        float _453 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[14].x, _447);
        float _455 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[15].x, _449);
        float _457 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[17].x, _451);
        float _459 = _453 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _461 = _455 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        float _463 = _457 + (*spvDescriptorSet0.vp_c3)._m0[17].w;
        _465 = _461;
        _467 = as_type<int>(_463);
        _469 = _459;
        _471 = true;
    }
    else
    {
        int _473 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _475 = _473 != 0;
        if (!_475)
        {
            _433 = _421;
        }
        float _477 = _433;
        _469 = _477;
        if (!_475)
        {
            _435 = _419;
        }
        float _479 = _435;
        float _481 = _479;
        _465 = _479;
        if (!_475)
        {
            _437 = _423;
        }
        float _483 = _437;
        bool _485 = !_475;
        float _487 = _483;
        _467 = as_type<int>(_483);
        if (!_485)
        {
            if (!_425)
            {
                _481 = _421;
            }
            float _489 = _481;
            float _491 = _489;
            float _493 = _489;
            if (!_425)
            {
                _487 = _419;
            }
            float _495 = _487;
            bool _497 = !_425;
            float _499 = _495;
            float _501 = _495;
            if (!_497)
            {
                int _503 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _505 = _503 != 0;
                int _507 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _509 = _507 != 0;
                int _511 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _513 = _511 != 0;
                int _515 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _517 = _515 != 0;
                int _519 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _521 = _519 != 0;
                if (_505)
                {
                    _491 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _523 = _491;
                float _525 = _523;
                if (_505)
                {
                    _499 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _527 = _499;
                float _529 = _527;
                if (!_505)
                {
                    _525 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _531 = _525;
                if (!_505)
                {
                    _529 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _533 = _529;
                float _535 = _531 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _537 = _533 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_517)
                {
                    float _539 = _535 * _421;
                    _439 = _539;
                }
                float _541 = _439;
                float _543 = -_535;
                float _545 = _543 + 1.0;
                float _547 = _541;
                if (_521)
                {
                    float _549 = _537 * _419;
                    _441 = _549;
                }
                float _551 = _441;
                float _553 = -_537;
                float _555 = _553 + 1.0;
                float _557 = _551;
                if (_509)
                {
                    float _559 = _541 + _545;
                    _547 = _559;
                }
                float _561 = _547;
                if (_513)
                {
                    float _563 = _551 + _555;
                    _557 = _563;
                }
                float _565 = _557;
                _501 = _565;
                _493 = _561;
            }
            float _567 = _501;
            float _569 = _493;
            int _571 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _573 = _571 != 0;
            int _575 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _577 = _575 != 0;
            int _579 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _581 = _579 != 0;
            int _583 = as_type<int>(_569);
            int _585 = as_type<int>(_567);
            _467 = as_type<int>(_423);
            if (_577)
            {
                float _587 = -_569;
                float _589 = _587 + 1.0;
                _583 = as_type<int>(_589);
            }
            int _591 = _583;
            if (_581)
            {
                float _593 = -_567;
                float _595 = _593 + 1.0;
                _585 = as_type<int>(_595);
            }
            int _597 = _585;
            bool _599 = !_573;
            float _601 = _599 ? as_type<float>(_591) : as_type<float>(_597);
            bool _603 = !_573;
            float _605 = _603 ? as_type<float>(_597) : as_type<float>(_591);
            _465 = _605;
            _469 = _601;
        }
    }
    _471 = false;
    float _607 = _465;
    int _609 = _467;
    float _611 = _469;
    float _613 = _607 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _615 = _607 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    out.m_25.w = as_type<float>(_609);
    bool _617 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _619 = fma(_611, (*spvDescriptorSet0.vp_c3)._m0[8].x, _613);
    float _621 = fma(_611, (*spvDescriptorSet0.vp_c3)._m0[7].x, _615);
    float _623 = _619 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _625 = _621 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _627 = -_623;
    float _629 = _627 + 1.0;
    out.m_25.x = _625;
    out.m_25.y = _629;
    bool _631 = !_617;
    float _633 = _607;
    float _635 = as_type<float>(_609);
    float _655;
    int _657;
    float _659;
    if (!_631)
    {
        float _637 = _47 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _639 = _47 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _641 = _47 * (*spvDescriptorSet0.vp_c3)._m0[21].y;
        float _643 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[18].x, _637);
        float _645 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[19].x, _639);
        float _647 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[21].x, _641);
        float _649 = _643 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _651 = _645 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        float _653 = _647 + (*spvDescriptorSet0.vp_c3)._m0[21].w;
        _655 = _651;
        _657 = as_type<int>(_653);
        _659 = _649;
        _661 = true;
    }
    else
    {
        int _663 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _665 = _663 != 0;
        if (!_665)
        {
            _130 = _417;
        }
        float _667 = _130;
        _659 = _667;
        if (!_665)
        {
            _633 = _415;
        }
        float _669 = _633;
        float _671 = _669;
        _655 = _669;
        if (!_665)
        {
            _635 = _427;
        }
        float _673 = _635;
        bool _675 = !_665;
        float _677 = _673;
        _657 = as_type<int>(_673);
        if (!_675)
        {
            if (!_425)
            {
                _671 = _417;
            }
            float _679 = _671;
            float _681 = _679;
            float _683 = _679;
            if (!_425)
            {
                _677 = _415;
            }
            float _685 = _677;
            bool _687 = !_425;
            float _689 = _685;
            int _691 = as_type<int>(_685);
            if (!_687)
            {
                int _693 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _695 = _693 != 0;
                int _697 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _699 = _697 != 0;
                int _701 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _703 = _701 != 0;
                int _705 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _707 = _705 != 0;
                int _709 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _711 = _709 != 0;
                if (_695)
                {
                    _681 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _713 = _681;
                float _715 = _713;
                if (_695)
                {
                    _689 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _717 = _689;
                float _719 = _717;
                if (!_695)
                {
                    _719 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _721 = _719;
                if (!_695)
                {
                    _715 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _723 = _715;
                float _725 = _721 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _727 = _723 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                if (_711)
                {
                    float _729 = _725 * _415;
                    _443 = _729;
                }
                float _731 = _443;
                float _733 = -_725;
                float _735 = _733 + 1.0;
                int _737 = as_type<int>(_731);
                if (_707)
                {
                    float _739 = _727 * _417;
                    _445 = _739;
                }
                float _741 = _445;
                float _743 = -_727;
                float _745 = _743 + 1.0;
                float _747 = _741;
                if (_703)
                {
                    float _749 = _731 + _735;
                    _737 = as_type<int>(_749);
                }
                int _751 = _737;
                if (_699)
                {
                    float _753 = _741 + _745;
                    _747 = _753;
                }
                float _755 = _747;
                _691 = _751;
                _683 = _755;
            }
            int _757 = _691;
            float _759 = _683;
            int _761 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _763 = _761 != 0;
            int _765 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _767 = _765 != 0;
            int _769 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _771 = _769 != 0;
            int _773 = as_type<int>(_759);
            int _775 = _757;
            _657 = as_type<int>(_427);
            if (_767)
            {
                float _777 = -_759;
                float _779 = _777 + 1.0;
                _773 = as_type<int>(_779);
            }
            int _781 = _773;
            if (_771)
            {
                float _783 = -as_type<float>(_757);
                float _785 = _783 + 1.0;
                _775 = as_type<int>(_785);
            }
            int _787 = _775;
            bool _789 = !_763;
            float _791 = _789 ? as_type<float>(_781) : as_type<float>(_787);
            bool _793 = !_763;
            float _795 = _793 ? as_type<float>(_787) : as_type<float>(_781);
            _655 = _795;
            _659 = _791;
        }
    }
    _661 = false;
    float _797 = _655;
    int _799 = _657;
    float _801 = _659;
    float _803 = _797 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _805 = _797 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    out.m_27.w = as_type<float>(_799);
    float _807 = fma(_801, (*spvDescriptorSet0.vp_c3)._m0[10].x, _803);
    float _809 = fma(_801, (*spvDescriptorSet0.vp_c3)._m0[9].x, _805);
    float _811 = _807 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _813 = _809 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _815 = -_811;
    float _817 = _815 + 1.0;
    out.m_27.x = _813;
    out.m_27.y = _817;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    bool _661 = false;
    bool _471 = false;
    bool _160 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _41 = in.m_22.x;
    float _43 = in.m_22.y;
    float _45 = -_43;
    float _47 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[33].y, (*spvDescriptorSet0.vp_c3)._m0[33].w);
    float _49 = fma(_41, (*spvDescriptorSet0.vp_c3)._m0[33].x, (*spvDescriptorSet0.vp_c3)._m0[33].z);
    float _51 = _47 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _53 = _47 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _55 = _47 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _57 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[5].x, _51);
    float _59 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[4].x, _53);
    float _61 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[6].x, _55);
    float _63 = _57 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _65 = _59 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _67 = _61 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _69 = _63 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _71 = _63 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _73 = _63 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _75 = _63 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _77 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[0].x, _69);
    float _79 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[1].x, _71);
    float _81 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[2].x, _73);
    float _83 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[3].x, _75);
    float _85 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[0].z, _77);
    float _87 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[1].z, _79);
    float _89 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[2].z, _81);
    float _91 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[3].z, _83);
    float _93 = _85 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _95 = _87 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _97 = _89 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _99 = _91 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _93;
    out.gl_Position.y = _95;
    out.gl_Position.z = _97;
    out.gl_Position.w = _99;
    int _102 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1073741824;
    bool _106 = _102 != 0;
    bool _108 = !_106;
    float _110 = _93;
    float _112 = _85;
    float _114 = _87;
    float _116 = _63;
    float _118 = _93;
    float _120 = _87;
    float _122 = _85;
    float _124 = _63;
    float _126 = _43;
    float _128 = _41;
    float _130 = _47;
    bool _136;
    float _142;
    float _146;
    float _152;
    float _158;
    if (!_108)
    {
        int _132 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _134 = _132 != 0;
        _136 = _134;
        if (_134)
        {
            _110 = _41;
        }
        float _138 = _110;
        float _140 = _138;
        _142 = _138;
        if (_134)
        {
            _112 = _43;
        }
        float _144 = _112;
        _146 = _144;
        if (_134)
        {
            _114 = 1.0;
        }
        float _148 = _114;
        float _150 = _148;
        _152 = _148;
        if (_134)
        {
            _116 = 1.0;
        }
        float _154 = _116;
        float _156 = _154;
        _158 = _154;
        _160 = _134;
        if (!_160)
        {
            float _162 = trunc(_41);
            int _164 = int(_162);
            float _166 = trunc(_43);
            int _168 = int(_166);
            int _170 = _168 * 2;
            int _172 = _170 + _164;
            int _174 = _172 << 4;
            bool _176 = _174 == 0;
            bool _178 = _174 == 16;
            bool _180 = _174 == 32;
            bool _182 = _174 == 48;
            float _184 = as_type<float>(_174);
            float _186 = as_type<float>(_164);
            float _188 = as_type<float>(_168);
            if (_176)
            {
                _140 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _190 = _140;
            float _192 = _190;
            if (_176)
            {
                _150 = (*spvDescriptorSet0.vp_c3)._m0[14].w;
            }
            float _194 = _150;
            float _196 = _194;
            if (_176)
            {
                _184 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _198 = _184;
            float _200 = _198;
            if (_178)
            {
                _192 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _202 = _192;
            float _204 = _202;
            if (_176)
            {
                _186 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _206 = _186;
            float _208 = _206;
            if (_176)
            {
                _188 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _210 = _188;
            float _212 = _210;
            if (_178)
            {
                _212 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _214 = _212;
            float _216 = _214;
            if (_176)
            {
                _156 = (*spvDescriptorSet0.vp_c3)._m0[18].w;
            }
            float _218 = _156;
            float _220 = _218;
            if (_178)
            {
                _200 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _222 = _200;
            float _224 = _222;
            if (_178)
            {
                _196 = (*spvDescriptorSet0.vp_c3)._m0[15].w;
            }
            float _226 = _196;
            float _228 = _226;
            if (_180)
            {
                _228 = (*spvDescriptorSet0.vp_c3)._m0[16].w;
            }
            float _230 = _228;
            float _232 = _230;
            if (_178)
            {
                _208 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _234 = _208;
            float _236 = _234;
            if (_178)
            {
                _220 = (*spvDescriptorSet0.vp_c3)._m0[19].w;
            }
            float _238 = _220;
            float _240 = _238;
            if (_180)
            {
                _204 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _242 = _204;
            float _244 = _242;
            if (_182)
            {
                _244 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _246 = _244;
            _142 = _246;
            if (_180)
            {
                _224 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _248 = _224;
            float _250 = _248;
            if (_180)
            {
                _236 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _252 = _236;
            float _254 = _252;
            if (_180)
            {
                _216 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _256 = _216;
            float _258 = _256;
            if (_182)
            {
                _258 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _260 = _258;
            _126 = _260;
            if (_180)
            {
                _240 = (*spvDescriptorSet0.vp_c3)._m0[20].w;
            }
            float _262 = _240;
            float _264 = _262;
            if (_182)
            {
                _250 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _266 = _250;
            _146 = _266;
            if (_182)
            {
                _232 = (*spvDescriptorSet0.vp_c3)._m0[17].w;
            }
            float _268 = _232;
            _152 = _268;
            if (_182)
            {
                _254 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _270 = _254;
            _128 = _270;
            if (_182)
            {
                _264 = (*spvDescriptorSet0.vp_c3)._m0[21].w;
            }
            float _272 = _264;
            _158 = _272;
            _160 = true;
        }
    }
    else
    {
        int _274 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _276 = _274 != 0;
        _136 = _276;
        if (_276)
        {
            _118 = _41;
        }
        float _278 = _118;
        float _280 = _278;
        _142 = _278;
        if (_276)
        {
            _120 = 1.0;
        }
        float _282 = _120;
        float _284 = _282;
        _152 = _282;
        if (_276)
        {
            _122 = _43;
        }
        float _286 = _122;
        _146 = _286;
        if (_276)
        {
            _124 = 1.0;
        }
        float _288 = _124;
        _158 = _288;
        if (!_276)
        {
            float _290 = trunc(_41);
            int _292 = int(_290);
            float _294 = trunc(_43);
            int _296 = int(_294);
            int _298 = _296 << 1;
            int _300 = _298 + _292;
            int _302 = _300 << 4;
            uint _305 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
            bool _307 = _302 == 0;
            bool _309 = _302 == 16;
            bool _311 = _302 == 32;
            bool _313 = _302 == 48;
            int _315 = int(_305) & 15;
            bool _317 = _315 != 13;
            float _319 = as_type<float>(_292);
            float _321 = as_type<float>(_296);
            float _323 = as_type<float>(_302);
            float _325 = as_type<float>(_315);
            if (_307)
            {
                _280 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _327 = _280;
            float _329 = _327;
            if (_307)
            {
                _319 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _331 = _319;
            float _333 = _331;
            if (_307)
            {
                _321 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _335 = _321;
            float _337 = _335;
            if (_309)
            {
                _333 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _339 = _333;
            float _341 = _339;
            if (_309)
            {
                _337 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _343 = _337;
            float _345 = _343;
            if (_311)
            {
                _341 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _347 = _341;
            float _349 = _347;
            if (_311)
            {
                _345 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _351 = _345;
            _126 = _351;
            if (_313)
            {
                _349 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _353 = _349;
            float _355 = _353;
            if (_307)
            {
                _284 = (*spvDescriptorSet0.vp_c3)._m0[14].w;
            }
            float _357 = _284;
            float _359 = _357;
            if (_307)
            {
                _323 = (*spvDescriptorSet0.vp_c3)._m0[18].w;
            }
            float _361 = _323;
            float _363 = _361;
            if (!_317)
            {
                _325 = _353;
            }
            float _365 = _325;
            float _367 = _365;
            if (_317)
            {
                _367 = _353;
            }
            float _369 = _367;
            _146 = _369;
            if (_307)
            {
                _355 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _371 = _355;
            float _373 = _371;
            if (_309)
            {
                _329 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _375 = _329;
            float _377 = _375;
            if (_311)
            {
                _377 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _379 = _377;
            float _381 = _379;
            if (_309)
            {
                _359 = (*spvDescriptorSet0.vp_c3)._m0[15].w;
            }
            float _383 = _359;
            float _385 = _383;
            if (_309)
            {
                _373 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _387 = _373;
            float _389 = _387;
            if (_309)
            {
                _363 = (*spvDescriptorSet0.vp_c3)._m0[19].w;
            }
            float _391 = _363;
            float _393 = _391;
            if (_311)
            {
                _385 = (*spvDescriptorSet0.vp_c3)._m0[16].w;
            }
            float _395 = _385;
            float _397 = _395;
            if (_311)
            {
                _389 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _399 = _389;
            float _401 = _399;
            if (_311)
            {
                _393 = (*spvDescriptorSet0.vp_c3)._m0[20].w;
            }
            float _403 = _393;
            float _405 = _403;
            if (_313)
            {
                _405 = (*spvDescriptorSet0.vp_c3)._m0[21].w;
            }
            float _407 = _405;
            _158 = _407;
            if (_313)
            {
                _381 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _409 = _381;
            _142 = _409;
            if (_313)
            {
                _397 = (*spvDescriptorSet0.vp_c3)._m0[17].w;
            }
            float _411 = _397;
            _152 = _411;
            if (_313)
            {
                _401 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _413 = _401;
            _128 = _413;
            if (_313)
            {
                _126 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
        }
    }
    _160 = false;
    float _415 = _126;
    float _417 = _128;
    float _419 = _146;
    float _421 = _142;
    float _423 = _152;
    bool _425 = _136;
    float _427 = _158;
    bool _429 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _431 = !_429;
    float _433 = _419;
    float _435 = _415;
    float _437 = _417;
    float _439 = _421;
    float _441 = _419;
    float _443 = _415;
    float _445 = _417;
    float _465;
    int _467;
    float _469;
    if (!_431)
    {
        float _447 = _47 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _449 = _47 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _451 = _47 * (*spvDescriptorSet0.vp_c3)._m0[17].y;
        float _453 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[14].x, _447);
        float _455 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[15].x, _449);
        float _457 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[17].x, _451);
        float _459 = _453 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _461 = _455 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        float _463 = _457 + (*spvDescriptorSet0.vp_c3)._m0[17].w;
        _465 = _461;
        _467 = as_type<int>(_463);
        _469 = _459;
        _471 = true;
    }
    else
    {
        int _473 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _475 = _473 != 0;
        if (!_475)
        {
            _433 = _421;
        }
        float _477 = _433;
        _469 = _477;
        if (!_475)
        {
            _435 = _419;
        }
        float _479 = _435;
        float _481 = _479;
        _465 = _479;
        if (!_475)
        {
            _437 = _423;
        }
        float _483 = _437;
        bool _485 = !_475;
        float _487 = _483;
        _467 = as_type<int>(_483);
        if (!_485)
        {
            if (!_425)
            {
                _481 = _421;
            }
            float _489 = _481;
            float _491 = _489;
            float _493 = _489;
            if (!_425)
            {
                _487 = _419;
            }
            float _495 = _487;
            bool _497 = !_425;
            float _499 = _495;
            float _501 = _495;
            if (!_497)
            {
                int _503 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _505 = _503 != 0;
                int _507 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _509 = _507 != 0;
                int _511 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _513 = _511 != 0;
                int _515 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _517 = _515 != 0;
                int _519 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _521 = _519 != 0;
                if (_505)
                {
                    _491 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _523 = _491;
                float _525 = _523;
                if (_505)
                {
                    _499 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _527 = _499;
                float _529 = _527;
                if (!_505)
                {
                    _525 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _531 = _525;
                if (!_505)
                {
                    _529 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _533 = _529;
                float _535 = _531 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _537 = _533 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_517)
                {
                    float _539 = _535 * _421;
                    _439 = _539;
                }
                float _541 = _439;
                float _543 = -_535;
                float _545 = _543 + 1.0;
                float _547 = _541;
                if (_521)
                {
                    float _549 = _537 * _419;
                    _441 = _549;
                }
                float _551 = _441;
                float _553 = -_537;
                float _555 = _553 + 1.0;
                float _557 = _551;
                if (_509)
                {
                    float _559 = _541 + _545;
                    _547 = _559;
                }
                float _561 = _547;
                if (_513)
                {
                    float _563 = _551 + _555;
                    _557 = _563;
                }
                float _565 = _557;
                _501 = _565;
                _493 = _561;
            }
            float _567 = _501;
            float _569 = _493;
            int _571 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _573 = _571 != 0;
            int _575 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _577 = _575 != 0;
            int _579 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _581 = _579 != 0;
            int _583 = as_type<int>(_569);
            int _585 = as_type<int>(_567);
            _467 = as_type<int>(_423);
            if (_577)
            {
                float _587 = -_569;
                float _589 = _587 + 1.0;
                _583 = as_type<int>(_589);
            }
            int _591 = _583;
            if (_581)
            {
                float _593 = -_567;
                float _595 = _593 + 1.0;
                _585 = as_type<int>(_595);
            }
            int _597 = _585;
            bool _599 = !_573;
            float _601 = _599 ? as_type<float>(_591) : as_type<float>(_597);
            bool _603 = !_573;
            float _605 = _603 ? as_type<float>(_597) : as_type<float>(_591);
            _465 = _605;
            _469 = _601;
        }
    }
    _471 = false;
    float _607 = _465;
    int _609 = _467;
    float _611 = _469;
    float _613 = _607 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _615 = _607 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    out.m_25.w = as_type<float>(_609);
    bool _617 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _619 = fma(_611, (*spvDescriptorSet0.vp_c3)._m0[8].x, _613);
    float _621 = fma(_611, (*spvDescriptorSet0.vp_c3)._m0[7].x, _615);
    float _623 = _619 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _625 = _621 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _627 = -_623;
    float _629 = _627 + 1.0;
    out.m_25.x = _625;
    out.m_25.y = _629;
    bool _631 = !_617;
    float _633 = _607;
    float _635 = as_type<float>(_609);
    float _655;
    int _657;
    float _659;
    if (!_631)
    {
        float _637 = _47 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _639 = _47 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _641 = _47 * (*spvDescriptorSet0.vp_c3)._m0[21].y;
        float _643 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[18].x, _637);
        float _645 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[19].x, _639);
        float _647 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[21].x, _641);
        float _649 = _643 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _651 = _645 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        float _653 = _647 + (*spvDescriptorSet0.vp_c3)._m0[21].w;
        _655 = _651;
        _657 = as_type<int>(_653);
        _659 = _649;
        _661 = true;
    }
    else
    {
        int _663 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _665 = _663 != 0;
        if (!_665)
        {
            _130 = _417;
        }
        float _667 = _130;
        _659 = _667;
        if (!_665)
        {
            _633 = _415;
        }
        float _669 = _633;
        float _671 = _669;
        _655 = _669;
        if (!_665)
        {
            _635 = _427;
        }
        float _673 = _635;
        bool _675 = !_665;
        float _677 = _673;
        _657 = as_type<int>(_673);
        if (!_675)
        {
            if (!_425)
            {
                _671 = _417;
            }
            float _679 = _671;
            float _681 = _679;
            float _683 = _679;
            if (!_425)
            {
                _677 = _415;
            }
            float _685 = _677;
            bool _687 = !_425;
            float _689 = _685;
            int _691 = as_type<int>(_685);
            if (!_687)
            {
                int _693 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _695 = _693 != 0;
                int _697 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _699 = _697 != 0;
                int _701 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _703 = _701 != 0;
                int _705 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _707 = _705 != 0;
                int _709 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _711 = _709 != 0;
                if (_695)
                {
                    _681 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _713 = _681;
                float _715 = _713;
                if (_695)
                {
                    _689 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _717 = _689;
                float _719 = _717;
                if (!_695)
                {
                    _719 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _721 = _719;
                if (!_695)
                {
                    _715 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _723 = _715;
                float _725 = _721 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _727 = _723 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                if (_711)
                {
                    float _729 = _725 * _415;
                    _443 = _729;
                }
                float _731 = _443;
                float _733 = -_725;
                float _735 = _733 + 1.0;
                int _737 = as_type<int>(_731);
                if (_707)
                {
                    float _739 = _727 * _417;
                    _445 = _739;
                }
                float _741 = _445;
                float _743 = -_727;
                float _745 = _743 + 1.0;
                float _747 = _741;
                if (_703)
                {
                    float _749 = _731 + _735;
                    _737 = as_type<int>(_749);
                }
                int _751 = _737;
                if (_699)
                {
                    float _753 = _741 + _745;
                    _747 = _753;
                }
                float _755 = _747;
                _691 = _751;
                _683 = _755;
            }
            int _757 = _691;
            float _759 = _683;
            int _761 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _763 = _761 != 0;
            int _765 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _767 = _765 != 0;
            int _769 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _771 = _769 != 0;
            int _773 = as_type<int>(_759);
            int _775 = _757;
            _657 = as_type<int>(_427);
            if (_767)
            {
                float _777 = -_759;
                float _779 = _777 + 1.0;
                _773 = as_type<int>(_779);
            }
            int _781 = _773;
            if (_771)
            {
                float _783 = -as_type<float>(_757);
                float _785 = _783 + 1.0;
                _775 = as_type<int>(_785);
            }
            int _787 = _775;
            bool _789 = !_763;
            float _791 = _789 ? as_type<float>(_781) : as_type<float>(_787);
            bool _793 = !_763;
            float _795 = _793 ? as_type<float>(_787) : as_type<float>(_781);
            _655 = _795;
            _659 = _791;
        }
    }
    _661 = false;
    float _797 = _655;
    int _799 = _657;
    float _801 = _659;
    float _803 = _797 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _805 = _797 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    out.m_27.w = as_type<float>(_799);
    float _807 = fma(_801, (*spvDescriptorSet0.vp_c3)._m0[10].x, _803);
    float _809 = fma(_801, (*spvDescriptorSet0.vp_c3)._m0[9].x, _805);
    float _811 = _807 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _813 = _809 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _815 = -_811;
    float _817 = _815 + 1.0;
    out.m_27.x = _813;
    out.m_27.y = _817;
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
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    bool _661 = false;
    bool _471 = false;
    bool _160 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _41 = in.m_22.x;
    float _43 = in.m_22.y;
    float _45 = -_43;
    float _47 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[33].y, (*spvDescriptorSet0.vp_c3)._m0[33].w);
    float _49 = fma(_41, (*spvDescriptorSet0.vp_c3)._m0[33].x, (*spvDescriptorSet0.vp_c3)._m0[33].z);
    float _51 = _47 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _53 = _47 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _55 = _47 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _57 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[5].x, _51);
    float _59 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[4].x, _53);
    float _61 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[6].x, _55);
    float _63 = _57 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _65 = _59 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _67 = _61 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _69 = _63 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _71 = _63 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _73 = _63 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _75 = _63 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _77 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[0].x, _69);
    float _79 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[1].x, _71);
    float _81 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[2].x, _73);
    float _83 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[3].x, _75);
    float _85 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[0].z, _77);
    float _87 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[1].z, _79);
    float _89 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[2].z, _81);
    float _91 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[3].z, _83);
    float _93 = _85 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _95 = _87 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _97 = _89 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _99 = _91 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _93;
    out.gl_Position.y = _95;
    out.gl_Position.z = _97;
    out.gl_Position.w = _99;
    int _102 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1073741824;
    bool _106 = _102 != 0;
    bool _108 = !_106;
    float _110 = _93;
    float _112 = _85;
    float _114 = _87;
    float _116 = _63;
    float _118 = _93;
    float _120 = _87;
    float _122 = _85;
    float _124 = _63;
    float _126 = _43;
    float _128 = _41;
    float _130 = _47;
    bool _136;
    float _142;
    float _146;
    float _152;
    float _158;
    if (!_108)
    {
        int _132 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _134 = _132 != 0;
        _136 = _134;
        if (_134)
        {
            _110 = _41;
        }
        float _138 = _110;
        float _140 = _138;
        _142 = _138;
        if (_134)
        {
            _112 = _43;
        }
        float _144 = _112;
        _146 = _144;
        if (_134)
        {
            _114 = 1.0;
        }
        float _148 = _114;
        float _150 = _148;
        _152 = _148;
        if (_134)
        {
            _116 = 1.0;
        }
        float _154 = _116;
        float _156 = _154;
        _158 = _154;
        _160 = _134;
        if (!_160)
        {
            float _162 = trunc(_41);
            int _164 = int(_162);
            float _166 = trunc(_43);
            int _168 = int(_166);
            int _170 = _168 * 2;
            int _172 = _170 + _164;
            int _174 = _172 << 4;
            bool _176 = _174 == 0;
            bool _178 = _174 == 16;
            bool _180 = _174 == 32;
            bool _182 = _174 == 48;
            float _184 = as_type<float>(_174);
            float _186 = as_type<float>(_164);
            float _188 = as_type<float>(_168);
            if (_176)
            {
                _140 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _190 = _140;
            float _192 = _190;
            if (_176)
            {
                _150 = (*spvDescriptorSet0.vp_c3)._m0[14].w;
            }
            float _194 = _150;
            float _196 = _194;
            if (_176)
            {
                _184 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _198 = _184;
            float _200 = _198;
            if (_178)
            {
                _192 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _202 = _192;
            float _204 = _202;
            if (_176)
            {
                _186 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _206 = _186;
            float _208 = _206;
            if (_176)
            {
                _188 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _210 = _188;
            float _212 = _210;
            if (_178)
            {
                _212 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _214 = _212;
            float _216 = _214;
            if (_176)
            {
                _156 = (*spvDescriptorSet0.vp_c3)._m0[18].w;
            }
            float _218 = _156;
            float _220 = _218;
            if (_178)
            {
                _200 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _222 = _200;
            float _224 = _222;
            if (_178)
            {
                _196 = (*spvDescriptorSet0.vp_c3)._m0[15].w;
            }
            float _226 = _196;
            float _228 = _226;
            if (_180)
            {
                _228 = (*spvDescriptorSet0.vp_c3)._m0[16].w;
            }
            float _230 = _228;
            float _232 = _230;
            if (_178)
            {
                _208 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _234 = _208;
            float _236 = _234;
            if (_178)
            {
                _220 = (*spvDescriptorSet0.vp_c3)._m0[19].w;
            }
            float _238 = _220;
            float _240 = _238;
            if (_180)
            {
                _204 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _242 = _204;
            float _244 = _242;
            if (_182)
            {
                _244 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _246 = _244;
            _142 = _246;
            if (_180)
            {
                _224 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _248 = _224;
            float _250 = _248;
            if (_180)
            {
                _236 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _252 = _236;
            float _254 = _252;
            if (_180)
            {
                _216 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _256 = _216;
            float _258 = _256;
            if (_182)
            {
                _258 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _260 = _258;
            _126 = _260;
            if (_180)
            {
                _240 = (*spvDescriptorSet0.vp_c3)._m0[20].w;
            }
            float _262 = _240;
            float _264 = _262;
            if (_182)
            {
                _250 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _266 = _250;
            _146 = _266;
            if (_182)
            {
                _232 = (*spvDescriptorSet0.vp_c3)._m0[17].w;
            }
            float _268 = _232;
            _152 = _268;
            if (_182)
            {
                _254 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _270 = _254;
            _128 = _270;
            if (_182)
            {
                _264 = (*spvDescriptorSet0.vp_c3)._m0[21].w;
            }
            float _272 = _264;
            _158 = _272;
            _160 = true;
        }
    }
    else
    {
        int _274 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _276 = _274 != 0;
        _136 = _276;
        if (_276)
        {
            _118 = _41;
        }
        float _278 = _118;
        float _280 = _278;
        _142 = _278;
        if (_276)
        {
            _120 = 1.0;
        }
        float _282 = _120;
        float _284 = _282;
        _152 = _282;
        if (_276)
        {
            _122 = _43;
        }
        float _286 = _122;
        _146 = _286;
        if (_276)
        {
            _124 = 1.0;
        }
        float _288 = _124;
        _158 = _288;
        if (!_276)
        {
            float _290 = trunc(_41);
            int _292 = int(_290);
            float _294 = trunc(_43);
            int _296 = int(_294);
            int _298 = _296 << 1;
            int _300 = _298 + _292;
            int _302 = _300 << 4;
            uint _305 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
            bool _307 = _302 == 0;
            bool _309 = _302 == 16;
            bool _311 = _302 == 32;
            bool _313 = _302 == 48;
            int _315 = int(_305) & 15;
            bool _317 = _315 != 13;
            float _319 = as_type<float>(_292);
            float _321 = as_type<float>(_296);
            float _323 = as_type<float>(_302);
            float _325 = as_type<float>(_315);
            if (_307)
            {
                _280 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _327 = _280;
            float _329 = _327;
            if (_307)
            {
                _319 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _331 = _319;
            float _333 = _331;
            if (_307)
            {
                _321 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _335 = _321;
            float _337 = _335;
            if (_309)
            {
                _333 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _339 = _333;
            float _341 = _339;
            if (_309)
            {
                _337 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _343 = _337;
            float _345 = _343;
            if (_311)
            {
                _341 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _347 = _341;
            float _349 = _347;
            if (_311)
            {
                _345 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _351 = _345;
            _126 = _351;
            if (_313)
            {
                _349 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _353 = _349;
            float _355 = _353;
            if (_307)
            {
                _284 = (*spvDescriptorSet0.vp_c3)._m0[14].w;
            }
            float _357 = _284;
            float _359 = _357;
            if (_307)
            {
                _323 = (*spvDescriptorSet0.vp_c3)._m0[18].w;
            }
            float _361 = _323;
            float _363 = _361;
            if (!_317)
            {
                _325 = _353;
            }
            float _365 = _325;
            float _367 = _365;
            if (_317)
            {
                _367 = _353;
            }
            float _369 = _367;
            _146 = _369;
            if (_307)
            {
                _355 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _371 = _355;
            float _373 = _371;
            if (_309)
            {
                _329 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _375 = _329;
            float _377 = _375;
            if (_311)
            {
                _377 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _379 = _377;
            float _381 = _379;
            if (_309)
            {
                _359 = (*spvDescriptorSet0.vp_c3)._m0[15].w;
            }
            float _383 = _359;
            float _385 = _383;
            if (_309)
            {
                _373 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _387 = _373;
            float _389 = _387;
            if (_309)
            {
                _363 = (*spvDescriptorSet0.vp_c3)._m0[19].w;
            }
            float _391 = _363;
            float _393 = _391;
            if (_311)
            {
                _385 = (*spvDescriptorSet0.vp_c3)._m0[16].w;
            }
            float _395 = _385;
            float _397 = _395;
            if (_311)
            {
                _389 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _399 = _389;
            float _401 = _399;
            if (_311)
            {
                _393 = (*spvDescriptorSet0.vp_c3)._m0[20].w;
            }
            float _403 = _393;
            float _405 = _403;
            if (_313)
            {
                _405 = (*spvDescriptorSet0.vp_c3)._m0[21].w;
            }
            float _407 = _405;
            _158 = _407;
            if (_313)
            {
                _381 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _409 = _381;
            _142 = _409;
            if (_313)
            {
                _397 = (*spvDescriptorSet0.vp_c3)._m0[17].w;
            }
            float _411 = _397;
            _152 = _411;
            if (_313)
            {
                _401 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _413 = _401;
            _128 = _413;
            if (_313)
            {
                _126 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
        }
    }
    _160 = false;
    float _415 = _126;
    float _417 = _128;
    float _419 = _146;
    float _421 = _142;
    float _423 = _152;
    bool _425 = _136;
    float _427 = _158;
    bool _429 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _431 = !_429;
    float _433 = _419;
    float _435 = _415;
    float _437 = _417;
    float _439 = _421;
    float _441 = _419;
    float _443 = _415;
    float _445 = _417;
    float _465;
    int _467;
    float _469;
    if (!_431)
    {
        float _447 = _47 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _449 = _47 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _451 = _47 * (*spvDescriptorSet0.vp_c3)._m0[17].y;
        float _453 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[14].x, _447);
        float _455 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[15].x, _449);
        float _457 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[17].x, _451);
        float _459 = _453 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _461 = _455 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        float _463 = _457 + (*spvDescriptorSet0.vp_c3)._m0[17].w;
        _465 = _461;
        _467 = as_type<int>(_463);
        _469 = _459;
        _471 = true;
    }
    else
    {
        int _473 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _475 = _473 != 0;
        if (!_475)
        {
            _433 = _421;
        }
        float _477 = _433;
        _469 = _477;
        if (!_475)
        {
            _435 = _419;
        }
        float _479 = _435;
        float _481 = _479;
        _465 = _479;
        if (!_475)
        {
            _437 = _423;
        }
        float _483 = _437;
        bool _485 = !_475;
        float _487 = _483;
        _467 = as_type<int>(_483);
        if (!_485)
        {
            if (!_425)
            {
                _481 = _421;
            }
            float _489 = _481;
            float _491 = _489;
            float _493 = _489;
            if (!_425)
            {
                _487 = _419;
            }
            float _495 = _487;
            bool _497 = !_425;
            float _499 = _495;
            float _501 = _495;
            if (!_497)
            {
                int _503 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _505 = _503 != 0;
                int _507 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _509 = _507 != 0;
                int _511 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _513 = _511 != 0;
                int _515 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _517 = _515 != 0;
                int _519 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _521 = _519 != 0;
                if (_505)
                {
                    _491 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _523 = _491;
                float _525 = _523;
                if (_505)
                {
                    _499 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _527 = _499;
                float _529 = _527;
                if (!_505)
                {
                    _525 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _531 = _525;
                if (!_505)
                {
                    _529 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _533 = _529;
                float _535 = _531 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _537 = _533 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_517)
                {
                    float _539 = _535 * _421;
                    _439 = _539;
                }
                float _541 = _439;
                float _543 = -_535;
                float _545 = _543 + 1.0;
                float _547 = _541;
                if (_521)
                {
                    float _549 = _537 * _419;
                    _441 = _549;
                }
                float _551 = _441;
                float _553 = -_537;
                float _555 = _553 + 1.0;
                float _557 = _551;
                if (_509)
                {
                    float _559 = _541 + _545;
                    _547 = _559;
                }
                float _561 = _547;
                if (_513)
                {
                    float _563 = _551 + _555;
                    _557 = _563;
                }
                float _565 = _557;
                _501 = _565;
                _493 = _561;
            }
            float _567 = _501;
            float _569 = _493;
            int _571 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _573 = _571 != 0;
            int _575 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _577 = _575 != 0;
            int _579 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _581 = _579 != 0;
            int _583 = as_type<int>(_569);
            int _585 = as_type<int>(_567);
            _467 = as_type<int>(_423);
            if (_577)
            {
                float _587 = -_569;
                float _589 = _587 + 1.0;
                _583 = as_type<int>(_589);
            }
            int _591 = _583;
            if (_581)
            {
                float _593 = -_567;
                float _595 = _593 + 1.0;
                _585 = as_type<int>(_595);
            }
            int _597 = _585;
            bool _599 = !_573;
            float _601 = _599 ? as_type<float>(_591) : as_type<float>(_597);
            bool _603 = !_573;
            float _605 = _603 ? as_type<float>(_597) : as_type<float>(_591);
            _465 = _605;
            _469 = _601;
        }
    }
    _471 = false;
    float _607 = _465;
    int _609 = _467;
    float _611 = _469;
    float _613 = _607 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _615 = _607 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    out.m_25.w = as_type<float>(_609);
    bool _617 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _619 = fma(_611, (*spvDescriptorSet0.vp_c3)._m0[8].x, _613);
    float _621 = fma(_611, (*spvDescriptorSet0.vp_c3)._m0[7].x, _615);
    float _623 = _619 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _625 = _621 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _627 = -_623;
    float _629 = _627 + 1.0;
    out.m_25.x = _625;
    out.m_25.y = _629;
    bool _631 = !_617;
    float _633 = _607;
    float _635 = as_type<float>(_609);
    float _655;
    int _657;
    float _659;
    if (!_631)
    {
        float _637 = _47 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _639 = _47 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _641 = _47 * (*spvDescriptorSet0.vp_c3)._m0[21].y;
        float _643 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[18].x, _637);
        float _645 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[19].x, _639);
        float _647 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[21].x, _641);
        float _649 = _643 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _651 = _645 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        float _653 = _647 + (*spvDescriptorSet0.vp_c3)._m0[21].w;
        _655 = _651;
        _657 = as_type<int>(_653);
        _659 = _649;
        _661 = true;
    }
    else
    {
        int _663 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _665 = _663 != 0;
        if (!_665)
        {
            _130 = _417;
        }
        float _667 = _130;
        _659 = _667;
        if (!_665)
        {
            _633 = _415;
        }
        float _669 = _633;
        float _671 = _669;
        _655 = _669;
        if (!_665)
        {
            _635 = _427;
        }
        float _673 = _635;
        bool _675 = !_665;
        float _677 = _673;
        _657 = as_type<int>(_673);
        if (!_675)
        {
            if (!_425)
            {
                _671 = _417;
            }
            float _679 = _671;
            float _681 = _679;
            float _683 = _679;
            if (!_425)
            {
                _677 = _415;
            }
            float _685 = _677;
            bool _687 = !_425;
            float _689 = _685;
            int _691 = as_type<int>(_685);
            if (!_687)
            {
                int _693 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _695 = _693 != 0;
                int _697 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _699 = _697 != 0;
                int _701 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _703 = _701 != 0;
                int _705 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _707 = _705 != 0;
                int _709 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _711 = _709 != 0;
                if (_695)
                {
                    _681 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _713 = _681;
                float _715 = _713;
                if (_695)
                {
                    _689 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _717 = _689;
                float _719 = _717;
                if (!_695)
                {
                    _719 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _721 = _719;
                if (!_695)
                {
                    _715 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _723 = _715;
                float _725 = _721 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _727 = _723 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                if (_711)
                {
                    float _729 = _725 * _415;
                    _443 = _729;
                }
                float _731 = _443;
                float _733 = -_725;
                float _735 = _733 + 1.0;
                int _737 = as_type<int>(_731);
                if (_707)
                {
                    float _739 = _727 * _417;
                    _445 = _739;
                }
                float _741 = _445;
                float _743 = -_727;
                float _745 = _743 + 1.0;
                float _747 = _741;
                if (_703)
                {
                    float _749 = _731 + _735;
                    _737 = as_type<int>(_749);
                }
                int _751 = _737;
                if (_699)
                {
                    float _753 = _741 + _745;
                    _747 = _753;
                }
                float _755 = _747;
                _691 = _751;
                _683 = _755;
            }
            int _757 = _691;
            float _759 = _683;
            int _761 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _763 = _761 != 0;
            int _765 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _767 = _765 != 0;
            int _769 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _771 = _769 != 0;
            int _773 = as_type<int>(_759);
            int _775 = _757;
            _657 = as_type<int>(_427);
            if (_767)
            {
                float _777 = -_759;
                float _779 = _777 + 1.0;
                _773 = as_type<int>(_779);
            }
            int _781 = _773;
            if (_771)
            {
                float _783 = -as_type<float>(_757);
                float _785 = _783 + 1.0;
                _775 = as_type<int>(_785);
            }
            int _787 = _775;
            bool _789 = !_763;
            float _791 = _789 ? as_type<float>(_781) : as_type<float>(_787);
            bool _793 = !_763;
            float _795 = _793 ? as_type<float>(_787) : as_type<float>(_781);
            _655 = _795;
            _659 = _791;
        }
    }
    _661 = false;
    float _797 = _655;
    int _799 = _657;
    float _801 = _659;
    float _803 = _797 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _805 = _797 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    out.m_27.w = as_type<float>(_799);
    float _807 = fma(_801, (*spvDescriptorSet0.vp_c3)._m0[10].x, _803);
    float _809 = fma(_801, (*spvDescriptorSet0.vp_c3)._m0[9].x, _805);
    float _811 = _807 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _813 = _809 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _815 = -_811;
    float _817 = _815 + 1.0;
    out.m_27.x = _813;
    out.m_27.y = _817;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_25.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_25.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_25.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_25.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_27.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_27.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_27.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_27.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

