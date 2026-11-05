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
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    bool _983 = false;
    bool _805 = false;
    bool _619 = false;
    bool _202 = false;
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
    float _112 = _85;
    float _114 = _101;
    float _116 = _95;
    float _118 = _99;
    float _120 = _97;
    int _122 = as_type<int>(_89);
    float _124 = _65;
    int _126 = as_type<int>(_67);
    float _128 = _85;
    float _130 = _99;
    float _132 = _101;
    float _134 = _65;
    float _136 = _97;
    float _138 = _95;
    int _140 = as_type<int>(_89);
    int _142 = as_type<int>(_67);
    float _144 = _45;
    float _146 = _49;
    float _148 = _51;
    bool _154;
    float _160;
    float _166;
    float _172;
    float _178;
    float _184;
    int _190;
    float _196;
    int _200;
    if (!_110)
    {
        int _150 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _152 = _150 != 0;
        _154 = _152;
        if (_152)
        {
            _112 = _43;
        }
        float _156 = _112;
        float _158 = _156;
        _160 = _156;
        if (_152)
        {
            _114 = _45;
        }
        float _162 = _114;
        float _164 = _162;
        _166 = _162;
        if (_152)
        {
            _116 = _45;
        }
        float _168 = _116;
        float _170 = _168;
        _172 = _168;
        if (_152)
        {
            _118 = 1.0;
        }
        float _174 = _118;
        float _176 = _174;
        _178 = _174;
        if (_152)
        {
            _120 = _43;
        }
        float _180 = _120;
        float _182 = _180;
        _184 = _180;
        if (_152)
        {
            _122 = 1065353216;
        }
        int _186 = _122;
        int _188 = _186;
        _190 = _186;
        if (_152)
        {
            _124 = _43;
        }
        float _192 = _124;
        float _194 = _192;
        _196 = _192;
        if (_152)
        {
            _126 = 1065353216;
        }
        int _198 = _126;
        _200 = _198;
        _202 = _152;
        if (!_202)
        {
            float _204 = trunc(_43);
            int _206 = int(_204);
            float _208 = trunc(_45);
            int _210 = int(_208);
            int _212 = _210 * 2;
            int _214 = _212 + _206;
            int _216 = _214 << 4;
            bool _218 = _216 == 0;
            bool _220 = _216 == 16;
            bool _222 = _216 == 32;
            bool _224 = _216 == 48;
            float _226 = as_type<float>(_210);
            int _228 = _216;
            if (_218)
            {
                _158 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _230 = _158;
            float _232 = _230;
            if (_218)
            {
                _176 = (*spvDescriptorSet0.vp_c3)._m0[14].w;
            }
            float _234 = _176;
            float _236 = _234;
            if (_218)
            {
                _164 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _238 = _164;
            float _240 = _238;
            if (_218)
            {
                _194 = (*spvDescriptorSet0.vp_c3)._m0[22].x;
            }
            float _242 = _194;
            float _244 = _242;
            if (_218)
            {
                _182 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _246 = _182;
            float _248 = _246;
            if (_220)
            {
                _240 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _250 = _240;
            float _252 = _250;
            if (_218)
            {
                _170 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _254 = _170;
            float _256 = _254;
            if (_218)
            {
                _188 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[18].w);
            }
            int _258 = _188;
            int _260 = _258;
            if (_220)
            {
                _260 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[19].w);
            }
            int _262 = _260;
            int _264 = _262;
            if (_218)
            {
                _226 = (*spvDescriptorSet0.vp_c3)._m0[22].y;
            }
            float _266 = _226;
            float _268 = _266;
            if (_218)
            {
                _228 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[22].w);
            }
            int _270 = _228;
            int _272 = _270;
            if (_220)
            {
                _232 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _274 = _232;
            float _276 = _274;
            if (_222)
            {
                _276 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _278 = _276;
            float _280 = _278;
            if (_220)
            {
                _236 = (*spvDescriptorSet0.vp_c3)._m0[15].w;
            }
            float _282 = _236;
            float _284 = _282;
            if (_220)
            {
                _248 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _286 = _248;
            float _288 = _286;
            if (_220)
            {
                _256 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _290 = _256;
            float _292 = _290;
            if (_222)
            {
                _292 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _294 = _292;
            float _296 = _294;
            if (_220)
            {
                _244 = (*spvDescriptorSet0.vp_c3)._m0[23].x;
            }
            float _298 = _244;
            float _300 = _298;
            if (_220)
            {
                _268 = (*spvDescriptorSet0.vp_c3)._m0[23].y;
            }
            float _302 = _268;
            float _304 = _302;
            if (_220)
            {
                _272 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[23].w);
            }
            int _306 = _272;
            int _308 = _306;
            if (_222)
            {
                _308 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[24].w);
            }
            int _310 = _308;
            int _312 = _310;
            if (_222)
            {
                _252 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _314 = _252;
            float _316 = _314;
            if (_222)
            {
                _284 = (*spvDescriptorSet0.vp_c3)._m0[16].w;
            }
            float _318 = _284;
            float _320 = _318;
            if (_222)
            {
                _288 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _322 = _288;
            float _324 = _322;
            if (_224)
            {
                _324 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _326 = _324;
            _184 = _326;
            if (_222)
            {
                _264 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[20].w);
            }
            int _328 = _264;
            int _330 = _328;
            if (_222)
            {
                _300 = (*spvDescriptorSet0.vp_c3)._m0[24].x;
            }
            float _332 = _300;
            float _334 = _332;
            if (_222)
            {
                _304 = (*spvDescriptorSet0.vp_c3)._m0[24].y;
            }
            float _336 = _304;
            float _338 = _336;
            if (_224)
            {
                _338 = (*spvDescriptorSet0.vp_c3)._m0[25].y;
            }
            float _340 = _338;
            _144 = _340;
            if (_224)
            {
                _280 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _342 = _280;
            _160 = _342;
            if (_224)
            {
                _316 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _344 = _316;
            _166 = _344;
            if (_224)
            {
                _320 = (*spvDescriptorSet0.vp_c3)._m0[17].w;
            }
            float _346 = _320;
            _178 = _346;
            if (_224)
            {
                _296 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _348 = _296;
            _172 = _348;
            if (_224)
            {
                _330 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[21].w);
            }
            int _350 = _330;
            _190 = _350;
            if (_224)
            {
                _334 = (*spvDescriptorSet0.vp_c3)._m0[25].x;
            }
            float _352 = _334;
            _196 = _352;
            if (_224)
            {
                _312 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[25].w);
            }
            int _354 = _312;
            _200 = _354;
            _202 = true;
        }
    }
    else
    {
        int _356 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _358 = _356 != 0;
        _154 = _358;
        if (_358)
        {
            _128 = _43;
        }
        float _360 = _128;
        float _362 = _360;
        _160 = _360;
        if (_358)
        {
            _130 = 1.0;
        }
        float _364 = _130;
        float _366 = _364;
        _178 = _364;
        if (_358)
        {
            _132 = _45;
        }
        float _368 = _132;
        float _370 = _368;
        _166 = _368;
        if (_358)
        {
            _134 = _43;
        }
        float _372 = _134;
        float _374 = _372;
        _196 = _372;
        if (_358)
        {
            _136 = _43;
        }
        float _376 = _136;
        float _378 = _376;
        _184 = _376;
        if (_358)
        {
            _138 = _45;
        }
        float _380 = _138;
        float _382 = _380;
        _172 = _380;
        if (_358)
        {
            _140 = 1065353216;
        }
        int _384 = _140;
        _190 = _384;
        if (_358)
        {
            _142 = 1065353216;
        }
        int _386 = _142;
        _200 = _386;
        if (!_358)
        {
            float _388 = trunc(_43);
            int _390 = int(_388);
            float _392 = trunc(_45);
            int _394 = int(_392);
            int _396 = _394 << 1;
            int _398 = _396 + _390;
            int _400 = _398 << 4;
            uint _403 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
            bool _405 = _400 == 0;
            bool _407 = _400 == 16;
            bool _409 = _400 == 32;
            bool _411 = _400 == 48;
            int _413 = int(_403) & 15;
            int _415 = _400;
            float _417 = as_type<float>(_394);
            int _419 = _413;
            if (_405)
            {
                _362 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _421 = _362;
            float _423 = _421;
            if (_405)
            {
                _366 = (*spvDescriptorSet0.vp_c3)._m0[14].w;
            }
            float _425 = _366;
            float _427 = _425;
            if (_405)
            {
                _370 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _429 = _370;
            float _431 = _429;
            if (_405)
            {
                _378 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _433 = _378;
            float _435 = _433;
            if (_405)
            {
                _415 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[18].w);
            }
            int _437 = _415;
            int _439 = _437;
            if (_405)
            {
                _382 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _441 = _382;
            float _443 = _441;
            if (_407)
            {
                _431 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _445 = _431;
            float _447 = _445;
            if (_405)
            {
                _374 = (*spvDescriptorSet0.vp_c3)._m0[22].x;
            }
            float _449 = _374;
            float _451 = _449;
            if (_407)
            {
                _439 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[19].w);
            }
            int _453 = _439;
            int _455 = _453;
            if (_405)
            {
                _417 = (*spvDescriptorSet0.vp_c3)._m0[22].y;
            }
            float _457 = _417;
            float _459 = _457;
            if (_409)
            {
                _447 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _461 = _447;
            float _463 = _461;
            if (_405)
            {
                _419 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[22].w);
            }
            int _465 = _419;
            int _467 = _465;
            if (_411)
            {
                _463 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _469 = _463;
            _166 = _469;
            if (_407)
            {
                _423 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _471 = _423;
            float _473 = _471;
            if (_407)
            {
                _427 = (*spvDescriptorSet0.vp_c3)._m0[15].w;
            }
            float _475 = _427;
            float _477 = _475;
            if (_407)
            {
                _435 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _479 = _435;
            float _481 = _479;
            if (_407)
            {
                _443 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _483 = _443;
            float _485 = _483;
            if (_407)
            {
                _451 = (*spvDescriptorSet0.vp_c3)._m0[23].x;
            }
            float _487 = _451;
            float _489 = _487;
            if (_409)
            {
                _489 = (*spvDescriptorSet0.vp_c3)._m0[24].x;
            }
            float _491 = _489;
            float _493 = _491;
            if (_407)
            {
                _459 = (*spvDescriptorSet0.vp_c3)._m0[23].y;
            }
            float _495 = _459;
            float _497 = _495;
            if (_407)
            {
                _467 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[23].w);
            }
            int _499 = _467;
            int _501 = _499;
            if (_409)
            {
                _473 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _503 = _473;
            float _505 = _503;
            if (_409)
            {
                _477 = (*spvDescriptorSet0.vp_c3)._m0[16].w;
            }
            float _507 = _477;
            float _509 = _507;
            if (_409)
            {
                _481 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _511 = _481;
            float _513 = _511;
            if (_409)
            {
                _485 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _515 = _485;
            float _517 = _515;
            if (_409)
            {
                _455 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[20].w);
            }
            int _519 = _455;
            int _521 = _519;
            if (_409)
            {
                _497 = (*spvDescriptorSet0.vp_c3)._m0[24].y;
            }
            float _523 = _497;
            float _525 = _523;
            if (_411)
            {
                _525 = (*spvDescriptorSet0.vp_c3)._m0[25].y;
            }
            float _527 = _525;
            _144 = _527;
            if (_409)
            {
                _501 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[24].w);
            }
            int _529 = _501;
            _200 = _529;
            if (_411)
            {
                _505 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _531 = _505;
            _160 = _531;
            if (_411)
            {
                _509 = (*spvDescriptorSet0.vp_c3)._m0[17].w;
            }
            float _533 = _509;
            _178 = _533;
            if (_411)
            {
                _513 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _535 = _513;
            _184 = _535;
            if (_411)
            {
                _517 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _537 = _517;
            _172 = _537;
            if (_411)
            {
                _521 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[21].w);
            }
            int _539 = _521;
            _190 = _539;
            if (_411)
            {
                _493 = (*spvDescriptorSet0.vp_c3)._m0[25].x;
            }
            float _541 = _493;
            _196 = _541;
            if (_411)
            {
                _200 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[25].w);
            }
        }
    }
    _202 = false;
    float _543 = _184;
    float _545 = _144;
    float _547 = _196;
    float _549 = _172;
    float _551 = _160;
    float _553 = _166;
    float _555 = _178;
    bool _557 = _154;
    int _559 = _190;
    int _561 = _200;
    bool _563 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _565 = !_563;
    float _567 = _549;
    float _569 = _547;
    float _571 = _553;
    float _573 = _551;
    float _575 = _551;
    float _577 = _543;
    float _579 = _549;
    int _581 = _559;
    float _583 = _547;
    float _585 = _545;
    int _587 = as_type<int>(_547);
    float _589 = _545;
    float _591 = _545;
    int _593 = _561;
    float _595 = _547;
    float _615;
    int _617;
    if (!_565)
    {
        float _597 = _49 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _599 = _49 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _601 = _49 * (*spvDescriptorSet0.vp_c3)._m0[17].y;
        float _603 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[14].x, _597);
        float _605 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[15].x, _599);
        float _607 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[17].x, _601);
        float _609 = _603 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _611 = _605 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        float _613 = _607 + (*spvDescriptorSet0.vp_c3)._m0[17].w;
        _615 = _611;
        _617 = as_type<int>(_613);
        _575 = _609;
        _619 = true;
    }
    else
    {
        int _621 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _623 = _621 != 0;
        if (!_623)
        {
            _567 = _553;
        }
        float _625 = _567;
        float _627 = _625;
        _615 = _625;
        if (!_623)
        {
            _569 = _555;
        }
        float _629 = _569;
        bool _631 = !_623;
        float _633 = _629;
        _617 = as_type<int>(_629);
        if (!_631)
        {
            if (!_557)
            {
                _627 = _551;
            }
            float _635 = _627;
            float _637 = _635;
            float _639 = _635;
            if (!_557)
            {
                _633 = _553;
            }
            float _641 = _633;
            bool _643 = !_557;
            float _645 = _641;
            int _647 = as_type<int>(_641);
            if (!_643)
            {
                int _649 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _651 = _649 != 0;
                int _653 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _655 = _653 != 0;
                int _657 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _659 = _657 != 0;
                int _661 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _663 = _661 != 0;
                int _665 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _667 = _665 != 0;
                if (_651)
                {
                    _645 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _669 = _645;
                float _671 = _669;
                if (_651)
                {
                    _637 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _673 = _637;
                float _675 = _673;
                if (!_651)
                {
                    _671 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _677 = _671;
                if (!_651)
                {
                    _675 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _679 = _675;
                float _681 = _677 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _683 = _679 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                if (_667)
                {
                    float _685 = _681 * _553;
                    _571 = _685;
                }
                float _687 = _571;
                float _689 = -_681;
                float _691 = _689 + 1.0;
                int _693 = as_type<int>(_687);
                if (_663)
                {
                    float _695 = _683 * _551;
                    _573 = _695;
                }
                float _697 = _573;
                float _699 = -_683;
                float _701 = _699 + 1.0;
                float _703 = _697;
                if (_659)
                {
                    float _705 = _687 + _691;
                    _693 = as_type<int>(_705);
                }
                int _707 = _693;
                if (_655)
                {
                    float _709 = _697 + _701;
                    _703 = _709;
                }
                float _711 = _703;
                _647 = _707;
                _639 = _711;
            }
            int _713 = _647;
            float _715 = _639;
            int _717 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _719 = _717 != 0;
            int _721 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _723 = _721 != 0;
            int _725 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _727 = _725 != 0;
            int _729 = as_type<int>(_715);
            int _731 = _713;
            _617 = as_type<int>(_555);
            if (_723)
            {
                float _733 = -_715;
                float _735 = _733 + 1.0;
                _729 = as_type<int>(_735);
            }
            int _737 = _729;
            if (_727)
            {
                float _739 = -as_type<float>(_713);
                float _741 = _739 + 1.0;
                _731 = as_type<int>(_741);
            }
            int _743 = _731;
            bool _745 = !_719;
            float _747 = _745 ? as_type<float>(_737) : as_type<float>(_743);
            bool _749 = !_719;
            float _751 = _749 ? as_type<float>(_743) : as_type<float>(_737);
            _615 = _751;
            _575 = _747;
        }
    }
    _619 = false;
    float _753 = _615;
    int _755 = _617;
    float _757 = _575;
    float _759 = _753 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _761 = _753 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    out.m_25.w = as_type<float>(_755);
    bool _763 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _765 = fma(_757, (*spvDescriptorSet0.vp_c3)._m0[8].x, _759);
    float _767 = fma(_757, (*spvDescriptorSet0.vp_c3)._m0[7].x, _761);
    float _769 = _765 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _771 = _767 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _773 = -_769;
    float _775 = _773 + 1.0;
    out.m_25.x = _771;
    out.m_25.y = _775;
    bool _777 = !_763;
    float _779 = _771;
    float _781 = as_type<float>(_755);
    float _801;
    float _803;
    if (!_777)
    {
        float _783 = _49 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _785 = _49 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _787 = _49 * (*spvDescriptorSet0.vp_c3)._m0[21].y;
        float _789 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[18].x, _783);
        float _791 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[19].x, _785);
        float _793 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[21].x, _787);
        float _795 = _789 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _797 = _791 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        float _799 = _793 + (*spvDescriptorSet0.vp_c3)._m0[21].w;
        _801 = _797;
        _581 = as_type<int>(_799);
        _803 = _795;
        _805 = true;
    }
    else
    {
        int _807 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _809 = _807 != 0;
        if (!_809)
        {
            _779 = _543;
        }
        float _811 = _779;
        float _813 = _811;
        _803 = _811;
        if (!_809)
        {
            _781 = _549;
        }
        float _815 = _781;
        bool _817 = !_809;
        float _819 = _815;
        _801 = _815;
        if (!_817)
        {
            if (!_557)
            {
                _813 = _543;
            }
            float _821 = _813;
            float _823 = _821;
            int _825 = as_type<int>(_821);
            if (!_557)
            {
                _819 = _549;
            }
            float _827 = _819;
            bool _829 = !_557;
            float _831 = _827;
            float _833 = _827;
            if (!_829)
            {
                int _835 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _837 = _835 != 0;
                int _839 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _841 = _839 != 0;
                int _843 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _845 = _843 != 0;
                int _847 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _849 = _847 != 0;
                int _851 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _853 = _851 != 0;
                if (_837)
                {
                    _831 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _855 = _831;
                float _857 = _855;
                if (_837)
                {
                    _823 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _859 = _823;
                float _861 = _859;
                if (!_837)
                {
                    _861 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _863 = _861;
                if (!_837)
                {
                    _857 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _865 = _857;
                float _867 = _863 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _869 = _865 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_849)
                {
                    float _871 = _867 * _543;
                    _577 = _871;
                }
                float _873 = _577;
                float _875 = -_867;
                float _877 = _875 + 1.0;
                int _879 = as_type<int>(_873);
                if (_853)
                {
                    float _881 = _869 * _549;
                    _579 = _881;
                }
                float _883 = _579;
                float _885 = -_869;
                float _887 = _885 + 1.0;
                float _889 = _883;
                if (_841)
                {
                    float _891 = _873 + _877;
                    _879 = as_type<int>(_891);
                }
                int _893 = _879;
                if (_845)
                {
                    float _895 = _883 + _887;
                    _889 = _895;
                }
                float _897 = _889;
                _825 = _893;
                _833 = _897;
            }
            int _899 = _825;
            float _901 = _833;
            int _903 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _905 = _903 != 0;
            int _907 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _909 = _907 != 0;
            int _911 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _913 = _911 != 0;
            int _915 = _899;
            int _917 = as_type<int>(_901);
            if (_909)
            {
                float _919 = -as_type<float>(_899);
                float _921 = _919 + 1.0;
                _915 = as_type<int>(_921);
            }
            int _923 = _915;
            if (_913)
            {
                float _925 = -_901;
                float _927 = _925 + 1.0;
                _917 = as_type<int>(_927);
            }
            int _929 = _917;
            bool _931 = !_905;
            float _933 = _931 ? as_type<float>(_923) : as_type<float>(_929);
            bool _935 = !_905;
            float _937 = _935 ? as_type<float>(_929) : as_type<float>(_923);
            _801 = _937;
            _803 = _933;
        }
    }
    _805 = false;
    float _939 = _801;
    int _941 = _581;
    float _943 = _803;
    float _945 = _939 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _947 = _939 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    out.m_27.w = as_type<float>(_941);
    bool _949 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].z);
    float _951 = fma(_943, (*spvDescriptorSet0.vp_c3)._m0[10].x, _945);
    float _953 = fma(_943, (*spvDescriptorSet0.vp_c3)._m0[9].x, _947);
    float _955 = _951 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _957 = _953 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _959 = -_955;
    float _961 = _959 + 1.0;
    out.m_27.x = _957;
    out.m_27.y = _961;
    bool _963 = !_949;
    if (!_963)
    {
        float _965 = _49 * (*spvDescriptorSet0.vp_c3)._m0[22].y;
        float _967 = _49 * (*spvDescriptorSet0.vp_c3)._m0[23].y;
        float _969 = _49 * (*spvDescriptorSet0.vp_c3)._m0[25].y;
        float _971 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[22].x, _965);
        float _973 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[23].x, _967);
        float _975 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[25].x, _969);
        float _977 = _971 + (*spvDescriptorSet0.vp_c3)._m0[22].w;
        float _979 = _973 + (*spvDescriptorSet0.vp_c3)._m0[23].w;
        float _981 = _975 + (*spvDescriptorSet0.vp_c3)._m0[25].w;
        _591 = _979;
        _593 = as_type<int>(_981);
        _595 = _977;
        _983 = true;
    }
    else
    {
        int _985 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _987 = _985 != 0;
        bool _989 = !_987;
        if (!_989)
        {
            bool _991 = !_557;
            if (!_991)
            {
                int _993 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _995 = _993 != 0;
                int _997 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _999 = _997 != 0;
                int _1001 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _1003 = _1001 != 0;
                int _1005 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _1007 = _1005 != 0;
                int _1009 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _1011 = _1009 != 0;
                if (_995)
                {
                    _146 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1013 = _146;
                float _1015 = _1013;
                if (_995)
                {
                    _148 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1017 = _148;
                float _1019 = _1017;
                if (!_995)
                {
                    _1015 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1021 = _1015;
                if (!_995)
                {
                    _1019 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1023 = _1019;
                float _1025 = _1021 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _1027 = _1023 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_1007)
                {
                    float _1029 = _1025 * _547;
                    _583 = _1029;
                }
                float _1031 = _583;
                float _1033 = -_1025;
                float _1035 = _1033 + 1.0;
                int _1037 = as_type<int>(_1031);
                if (_1011)
                {
                    float _1039 = _1027 * _545;
                    _585 = _1039;
                }
                float _1041 = _585;
                float _1043 = -_1027;
                float _1045 = _1043 + 1.0;
                _589 = _1041;
                if (_999)
                {
                    float _1047 = _1031 + _1035;
                    _1037 = as_type<int>(_1047);
                }
                int _1049 = _1037;
                _587 = _1049;
                if (_1003)
                {
                    float _1051 = _1041 + _1045;
                    _589 = _1051;
                }
            }
            int _1053 = _587;
            float _1055 = _589;
            int _1057 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _1059 = _1057 != 0;
            int _1061 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _1063 = _1061 != 0;
            int _1065 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _1067 = _1065 != 0;
            int _1069 = _1053;
            int _1071 = as_type<int>(_1055);
            if (_1063)
            {
                float _1073 = -as_type<float>(_1053);
                float _1075 = _1073 + 1.0;
                _1069 = as_type<int>(_1075);
            }
            int _1077 = _1069;
            if (_1067)
            {
                float _1079 = -_1055;
                float _1081 = _1079 + 1.0;
                _1071 = as_type<int>(_1081);
            }
            int _1083 = _1071;
            bool _1085 = !_1059;
            float _1087 = _1085 ? as_type<float>(_1077) : as_type<float>(_1083);
            bool _1089 = !_1059;
            float _1091 = _1089 ? as_type<float>(_1083) : as_type<float>(_1077);
            _591 = _1091;
            _595 = _1087;
        }
    }
    _983 = false;
    float _1093 = _591;
    int _1095 = _593;
    float _1097 = _595;
    float _1099 = _1093 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _1101 = _1093 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    out.m_29.w = as_type<float>(_1095);
    float _1103 = fma(_1097, (*spvDescriptorSet0.vp_c3)._m0[12].x, _1099);
    float _1105 = fma(_1097, (*spvDescriptorSet0.vp_c3)._m0[11].x, _1101);
    float _1107 = _1103 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _1109 = _1105 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _1111 = -_1107;
    float _1113 = _1111 + 1.0;
    out.m_29.x = _1109;
    out.m_29.y = _1113;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    bool _983 = false;
    bool _805 = false;
    bool _619 = false;
    bool _202 = false;
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
    float _112 = _85;
    float _114 = _101;
    float _116 = _95;
    float _118 = _99;
    float _120 = _97;
    int _122 = as_type<int>(_89);
    float _124 = _65;
    int _126 = as_type<int>(_67);
    float _128 = _85;
    float _130 = _99;
    float _132 = _101;
    float _134 = _65;
    float _136 = _97;
    float _138 = _95;
    int _140 = as_type<int>(_89);
    int _142 = as_type<int>(_67);
    float _144 = _45;
    float _146 = _49;
    float _148 = _51;
    bool _154;
    float _160;
    float _166;
    float _172;
    float _178;
    float _184;
    int _190;
    float _196;
    int _200;
    if (!_110)
    {
        int _150 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _152 = _150 != 0;
        _154 = _152;
        if (_152)
        {
            _112 = _43;
        }
        float _156 = _112;
        float _158 = _156;
        _160 = _156;
        if (_152)
        {
            _114 = _45;
        }
        float _162 = _114;
        float _164 = _162;
        _166 = _162;
        if (_152)
        {
            _116 = _45;
        }
        float _168 = _116;
        float _170 = _168;
        _172 = _168;
        if (_152)
        {
            _118 = 1.0;
        }
        float _174 = _118;
        float _176 = _174;
        _178 = _174;
        if (_152)
        {
            _120 = _43;
        }
        float _180 = _120;
        float _182 = _180;
        _184 = _180;
        if (_152)
        {
            _122 = 1065353216;
        }
        int _186 = _122;
        int _188 = _186;
        _190 = _186;
        if (_152)
        {
            _124 = _43;
        }
        float _192 = _124;
        float _194 = _192;
        _196 = _192;
        if (_152)
        {
            _126 = 1065353216;
        }
        int _198 = _126;
        _200 = _198;
        _202 = _152;
        if (!_202)
        {
            float _204 = trunc(_43);
            int _206 = int(_204);
            float _208 = trunc(_45);
            int _210 = int(_208);
            int _212 = _210 * 2;
            int _214 = _212 + _206;
            int _216 = _214 << 4;
            bool _218 = _216 == 0;
            bool _220 = _216 == 16;
            bool _222 = _216 == 32;
            bool _224 = _216 == 48;
            float _226 = as_type<float>(_210);
            int _228 = _216;
            if (_218)
            {
                _158 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _230 = _158;
            float _232 = _230;
            if (_218)
            {
                _176 = (*spvDescriptorSet0.vp_c3)._m0[14].w;
            }
            float _234 = _176;
            float _236 = _234;
            if (_218)
            {
                _164 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _238 = _164;
            float _240 = _238;
            if (_218)
            {
                _194 = (*spvDescriptorSet0.vp_c3)._m0[22].x;
            }
            float _242 = _194;
            float _244 = _242;
            if (_218)
            {
                _182 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _246 = _182;
            float _248 = _246;
            if (_220)
            {
                _240 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _250 = _240;
            float _252 = _250;
            if (_218)
            {
                _170 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _254 = _170;
            float _256 = _254;
            if (_218)
            {
                _188 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[18].w);
            }
            int _258 = _188;
            int _260 = _258;
            if (_220)
            {
                _260 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[19].w);
            }
            int _262 = _260;
            int _264 = _262;
            if (_218)
            {
                _226 = (*spvDescriptorSet0.vp_c3)._m0[22].y;
            }
            float _266 = _226;
            float _268 = _266;
            if (_218)
            {
                _228 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[22].w);
            }
            int _270 = _228;
            int _272 = _270;
            if (_220)
            {
                _232 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _274 = _232;
            float _276 = _274;
            if (_222)
            {
                _276 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _278 = _276;
            float _280 = _278;
            if (_220)
            {
                _236 = (*spvDescriptorSet0.vp_c3)._m0[15].w;
            }
            float _282 = _236;
            float _284 = _282;
            if (_220)
            {
                _248 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _286 = _248;
            float _288 = _286;
            if (_220)
            {
                _256 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _290 = _256;
            float _292 = _290;
            if (_222)
            {
                _292 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _294 = _292;
            float _296 = _294;
            if (_220)
            {
                _244 = (*spvDescriptorSet0.vp_c3)._m0[23].x;
            }
            float _298 = _244;
            float _300 = _298;
            if (_220)
            {
                _268 = (*spvDescriptorSet0.vp_c3)._m0[23].y;
            }
            float _302 = _268;
            float _304 = _302;
            if (_220)
            {
                _272 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[23].w);
            }
            int _306 = _272;
            int _308 = _306;
            if (_222)
            {
                _308 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[24].w);
            }
            int _310 = _308;
            int _312 = _310;
            if (_222)
            {
                _252 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _314 = _252;
            float _316 = _314;
            if (_222)
            {
                _284 = (*spvDescriptorSet0.vp_c3)._m0[16].w;
            }
            float _318 = _284;
            float _320 = _318;
            if (_222)
            {
                _288 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _322 = _288;
            float _324 = _322;
            if (_224)
            {
                _324 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _326 = _324;
            _184 = _326;
            if (_222)
            {
                _264 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[20].w);
            }
            int _328 = _264;
            int _330 = _328;
            if (_222)
            {
                _300 = (*spvDescriptorSet0.vp_c3)._m0[24].x;
            }
            float _332 = _300;
            float _334 = _332;
            if (_222)
            {
                _304 = (*spvDescriptorSet0.vp_c3)._m0[24].y;
            }
            float _336 = _304;
            float _338 = _336;
            if (_224)
            {
                _338 = (*spvDescriptorSet0.vp_c3)._m0[25].y;
            }
            float _340 = _338;
            _144 = _340;
            if (_224)
            {
                _280 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _342 = _280;
            _160 = _342;
            if (_224)
            {
                _316 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _344 = _316;
            _166 = _344;
            if (_224)
            {
                _320 = (*spvDescriptorSet0.vp_c3)._m0[17].w;
            }
            float _346 = _320;
            _178 = _346;
            if (_224)
            {
                _296 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _348 = _296;
            _172 = _348;
            if (_224)
            {
                _330 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[21].w);
            }
            int _350 = _330;
            _190 = _350;
            if (_224)
            {
                _334 = (*spvDescriptorSet0.vp_c3)._m0[25].x;
            }
            float _352 = _334;
            _196 = _352;
            if (_224)
            {
                _312 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[25].w);
            }
            int _354 = _312;
            _200 = _354;
            _202 = true;
        }
    }
    else
    {
        int _356 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _358 = _356 != 0;
        _154 = _358;
        if (_358)
        {
            _128 = _43;
        }
        float _360 = _128;
        float _362 = _360;
        _160 = _360;
        if (_358)
        {
            _130 = 1.0;
        }
        float _364 = _130;
        float _366 = _364;
        _178 = _364;
        if (_358)
        {
            _132 = _45;
        }
        float _368 = _132;
        float _370 = _368;
        _166 = _368;
        if (_358)
        {
            _134 = _43;
        }
        float _372 = _134;
        float _374 = _372;
        _196 = _372;
        if (_358)
        {
            _136 = _43;
        }
        float _376 = _136;
        float _378 = _376;
        _184 = _376;
        if (_358)
        {
            _138 = _45;
        }
        float _380 = _138;
        float _382 = _380;
        _172 = _380;
        if (_358)
        {
            _140 = 1065353216;
        }
        int _384 = _140;
        _190 = _384;
        if (_358)
        {
            _142 = 1065353216;
        }
        int _386 = _142;
        _200 = _386;
        if (!_358)
        {
            float _388 = trunc(_43);
            int _390 = int(_388);
            float _392 = trunc(_45);
            int _394 = int(_392);
            int _396 = _394 << 1;
            int _398 = _396 + _390;
            int _400 = _398 << 4;
            uint _403 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
            bool _405 = _400 == 0;
            bool _407 = _400 == 16;
            bool _409 = _400 == 32;
            bool _411 = _400 == 48;
            int _413 = int(_403) & 15;
            int _415 = _400;
            float _417 = as_type<float>(_394);
            int _419 = _413;
            if (_405)
            {
                _362 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _421 = _362;
            float _423 = _421;
            if (_405)
            {
                _366 = (*spvDescriptorSet0.vp_c3)._m0[14].w;
            }
            float _425 = _366;
            float _427 = _425;
            if (_405)
            {
                _370 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _429 = _370;
            float _431 = _429;
            if (_405)
            {
                _378 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _433 = _378;
            float _435 = _433;
            if (_405)
            {
                _415 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[18].w);
            }
            int _437 = _415;
            int _439 = _437;
            if (_405)
            {
                _382 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _441 = _382;
            float _443 = _441;
            if (_407)
            {
                _431 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _445 = _431;
            float _447 = _445;
            if (_405)
            {
                _374 = (*spvDescriptorSet0.vp_c3)._m0[22].x;
            }
            float _449 = _374;
            float _451 = _449;
            if (_407)
            {
                _439 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[19].w);
            }
            int _453 = _439;
            int _455 = _453;
            if (_405)
            {
                _417 = (*spvDescriptorSet0.vp_c3)._m0[22].y;
            }
            float _457 = _417;
            float _459 = _457;
            if (_409)
            {
                _447 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _461 = _447;
            float _463 = _461;
            if (_405)
            {
                _419 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[22].w);
            }
            int _465 = _419;
            int _467 = _465;
            if (_411)
            {
                _463 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _469 = _463;
            _166 = _469;
            if (_407)
            {
                _423 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _471 = _423;
            float _473 = _471;
            if (_407)
            {
                _427 = (*spvDescriptorSet0.vp_c3)._m0[15].w;
            }
            float _475 = _427;
            float _477 = _475;
            if (_407)
            {
                _435 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _479 = _435;
            float _481 = _479;
            if (_407)
            {
                _443 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _483 = _443;
            float _485 = _483;
            if (_407)
            {
                _451 = (*spvDescriptorSet0.vp_c3)._m0[23].x;
            }
            float _487 = _451;
            float _489 = _487;
            if (_409)
            {
                _489 = (*spvDescriptorSet0.vp_c3)._m0[24].x;
            }
            float _491 = _489;
            float _493 = _491;
            if (_407)
            {
                _459 = (*spvDescriptorSet0.vp_c3)._m0[23].y;
            }
            float _495 = _459;
            float _497 = _495;
            if (_407)
            {
                _467 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[23].w);
            }
            int _499 = _467;
            int _501 = _499;
            if (_409)
            {
                _473 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _503 = _473;
            float _505 = _503;
            if (_409)
            {
                _477 = (*spvDescriptorSet0.vp_c3)._m0[16].w;
            }
            float _507 = _477;
            float _509 = _507;
            if (_409)
            {
                _481 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _511 = _481;
            float _513 = _511;
            if (_409)
            {
                _485 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _515 = _485;
            float _517 = _515;
            if (_409)
            {
                _455 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[20].w);
            }
            int _519 = _455;
            int _521 = _519;
            if (_409)
            {
                _497 = (*spvDescriptorSet0.vp_c3)._m0[24].y;
            }
            float _523 = _497;
            float _525 = _523;
            if (_411)
            {
                _525 = (*spvDescriptorSet0.vp_c3)._m0[25].y;
            }
            float _527 = _525;
            _144 = _527;
            if (_409)
            {
                _501 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[24].w);
            }
            int _529 = _501;
            _200 = _529;
            if (_411)
            {
                _505 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _531 = _505;
            _160 = _531;
            if (_411)
            {
                _509 = (*spvDescriptorSet0.vp_c3)._m0[17].w;
            }
            float _533 = _509;
            _178 = _533;
            if (_411)
            {
                _513 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _535 = _513;
            _184 = _535;
            if (_411)
            {
                _517 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _537 = _517;
            _172 = _537;
            if (_411)
            {
                _521 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[21].w);
            }
            int _539 = _521;
            _190 = _539;
            if (_411)
            {
                _493 = (*spvDescriptorSet0.vp_c3)._m0[25].x;
            }
            float _541 = _493;
            _196 = _541;
            if (_411)
            {
                _200 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[25].w);
            }
        }
    }
    _202 = false;
    float _543 = _184;
    float _545 = _144;
    float _547 = _196;
    float _549 = _172;
    float _551 = _160;
    float _553 = _166;
    float _555 = _178;
    bool _557 = _154;
    int _559 = _190;
    int _561 = _200;
    bool _563 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _565 = !_563;
    float _567 = _549;
    float _569 = _547;
    float _571 = _553;
    float _573 = _551;
    float _575 = _551;
    float _577 = _543;
    float _579 = _549;
    int _581 = _559;
    float _583 = _547;
    float _585 = _545;
    int _587 = as_type<int>(_547);
    float _589 = _545;
    float _591 = _545;
    int _593 = _561;
    float _595 = _547;
    float _615;
    int _617;
    if (!_565)
    {
        float _597 = _49 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _599 = _49 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _601 = _49 * (*spvDescriptorSet0.vp_c3)._m0[17].y;
        float _603 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[14].x, _597);
        float _605 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[15].x, _599);
        float _607 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[17].x, _601);
        float _609 = _603 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _611 = _605 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        float _613 = _607 + (*spvDescriptorSet0.vp_c3)._m0[17].w;
        _615 = _611;
        _617 = as_type<int>(_613);
        _575 = _609;
        _619 = true;
    }
    else
    {
        int _621 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _623 = _621 != 0;
        if (!_623)
        {
            _567 = _553;
        }
        float _625 = _567;
        float _627 = _625;
        _615 = _625;
        if (!_623)
        {
            _569 = _555;
        }
        float _629 = _569;
        bool _631 = !_623;
        float _633 = _629;
        _617 = as_type<int>(_629);
        if (!_631)
        {
            if (!_557)
            {
                _627 = _551;
            }
            float _635 = _627;
            float _637 = _635;
            float _639 = _635;
            if (!_557)
            {
                _633 = _553;
            }
            float _641 = _633;
            bool _643 = !_557;
            float _645 = _641;
            int _647 = as_type<int>(_641);
            if (!_643)
            {
                int _649 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _651 = _649 != 0;
                int _653 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _655 = _653 != 0;
                int _657 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _659 = _657 != 0;
                int _661 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _663 = _661 != 0;
                int _665 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _667 = _665 != 0;
                if (_651)
                {
                    _645 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _669 = _645;
                float _671 = _669;
                if (_651)
                {
                    _637 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _673 = _637;
                float _675 = _673;
                if (!_651)
                {
                    _671 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _677 = _671;
                if (!_651)
                {
                    _675 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _679 = _675;
                float _681 = _677 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _683 = _679 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                if (_667)
                {
                    float _685 = _681 * _553;
                    _571 = _685;
                }
                float _687 = _571;
                float _689 = -_681;
                float _691 = _689 + 1.0;
                int _693 = as_type<int>(_687);
                if (_663)
                {
                    float _695 = _683 * _551;
                    _573 = _695;
                }
                float _697 = _573;
                float _699 = -_683;
                float _701 = _699 + 1.0;
                float _703 = _697;
                if (_659)
                {
                    float _705 = _687 + _691;
                    _693 = as_type<int>(_705);
                }
                int _707 = _693;
                if (_655)
                {
                    float _709 = _697 + _701;
                    _703 = _709;
                }
                float _711 = _703;
                _647 = _707;
                _639 = _711;
            }
            int _713 = _647;
            float _715 = _639;
            int _717 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _719 = _717 != 0;
            int _721 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _723 = _721 != 0;
            int _725 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _727 = _725 != 0;
            int _729 = as_type<int>(_715);
            int _731 = _713;
            _617 = as_type<int>(_555);
            if (_723)
            {
                float _733 = -_715;
                float _735 = _733 + 1.0;
                _729 = as_type<int>(_735);
            }
            int _737 = _729;
            if (_727)
            {
                float _739 = -as_type<float>(_713);
                float _741 = _739 + 1.0;
                _731 = as_type<int>(_741);
            }
            int _743 = _731;
            bool _745 = !_719;
            float _747 = _745 ? as_type<float>(_737) : as_type<float>(_743);
            bool _749 = !_719;
            float _751 = _749 ? as_type<float>(_743) : as_type<float>(_737);
            _615 = _751;
            _575 = _747;
        }
    }
    _619 = false;
    float _753 = _615;
    int _755 = _617;
    float _757 = _575;
    float _759 = _753 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _761 = _753 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    out.m_25.w = as_type<float>(_755);
    bool _763 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _765 = fma(_757, (*spvDescriptorSet0.vp_c3)._m0[8].x, _759);
    float _767 = fma(_757, (*spvDescriptorSet0.vp_c3)._m0[7].x, _761);
    float _769 = _765 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _771 = _767 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _773 = -_769;
    float _775 = _773 + 1.0;
    out.m_25.x = _771;
    out.m_25.y = _775;
    bool _777 = !_763;
    float _779 = _771;
    float _781 = as_type<float>(_755);
    float _801;
    float _803;
    if (!_777)
    {
        float _783 = _49 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _785 = _49 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _787 = _49 * (*spvDescriptorSet0.vp_c3)._m0[21].y;
        float _789 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[18].x, _783);
        float _791 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[19].x, _785);
        float _793 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[21].x, _787);
        float _795 = _789 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _797 = _791 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        float _799 = _793 + (*spvDescriptorSet0.vp_c3)._m0[21].w;
        _801 = _797;
        _581 = as_type<int>(_799);
        _803 = _795;
        _805 = true;
    }
    else
    {
        int _807 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _809 = _807 != 0;
        if (!_809)
        {
            _779 = _543;
        }
        float _811 = _779;
        float _813 = _811;
        _803 = _811;
        if (!_809)
        {
            _781 = _549;
        }
        float _815 = _781;
        bool _817 = !_809;
        float _819 = _815;
        _801 = _815;
        if (!_817)
        {
            if (!_557)
            {
                _813 = _543;
            }
            float _821 = _813;
            float _823 = _821;
            int _825 = as_type<int>(_821);
            if (!_557)
            {
                _819 = _549;
            }
            float _827 = _819;
            bool _829 = !_557;
            float _831 = _827;
            float _833 = _827;
            if (!_829)
            {
                int _835 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _837 = _835 != 0;
                int _839 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _841 = _839 != 0;
                int _843 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _845 = _843 != 0;
                int _847 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _849 = _847 != 0;
                int _851 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _853 = _851 != 0;
                if (_837)
                {
                    _831 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _855 = _831;
                float _857 = _855;
                if (_837)
                {
                    _823 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _859 = _823;
                float _861 = _859;
                if (!_837)
                {
                    _861 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _863 = _861;
                if (!_837)
                {
                    _857 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _865 = _857;
                float _867 = _863 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _869 = _865 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_849)
                {
                    float _871 = _867 * _543;
                    _577 = _871;
                }
                float _873 = _577;
                float _875 = -_867;
                float _877 = _875 + 1.0;
                int _879 = as_type<int>(_873);
                if (_853)
                {
                    float _881 = _869 * _549;
                    _579 = _881;
                }
                float _883 = _579;
                float _885 = -_869;
                float _887 = _885 + 1.0;
                float _889 = _883;
                if (_841)
                {
                    float _891 = _873 + _877;
                    _879 = as_type<int>(_891);
                }
                int _893 = _879;
                if (_845)
                {
                    float _895 = _883 + _887;
                    _889 = _895;
                }
                float _897 = _889;
                _825 = _893;
                _833 = _897;
            }
            int _899 = _825;
            float _901 = _833;
            int _903 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _905 = _903 != 0;
            int _907 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _909 = _907 != 0;
            int _911 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _913 = _911 != 0;
            int _915 = _899;
            int _917 = as_type<int>(_901);
            if (_909)
            {
                float _919 = -as_type<float>(_899);
                float _921 = _919 + 1.0;
                _915 = as_type<int>(_921);
            }
            int _923 = _915;
            if (_913)
            {
                float _925 = -_901;
                float _927 = _925 + 1.0;
                _917 = as_type<int>(_927);
            }
            int _929 = _917;
            bool _931 = !_905;
            float _933 = _931 ? as_type<float>(_923) : as_type<float>(_929);
            bool _935 = !_905;
            float _937 = _935 ? as_type<float>(_929) : as_type<float>(_923);
            _801 = _937;
            _803 = _933;
        }
    }
    _805 = false;
    float _939 = _801;
    int _941 = _581;
    float _943 = _803;
    float _945 = _939 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _947 = _939 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    out.m_27.w = as_type<float>(_941);
    bool _949 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].z);
    float _951 = fma(_943, (*spvDescriptorSet0.vp_c3)._m0[10].x, _945);
    float _953 = fma(_943, (*spvDescriptorSet0.vp_c3)._m0[9].x, _947);
    float _955 = _951 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _957 = _953 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _959 = -_955;
    float _961 = _959 + 1.0;
    out.m_27.x = _957;
    out.m_27.y = _961;
    bool _963 = !_949;
    if (!_963)
    {
        float _965 = _49 * (*spvDescriptorSet0.vp_c3)._m0[22].y;
        float _967 = _49 * (*spvDescriptorSet0.vp_c3)._m0[23].y;
        float _969 = _49 * (*spvDescriptorSet0.vp_c3)._m0[25].y;
        float _971 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[22].x, _965);
        float _973 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[23].x, _967);
        float _975 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[25].x, _969);
        float _977 = _971 + (*spvDescriptorSet0.vp_c3)._m0[22].w;
        float _979 = _973 + (*spvDescriptorSet0.vp_c3)._m0[23].w;
        float _981 = _975 + (*spvDescriptorSet0.vp_c3)._m0[25].w;
        _591 = _979;
        _593 = as_type<int>(_981);
        _595 = _977;
        _983 = true;
    }
    else
    {
        int _985 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _987 = _985 != 0;
        bool _989 = !_987;
        if (!_989)
        {
            bool _991 = !_557;
            if (!_991)
            {
                int _993 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _995 = _993 != 0;
                int _997 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _999 = _997 != 0;
                int _1001 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _1003 = _1001 != 0;
                int _1005 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _1007 = _1005 != 0;
                int _1009 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _1011 = _1009 != 0;
                if (_995)
                {
                    _146 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1013 = _146;
                float _1015 = _1013;
                if (_995)
                {
                    _148 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1017 = _148;
                float _1019 = _1017;
                if (!_995)
                {
                    _1015 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1021 = _1015;
                if (!_995)
                {
                    _1019 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1023 = _1019;
                float _1025 = _1021 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _1027 = _1023 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_1007)
                {
                    float _1029 = _1025 * _547;
                    _583 = _1029;
                }
                float _1031 = _583;
                float _1033 = -_1025;
                float _1035 = _1033 + 1.0;
                int _1037 = as_type<int>(_1031);
                if (_1011)
                {
                    float _1039 = _1027 * _545;
                    _585 = _1039;
                }
                float _1041 = _585;
                float _1043 = -_1027;
                float _1045 = _1043 + 1.0;
                _589 = _1041;
                if (_999)
                {
                    float _1047 = _1031 + _1035;
                    _1037 = as_type<int>(_1047);
                }
                int _1049 = _1037;
                _587 = _1049;
                if (_1003)
                {
                    float _1051 = _1041 + _1045;
                    _589 = _1051;
                }
            }
            int _1053 = _587;
            float _1055 = _589;
            int _1057 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _1059 = _1057 != 0;
            int _1061 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _1063 = _1061 != 0;
            int _1065 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _1067 = _1065 != 0;
            int _1069 = _1053;
            int _1071 = as_type<int>(_1055);
            if (_1063)
            {
                float _1073 = -as_type<float>(_1053);
                float _1075 = _1073 + 1.0;
                _1069 = as_type<int>(_1075);
            }
            int _1077 = _1069;
            if (_1067)
            {
                float _1079 = -_1055;
                float _1081 = _1079 + 1.0;
                _1071 = as_type<int>(_1081);
            }
            int _1083 = _1071;
            bool _1085 = !_1059;
            float _1087 = _1085 ? as_type<float>(_1077) : as_type<float>(_1083);
            bool _1089 = !_1059;
            float _1091 = _1089 ? as_type<float>(_1083) : as_type<float>(_1077);
            _591 = _1091;
            _595 = _1087;
        }
    }
    _983 = false;
    float _1093 = _591;
    int _1095 = _593;
    float _1097 = _595;
    float _1099 = _1093 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _1101 = _1093 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    out.m_29.w = as_type<float>(_1095);
    float _1103 = fma(_1097, (*spvDescriptorSet0.vp_c3)._m0[12].x, _1099);
    float _1105 = fma(_1097, (*spvDescriptorSet0.vp_c3)._m0[11].x, _1101);
    float _1107 = _1103 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _1109 = _1105 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _1111 = -_1107;
    float _1113 = _1111 + 1.0;
    out.m_29.x = _1109;
    out.m_29.y = _1113;
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
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    bool _983 = false;
    bool _805 = false;
    bool _619 = false;
    bool _202 = false;
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
    float _112 = _85;
    float _114 = _101;
    float _116 = _95;
    float _118 = _99;
    float _120 = _97;
    int _122 = as_type<int>(_89);
    float _124 = _65;
    int _126 = as_type<int>(_67);
    float _128 = _85;
    float _130 = _99;
    float _132 = _101;
    float _134 = _65;
    float _136 = _97;
    float _138 = _95;
    int _140 = as_type<int>(_89);
    int _142 = as_type<int>(_67);
    float _144 = _45;
    float _146 = _49;
    float _148 = _51;
    bool _154;
    float _160;
    float _166;
    float _172;
    float _178;
    float _184;
    int _190;
    float _196;
    int _200;
    if (!_110)
    {
        int _150 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _152 = _150 != 0;
        _154 = _152;
        if (_152)
        {
            _112 = _43;
        }
        float _156 = _112;
        float _158 = _156;
        _160 = _156;
        if (_152)
        {
            _114 = _45;
        }
        float _162 = _114;
        float _164 = _162;
        _166 = _162;
        if (_152)
        {
            _116 = _45;
        }
        float _168 = _116;
        float _170 = _168;
        _172 = _168;
        if (_152)
        {
            _118 = 1.0;
        }
        float _174 = _118;
        float _176 = _174;
        _178 = _174;
        if (_152)
        {
            _120 = _43;
        }
        float _180 = _120;
        float _182 = _180;
        _184 = _180;
        if (_152)
        {
            _122 = 1065353216;
        }
        int _186 = _122;
        int _188 = _186;
        _190 = _186;
        if (_152)
        {
            _124 = _43;
        }
        float _192 = _124;
        float _194 = _192;
        _196 = _192;
        if (_152)
        {
            _126 = 1065353216;
        }
        int _198 = _126;
        _200 = _198;
        _202 = _152;
        if (!_202)
        {
            float _204 = trunc(_43);
            int _206 = int(_204);
            float _208 = trunc(_45);
            int _210 = int(_208);
            int _212 = _210 * 2;
            int _214 = _212 + _206;
            int _216 = _214 << 4;
            bool _218 = _216 == 0;
            bool _220 = _216 == 16;
            bool _222 = _216 == 32;
            bool _224 = _216 == 48;
            float _226 = as_type<float>(_210);
            int _228 = _216;
            if (_218)
            {
                _158 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _230 = _158;
            float _232 = _230;
            if (_218)
            {
                _176 = (*spvDescriptorSet0.vp_c3)._m0[14].w;
            }
            float _234 = _176;
            float _236 = _234;
            if (_218)
            {
                _164 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _238 = _164;
            float _240 = _238;
            if (_218)
            {
                _194 = (*spvDescriptorSet0.vp_c3)._m0[22].x;
            }
            float _242 = _194;
            float _244 = _242;
            if (_218)
            {
                _182 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _246 = _182;
            float _248 = _246;
            if (_220)
            {
                _240 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _250 = _240;
            float _252 = _250;
            if (_218)
            {
                _170 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _254 = _170;
            float _256 = _254;
            if (_218)
            {
                _188 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[18].w);
            }
            int _258 = _188;
            int _260 = _258;
            if (_220)
            {
                _260 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[19].w);
            }
            int _262 = _260;
            int _264 = _262;
            if (_218)
            {
                _226 = (*spvDescriptorSet0.vp_c3)._m0[22].y;
            }
            float _266 = _226;
            float _268 = _266;
            if (_218)
            {
                _228 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[22].w);
            }
            int _270 = _228;
            int _272 = _270;
            if (_220)
            {
                _232 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _274 = _232;
            float _276 = _274;
            if (_222)
            {
                _276 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _278 = _276;
            float _280 = _278;
            if (_220)
            {
                _236 = (*spvDescriptorSet0.vp_c3)._m0[15].w;
            }
            float _282 = _236;
            float _284 = _282;
            if (_220)
            {
                _248 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _286 = _248;
            float _288 = _286;
            if (_220)
            {
                _256 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _290 = _256;
            float _292 = _290;
            if (_222)
            {
                _292 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _294 = _292;
            float _296 = _294;
            if (_220)
            {
                _244 = (*spvDescriptorSet0.vp_c3)._m0[23].x;
            }
            float _298 = _244;
            float _300 = _298;
            if (_220)
            {
                _268 = (*spvDescriptorSet0.vp_c3)._m0[23].y;
            }
            float _302 = _268;
            float _304 = _302;
            if (_220)
            {
                _272 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[23].w);
            }
            int _306 = _272;
            int _308 = _306;
            if (_222)
            {
                _308 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[24].w);
            }
            int _310 = _308;
            int _312 = _310;
            if (_222)
            {
                _252 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _314 = _252;
            float _316 = _314;
            if (_222)
            {
                _284 = (*spvDescriptorSet0.vp_c3)._m0[16].w;
            }
            float _318 = _284;
            float _320 = _318;
            if (_222)
            {
                _288 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _322 = _288;
            float _324 = _322;
            if (_224)
            {
                _324 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _326 = _324;
            _184 = _326;
            if (_222)
            {
                _264 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[20].w);
            }
            int _328 = _264;
            int _330 = _328;
            if (_222)
            {
                _300 = (*spvDescriptorSet0.vp_c3)._m0[24].x;
            }
            float _332 = _300;
            float _334 = _332;
            if (_222)
            {
                _304 = (*spvDescriptorSet0.vp_c3)._m0[24].y;
            }
            float _336 = _304;
            float _338 = _336;
            if (_224)
            {
                _338 = (*spvDescriptorSet0.vp_c3)._m0[25].y;
            }
            float _340 = _338;
            _144 = _340;
            if (_224)
            {
                _280 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _342 = _280;
            _160 = _342;
            if (_224)
            {
                _316 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _344 = _316;
            _166 = _344;
            if (_224)
            {
                _320 = (*spvDescriptorSet0.vp_c3)._m0[17].w;
            }
            float _346 = _320;
            _178 = _346;
            if (_224)
            {
                _296 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _348 = _296;
            _172 = _348;
            if (_224)
            {
                _330 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[21].w);
            }
            int _350 = _330;
            _190 = _350;
            if (_224)
            {
                _334 = (*spvDescriptorSet0.vp_c3)._m0[25].x;
            }
            float _352 = _334;
            _196 = _352;
            if (_224)
            {
                _312 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[25].w);
            }
            int _354 = _312;
            _200 = _354;
            _202 = true;
        }
    }
    else
    {
        int _356 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _358 = _356 != 0;
        _154 = _358;
        if (_358)
        {
            _128 = _43;
        }
        float _360 = _128;
        float _362 = _360;
        _160 = _360;
        if (_358)
        {
            _130 = 1.0;
        }
        float _364 = _130;
        float _366 = _364;
        _178 = _364;
        if (_358)
        {
            _132 = _45;
        }
        float _368 = _132;
        float _370 = _368;
        _166 = _368;
        if (_358)
        {
            _134 = _43;
        }
        float _372 = _134;
        float _374 = _372;
        _196 = _372;
        if (_358)
        {
            _136 = _43;
        }
        float _376 = _136;
        float _378 = _376;
        _184 = _376;
        if (_358)
        {
            _138 = _45;
        }
        float _380 = _138;
        float _382 = _380;
        _172 = _380;
        if (_358)
        {
            _140 = 1065353216;
        }
        int _384 = _140;
        _190 = _384;
        if (_358)
        {
            _142 = 1065353216;
        }
        int _386 = _142;
        _200 = _386;
        if (!_358)
        {
            float _388 = trunc(_43);
            int _390 = int(_388);
            float _392 = trunc(_45);
            int _394 = int(_392);
            int _396 = _394 << 1;
            int _398 = _396 + _390;
            int _400 = _398 << 4;
            uint _403 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
            bool _405 = _400 == 0;
            bool _407 = _400 == 16;
            bool _409 = _400 == 32;
            bool _411 = _400 == 48;
            int _413 = int(_403) & 15;
            int _415 = _400;
            float _417 = as_type<float>(_394);
            int _419 = _413;
            if (_405)
            {
                _362 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _421 = _362;
            float _423 = _421;
            if (_405)
            {
                _366 = (*spvDescriptorSet0.vp_c3)._m0[14].w;
            }
            float _425 = _366;
            float _427 = _425;
            if (_405)
            {
                _370 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _429 = _370;
            float _431 = _429;
            if (_405)
            {
                _378 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _433 = _378;
            float _435 = _433;
            if (_405)
            {
                _415 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[18].w);
            }
            int _437 = _415;
            int _439 = _437;
            if (_405)
            {
                _382 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _441 = _382;
            float _443 = _441;
            if (_407)
            {
                _431 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _445 = _431;
            float _447 = _445;
            if (_405)
            {
                _374 = (*spvDescriptorSet0.vp_c3)._m0[22].x;
            }
            float _449 = _374;
            float _451 = _449;
            if (_407)
            {
                _439 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[19].w);
            }
            int _453 = _439;
            int _455 = _453;
            if (_405)
            {
                _417 = (*spvDescriptorSet0.vp_c3)._m0[22].y;
            }
            float _457 = _417;
            float _459 = _457;
            if (_409)
            {
                _447 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _461 = _447;
            float _463 = _461;
            if (_405)
            {
                _419 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[22].w);
            }
            int _465 = _419;
            int _467 = _465;
            if (_411)
            {
                _463 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _469 = _463;
            _166 = _469;
            if (_407)
            {
                _423 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _471 = _423;
            float _473 = _471;
            if (_407)
            {
                _427 = (*spvDescriptorSet0.vp_c3)._m0[15].w;
            }
            float _475 = _427;
            float _477 = _475;
            if (_407)
            {
                _435 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _479 = _435;
            float _481 = _479;
            if (_407)
            {
                _443 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _483 = _443;
            float _485 = _483;
            if (_407)
            {
                _451 = (*spvDescriptorSet0.vp_c3)._m0[23].x;
            }
            float _487 = _451;
            float _489 = _487;
            if (_409)
            {
                _489 = (*spvDescriptorSet0.vp_c3)._m0[24].x;
            }
            float _491 = _489;
            float _493 = _491;
            if (_407)
            {
                _459 = (*spvDescriptorSet0.vp_c3)._m0[23].y;
            }
            float _495 = _459;
            float _497 = _495;
            if (_407)
            {
                _467 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[23].w);
            }
            int _499 = _467;
            int _501 = _499;
            if (_409)
            {
                _473 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _503 = _473;
            float _505 = _503;
            if (_409)
            {
                _477 = (*spvDescriptorSet0.vp_c3)._m0[16].w;
            }
            float _507 = _477;
            float _509 = _507;
            if (_409)
            {
                _481 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _511 = _481;
            float _513 = _511;
            if (_409)
            {
                _485 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _515 = _485;
            float _517 = _515;
            if (_409)
            {
                _455 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[20].w);
            }
            int _519 = _455;
            int _521 = _519;
            if (_409)
            {
                _497 = (*spvDescriptorSet0.vp_c3)._m0[24].y;
            }
            float _523 = _497;
            float _525 = _523;
            if (_411)
            {
                _525 = (*spvDescriptorSet0.vp_c3)._m0[25].y;
            }
            float _527 = _525;
            _144 = _527;
            if (_409)
            {
                _501 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[24].w);
            }
            int _529 = _501;
            _200 = _529;
            if (_411)
            {
                _505 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _531 = _505;
            _160 = _531;
            if (_411)
            {
                _509 = (*spvDescriptorSet0.vp_c3)._m0[17].w;
            }
            float _533 = _509;
            _178 = _533;
            if (_411)
            {
                _513 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _535 = _513;
            _184 = _535;
            if (_411)
            {
                _517 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _537 = _517;
            _172 = _537;
            if (_411)
            {
                _521 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[21].w);
            }
            int _539 = _521;
            _190 = _539;
            if (_411)
            {
                _493 = (*spvDescriptorSet0.vp_c3)._m0[25].x;
            }
            float _541 = _493;
            _196 = _541;
            if (_411)
            {
                _200 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[25].w);
            }
        }
    }
    _202 = false;
    float _543 = _184;
    float _545 = _144;
    float _547 = _196;
    float _549 = _172;
    float _551 = _160;
    float _553 = _166;
    float _555 = _178;
    bool _557 = _154;
    int _559 = _190;
    int _561 = _200;
    bool _563 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _565 = !_563;
    float _567 = _549;
    float _569 = _547;
    float _571 = _553;
    float _573 = _551;
    float _575 = _551;
    float _577 = _543;
    float _579 = _549;
    int _581 = _559;
    float _583 = _547;
    float _585 = _545;
    int _587 = as_type<int>(_547);
    float _589 = _545;
    float _591 = _545;
    int _593 = _561;
    float _595 = _547;
    float _615;
    int _617;
    if (!_565)
    {
        float _597 = _49 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _599 = _49 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _601 = _49 * (*spvDescriptorSet0.vp_c3)._m0[17].y;
        float _603 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[14].x, _597);
        float _605 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[15].x, _599);
        float _607 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[17].x, _601);
        float _609 = _603 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _611 = _605 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        float _613 = _607 + (*spvDescriptorSet0.vp_c3)._m0[17].w;
        _615 = _611;
        _617 = as_type<int>(_613);
        _575 = _609;
        _619 = true;
    }
    else
    {
        int _621 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _623 = _621 != 0;
        if (!_623)
        {
            _567 = _553;
        }
        float _625 = _567;
        float _627 = _625;
        _615 = _625;
        if (!_623)
        {
            _569 = _555;
        }
        float _629 = _569;
        bool _631 = !_623;
        float _633 = _629;
        _617 = as_type<int>(_629);
        if (!_631)
        {
            if (!_557)
            {
                _627 = _551;
            }
            float _635 = _627;
            float _637 = _635;
            float _639 = _635;
            if (!_557)
            {
                _633 = _553;
            }
            float _641 = _633;
            bool _643 = !_557;
            float _645 = _641;
            int _647 = as_type<int>(_641);
            if (!_643)
            {
                int _649 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _651 = _649 != 0;
                int _653 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _655 = _653 != 0;
                int _657 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _659 = _657 != 0;
                int _661 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _663 = _661 != 0;
                int _665 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _667 = _665 != 0;
                if (_651)
                {
                    _645 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _669 = _645;
                float _671 = _669;
                if (_651)
                {
                    _637 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _673 = _637;
                float _675 = _673;
                if (!_651)
                {
                    _671 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _677 = _671;
                if (!_651)
                {
                    _675 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _679 = _675;
                float _681 = _677 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _683 = _679 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                if (_667)
                {
                    float _685 = _681 * _553;
                    _571 = _685;
                }
                float _687 = _571;
                float _689 = -_681;
                float _691 = _689 + 1.0;
                int _693 = as_type<int>(_687);
                if (_663)
                {
                    float _695 = _683 * _551;
                    _573 = _695;
                }
                float _697 = _573;
                float _699 = -_683;
                float _701 = _699 + 1.0;
                float _703 = _697;
                if (_659)
                {
                    float _705 = _687 + _691;
                    _693 = as_type<int>(_705);
                }
                int _707 = _693;
                if (_655)
                {
                    float _709 = _697 + _701;
                    _703 = _709;
                }
                float _711 = _703;
                _647 = _707;
                _639 = _711;
            }
            int _713 = _647;
            float _715 = _639;
            int _717 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _719 = _717 != 0;
            int _721 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _723 = _721 != 0;
            int _725 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _727 = _725 != 0;
            int _729 = as_type<int>(_715);
            int _731 = _713;
            _617 = as_type<int>(_555);
            if (_723)
            {
                float _733 = -_715;
                float _735 = _733 + 1.0;
                _729 = as_type<int>(_735);
            }
            int _737 = _729;
            if (_727)
            {
                float _739 = -as_type<float>(_713);
                float _741 = _739 + 1.0;
                _731 = as_type<int>(_741);
            }
            int _743 = _731;
            bool _745 = !_719;
            float _747 = _745 ? as_type<float>(_737) : as_type<float>(_743);
            bool _749 = !_719;
            float _751 = _749 ? as_type<float>(_743) : as_type<float>(_737);
            _615 = _751;
            _575 = _747;
        }
    }
    _619 = false;
    float _753 = _615;
    int _755 = _617;
    float _757 = _575;
    float _759 = _753 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _761 = _753 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    out.m_25.w = as_type<float>(_755);
    bool _763 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _765 = fma(_757, (*spvDescriptorSet0.vp_c3)._m0[8].x, _759);
    float _767 = fma(_757, (*spvDescriptorSet0.vp_c3)._m0[7].x, _761);
    float _769 = _765 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _771 = _767 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _773 = -_769;
    float _775 = _773 + 1.0;
    out.m_25.x = _771;
    out.m_25.y = _775;
    bool _777 = !_763;
    float _779 = _771;
    float _781 = as_type<float>(_755);
    float _801;
    float _803;
    if (!_777)
    {
        float _783 = _49 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _785 = _49 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _787 = _49 * (*spvDescriptorSet0.vp_c3)._m0[21].y;
        float _789 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[18].x, _783);
        float _791 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[19].x, _785);
        float _793 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[21].x, _787);
        float _795 = _789 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _797 = _791 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        float _799 = _793 + (*spvDescriptorSet0.vp_c3)._m0[21].w;
        _801 = _797;
        _581 = as_type<int>(_799);
        _803 = _795;
        _805 = true;
    }
    else
    {
        int _807 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _809 = _807 != 0;
        if (!_809)
        {
            _779 = _543;
        }
        float _811 = _779;
        float _813 = _811;
        _803 = _811;
        if (!_809)
        {
            _781 = _549;
        }
        float _815 = _781;
        bool _817 = !_809;
        float _819 = _815;
        _801 = _815;
        if (!_817)
        {
            if (!_557)
            {
                _813 = _543;
            }
            float _821 = _813;
            float _823 = _821;
            int _825 = as_type<int>(_821);
            if (!_557)
            {
                _819 = _549;
            }
            float _827 = _819;
            bool _829 = !_557;
            float _831 = _827;
            float _833 = _827;
            if (!_829)
            {
                int _835 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _837 = _835 != 0;
                int _839 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _841 = _839 != 0;
                int _843 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _845 = _843 != 0;
                int _847 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _849 = _847 != 0;
                int _851 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _853 = _851 != 0;
                if (_837)
                {
                    _831 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _855 = _831;
                float _857 = _855;
                if (_837)
                {
                    _823 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _859 = _823;
                float _861 = _859;
                if (!_837)
                {
                    _861 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _863 = _861;
                if (!_837)
                {
                    _857 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _865 = _857;
                float _867 = _863 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _869 = _865 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_849)
                {
                    float _871 = _867 * _543;
                    _577 = _871;
                }
                float _873 = _577;
                float _875 = -_867;
                float _877 = _875 + 1.0;
                int _879 = as_type<int>(_873);
                if (_853)
                {
                    float _881 = _869 * _549;
                    _579 = _881;
                }
                float _883 = _579;
                float _885 = -_869;
                float _887 = _885 + 1.0;
                float _889 = _883;
                if (_841)
                {
                    float _891 = _873 + _877;
                    _879 = as_type<int>(_891);
                }
                int _893 = _879;
                if (_845)
                {
                    float _895 = _883 + _887;
                    _889 = _895;
                }
                float _897 = _889;
                _825 = _893;
                _833 = _897;
            }
            int _899 = _825;
            float _901 = _833;
            int _903 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _905 = _903 != 0;
            int _907 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _909 = _907 != 0;
            int _911 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _913 = _911 != 0;
            int _915 = _899;
            int _917 = as_type<int>(_901);
            if (_909)
            {
                float _919 = -as_type<float>(_899);
                float _921 = _919 + 1.0;
                _915 = as_type<int>(_921);
            }
            int _923 = _915;
            if (_913)
            {
                float _925 = -_901;
                float _927 = _925 + 1.0;
                _917 = as_type<int>(_927);
            }
            int _929 = _917;
            bool _931 = !_905;
            float _933 = _931 ? as_type<float>(_923) : as_type<float>(_929);
            bool _935 = !_905;
            float _937 = _935 ? as_type<float>(_929) : as_type<float>(_923);
            _801 = _937;
            _803 = _933;
        }
    }
    _805 = false;
    float _939 = _801;
    int _941 = _581;
    float _943 = _803;
    float _945 = _939 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _947 = _939 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    out.m_27.w = as_type<float>(_941);
    bool _949 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].z);
    float _951 = fma(_943, (*spvDescriptorSet0.vp_c3)._m0[10].x, _945);
    float _953 = fma(_943, (*spvDescriptorSet0.vp_c3)._m0[9].x, _947);
    float _955 = _951 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _957 = _953 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _959 = -_955;
    float _961 = _959 + 1.0;
    out.m_27.x = _957;
    out.m_27.y = _961;
    bool _963 = !_949;
    if (!_963)
    {
        float _965 = _49 * (*spvDescriptorSet0.vp_c3)._m0[22].y;
        float _967 = _49 * (*spvDescriptorSet0.vp_c3)._m0[23].y;
        float _969 = _49 * (*spvDescriptorSet0.vp_c3)._m0[25].y;
        float _971 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[22].x, _965);
        float _973 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[23].x, _967);
        float _975 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[25].x, _969);
        float _977 = _971 + (*spvDescriptorSet0.vp_c3)._m0[22].w;
        float _979 = _973 + (*spvDescriptorSet0.vp_c3)._m0[23].w;
        float _981 = _975 + (*spvDescriptorSet0.vp_c3)._m0[25].w;
        _591 = _979;
        _593 = as_type<int>(_981);
        _595 = _977;
        _983 = true;
    }
    else
    {
        int _985 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _987 = _985 != 0;
        bool _989 = !_987;
        if (!_989)
        {
            bool _991 = !_557;
            if (!_991)
            {
                int _993 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _995 = _993 != 0;
                int _997 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _999 = _997 != 0;
                int _1001 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _1003 = _1001 != 0;
                int _1005 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _1007 = _1005 != 0;
                int _1009 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _1011 = _1009 != 0;
                if (_995)
                {
                    _146 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1013 = _146;
                float _1015 = _1013;
                if (_995)
                {
                    _148 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1017 = _148;
                float _1019 = _1017;
                if (!_995)
                {
                    _1015 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _1021 = _1015;
                if (!_995)
                {
                    _1019 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _1023 = _1019;
                float _1025 = _1021 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _1027 = _1023 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_1007)
                {
                    float _1029 = _1025 * _547;
                    _583 = _1029;
                }
                float _1031 = _583;
                float _1033 = -_1025;
                float _1035 = _1033 + 1.0;
                int _1037 = as_type<int>(_1031);
                if (_1011)
                {
                    float _1039 = _1027 * _545;
                    _585 = _1039;
                }
                float _1041 = _585;
                float _1043 = -_1027;
                float _1045 = _1043 + 1.0;
                _589 = _1041;
                if (_999)
                {
                    float _1047 = _1031 + _1035;
                    _1037 = as_type<int>(_1047);
                }
                int _1049 = _1037;
                _587 = _1049;
                if (_1003)
                {
                    float _1051 = _1041 + _1045;
                    _589 = _1051;
                }
            }
            int _1053 = _587;
            float _1055 = _589;
            int _1057 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _1059 = _1057 != 0;
            int _1061 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _1063 = _1061 != 0;
            int _1065 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _1067 = _1065 != 0;
            int _1069 = _1053;
            int _1071 = as_type<int>(_1055);
            if (_1063)
            {
                float _1073 = -as_type<float>(_1053);
                float _1075 = _1073 + 1.0;
                _1069 = as_type<int>(_1075);
            }
            int _1077 = _1069;
            if (_1067)
            {
                float _1079 = -_1055;
                float _1081 = _1079 + 1.0;
                _1071 = as_type<int>(_1081);
            }
            int _1083 = _1071;
            bool _1085 = !_1059;
            float _1087 = _1085 ? as_type<float>(_1077) : as_type<float>(_1083);
            bool _1089 = !_1059;
            float _1091 = _1089 ? as_type<float>(_1083) : as_type<float>(_1077);
            _591 = _1091;
            _595 = _1087;
        }
    }
    _983 = false;
    float _1093 = _591;
    int _1095 = _593;
    float _1097 = _595;
    float _1099 = _1093 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _1101 = _1093 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    out.m_29.w = as_type<float>(_1095);
    float _1103 = fma(_1097, (*spvDescriptorSet0.vp_c3)._m0[12].x, _1099);
    float _1105 = fma(_1097, (*spvDescriptorSet0.vp_c3)._m0[11].x, _1101);
    float _1107 = _1103 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _1109 = _1105 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _1111 = -_1107;
    float _1113 = _1111 + 1.0;
    out.m_29.x = _1109;
    out.m_29.y = _1113;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_25.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_25.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_25.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_25.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_27.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_27.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_27.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_27.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

