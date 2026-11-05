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
    float4 m_29 [[user(locn3)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
    float4 dm_pad0 [[user(locn0)]];
};

struct main0_in
{
    float4 m_22 [[attribute(0)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad0 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    bool _823 = false;
    bool _653 = false;
    bool _475 = false;
    bool _172 = false;
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
    float _112 = _97;
    float _114 = _95;
    float _116 = _65;
    float _118 = _89;
    float _120 = _67;
    float _122 = _97;
    float _124 = _95;
    float _126 = _65;
    float _128 = _89;
    float _130 = _67;
    float _132 = _45;
    float _134 = _49;
    float _136 = _51;
    bool _142;
    float _148;
    float _154;
    float _160;
    float _166;
    float _170;
    if (!_110)
    {
        int _138 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _140 = _138 != 0;
        _142 = _140;
        if (_140)
        {
            _112 = _43;
        }
        float _144 = _112;
        float _146 = _144;
        _148 = _144;
        if (_140)
        {
            _114 = _45;
        }
        float _150 = _114;
        float _152 = _150;
        _154 = _150;
        if (_140)
        {
            _116 = _43;
        }
        float _156 = _116;
        float _158 = _156;
        _160 = _156;
        if (_140)
        {
            _118 = _45;
        }
        float _162 = _118;
        float _164 = _162;
        _166 = _162;
        if (_140)
        {
            _120 = _43;
        }
        float _168 = _120;
        _170 = _168;
        _172 = _140;
        if (!_172)
        {
            float _174 = trunc(_43);
            int _176 = int(_174);
            float _178 = trunc(_45);
            int _180 = int(_178);
            int _182 = _180 << 1;
            int _184 = _182 + _176;
            int _186 = _184 * 16;
            bool _188 = _186 == 0;
            bool _190 = _186 == 16;
            bool _192 = _186 == 32;
            bool _194 = _186 == 48;
            float _196 = as_type<float>(_186);
            float _198 = as_type<float>(_180);
            if (_188)
            {
                _146 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _200 = _146;
            float _202 = _200;
            if (_188)
            {
                _196 = (*spvDescriptorSet0.vp_c3)._m0[22].x;
            }
            float _204 = _196;
            float _206 = _204;
            if (_188)
            {
                _152 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _208 = _152;
            float _210 = _208;
            if (_188)
            {
                _158 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _212 = _158;
            float _214 = _212;
            if (_188)
            {
                _164 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _216 = _164;
            float _218 = _216;
            if (_190)
            {
                _218 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _220 = _218;
            float _222 = _220;
            if (_188)
            {
                _198 = (*spvDescriptorSet0.vp_c3)._m0[22].y;
            }
            float _224 = _198;
            float _226 = _224;
            if (_190)
            {
                _202 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _228 = _202;
            float _230 = _228;
            if (_190)
            {
                _210 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _232 = _210;
            float _234 = _232;
            if (_190)
            {
                _214 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _236 = _214;
            float _238 = _236;
            if (_192)
            {
                _238 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _240 = _238;
            float _242 = _240;
            if (_190)
            {
                _206 = (*spvDescriptorSet0.vp_c3)._m0[23].x;
            }
            float _244 = _206;
            float _246 = _244;
            if (_190)
            {
                _226 = (*spvDescriptorSet0.vp_c3)._m0[23].y;
            }
            float _248 = _226;
            float _250 = _248;
            if (_192)
            {
                _230 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _252 = _230;
            float _254 = _252;
            if (_192)
            {
                _234 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _256 = _234;
            float _258 = _256;
            if (_194)
            {
                _258 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _260 = _258;
            _154 = _260;
            if (_192)
            {
                _222 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _262 = _222;
            float _264 = _262;
            if (_192)
            {
                _246 = (*spvDescriptorSet0.vp_c3)._m0[24].x;
            }
            float _266 = _246;
            float _268 = _266;
            if (_192)
            {
                _250 = (*spvDescriptorSet0.vp_c3)._m0[24].y;
            }
            float _270 = _250;
            float _272 = _270;
            if (_194)
            {
                _254 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _274 = _254;
            _148 = _274;
            if (_194)
            {
                _242 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _276 = _242;
            _160 = _276;
            if (_194)
            {
                _264 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _278 = _264;
            _166 = _278;
            if (_194)
            {
                _268 = (*spvDescriptorSet0.vp_c3)._m0[25].x;
            }
            float _280 = _268;
            _170 = _280;
            if (_194)
            {
                _272 = (*spvDescriptorSet0.vp_c3)._m0[25].y;
            }
            float _282 = _272;
            _132 = _282;
            _172 = true;
        }
    }
    else
    {
        int _284 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _286 = _284 != 0;
        _142 = _286;
        if (_286)
        {
            _122 = _43;
        }
        float _288 = _122;
        float _290 = _288;
        _148 = _288;
        if (_286)
        {
            _124 = _45;
        }
        float _292 = _124;
        float _294 = _292;
        _154 = _292;
        if (_286)
        {
            _126 = _43;
        }
        float _296 = _126;
        float _298 = _296;
        _160 = _296;
        if (_286)
        {
            _128 = _45;
        }
        float _300 = _128;
        _166 = _300;
        if (_286)
        {
            _130 = _43;
        }
        float _302 = _130;
        _170 = _302;
        if (!_286)
        {
            float _304 = trunc(_43);
            int _306 = int(_304);
            float _308 = trunc(_45);
            int _310 = int(_308);
            int _312 = _310 * 2;
            int _314 = _312 + _306;
            int _316 = _314 << 4;
            uint _319 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
            bool _321 = _316 == 0;
            bool _323 = _316 == 16;
            bool _325 = _316 == 32;
            bool _327 = _316 == 48;
            int _329 = int(_319) & 15;
            float _331 = as_type<float>(_316);
            float _333 = as_type<float>(_329);
            float _335 = as_type<float>(_310);
            if (_321)
            {
                _298 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _337 = _298;
            float _339 = _337;
            if (_321)
            {
                _290 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _341 = _290;
            float _343 = _341;
            if (_321)
            {
                _294 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _345 = _294;
            float _347 = _345;
            if (_323)
            {
                _347 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _349 = _347;
            float _351 = _349;
            if (_321)
            {
                _331 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _353 = _331;
            float _355 = _353;
            if (_323)
            {
                _355 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _357 = _355;
            float _359 = _357;
            if (_321)
            {
                _333 = (*spvDescriptorSet0.vp_c3)._m0[22].x;
            }
            float _361 = _333;
            float _363 = _361;
            if (_321)
            {
                _335 = (*spvDescriptorSet0.vp_c3)._m0[22].y;
            }
            float _365 = _335;
            float _367 = _365;
            if (_323)
            {
                _343 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _369 = _343;
            float _371 = _369;
            if (_323)
            {
                _339 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _373 = _339;
            float _375 = _373;
            if (_323)
            {
                _363 = (*spvDescriptorSet0.vp_c3)._m0[23].x;
            }
            float _377 = _363;
            float _379 = _377;
            if (_323)
            {
                _367 = (*spvDescriptorSet0.vp_c3)._m0[23].y;
            }
            float _381 = _367;
            float _383 = _381;
            if (_325)
            {
                _383 = (*spvDescriptorSet0.vp_c3)._m0[24].y;
            }
            float _385 = _383;
            _132 = _385;
            if (_325)
            {
                _371 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _387 = _371;
            float _389 = _387;
            if (_325)
            {
                _351 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _391 = _351;
            float _393 = _391;
            if (_325)
            {
                _375 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _395 = _375;
            float _397 = _395;
            if (_325)
            {
                _359 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _399 = _359;
            float _401 = _399;
            if (_325)
            {
                _379 = (*spvDescriptorSet0.vp_c3)._m0[24].x;
            }
            float _403 = _379;
            float _405 = _403;
            if (_327)
            {
                _389 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _407 = _389;
            _148 = _407;
            if (_327)
            {
                _393 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _409 = _393;
            _154 = _409;
            if (_327)
            {
                _397 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _411 = _397;
            _160 = _411;
            if (_327)
            {
                _401 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _413 = _401;
            _166 = _413;
            if (_327)
            {
                _405 = (*spvDescriptorSet0.vp_c3)._m0[25].x;
            }
            float _415 = _405;
            _170 = _415;
            if (_327)
            {
                _132 = (*spvDescriptorSet0.vp_c3)._m0[25].y;
            }
        }
    }
    _172 = false;
    float _417 = _132;
    float _419 = _170;
    float _421 = _166;
    float _423 = _160;
    float _425 = _148;
    float _427 = _154;
    bool _429 = _142;
    bool _431 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _433 = !_431;
    float _435 = _421;
    float _437 = _419;
    float _439 = _425;
    float _441 = _427;
    float _443 = _423;
    float _445 = _421;
    float _447 = _419;
    float _449 = _417;
    int _451 = as_type<int>(_419);
    float _453 = _417;
    float _455 = _417;
    float _457 = _419;
    float _471;
    float _473;
    if (!_433)
    {
        float _459 = _49 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _461 = _49 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _463 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[14].x, _459);
        float _465 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[15].x, _461);
        float _467 = _463 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _469 = _465 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _471 = _469;
        _473 = _467;
        _475 = true;
    }
    else
    {
        int _477 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _479 = _477 != 0;
        if (!_479)
        {
            _435 = _425;
        }
        float _481 = _435;
        float _483 = _481;
        _473 = _481;
        if (!_479)
        {
            _437 = _427;
        }
        float _485 = _437;
        bool _487 = !_479;
        float _489 = _485;
        _471 = _485;
        if (!_487)
        {
            if (!_429)
            {
                _483 = _425;
            }
            float _491 = _483;
            float _493 = _491;
            int _495 = as_type<int>(_491);
            if (!_429)
            {
                _489 = _427;
            }
            float _497 = _489;
            bool _499 = !_429;
            float _501 = _497;
            float _503 = _497;
            if (!_499)
            {
                int _505 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _507 = _505 != 0;
                int _509 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _511 = _509 != 0;
                int _513 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _515 = _513 != 0;
                int _517 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _519 = _517 != 0;
                int _521 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _523 = _521 != 0;
                if (_507)
                {
                    _493 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _525 = _493;
                float _527 = _525;
                if (_507)
                {
                    _501 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _529 = _501;
                float _531 = _529;
                if (!_507)
                {
                    _527 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _533 = _527;
                if (!_507)
                {
                    _531 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _535 = _531;
                float _537 = _533 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _539 = _535 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_519)
                {
                    float _541 = _537 * _425;
                    _439 = _541;
                }
                float _543 = _439;
                float _545 = -_537;
                float _547 = _545 + 1.0;
                int _549 = as_type<int>(_543);
                if (_523)
                {
                    float _551 = _539 * _427;
                    _441 = _551;
                }
                float _553 = _441;
                float _555 = -_539;
                float _557 = _555 + 1.0;
                float _559 = _553;
                if (_511)
                {
                    float _561 = _543 + _547;
                    _549 = as_type<int>(_561);
                }
                int _563 = _549;
                if (_515)
                {
                    float _565 = _553 + _557;
                    _559 = _565;
                }
                float _567 = _559;
                _495 = _563;
                _503 = _567;
            }
            int _569 = _495;
            float _571 = _503;
            int _573 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _575 = _573 != 0;
            int _577 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _579 = _577 != 0;
            int _581 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _583 = _581 != 0;
            int _585 = _569;
            int _587 = as_type<int>(_571);
            if (_579)
            {
                float _589 = -as_type<float>(_569);
                float _591 = _589 + 1.0;
                _585 = as_type<int>(_591);
            }
            int _593 = _585;
            if (_583)
            {
                float _595 = -_571;
                float _597 = _595 + 1.0;
                _587 = as_type<int>(_597);
            }
            int _599 = _587;
            bool _601 = !_575;
            float _603 = _601 ? as_type<float>(_593) : as_type<float>(_599);
            bool _605 = !_575;
            float _607 = _605 ? as_type<float>(_599) : as_type<float>(_593);
            _471 = _607;
            _473 = _603;
        }
    }
    _475 = false;
    float _609 = _471;
    float _611 = _473;
    float _613 = _609 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _615 = _609 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
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
    float _633 = _625;
    float _635 = _621;
    float _649;
    float _651;
    if (!_631)
    {
        float _637 = _49 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _639 = _49 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _641 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[18].x, _637);
        float _643 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[19].x, _639);
        float _645 = _641 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _647 = _643 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _649 = _647;
        _651 = _645;
        _653 = true;
    }
    else
    {
        int _655 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _657 = _655 != 0;
        if (!_657)
        {
            _633 = _423;
        }
        float _659 = _633;
        float _661 = _659;
        _651 = _659;
        if (!_657)
        {
            _635 = _421;
        }
        float _663 = _635;
        bool _665 = !_657;
        float _667 = _663;
        _649 = _663;
        if (!_665)
        {
            if (!_429)
            {
                _661 = _423;
            }
            float _669 = _661;
            float _671 = _669;
            float _673 = _669;
            if (!_429)
            {
                _667 = _421;
            }
            float _675 = _667;
            bool _677 = !_429;
            float _679 = _675;
            float _681 = _675;
            if (!_677)
            {
                int _683 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _685 = _683 != 0;
                int _687 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _689 = _687 != 0;
                int _691 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _693 = _691 != 0;
                int _695 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _697 = _695 != 0;
                int _699 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _701 = _699 != 0;
                if (_685)
                {
                    _671 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _703 = _671;
                float _705 = _703;
                if (_685)
                {
                    _679 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _707 = _679;
                float _709 = _707;
                if (!_685)
                {
                    _705 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _711 = _705;
                if (!_685)
                {
                    _709 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _713 = _709;
                float _715 = _711 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _717 = _713 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_697)
                {
                    float _719 = _715 * _423;
                    _443 = _719;
                }
                float _721 = _443;
                float _723 = -_715;
                float _725 = _723 + 1.0;
                float _727 = _721;
                if (_701)
                {
                    float _729 = _717 * _421;
                    _445 = _729;
                }
                float _731 = _445;
                float _733 = -_717;
                float _735 = _733 + 1.0;
                float _737 = _731;
                if (_689)
                {
                    float _739 = _721 + _725;
                    _727 = _739;
                }
                float _741 = _727;
                if (_693)
                {
                    float _743 = _731 + _735;
                    _737 = _743;
                }
                float _745 = _737;
                _673 = _741;
                _681 = _745;
            }
            float _747 = _673;
            float _749 = _681;
            int _751 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _753 = _751 != 0;
            int _755 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _757 = _755 != 0;
            int _759 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _761 = _759 != 0;
            int _763 = as_type<int>(_747);
            int _765 = as_type<int>(_749);
            if (_757)
            {
                float _767 = -_747;
                float _769 = _767 + 1.0;
                _763 = as_type<int>(_769);
            }
            int _771 = _763;
            if (_761)
            {
                float _773 = -_749;
                float _775 = _773 + 1.0;
                _765 = as_type<int>(_775);
            }
            int _777 = _765;
            bool _779 = !_753;
            float _781 = _779 ? as_type<float>(_771) : as_type<float>(_777);
            bool _783 = !_753;
            float _785 = _783 ? as_type<float>(_777) : as_type<float>(_771);
            _649 = _785;
            _651 = _781;
        }
    }
    _653 = false;
    float _787 = _649;
    float _789 = _651;
    float _791 = _787 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _793 = _787 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    bool _795 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].z);
    float _797 = fma(_789, (*spvDescriptorSet0.vp_c3)._m0[10].x, _791);
    float _799 = fma(_789, (*spvDescriptorSet0.vp_c3)._m0[9].x, _793);
    float _801 = _797 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _803 = _799 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _805 = -_801;
    float _807 = _805 + 1.0;
    out.m_27.x = _803;
    out.m_27.y = _807;
    bool _809 = !_795;
    if (!_809)
    {
        float _811 = _49 * (*spvDescriptorSet0.vp_c3)._m0[22].y;
        float _813 = _49 * (*spvDescriptorSet0.vp_c3)._m0[23].y;
        float _815 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[22].x, _811);
        float _817 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[23].x, _813);
        float _819 = _815 + (*spvDescriptorSet0.vp_c3)._m0[22].w;
        float _821 = _817 + (*spvDescriptorSet0.vp_c3)._m0[23].w;
        _455 = _821;
        _457 = _819;
        _823 = true;
    }
    else
    {
        int _825 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _827 = _825 != 0;
        bool _829 = !_827;
        if (!_829)
        {
            bool _831 = !_429;
            if (!_831)
            {
                int _833 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _835 = _833 != 0;
                int _837 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _839 = _837 != 0;
                int _841 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _843 = _841 != 0;
                int _845 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _847 = _845 != 0;
                int _849 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _851 = _849 != 0;
                if (_835)
                {
                    _134 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _853 = _134;
                float _855 = _853;
                if (_835)
                {
                    _136 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _857 = _136;
                float _859 = _857;
                if (!_835)
                {
                    _855 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _861 = _855;
                if (!_835)
                {
                    _859 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _863 = _859;
                float _865 = _861 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _867 = _863 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_847)
                {
                    float _869 = _865 * _419;
                    _447 = _869;
                }
                float _871 = _447;
                float _873 = -_865;
                float _875 = _873 + 1.0;
                int _877 = as_type<int>(_871);
                if (_851)
                {
                    float _879 = _867 * _417;
                    _449 = _879;
                }
                float _881 = _449;
                float _883 = -_867;
                float _885 = _883 + 1.0;
                _453 = _881;
                if (_839)
                {
                    float _887 = _871 + _875;
                    _877 = as_type<int>(_887);
                }
                int _889 = _877;
                _451 = _889;
                if (_843)
                {
                    float _891 = _881 + _885;
                    _453 = _891;
                }
            }
            int _893 = _451;
            float _895 = _453;
            int _897 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _899 = _897 != 0;
            int _901 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _903 = _901 != 0;
            int _905 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _907 = _905 != 0;
            int _909 = _893;
            int _911 = as_type<int>(_895);
            if (_903)
            {
                float _913 = -as_type<float>(_893);
                float _915 = _913 + 1.0;
                _909 = as_type<int>(_915);
            }
            int _917 = _909;
            if (_907)
            {
                float _919 = -_895;
                float _921 = _919 + 1.0;
                _911 = as_type<int>(_921);
            }
            int _923 = _911;
            bool _925 = !_899;
            float _927 = _925 ? as_type<float>(_917) : as_type<float>(_923);
            bool _929 = !_899;
            float _931 = _929 ? as_type<float>(_923) : as_type<float>(_917);
            _455 = _931;
            _457 = _927;
        }
    }
    _823 = false;
    float _933 = _455;
    float _935 = _457;
    float _937 = _933 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _939 = _933 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _941 = fma(_935, (*spvDescriptorSet0.vp_c3)._m0[12].x, _937);
    float _943 = fma(_935, (*spvDescriptorSet0.vp_c3)._m0[11].x, _939);
    float _945 = _941 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _947 = _943 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _949 = -_945;
    float _951 = _949 + 1.0;
    out.m_29.x = _947;
    out.m_29.y = _951;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad0 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    bool _823 = false;
    bool _653 = false;
    bool _475 = false;
    bool _172 = false;
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
    float _112 = _97;
    float _114 = _95;
    float _116 = _65;
    float _118 = _89;
    float _120 = _67;
    float _122 = _97;
    float _124 = _95;
    float _126 = _65;
    float _128 = _89;
    float _130 = _67;
    float _132 = _45;
    float _134 = _49;
    float _136 = _51;
    bool _142;
    float _148;
    float _154;
    float _160;
    float _166;
    float _170;
    if (!_110)
    {
        int _138 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _140 = _138 != 0;
        _142 = _140;
        if (_140)
        {
            _112 = _43;
        }
        float _144 = _112;
        float _146 = _144;
        _148 = _144;
        if (_140)
        {
            _114 = _45;
        }
        float _150 = _114;
        float _152 = _150;
        _154 = _150;
        if (_140)
        {
            _116 = _43;
        }
        float _156 = _116;
        float _158 = _156;
        _160 = _156;
        if (_140)
        {
            _118 = _45;
        }
        float _162 = _118;
        float _164 = _162;
        _166 = _162;
        if (_140)
        {
            _120 = _43;
        }
        float _168 = _120;
        _170 = _168;
        _172 = _140;
        if (!_172)
        {
            float _174 = trunc(_43);
            int _176 = int(_174);
            float _178 = trunc(_45);
            int _180 = int(_178);
            int _182 = _180 << 1;
            int _184 = _182 + _176;
            int _186 = _184 * 16;
            bool _188 = _186 == 0;
            bool _190 = _186 == 16;
            bool _192 = _186 == 32;
            bool _194 = _186 == 48;
            float _196 = as_type<float>(_186);
            float _198 = as_type<float>(_180);
            if (_188)
            {
                _146 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _200 = _146;
            float _202 = _200;
            if (_188)
            {
                _196 = (*spvDescriptorSet0.vp_c3)._m0[22].x;
            }
            float _204 = _196;
            float _206 = _204;
            if (_188)
            {
                _152 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _208 = _152;
            float _210 = _208;
            if (_188)
            {
                _158 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _212 = _158;
            float _214 = _212;
            if (_188)
            {
                _164 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _216 = _164;
            float _218 = _216;
            if (_190)
            {
                _218 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _220 = _218;
            float _222 = _220;
            if (_188)
            {
                _198 = (*spvDescriptorSet0.vp_c3)._m0[22].y;
            }
            float _224 = _198;
            float _226 = _224;
            if (_190)
            {
                _202 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _228 = _202;
            float _230 = _228;
            if (_190)
            {
                _210 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _232 = _210;
            float _234 = _232;
            if (_190)
            {
                _214 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _236 = _214;
            float _238 = _236;
            if (_192)
            {
                _238 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _240 = _238;
            float _242 = _240;
            if (_190)
            {
                _206 = (*spvDescriptorSet0.vp_c3)._m0[23].x;
            }
            float _244 = _206;
            float _246 = _244;
            if (_190)
            {
                _226 = (*spvDescriptorSet0.vp_c3)._m0[23].y;
            }
            float _248 = _226;
            float _250 = _248;
            if (_192)
            {
                _230 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _252 = _230;
            float _254 = _252;
            if (_192)
            {
                _234 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _256 = _234;
            float _258 = _256;
            if (_194)
            {
                _258 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _260 = _258;
            _154 = _260;
            if (_192)
            {
                _222 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _262 = _222;
            float _264 = _262;
            if (_192)
            {
                _246 = (*spvDescriptorSet0.vp_c3)._m0[24].x;
            }
            float _266 = _246;
            float _268 = _266;
            if (_192)
            {
                _250 = (*spvDescriptorSet0.vp_c3)._m0[24].y;
            }
            float _270 = _250;
            float _272 = _270;
            if (_194)
            {
                _254 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _274 = _254;
            _148 = _274;
            if (_194)
            {
                _242 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _276 = _242;
            _160 = _276;
            if (_194)
            {
                _264 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _278 = _264;
            _166 = _278;
            if (_194)
            {
                _268 = (*spvDescriptorSet0.vp_c3)._m0[25].x;
            }
            float _280 = _268;
            _170 = _280;
            if (_194)
            {
                _272 = (*spvDescriptorSet0.vp_c3)._m0[25].y;
            }
            float _282 = _272;
            _132 = _282;
            _172 = true;
        }
    }
    else
    {
        int _284 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _286 = _284 != 0;
        _142 = _286;
        if (_286)
        {
            _122 = _43;
        }
        float _288 = _122;
        float _290 = _288;
        _148 = _288;
        if (_286)
        {
            _124 = _45;
        }
        float _292 = _124;
        float _294 = _292;
        _154 = _292;
        if (_286)
        {
            _126 = _43;
        }
        float _296 = _126;
        float _298 = _296;
        _160 = _296;
        if (_286)
        {
            _128 = _45;
        }
        float _300 = _128;
        _166 = _300;
        if (_286)
        {
            _130 = _43;
        }
        float _302 = _130;
        _170 = _302;
        if (!_286)
        {
            float _304 = trunc(_43);
            int _306 = int(_304);
            float _308 = trunc(_45);
            int _310 = int(_308);
            int _312 = _310 * 2;
            int _314 = _312 + _306;
            int _316 = _314 << 4;
            uint _319 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
            bool _321 = _316 == 0;
            bool _323 = _316 == 16;
            bool _325 = _316 == 32;
            bool _327 = _316 == 48;
            int _329 = int(_319) & 15;
            float _331 = as_type<float>(_316);
            float _333 = as_type<float>(_329);
            float _335 = as_type<float>(_310);
            if (_321)
            {
                _298 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _337 = _298;
            float _339 = _337;
            if (_321)
            {
                _290 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _341 = _290;
            float _343 = _341;
            if (_321)
            {
                _294 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _345 = _294;
            float _347 = _345;
            if (_323)
            {
                _347 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _349 = _347;
            float _351 = _349;
            if (_321)
            {
                _331 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _353 = _331;
            float _355 = _353;
            if (_323)
            {
                _355 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _357 = _355;
            float _359 = _357;
            if (_321)
            {
                _333 = (*spvDescriptorSet0.vp_c3)._m0[22].x;
            }
            float _361 = _333;
            float _363 = _361;
            if (_321)
            {
                _335 = (*spvDescriptorSet0.vp_c3)._m0[22].y;
            }
            float _365 = _335;
            float _367 = _365;
            if (_323)
            {
                _343 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _369 = _343;
            float _371 = _369;
            if (_323)
            {
                _339 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _373 = _339;
            float _375 = _373;
            if (_323)
            {
                _363 = (*spvDescriptorSet0.vp_c3)._m0[23].x;
            }
            float _377 = _363;
            float _379 = _377;
            if (_323)
            {
                _367 = (*spvDescriptorSet0.vp_c3)._m0[23].y;
            }
            float _381 = _367;
            float _383 = _381;
            if (_325)
            {
                _383 = (*spvDescriptorSet0.vp_c3)._m0[24].y;
            }
            float _385 = _383;
            _132 = _385;
            if (_325)
            {
                _371 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _387 = _371;
            float _389 = _387;
            if (_325)
            {
                _351 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _391 = _351;
            float _393 = _391;
            if (_325)
            {
                _375 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _395 = _375;
            float _397 = _395;
            if (_325)
            {
                _359 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _399 = _359;
            float _401 = _399;
            if (_325)
            {
                _379 = (*spvDescriptorSet0.vp_c3)._m0[24].x;
            }
            float _403 = _379;
            float _405 = _403;
            if (_327)
            {
                _389 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _407 = _389;
            _148 = _407;
            if (_327)
            {
                _393 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _409 = _393;
            _154 = _409;
            if (_327)
            {
                _397 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _411 = _397;
            _160 = _411;
            if (_327)
            {
                _401 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _413 = _401;
            _166 = _413;
            if (_327)
            {
                _405 = (*spvDescriptorSet0.vp_c3)._m0[25].x;
            }
            float _415 = _405;
            _170 = _415;
            if (_327)
            {
                _132 = (*spvDescriptorSet0.vp_c3)._m0[25].y;
            }
        }
    }
    _172 = false;
    float _417 = _132;
    float _419 = _170;
    float _421 = _166;
    float _423 = _160;
    float _425 = _148;
    float _427 = _154;
    bool _429 = _142;
    bool _431 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _433 = !_431;
    float _435 = _421;
    float _437 = _419;
    float _439 = _425;
    float _441 = _427;
    float _443 = _423;
    float _445 = _421;
    float _447 = _419;
    float _449 = _417;
    int _451 = as_type<int>(_419);
    float _453 = _417;
    float _455 = _417;
    float _457 = _419;
    float _471;
    float _473;
    if (!_433)
    {
        float _459 = _49 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _461 = _49 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _463 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[14].x, _459);
        float _465 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[15].x, _461);
        float _467 = _463 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _469 = _465 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _471 = _469;
        _473 = _467;
        _475 = true;
    }
    else
    {
        int _477 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _479 = _477 != 0;
        if (!_479)
        {
            _435 = _425;
        }
        float _481 = _435;
        float _483 = _481;
        _473 = _481;
        if (!_479)
        {
            _437 = _427;
        }
        float _485 = _437;
        bool _487 = !_479;
        float _489 = _485;
        _471 = _485;
        if (!_487)
        {
            if (!_429)
            {
                _483 = _425;
            }
            float _491 = _483;
            float _493 = _491;
            int _495 = as_type<int>(_491);
            if (!_429)
            {
                _489 = _427;
            }
            float _497 = _489;
            bool _499 = !_429;
            float _501 = _497;
            float _503 = _497;
            if (!_499)
            {
                int _505 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _507 = _505 != 0;
                int _509 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _511 = _509 != 0;
                int _513 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _515 = _513 != 0;
                int _517 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _519 = _517 != 0;
                int _521 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _523 = _521 != 0;
                if (_507)
                {
                    _493 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _525 = _493;
                float _527 = _525;
                if (_507)
                {
                    _501 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _529 = _501;
                float _531 = _529;
                if (!_507)
                {
                    _527 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _533 = _527;
                if (!_507)
                {
                    _531 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _535 = _531;
                float _537 = _533 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _539 = _535 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_519)
                {
                    float _541 = _537 * _425;
                    _439 = _541;
                }
                float _543 = _439;
                float _545 = -_537;
                float _547 = _545 + 1.0;
                int _549 = as_type<int>(_543);
                if (_523)
                {
                    float _551 = _539 * _427;
                    _441 = _551;
                }
                float _553 = _441;
                float _555 = -_539;
                float _557 = _555 + 1.0;
                float _559 = _553;
                if (_511)
                {
                    float _561 = _543 + _547;
                    _549 = as_type<int>(_561);
                }
                int _563 = _549;
                if (_515)
                {
                    float _565 = _553 + _557;
                    _559 = _565;
                }
                float _567 = _559;
                _495 = _563;
                _503 = _567;
            }
            int _569 = _495;
            float _571 = _503;
            int _573 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _575 = _573 != 0;
            int _577 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _579 = _577 != 0;
            int _581 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _583 = _581 != 0;
            int _585 = _569;
            int _587 = as_type<int>(_571);
            if (_579)
            {
                float _589 = -as_type<float>(_569);
                float _591 = _589 + 1.0;
                _585 = as_type<int>(_591);
            }
            int _593 = _585;
            if (_583)
            {
                float _595 = -_571;
                float _597 = _595 + 1.0;
                _587 = as_type<int>(_597);
            }
            int _599 = _587;
            bool _601 = !_575;
            float _603 = _601 ? as_type<float>(_593) : as_type<float>(_599);
            bool _605 = !_575;
            float _607 = _605 ? as_type<float>(_599) : as_type<float>(_593);
            _471 = _607;
            _473 = _603;
        }
    }
    _475 = false;
    float _609 = _471;
    float _611 = _473;
    float _613 = _609 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _615 = _609 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
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
    float _633 = _625;
    float _635 = _621;
    float _649;
    float _651;
    if (!_631)
    {
        float _637 = _49 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _639 = _49 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _641 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[18].x, _637);
        float _643 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[19].x, _639);
        float _645 = _641 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _647 = _643 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _649 = _647;
        _651 = _645;
        _653 = true;
    }
    else
    {
        int _655 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _657 = _655 != 0;
        if (!_657)
        {
            _633 = _423;
        }
        float _659 = _633;
        float _661 = _659;
        _651 = _659;
        if (!_657)
        {
            _635 = _421;
        }
        float _663 = _635;
        bool _665 = !_657;
        float _667 = _663;
        _649 = _663;
        if (!_665)
        {
            if (!_429)
            {
                _661 = _423;
            }
            float _669 = _661;
            float _671 = _669;
            float _673 = _669;
            if (!_429)
            {
                _667 = _421;
            }
            float _675 = _667;
            bool _677 = !_429;
            float _679 = _675;
            float _681 = _675;
            if (!_677)
            {
                int _683 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _685 = _683 != 0;
                int _687 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _689 = _687 != 0;
                int _691 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _693 = _691 != 0;
                int _695 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _697 = _695 != 0;
                int _699 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _701 = _699 != 0;
                if (_685)
                {
                    _671 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _703 = _671;
                float _705 = _703;
                if (_685)
                {
                    _679 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _707 = _679;
                float _709 = _707;
                if (!_685)
                {
                    _705 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _711 = _705;
                if (!_685)
                {
                    _709 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _713 = _709;
                float _715 = _711 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _717 = _713 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_697)
                {
                    float _719 = _715 * _423;
                    _443 = _719;
                }
                float _721 = _443;
                float _723 = -_715;
                float _725 = _723 + 1.0;
                float _727 = _721;
                if (_701)
                {
                    float _729 = _717 * _421;
                    _445 = _729;
                }
                float _731 = _445;
                float _733 = -_717;
                float _735 = _733 + 1.0;
                float _737 = _731;
                if (_689)
                {
                    float _739 = _721 + _725;
                    _727 = _739;
                }
                float _741 = _727;
                if (_693)
                {
                    float _743 = _731 + _735;
                    _737 = _743;
                }
                float _745 = _737;
                _673 = _741;
                _681 = _745;
            }
            float _747 = _673;
            float _749 = _681;
            int _751 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _753 = _751 != 0;
            int _755 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _757 = _755 != 0;
            int _759 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _761 = _759 != 0;
            int _763 = as_type<int>(_747);
            int _765 = as_type<int>(_749);
            if (_757)
            {
                float _767 = -_747;
                float _769 = _767 + 1.0;
                _763 = as_type<int>(_769);
            }
            int _771 = _763;
            if (_761)
            {
                float _773 = -_749;
                float _775 = _773 + 1.0;
                _765 = as_type<int>(_775);
            }
            int _777 = _765;
            bool _779 = !_753;
            float _781 = _779 ? as_type<float>(_771) : as_type<float>(_777);
            bool _783 = !_753;
            float _785 = _783 ? as_type<float>(_777) : as_type<float>(_771);
            _649 = _785;
            _651 = _781;
        }
    }
    _653 = false;
    float _787 = _649;
    float _789 = _651;
    float _791 = _787 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _793 = _787 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    bool _795 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].z);
    float _797 = fma(_789, (*spvDescriptorSet0.vp_c3)._m0[10].x, _791);
    float _799 = fma(_789, (*spvDescriptorSet0.vp_c3)._m0[9].x, _793);
    float _801 = _797 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _803 = _799 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _805 = -_801;
    float _807 = _805 + 1.0;
    out.m_27.x = _803;
    out.m_27.y = _807;
    bool _809 = !_795;
    if (!_809)
    {
        float _811 = _49 * (*spvDescriptorSet0.vp_c3)._m0[22].y;
        float _813 = _49 * (*spvDescriptorSet0.vp_c3)._m0[23].y;
        float _815 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[22].x, _811);
        float _817 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[23].x, _813);
        float _819 = _815 + (*spvDescriptorSet0.vp_c3)._m0[22].w;
        float _821 = _817 + (*spvDescriptorSet0.vp_c3)._m0[23].w;
        _455 = _821;
        _457 = _819;
        _823 = true;
    }
    else
    {
        int _825 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _827 = _825 != 0;
        bool _829 = !_827;
        if (!_829)
        {
            bool _831 = !_429;
            if (!_831)
            {
                int _833 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _835 = _833 != 0;
                int _837 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _839 = _837 != 0;
                int _841 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _843 = _841 != 0;
                int _845 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _847 = _845 != 0;
                int _849 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _851 = _849 != 0;
                if (_835)
                {
                    _134 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _853 = _134;
                float _855 = _853;
                if (_835)
                {
                    _136 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _857 = _136;
                float _859 = _857;
                if (!_835)
                {
                    _855 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _861 = _855;
                if (!_835)
                {
                    _859 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _863 = _859;
                float _865 = _861 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _867 = _863 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_847)
                {
                    float _869 = _865 * _419;
                    _447 = _869;
                }
                float _871 = _447;
                float _873 = -_865;
                float _875 = _873 + 1.0;
                int _877 = as_type<int>(_871);
                if (_851)
                {
                    float _879 = _867 * _417;
                    _449 = _879;
                }
                float _881 = _449;
                float _883 = -_867;
                float _885 = _883 + 1.0;
                _453 = _881;
                if (_839)
                {
                    float _887 = _871 + _875;
                    _877 = as_type<int>(_887);
                }
                int _889 = _877;
                _451 = _889;
                if (_843)
                {
                    float _891 = _881 + _885;
                    _453 = _891;
                }
            }
            int _893 = _451;
            float _895 = _453;
            int _897 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _899 = _897 != 0;
            int _901 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _903 = _901 != 0;
            int _905 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _907 = _905 != 0;
            int _909 = _893;
            int _911 = as_type<int>(_895);
            if (_903)
            {
                float _913 = -as_type<float>(_893);
                float _915 = _913 + 1.0;
                _909 = as_type<int>(_915);
            }
            int _917 = _909;
            if (_907)
            {
                float _919 = -_895;
                float _921 = _919 + 1.0;
                _911 = as_type<int>(_921);
            }
            int _923 = _911;
            bool _925 = !_899;
            float _927 = _925 ? as_type<float>(_917) : as_type<float>(_923);
            bool _929 = !_899;
            float _931 = _929 ? as_type<float>(_923) : as_type<float>(_917);
            _455 = _931;
            _457 = _927;
        }
    }
    _823 = false;
    float _933 = _455;
    float _935 = _457;
    float _937 = _933 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _939 = _933 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _941 = fma(_935, (*spvDescriptorSet0.vp_c3)._m0[12].x, _937);
    float _943 = fma(_935, (*spvDescriptorSet0.vp_c3)._m0[11].x, _939);
    float _945 = _941 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _947 = _943 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _949 = -_945;
    float _951 = _949 + 1.0;
    out.m_29.x = _947;
    out.m_29.y = _951;
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
    out.dm_pad0 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    bool _823 = false;
    bool _653 = false;
    bool _475 = false;
    bool _172 = false;
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
    float _112 = _97;
    float _114 = _95;
    float _116 = _65;
    float _118 = _89;
    float _120 = _67;
    float _122 = _97;
    float _124 = _95;
    float _126 = _65;
    float _128 = _89;
    float _130 = _67;
    float _132 = _45;
    float _134 = _49;
    float _136 = _51;
    bool _142;
    float _148;
    float _154;
    float _160;
    float _166;
    float _170;
    if (!_110)
    {
        int _138 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _140 = _138 != 0;
        _142 = _140;
        if (_140)
        {
            _112 = _43;
        }
        float _144 = _112;
        float _146 = _144;
        _148 = _144;
        if (_140)
        {
            _114 = _45;
        }
        float _150 = _114;
        float _152 = _150;
        _154 = _150;
        if (_140)
        {
            _116 = _43;
        }
        float _156 = _116;
        float _158 = _156;
        _160 = _156;
        if (_140)
        {
            _118 = _45;
        }
        float _162 = _118;
        float _164 = _162;
        _166 = _162;
        if (_140)
        {
            _120 = _43;
        }
        float _168 = _120;
        _170 = _168;
        _172 = _140;
        if (!_172)
        {
            float _174 = trunc(_43);
            int _176 = int(_174);
            float _178 = trunc(_45);
            int _180 = int(_178);
            int _182 = _180 << 1;
            int _184 = _182 + _176;
            int _186 = _184 * 16;
            bool _188 = _186 == 0;
            bool _190 = _186 == 16;
            bool _192 = _186 == 32;
            bool _194 = _186 == 48;
            float _196 = as_type<float>(_186);
            float _198 = as_type<float>(_180);
            if (_188)
            {
                _146 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _200 = _146;
            float _202 = _200;
            if (_188)
            {
                _196 = (*spvDescriptorSet0.vp_c3)._m0[22].x;
            }
            float _204 = _196;
            float _206 = _204;
            if (_188)
            {
                _152 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _208 = _152;
            float _210 = _208;
            if (_188)
            {
                _158 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _212 = _158;
            float _214 = _212;
            if (_188)
            {
                _164 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _216 = _164;
            float _218 = _216;
            if (_190)
            {
                _218 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _220 = _218;
            float _222 = _220;
            if (_188)
            {
                _198 = (*spvDescriptorSet0.vp_c3)._m0[22].y;
            }
            float _224 = _198;
            float _226 = _224;
            if (_190)
            {
                _202 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _228 = _202;
            float _230 = _228;
            if (_190)
            {
                _210 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _232 = _210;
            float _234 = _232;
            if (_190)
            {
                _214 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _236 = _214;
            float _238 = _236;
            if (_192)
            {
                _238 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _240 = _238;
            float _242 = _240;
            if (_190)
            {
                _206 = (*spvDescriptorSet0.vp_c3)._m0[23].x;
            }
            float _244 = _206;
            float _246 = _244;
            if (_190)
            {
                _226 = (*spvDescriptorSet0.vp_c3)._m0[23].y;
            }
            float _248 = _226;
            float _250 = _248;
            if (_192)
            {
                _230 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _252 = _230;
            float _254 = _252;
            if (_192)
            {
                _234 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _256 = _234;
            float _258 = _256;
            if (_194)
            {
                _258 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _260 = _258;
            _154 = _260;
            if (_192)
            {
                _222 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _262 = _222;
            float _264 = _262;
            if (_192)
            {
                _246 = (*spvDescriptorSet0.vp_c3)._m0[24].x;
            }
            float _266 = _246;
            float _268 = _266;
            if (_192)
            {
                _250 = (*spvDescriptorSet0.vp_c3)._m0[24].y;
            }
            float _270 = _250;
            float _272 = _270;
            if (_194)
            {
                _254 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _274 = _254;
            _148 = _274;
            if (_194)
            {
                _242 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _276 = _242;
            _160 = _276;
            if (_194)
            {
                _264 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _278 = _264;
            _166 = _278;
            if (_194)
            {
                _268 = (*spvDescriptorSet0.vp_c3)._m0[25].x;
            }
            float _280 = _268;
            _170 = _280;
            if (_194)
            {
                _272 = (*spvDescriptorSet0.vp_c3)._m0[25].y;
            }
            float _282 = _272;
            _132 = _282;
            _172 = true;
        }
    }
    else
    {
        int _284 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _286 = _284 != 0;
        _142 = _286;
        if (_286)
        {
            _122 = _43;
        }
        float _288 = _122;
        float _290 = _288;
        _148 = _288;
        if (_286)
        {
            _124 = _45;
        }
        float _292 = _124;
        float _294 = _292;
        _154 = _292;
        if (_286)
        {
            _126 = _43;
        }
        float _296 = _126;
        float _298 = _296;
        _160 = _296;
        if (_286)
        {
            _128 = _45;
        }
        float _300 = _128;
        _166 = _300;
        if (_286)
        {
            _130 = _43;
        }
        float _302 = _130;
        _170 = _302;
        if (!_286)
        {
            float _304 = trunc(_43);
            int _306 = int(_304);
            float _308 = trunc(_45);
            int _310 = int(_308);
            int _312 = _310 * 2;
            int _314 = _312 + _306;
            int _316 = _314 << 4;
            uint _319 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
            bool _321 = _316 == 0;
            bool _323 = _316 == 16;
            bool _325 = _316 == 32;
            bool _327 = _316 == 48;
            int _329 = int(_319) & 15;
            float _331 = as_type<float>(_316);
            float _333 = as_type<float>(_329);
            float _335 = as_type<float>(_310);
            if (_321)
            {
                _298 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _337 = _298;
            float _339 = _337;
            if (_321)
            {
                _290 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _341 = _290;
            float _343 = _341;
            if (_321)
            {
                _294 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _345 = _294;
            float _347 = _345;
            if (_323)
            {
                _347 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _349 = _347;
            float _351 = _349;
            if (_321)
            {
                _331 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _353 = _331;
            float _355 = _353;
            if (_323)
            {
                _355 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _357 = _355;
            float _359 = _357;
            if (_321)
            {
                _333 = (*spvDescriptorSet0.vp_c3)._m0[22].x;
            }
            float _361 = _333;
            float _363 = _361;
            if (_321)
            {
                _335 = (*spvDescriptorSet0.vp_c3)._m0[22].y;
            }
            float _365 = _335;
            float _367 = _365;
            if (_323)
            {
                _343 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _369 = _343;
            float _371 = _369;
            if (_323)
            {
                _339 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _373 = _339;
            float _375 = _373;
            if (_323)
            {
                _363 = (*spvDescriptorSet0.vp_c3)._m0[23].x;
            }
            float _377 = _363;
            float _379 = _377;
            if (_323)
            {
                _367 = (*spvDescriptorSet0.vp_c3)._m0[23].y;
            }
            float _381 = _367;
            float _383 = _381;
            if (_325)
            {
                _383 = (*spvDescriptorSet0.vp_c3)._m0[24].y;
            }
            float _385 = _383;
            _132 = _385;
            if (_325)
            {
                _371 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _387 = _371;
            float _389 = _387;
            if (_325)
            {
                _351 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _391 = _351;
            float _393 = _391;
            if (_325)
            {
                _375 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _395 = _375;
            float _397 = _395;
            if (_325)
            {
                _359 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _399 = _359;
            float _401 = _399;
            if (_325)
            {
                _379 = (*spvDescriptorSet0.vp_c3)._m0[24].x;
            }
            float _403 = _379;
            float _405 = _403;
            if (_327)
            {
                _389 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _407 = _389;
            _148 = _407;
            if (_327)
            {
                _393 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _409 = _393;
            _154 = _409;
            if (_327)
            {
                _397 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _411 = _397;
            _160 = _411;
            if (_327)
            {
                _401 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _413 = _401;
            _166 = _413;
            if (_327)
            {
                _405 = (*spvDescriptorSet0.vp_c3)._m0[25].x;
            }
            float _415 = _405;
            _170 = _415;
            if (_327)
            {
                _132 = (*spvDescriptorSet0.vp_c3)._m0[25].y;
            }
        }
    }
    _172 = false;
    float _417 = _132;
    float _419 = _170;
    float _421 = _166;
    float _423 = _160;
    float _425 = _148;
    float _427 = _154;
    bool _429 = _142;
    bool _431 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _433 = !_431;
    float _435 = _421;
    float _437 = _419;
    float _439 = _425;
    float _441 = _427;
    float _443 = _423;
    float _445 = _421;
    float _447 = _419;
    float _449 = _417;
    int _451 = as_type<int>(_419);
    float _453 = _417;
    float _455 = _417;
    float _457 = _419;
    float _471;
    float _473;
    if (!_433)
    {
        float _459 = _49 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _461 = _49 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _463 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[14].x, _459);
        float _465 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[15].x, _461);
        float _467 = _463 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _469 = _465 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _471 = _469;
        _473 = _467;
        _475 = true;
    }
    else
    {
        int _477 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _479 = _477 != 0;
        if (!_479)
        {
            _435 = _425;
        }
        float _481 = _435;
        float _483 = _481;
        _473 = _481;
        if (!_479)
        {
            _437 = _427;
        }
        float _485 = _437;
        bool _487 = !_479;
        float _489 = _485;
        _471 = _485;
        if (!_487)
        {
            if (!_429)
            {
                _483 = _425;
            }
            float _491 = _483;
            float _493 = _491;
            int _495 = as_type<int>(_491);
            if (!_429)
            {
                _489 = _427;
            }
            float _497 = _489;
            bool _499 = !_429;
            float _501 = _497;
            float _503 = _497;
            if (!_499)
            {
                int _505 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _507 = _505 != 0;
                int _509 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _511 = _509 != 0;
                int _513 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _515 = _513 != 0;
                int _517 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _519 = _517 != 0;
                int _521 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _523 = _521 != 0;
                if (_507)
                {
                    _493 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _525 = _493;
                float _527 = _525;
                if (_507)
                {
                    _501 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _529 = _501;
                float _531 = _529;
                if (!_507)
                {
                    _527 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _533 = _527;
                if (!_507)
                {
                    _531 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _535 = _531;
                float _537 = _533 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _539 = _535 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_519)
                {
                    float _541 = _537 * _425;
                    _439 = _541;
                }
                float _543 = _439;
                float _545 = -_537;
                float _547 = _545 + 1.0;
                int _549 = as_type<int>(_543);
                if (_523)
                {
                    float _551 = _539 * _427;
                    _441 = _551;
                }
                float _553 = _441;
                float _555 = -_539;
                float _557 = _555 + 1.0;
                float _559 = _553;
                if (_511)
                {
                    float _561 = _543 + _547;
                    _549 = as_type<int>(_561);
                }
                int _563 = _549;
                if (_515)
                {
                    float _565 = _553 + _557;
                    _559 = _565;
                }
                float _567 = _559;
                _495 = _563;
                _503 = _567;
            }
            int _569 = _495;
            float _571 = _503;
            int _573 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _575 = _573 != 0;
            int _577 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _579 = _577 != 0;
            int _581 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _583 = _581 != 0;
            int _585 = _569;
            int _587 = as_type<int>(_571);
            if (_579)
            {
                float _589 = -as_type<float>(_569);
                float _591 = _589 + 1.0;
                _585 = as_type<int>(_591);
            }
            int _593 = _585;
            if (_583)
            {
                float _595 = -_571;
                float _597 = _595 + 1.0;
                _587 = as_type<int>(_597);
            }
            int _599 = _587;
            bool _601 = !_575;
            float _603 = _601 ? as_type<float>(_593) : as_type<float>(_599);
            bool _605 = !_575;
            float _607 = _605 ? as_type<float>(_599) : as_type<float>(_593);
            _471 = _607;
            _473 = _603;
        }
    }
    _475 = false;
    float _609 = _471;
    float _611 = _473;
    float _613 = _609 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _615 = _609 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
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
    float _633 = _625;
    float _635 = _621;
    float _649;
    float _651;
    if (!_631)
    {
        float _637 = _49 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _639 = _49 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _641 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[18].x, _637);
        float _643 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[19].x, _639);
        float _645 = _641 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _647 = _643 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _649 = _647;
        _651 = _645;
        _653 = true;
    }
    else
    {
        int _655 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _657 = _655 != 0;
        if (!_657)
        {
            _633 = _423;
        }
        float _659 = _633;
        float _661 = _659;
        _651 = _659;
        if (!_657)
        {
            _635 = _421;
        }
        float _663 = _635;
        bool _665 = !_657;
        float _667 = _663;
        _649 = _663;
        if (!_665)
        {
            if (!_429)
            {
                _661 = _423;
            }
            float _669 = _661;
            float _671 = _669;
            float _673 = _669;
            if (!_429)
            {
                _667 = _421;
            }
            float _675 = _667;
            bool _677 = !_429;
            float _679 = _675;
            float _681 = _675;
            if (!_677)
            {
                int _683 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _685 = _683 != 0;
                int _687 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _689 = _687 != 0;
                int _691 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _693 = _691 != 0;
                int _695 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _697 = _695 != 0;
                int _699 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _701 = _699 != 0;
                if (_685)
                {
                    _671 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _703 = _671;
                float _705 = _703;
                if (_685)
                {
                    _679 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _707 = _679;
                float _709 = _707;
                if (!_685)
                {
                    _705 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _711 = _705;
                if (!_685)
                {
                    _709 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _713 = _709;
                float _715 = _711 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _717 = _713 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_697)
                {
                    float _719 = _715 * _423;
                    _443 = _719;
                }
                float _721 = _443;
                float _723 = -_715;
                float _725 = _723 + 1.0;
                float _727 = _721;
                if (_701)
                {
                    float _729 = _717 * _421;
                    _445 = _729;
                }
                float _731 = _445;
                float _733 = -_717;
                float _735 = _733 + 1.0;
                float _737 = _731;
                if (_689)
                {
                    float _739 = _721 + _725;
                    _727 = _739;
                }
                float _741 = _727;
                if (_693)
                {
                    float _743 = _731 + _735;
                    _737 = _743;
                }
                float _745 = _737;
                _673 = _741;
                _681 = _745;
            }
            float _747 = _673;
            float _749 = _681;
            int _751 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _753 = _751 != 0;
            int _755 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _757 = _755 != 0;
            int _759 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _761 = _759 != 0;
            int _763 = as_type<int>(_747);
            int _765 = as_type<int>(_749);
            if (_757)
            {
                float _767 = -_747;
                float _769 = _767 + 1.0;
                _763 = as_type<int>(_769);
            }
            int _771 = _763;
            if (_761)
            {
                float _773 = -_749;
                float _775 = _773 + 1.0;
                _765 = as_type<int>(_775);
            }
            int _777 = _765;
            bool _779 = !_753;
            float _781 = _779 ? as_type<float>(_771) : as_type<float>(_777);
            bool _783 = !_753;
            float _785 = _783 ? as_type<float>(_777) : as_type<float>(_771);
            _649 = _785;
            _651 = _781;
        }
    }
    _653 = false;
    float _787 = _649;
    float _789 = _651;
    float _791 = _787 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _793 = _787 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    bool _795 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].z);
    float _797 = fma(_789, (*spvDescriptorSet0.vp_c3)._m0[10].x, _791);
    float _799 = fma(_789, (*spvDescriptorSet0.vp_c3)._m0[9].x, _793);
    float _801 = _797 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _803 = _799 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _805 = -_801;
    float _807 = _805 + 1.0;
    out.m_27.x = _803;
    out.m_27.y = _807;
    bool _809 = !_795;
    if (!_809)
    {
        float _811 = _49 * (*spvDescriptorSet0.vp_c3)._m0[22].y;
        float _813 = _49 * (*spvDescriptorSet0.vp_c3)._m0[23].y;
        float _815 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[22].x, _811);
        float _817 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[23].x, _813);
        float _819 = _815 + (*spvDescriptorSet0.vp_c3)._m0[22].w;
        float _821 = _817 + (*spvDescriptorSet0.vp_c3)._m0[23].w;
        _455 = _821;
        _457 = _819;
        _823 = true;
    }
    else
    {
        int _825 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _827 = _825 != 0;
        bool _829 = !_827;
        if (!_829)
        {
            bool _831 = !_429;
            if (!_831)
            {
                int _833 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _835 = _833 != 0;
                int _837 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _839 = _837 != 0;
                int _841 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _843 = _841 != 0;
                int _845 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _847 = _845 != 0;
                int _849 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _851 = _849 != 0;
                if (_835)
                {
                    _134 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _853 = _134;
                float _855 = _853;
                if (_835)
                {
                    _136 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _857 = _136;
                float _859 = _857;
                if (!_835)
                {
                    _855 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _861 = _855;
                if (!_835)
                {
                    _859 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _863 = _859;
                float _865 = _861 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _867 = _863 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_847)
                {
                    float _869 = _865 * _419;
                    _447 = _869;
                }
                float _871 = _447;
                float _873 = -_865;
                float _875 = _873 + 1.0;
                int _877 = as_type<int>(_871);
                if (_851)
                {
                    float _879 = _867 * _417;
                    _449 = _879;
                }
                float _881 = _449;
                float _883 = -_867;
                float _885 = _883 + 1.0;
                _453 = _881;
                if (_839)
                {
                    float _887 = _871 + _875;
                    _877 = as_type<int>(_887);
                }
                int _889 = _877;
                _451 = _889;
                if (_843)
                {
                    float _891 = _881 + _885;
                    _453 = _891;
                }
            }
            int _893 = _451;
            float _895 = _453;
            int _897 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _899 = _897 != 0;
            int _901 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _903 = _901 != 0;
            int _905 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _907 = _905 != 0;
            int _909 = _893;
            int _911 = as_type<int>(_895);
            if (_903)
            {
                float _913 = -as_type<float>(_893);
                float _915 = _913 + 1.0;
                _909 = as_type<int>(_915);
            }
            int _917 = _909;
            if (_907)
            {
                float _919 = -_895;
                float _921 = _919 + 1.0;
                _911 = as_type<int>(_921);
            }
            int _923 = _911;
            bool _925 = !_899;
            float _927 = _925 ? as_type<float>(_917) : as_type<float>(_923);
            bool _929 = !_899;
            float _931 = _929 ? as_type<float>(_923) : as_type<float>(_917);
            _455 = _931;
            _457 = _927;
        }
    }
    _823 = false;
    float _933 = _455;
    float _935 = _457;
    float _937 = _933 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _939 = _933 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _941 = fma(_935, (*spvDescriptorSet0.vp_c3)._m0[12].x, _937);
    float _943 = fma(_935, (*spvDescriptorSet0.vp_c3)._m0[11].x, _939);
    float _945 = _941 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _947 = _943 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _949 = -_945;
    float _951 = _949 + 1.0;
    out.m_29.x = _947;
    out.m_29.y = _951;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.dm_pad0.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.dm_pad0.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.dm_pad0.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.dm_pad0.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_25.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_25.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_25.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_25.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_27.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_27.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_27.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_27.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

