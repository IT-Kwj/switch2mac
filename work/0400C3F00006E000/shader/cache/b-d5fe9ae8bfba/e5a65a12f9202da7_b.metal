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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
};

struct main0_out
{
    float4 m_57 [[user(locn0)]];
    float4 m_53 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
    float4 m_63 [[user(locn3)]];
    float4 m_35 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_55 [[user(locn6)]];
    float4 m_59 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_32 [[attribute(2)]];
    float4 m_37 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_45 [[attribute(5)]];
    float4 m_41 [[attribute(6)]];
    float4 m_39 [[attribute(7)]];
    float4 m_49 [[attribute(9)]];
    float4 m_43 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1402 = false;
    bool _800 = false;
    bool _548 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _77 = in.m_32.w;
    float _79 = trunc(_77);
    int _82 = int(_79);
    bool _86 = _82 >= 1;
    float _88 = 0.0;
    if (!_86)
    {
        _88 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _90 = _88;
    float _92 = _90;
    if (!_86)
    {
        out.m_35.x = 0.0;
    }
    int _94 = 0;
    if (!_86)
    {
        float _96 = _90 * 5.0;
        _94 = as_type<int>(_96);
    }
    int _98 = _94;
    int _100 = _98;
    if (!_86)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1589 = as_type<float>(_98);
        out.gl_Position.z = _1589;
    }
    if (!_86)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _102 = in.m_37.w;
    bool _104 = _102 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _106 = isnan(_102);
    bool _108 = _104 || _106;
    bool _110 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _112 = _108 || _110;
    float _114 = -_102;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_112)
    {
        float _118 = float(_82);
        _92 = _118;
    }
    float _120 = _92;
    bool _122 = _116 >= _120;
    bool _124 = !_112;
    bool _126 = _122 || _124;
    float _128 = _120;
    if (_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _128;
    if (_126)
    {
        out.m_35.x = 0.0;
    }
    if (_126)
    {
        float _132 = _130 * 5.0;
        _100 = as_type<int>(_132);
    }
    int _134 = _100;
    if (_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1658 = as_type<float>(_134);
        out.gl_Position.z = _1658;
    }
    if (_126)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _136 = in.m_37.x;
    float _138 = in.m_37.y;
    float _140 = in.m_37.z;
    float _142 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _144 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _146 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _148 = _144 || _146;
    bool _150 = isnan(1.0);
    bool _152 = _148 || _150;
    float _154 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _156 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _154);
    float _158 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _160 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _158);
    float _162 = _158;
    float _164 = (*spvDescriptorSet0.vp_c10)._m0[19].z;
    float _166 = _142;
    if (!_152)
    {
        float _168 = _142 * _142;
        float _170 = _168 * 0.5;
        _162 = _170;
    }
    float _172 = _162;
    float _174 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _156);
    float _176 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _160);
    float _178 = _172;
    if (!_152)
    {
        float _180 = _172 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    bool _184 = !_152;
    float _186 = _182;
    if (!_184)
    {
        float _188 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = log2(_188);
        float _192 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _194 = _192 + 1.0;
        float _196 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = _142 * _190;
        float _200 = exp2(_198);
        float _202 = _196 * 0.693147182464599609375;
        float _204 = 1.0 / _202;
        float _206 = 1.0 / _194;
        float _208 = _200 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _204, _142);
        float _214 = _212 * _206;
        float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _216;
        _164 = _200;
    }
    float _218 = _186;
    float _220 = _164;
    bool _222 = !_152;
    float _224 = _220;
    if (!_222)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = 1.0 / _232;
        float _236 = _142 * _228;
        float _238 = exp2(_236);
        float _240 = -_238;
        float _242 = _240 + 1.0;
        float _244 = _242 * _234;
        _166 = _244;
        _224 = _234;
    }
    float _246 = _166;
    float _248 = _224;
    float _250 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _252 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _254 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _256 = _248;
    float _258 = _250;
    float _260 = _254;
    if (!_152)
    {
        float _262 = _116 * _116;
        float _264 = _262 * 0.5;
        _256 = _264;
    }
    float _266 = _256;
    float _268 = fma(_246, _136, _250);
    float _270 = fma(_246, _138, _252);
    float _272 = fma(_246, _140, _254);
    if (!_152)
    {
        float _274 = _266 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _258 = _274;
    }
    float _276 = _258;
    bool _278 = !_152;
    float _280 = _276;
    if (!_278)
    {
        float _282 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _284 = log2(_282);
        float _286 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _288 = _286 + 1.0;
        float _290 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _292 = _116 * _284;
        float _294 = 1.0 / _288;
        float _296 = _290 * 0.693147182464599609375;
        float _298 = exp2(_292);
        float _300 = 1.0 / _296;
        float _302 = _298 + (-1.0);
        float _304 = -_302;
        float _306 = fma(_304, _300, _116);
        float _308 = _306 * _294;
        float _310 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _280 = _310;
        _260 = _298;
    }
    float _312 = _280;
    float _314 = _260;
    float _316 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _318 = _314;
    if (!_152)
    {
        _318 = _116;
    }
    float _320 = _318;
    bool _322 = !_152;
    float _324 = _320;
    if (!_322)
    {
        float _326 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _328 = log2(_326);
        float _330 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _332 = _330 + 1.0;
        float _334 = 1.0 / _332;
        float _336 = _116 * _328;
        float _338 = exp2(_336);
        float _340 = -_338;
        float _342 = _340 + 1.0;
        float _344 = _342 * _334;
        _324 = _344;
    }
    float _346 = _324;
    float _348 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _350 = fma(_346, _138, _316);
    float _352 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _354 = fma(_346, _136, _348);
    float _356 = -_350;
    float _358 = _270 + _356;
    float _360 = fma(_346, _140, _352);
    float _362 = -_354;
    float _364 = _268 + _362;
    float _366 = _358 * _358;
    float _368 = -_360;
    float _370 = _272 + _368;
    float _372 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _374 = sqrt(_174);
    float _376 = fma(_364, _364, _366);
    float _378 = in.m_39.w;
    float _380 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _372);
    float _382 = _358 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _384 = fma(_370, _370, _376);
    float _386 = _358 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _388 = sqrt(_176);
    float _390 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[14].y, _382);
    float _392 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[14].z, _386);
    float _394 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _380);
    float _396 = _358 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _398 = sqrt(_384);
    float _400 = in.m_32.x;
    float _402 = in.m_32.y;
    float _404 = in.m_32.z;
    float _406 = _358 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _408 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[14].x, _396);
    float _410 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[16].z, _392);
    float _412 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[14].w, _406);
    float _414 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[16].x, _408);
    float _416 = sqrt(_394);
    float _418 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[16].y, _390);
    float _420 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[16].w, _412);
    float _422 = _374 * _414;
    float _424 = _388 * _418;
    bool _426 = _398 >= 9.9999999747524270787835121154785e-07;
    bool _428 = isnan(_398);
    bool _430 = _426 || _428;
    bool _432 = isnan(9.9999999747524270787835121154785e-07);
    bool _434 = _430 || _432;
    float _436 = _424 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _438 = _424 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _440 = _424 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _442 = fma(_422, (*spvDescriptorSet0.vp_c8)._m0[24].x, _436);
    float _444 = fma(_422, (*spvDescriptorSet0.vp_c8)._m0[25].x, _438);
    float _446 = fma(_422, (*spvDescriptorSet0.vp_c8)._m0[26].x, _440);
    float _448 = _416 * _410;
    float _450 = fma(_268, _378, _400);
    float _452 = fma(_270, _378, _402);
    float _454 = fma(_272, _378, _404);
    float _456 = fma(_448, (*spvDescriptorSet0.vp_c8)._m0[24].z, _442);
    float _458 = fma(_448, (*spvDescriptorSet0.vp_c8)._m0[25].z, _444);
    float _460 = fma(_448, (*spvDescriptorSet0.vp_c8)._m0[26].z, _446);
    float _462 = fma(_420, (*spvDescriptorSet0.vp_c8)._m0[24].w, _456);
    float _464 = fma(_420, (*spvDescriptorSet0.vp_c8)._m0[25].w, _458);
    float _466 = fma(_420, (*spvDescriptorSet0.vp_c8)._m0[26].w, _460);
    float _468 = _464;
    float _470 = _462;
    float _472 = _466;
    if (!_434)
    {
        bool _474 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _476 = !_474;
        if (!_476)
        {
            float _478 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].y;
            float _480 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].x;
            float _482 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].z;
            float _484 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].y, _478);
            float _486 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].x, _480);
            float _488 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].z, _482);
            float _490 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].y, _484);
            float _492 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].x, _486);
            float _494 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].w;
            float _496 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].z, _488);
            float _498 = _388 * _490;
            float _500 = _374 * _492;
            float _502 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].w, _494);
            float _504 = _416 * _496;
            float _506 = _498 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
            float _508 = _498 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
            float _510 = _498 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
            float _512 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].w, _502);
            float _514 = fma(_500, (*spvDescriptorSet0.vp_c8)._m0[25].x, _506);
            float _516 = fma(_500, (*spvDescriptorSet0.vp_c8)._m0[24].x, _508);
            float _518 = fma(_500, (*spvDescriptorSet0.vp_c8)._m0[26].x, _510);
            float _520 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[25].z, _514);
            float _522 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[24].z, _516);
            float _524 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[26].z, _518);
            float _526 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[25].w, _520);
            float _528 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[24].w, _522);
            float _530 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[26].w, _524);
            float _532 = _526 * _526;
            float _534 = fma(_528, _528, _532);
            float _536 = fma(_530, _530, _534);
            float _538 = rsqrt(_536);
            float _540 = _538 * 9.9999999747524270787835121154785e-07;
            float _542 = _526 * _540;
            float _544 = _528 * _540;
            float _546 = _530 * _540;
            _468 = _542;
            _470 = _544;
            _472 = _546;
            _548 = true;
        }
        else
        {
            float _550 = _138 * _138;
            float _552 = fma(_136, _136, _550);
            float _554 = fma(_140, _140, _552);
            float _556 = sqrt(_554);
            bool _558 = _556 >= 9.9999999747524270787835121154785e-07;
            bool _560 = isnan(_556);
            bool _562 = _558 || _560;
            bool _564 = isnan(9.9999999747524270787835121154785e-07);
            bool _566 = _562 || _564;
            if (!_566)
            {
                float _568 = _402 * _402;
                float _570 = fma(_400, _400, _568);
                float _572 = fma(_404, _404, _570);
                float _574 = sqrt(_572);
                bool _576 = _574 >= 9.9999999747524270787835121154785e-07;
                bool _578 = isnan(_574);
                bool _580 = _576 || _578;
                bool _582 = isnan(9.9999999747524270787835121154785e-07);
                bool _584 = _580 || _582;
                if (!_584)
                {
                    float _586 = _388 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _588 = _374 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _590 = _416 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _592 = _586 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _594 = _586 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _596 = _586 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _598 = fma(_588, (*spvDescriptorSet0.vp_c8)._m0[25].x, _592);
                    float _600 = fma(_588, (*spvDescriptorSet0.vp_c8)._m0[24].x, _594);
                    float _602 = fma(_588, (*spvDescriptorSet0.vp_c8)._m0[26].x, _596);
                    float _604 = fma(_590, (*spvDescriptorSet0.vp_c8)._m0[25].z, _598);
                    float _606 = fma(_590, (*spvDescriptorSet0.vp_c8)._m0[24].z, _600);
                    float _608 = fma(_590, (*spvDescriptorSet0.vp_c8)._m0[26].z, _602);
                    float _610 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[25].w, _604);
                    float _612 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[24].w, _606);
                    float _614 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[26].w, _608);
                    float _616 = _610 * _610;
                    float _618 = fma(_612, _612, _616);
                    float _620 = fma(_614, _614, _618);
                    float _622 = rsqrt(_620);
                    float _624 = _622 * 9.9999999747524270787835121154785e-07;
                    float _626 = _610 * _624;
                    float _628 = _612 * _624;
                    float _630 = _614 * _624;
                    _468 = _626;
                    _470 = _628;
                    _472 = _630;
                    _548 = true;
                }
                else
                {
                    float _632 = _402 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _634 = _402 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _636 = _402 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _638 = _402 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                    float _640 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[14].y, _632);
                    float _642 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[14].x, _634);
                    float _644 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[14].z, _636);
                    float _646 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[14].w, _638);
                    float _648 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[16].y, _640);
                    float _650 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[16].x, _642);
                    float _652 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[16].z, _644);
                    float _654 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[16].w, _646);
                    float _656 = _388 * _648;
                    float _658 = _374 * _650;
                    float _660 = _416 * _652;
                    float _662 = _656 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _664 = _656 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _666 = _656 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _668 = fma(_658, (*spvDescriptorSet0.vp_c8)._m0[25].x, _662);
                    float _670 = fma(_658, (*spvDescriptorSet0.vp_c8)._m0[24].x, _664);
                    float _672 = fma(_658, (*spvDescriptorSet0.vp_c8)._m0[26].x, _666);
                    float _674 = fma(_660, (*spvDescriptorSet0.vp_c8)._m0[25].z, _668);
                    float _676 = fma(_660, (*spvDescriptorSet0.vp_c8)._m0[24].z, _670);
                    float _678 = fma(_660, (*spvDescriptorSet0.vp_c8)._m0[26].z, _672);
                    float _680 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[25].w, _674);
                    float _682 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[24].w, _676);
                    float _684 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[26].w, _678);
                    float _686 = _680 * _680;
                    float _688 = fma(_682, _682, _686);
                    float _690 = fma(_684, _684, _688);
                    float _692 = rsqrt(_690);
                    float _694 = _692 * 9.9999999747524270787835121154785e-07;
                    float _696 = _682 * _694;
                    float _698 = _680 * _694;
                    float _700 = _684 * _694;
                    _468 = _698;
                    _470 = _696;
                    _472 = _700;
                    _548 = true;
                }
            }
            else
            {
                float _702 = _138 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                float _704 = _138 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                float _706 = _138 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                float _708 = _138 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                float _710 = fma(_136, (*spvDescriptorSet0.vp_c10)._m0[14].y, _702);
                float _712 = fma(_136, (*spvDescriptorSet0.vp_c10)._m0[14].x, _704);
                float _714 = fma(_136, (*spvDescriptorSet0.vp_c10)._m0[14].z, _706);
                float _716 = fma(_136, (*spvDescriptorSet0.vp_c10)._m0[14].w, _708);
                float _718 = fma(_140, (*spvDescriptorSet0.vp_c10)._m0[16].y, _710);
                float _720 = fma(_140, (*spvDescriptorSet0.vp_c10)._m0[16].x, _712);
                float _722 = fma(_140, (*spvDescriptorSet0.vp_c10)._m0[16].z, _714);
                float _724 = fma(_140, (*spvDescriptorSet0.vp_c10)._m0[16].w, _716);
                float _726 = _388 * _718;
                float _728 = _374 * _720;
                float _730 = _416 * _722;
                float _732 = _726 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                float _734 = _726 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                float _736 = _726 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                float _738 = fma(_728, (*spvDescriptorSet0.vp_c8)._m0[25].x, _732);
                float _740 = fma(_728, (*spvDescriptorSet0.vp_c8)._m0[24].x, _734);
                float _742 = fma(_728, (*spvDescriptorSet0.vp_c8)._m0[26].x, _736);
                float _744 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[25].z, _738);
                float _746 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[24].z, _740);
                float _748 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[26].z, _742);
                float _750 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[25].w, _744);
                float _752 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[24].w, _746);
                float _754 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[26].w, _748);
                float _756 = _750 * _750;
                float _758 = fma(_752, _752, _756);
                float _760 = fma(_754, _754, _758);
                float _762 = rsqrt(_760);
                float _764 = _762 * 9.9999999747524270787835121154785e-07;
                float _766 = _752 * _764;
                float _768 = _750 * _764;
                float _770 = _754 * _764;
                _468 = _768;
                _470 = _766;
                _472 = _770;
            }
        }
    }
    _548 = false;
    float _772 = _468;
    float _774 = _470;
    float _776 = _472;
    bool _778 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    bool _780 = !_778;
    float _798;
    if (!_780)
    {
        float _782 = in.m_41.x;
        float _784 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _786 = _782 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _788 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _790 = _788 * _784;
        float _792 = floor(_790);
        float _794 = -_792;
        float _796 = _790 + _794;
        _798 = _796;
        _800 = true;
    }
    else
    {
        float _802 = float(_82);
        float _804 = 1.0 / _802;
        float _806 = _116 * _804;
        _798 = _806;
    }
    _800 = false;
    float _808 = _798;
    float _810 = _772 * _772;
    float _812 = in.m_41.y;
    float _814 = _452 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _816 = _452 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _818 = fma(_774, _774, _810);
    float _820 = _452 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _822 = _452 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _824 = in.m_39.x;
    float _826 = in.m_39.y;
    float _828 = in.m_39.z;
    float _830 = fma(_776, _776, _818);
    float _832 = fma(_450, (*spvDescriptorSet0.vp_c10)._m0[14].w, _822);
    float _834 = fma(_450, (*spvDescriptorSet0.vp_c10)._m0[14].x, _814);
    float _836 = fma(_450, (*spvDescriptorSet0.vp_c10)._m0[14].y, _816);
    float _838 = fma(_450, (*spvDescriptorSet0.vp_c10)._m0[14].z, _820);
    float _840 = rsqrt(_830);
    int _842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _844 = _842 != 0;
    float _846 = in.m_43.x;
    int _848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _850 = _848 != 0;
    float _852 = fma(_454, (*spvDescriptorSet0.vp_c10)._m0[16].y, _836);
    float _854 = fma(_454, (*spvDescriptorSet0.vp_c10)._m0[16].z, _838);
    float _856 = in.m_43.z;
    bool _858 = _812 > 0.5;
    float _860 = in.m_43.y;
    float _862 = _840 * _776;
    float _864 = _840 * _774;
    float _866 = _840 * _772;
    float _868 = in.m_45.x;
    float _870 = in.m_45.y;
    float _872 = in.m_45.z;
    float _874 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _876 = _862 * _874;
    float _878 = _826 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _880 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _882 = _866 * _880;
    float _884 = _824 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _886 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _888 = -_876;
    float _890 = fma(_864, _886, _888);
    float _892 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _894 = _864 * _892;
    float _896 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _898 = -_882;
    float _900 = fma(_862, _896, _898);
    float _902 = _878 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _904 = _890 * _890;
    float _906 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _908 = -_894;
    float _910 = fma(_866, _906, _908);
    float _912 = fma(_454, (*spvDescriptorSet0.vp_c10)._m0[16].x, _834);
    float _914 = _884 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _916 = fma(_900, _900, _904);
    out.m_47.x = _846;
    float _918 = _828 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _920 = _912 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _922 = fma(_910, _910, _916);
    float _924 = fma(_454, (*spvDescriptorSet0.vp_c10)._m0[16].w, _832);
    float _926 = _918 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    out.m_47.z = _856;
    float _928 = rsqrt(_922);
    float _930 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _870);
    float _932 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _868);
    out.m_47.y = _860;
    bool _934 = _870 != 0.0;
    bool _936 = isnan(_870);
    bool _938 = _934 || _936;
    bool _940 = isnan(0.0);
    bool _942 = _938 || _940;
    float _944 = _902 * _930;
    float _946 = _852 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _948 = _914 * _932;
    float _950 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _872);
    float _952 = _854 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _954 = _388 * _946;
    float _956 = _374 * _920;
    float _958 = _926 * _950;
    float _960 = in.m_49.y;
    float _962 = _416 * _952;
    float _964 = _900 * _928;
    float _966 = _890 * _928;
    float _968 = _954 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _970 = _954 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _972 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _974 = _972 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _976 = _910 * _928;
    float _978 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[24].x, _968);
    float _980 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[26].x, _970);
    float _982 = 1.0 / _974;
    float _984 = _924 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _986 = fma(_962, (*spvDescriptorSet0.vp_c8)._m0[24].z, _978);
    float _988 = _944 * _864;
    float _990 = fma(_962, (*spvDescriptorSet0.vp_c8)._m0[26].z, _980);
    float _992 = _944 * _862;
    float _994 = _866 * _976;
    float _996 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[24].w, _986);
    float _998 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[26].w, _990);
    float _1000 = _864 * _966;
    float _1002 = fma(_948, _964, _988);
    float _1004 = -_994;
    float _1006 = fma(_862, _966, _1004);
    float _1008 = fma(_948, _976, _992);
    float _1010 = -_1000;
    float _1012 = fma(_866, _964, _1010);
    float _1014 = _996 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1016 = fma(_958, _1006, _1002);
    float _1018 = _998 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1020 = fma(_958, _1012, _1008);
    float _1022 = _1014 + _1016;
    float _1024 = 0.0;
    float _1026 = _962;
    float _1028 = _862;
    float _1030 = _866;
    if (_844)
    {
        float _1032 = in.m_41.x;
        _1024 = _1032;
    }
    float _1034 = _1024;
    float _1036 = _1018 + _1020;
    float _1038 = -_960;
    float _1040 = _1038 + 1.0;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1042;
    float _1046 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1048 = _1022 + _1046;
    float _1050 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1052 = _1036 + _1050;
    float _1054 = in.m_51.x;
    float _1056 = in.m_51.y;
    float _1058 = in.m_51.z;
    float _1060 = _1044 * _982;
    float _1062 = _1048 * _1048;
    float _1064 = _1052 * _1052;
    float _1066 = _960;
    if (_850)
    {
        float _1068 = _858 ? _1040 : _960;
        _1066 = _1068;
    }
    float _1070 = _1066;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1074 = _808 + _1072;
    float _1076 = in.m_49.x;
    float _1078 = _954 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1080 = _868 == 0.0;
    bool _1082 = !_942;
    bool _1084 = _1080 && _1082;
    float _1086 = _1062 + _1064;
    float _1088 = fma(_1060, _1074, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1090 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1078);
    bool _1092 = _872 == 0.0;
    bool _1094 = _1092 && _1084;
    float _1096 = sqrt(_1086);
    bool _1098 = _808 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1100 = isnan(_808);
    bool _1102 = _1098 || _1100;
    bool _1104 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1106 = _1102 || _1104;
    float _1108 = float(_1106);
    float _1110 = fma(_962, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1090);
    float _1112 = _944 * _866;
    bool _1114 = _808 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1116 = isnan(_808);
    bool _1118 = _1114 || _1116;
    bool _1120 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1122 = _1118 || _1120;
    float _1124 = float(_1122);
    bool _1126 = _1034 > 0.5;
    bool _1128 = _1126 && _844;
    float _1130 = fma(_948, _966, _1112);
    float _1132 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1110);
    float _1134 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1136 = _1056;
    float _1138 = _1054;
    float _1140 = _1058;
    float _1142 = _1112;
    if (!_1094)
    {
        float _1144 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1056);
        _1136 = _1144;
    }
    float _1146 = _1136;
    float _1148 = _862 * _964;
    float _1150 = _1146;
    if (!_1094)
    {
        float _1152 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1054);
        _1138 = _1152;
    }
    float _1154 = _1138;
    if (!_1094)
    {
        float _1156 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1058);
        _1140 = _1156;
    }
    float _1158 = _1140;
    bool _1160 = _1096 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1162 = -_1108;
    float _1164 = _1162 + 1.0;
    float _1166 = -_1148;
    float _1168 = fma(_864, _976, _1166);
    if (_844)
    {
        _1026 = _1076;
    }
    float _1170 = _1026;
    float _1172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1174 = _1124 * _1164;
    float _1176 = fma(_958, _1168, _1130);
    float _1178 = _1132 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1180 = _1170;
    if (_1128)
    {
        float _1182 = -_1170;
        float _1184 = _1182 + 1.0;
        _1180 = _1184;
    }
    float _1186 = _1180;
    if (!_844)
    {
        _1142 = _1076;
    }
    float _1188 = _1142;
    float _1190 = _1088 * _1174;
    float _1192 = -_1124;
    float _1194 = _1192 + 1.0;
    float _1196 = _1178 + _1176;
    float _1198 = _1188;
    float _1200 = _1190;
    float _1202 = _1194;
    if (_844)
    {
        _1198 = _1186;
    }
    float _1204 = _1198;
    float _1206 = _864 * _1146;
    float _1208 = _866 * _1146;
    float _1210 = _862 * _1146;
    float _1212 = fma(_1194, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1190);
    if (!_1160)
    {
        _1028 = _1064;
    }
    float _1214 = _1028;
    float _1216 = _1214;
    if (!_1160)
    {
        _1150 = _1062;
    }
    float _1218 = _1150;
    float _1220 = _1218;
    if (!_1160)
    {
        _1200 = _1022;
    }
    float _1222 = _1200;
    float _1224 = _1222;
    if (!_1160)
    {
        _1202 = _1036;
    }
    float _1226 = _1202;
    float _1228 = _1226;
    if (!_1160)
    {
        _1030 = _1196;
    }
    float _1230 = _1030;
    bool _1232 = !_1160;
    float _1234 = _1230;
    float _1236 = _1172;
    if (!_1232)
    {
        float _1238 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1240 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1242 = _1096 + _1240;
        float _1244 = rsqrt(_1086);
        float _1246 = _1242 * _1238;
        float _1248 = _1196 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1250 = _1246 * 0.15915493667125701904296875;
        float _1252 = _1250 * 6.283185482025146484375;
        float _1254 = sin(_1252);
        float _1256 = _1250 * 6.283185482025146484375;
        float _1258 = cos(_1256);
        float _1260 = fma(_1254, _1248, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1262 = _1244 * _1260;
        float _1264 = _1258 + (-1.0);
        float _1266 = fma(_1048, _1262, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1268 = fma(_1052, _1262, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1270 = _1264 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1272 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1274 = _1266 + _1272;
        float _1276 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1278 = _1268 + _1276;
        float _1280 = fma(_1196, _1258, _1270);
        float _1282 = _1274 * _1274;
        float _1284 = _1278 * _1278;
        _1234 = _1280;
        _1220 = _1282;
        _1216 = _1284;
        _1224 = _1266;
        _1228 = _1268;
    }
    float _1286 = _1234;
    float _1288 = _1220;
    float _1290 = _1216;
    float _1292 = _1224;
    float _1294 = _1228;
    float _1296 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1298 = _1286 + _1296;
    float _1300 = fma(_966, _1154, _1208);
    float _1302 = fma(_964, _1154, _1206);
    float _1304 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1306 = fma(_1298, _1298, _1288);
    float _1308 = fma(_976, _1154, _1210);
    float _1310 = fma(_1006, _1158, _1302);
    float _1312 = _1304 * _1134;
    float _1314 = _1306 + _1290;
    float _1316 = fma(_1168, _1158, _1300);
    float _1318 = in.m_43.w;
    float _1320 = fma(_1108, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1212);
    float _1322 = sqrt(_1314);
    float _1324 = _1204 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1326 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1328 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1330 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1332 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1338 = _1324 * _1172;
    float _1340 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1342 = _1326 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1344 = _1328 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1346 = _1332 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1348 = _1334 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1350 = _1336 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1352 = _1330 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1354 = _1320 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1356 = fma(_1012, _1158, _1308);
    out.m_47.w = _1318;
    bool _1358 = _1322 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1360 = isnan(_1322);
    bool _1362 = _1358 || _1360;
    bool _1364 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1366 = _1362 || _1364;
    out.m_53.x = _1346;
    out.m_53.y = _1348;
    out.m_53.z = _1350;
    out.m_53.w = _1340;
    out.m_55.x = _1338;
    out.m_55.y = _1312;
    out.m_57.x = _1342;
    out.m_57.y = _1344;
    out.m_57.z = _1352;
    out.m_57.w = _1354;
    if (!_1366)
    {
        _1236 = 1.0;
    }
    float _1368 = _1236;
    out.m_59.x = _1310;
    out.m_59.y = _1316;
    out.m_59.z = _1356;
    bool _1370 = !_1366;
    float _1372 = _1368;
    if (!_1370)
    {
        bool _1374 = _1322 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1376 = isnan(_1322);
        bool _1378 = _1374 || _1376;
        bool _1380 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1382 = _1378 || _1380;
        if (!_1382)
        {
            float _1384 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1386 = _1322 + _1384;
            float _1388 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1390 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1388;
            float _1392 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1394 = _1392 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1396 = 1.0 / _1390;
            float _1398 = _1386 * _1396;
            float _1400 = fma(_1398, _1394, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1372 = _1400;
            _1402 = true;
        }
        else
        {
            bool _1404 = _1322 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1406 = isnan(_1322);
            bool _1408 = _1404 || _1406;
            bool _1410 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1412 = _1408 || _1410;
            if (!_1412)
            {
                float _1414 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1416 = _1322 + _1414;
                float _1418 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1420 = _1418 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1422 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1424 = _1422 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1426 = 1.0 / _1420;
                float _1428 = _1416 * _1426;
                float _1430 = fma(_1428, _1424, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1372 = _1430;
                _1402 = true;
            }
            else
            {
                _1372 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1402 = false;
    float _1432 = _1372;
    float _1434 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1436 = _1286 + _1434;
    float _1438 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1440 = _1292 + _1438;
    float _1442 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1444 = _1294 + _1442;
    float _1446 = fma(_1436, _1432, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1448 = fma(_1440, _1432, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1450 = fma(_1444, _1432, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1452 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1454 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1456 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1458 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1460 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1452);
    float _1462 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1454);
    float _1464 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1456);
    float _1466 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1458);
    float _1468 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1460);
    float _1470 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1462);
    float _1472 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1464);
    float _1474 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1466);
    float _1476 = _1468 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1478 = _1470 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1480 = _1472 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1482 = _1474 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1484 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1486 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1488 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1490 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1492 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1484);
    float _1494 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1486);
    float _1496 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1488);
    float _1498 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1490);
    float _1500 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1492);
    float _1502 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1494);
    float _1504 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1496);
    float _1506 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1498);
    float _1508 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1500);
    float _1510 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1502);
    float _1512 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1514 = _1448 + _1512;
    float _1516 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1504);
    float _1518 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1520 = _1446 + _1518;
    float _1522 = _1508 + _1510;
    float _1524 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1506);
    float _1526 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1528 = _1450 + _1526;
    float _1530 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1532 = _1522 * 0.5;
    out.m_35.x = _1530;
    out.m_61.x = _1514;
    out.m_61.y = _1520;
    out.m_61.z = _1528;
    out.gl_Position.x = _1516;
    out.gl_Position.y = _1524;
    out.gl_Position.z = _1508;
    out.gl_Position.w = _1510;
    out.m_63.z = _1532;
    out.m_63.w = _1510;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1402 = false;
    bool _800 = false;
    bool _548 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _77 = in.m_32.w;
    float _79 = trunc(_77);
    int _82 = int(_79);
    bool _86 = _82 >= 1;
    float _88 = 0.0;
    if (!_86)
    {
        _88 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _90 = _88;
    float _92 = _90;
    if (!_86)
    {
        out.m_35.x = 0.0;
    }
    int _94 = 0;
    if (!_86)
    {
        float _96 = _90 * 5.0;
        _94 = as_type<int>(_96);
    }
    int _98 = _94;
    int _100 = _98;
    if (!_86)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1589 = as_type<float>(_98);
        out.gl_Position.z = _1589;
    }
    if (!_86)
    {
        return out;
    }
    float _102 = in.m_37.w;
    bool _104 = _102 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _106 = isnan(_102);
    bool _108 = _104 || _106;
    bool _110 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _112 = _108 || _110;
    float _114 = -_102;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_112)
    {
        float _118 = float(_82);
        _92 = _118;
    }
    float _120 = _92;
    bool _122 = _116 >= _120;
    bool _124 = !_112;
    bool _126 = _122 || _124;
    float _128 = _120;
    if (_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _128;
    if (_126)
    {
        out.m_35.x = 0.0;
    }
    if (_126)
    {
        float _132 = _130 * 5.0;
        _100 = as_type<int>(_132);
    }
    int _134 = _100;
    if (_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1658 = as_type<float>(_134);
        out.gl_Position.z = _1658;
    }
    if (_126)
    {
        return out;
    }
    float _136 = in.m_37.x;
    float _138 = in.m_37.y;
    float _140 = in.m_37.z;
    float _142 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _144 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _146 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _148 = _144 || _146;
    bool _150 = isnan(1.0);
    bool _152 = _148 || _150;
    float _154 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _156 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _154);
    float _158 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _160 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _158);
    float _162 = _158;
    float _164 = (*spvDescriptorSet0.vp_c10)._m0[19].z;
    float _166 = _142;
    if (!_152)
    {
        float _168 = _142 * _142;
        float _170 = _168 * 0.5;
        _162 = _170;
    }
    float _172 = _162;
    float _174 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _156);
    float _176 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _160);
    float _178 = _172;
    if (!_152)
    {
        float _180 = _172 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    bool _184 = !_152;
    float _186 = _182;
    if (!_184)
    {
        float _188 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = log2(_188);
        float _192 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _194 = _192 + 1.0;
        float _196 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = _142 * _190;
        float _200 = exp2(_198);
        float _202 = _196 * 0.693147182464599609375;
        float _204 = 1.0 / _202;
        float _206 = 1.0 / _194;
        float _208 = _200 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _204, _142);
        float _214 = _212 * _206;
        float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _216;
        _164 = _200;
    }
    float _218 = _186;
    float _220 = _164;
    bool _222 = !_152;
    float _224 = _220;
    if (!_222)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = 1.0 / _232;
        float _236 = _142 * _228;
        float _238 = exp2(_236);
        float _240 = -_238;
        float _242 = _240 + 1.0;
        float _244 = _242 * _234;
        _166 = _244;
        _224 = _234;
    }
    float _246 = _166;
    float _248 = _224;
    float _250 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _252 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _254 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _256 = _248;
    float _258 = _250;
    float _260 = _254;
    if (!_152)
    {
        float _262 = _116 * _116;
        float _264 = _262 * 0.5;
        _256 = _264;
    }
    float _266 = _256;
    float _268 = fma(_246, _136, _250);
    float _270 = fma(_246, _138, _252);
    float _272 = fma(_246, _140, _254);
    if (!_152)
    {
        float _274 = _266 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _258 = _274;
    }
    float _276 = _258;
    bool _278 = !_152;
    float _280 = _276;
    if (!_278)
    {
        float _282 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _284 = log2(_282);
        float _286 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _288 = _286 + 1.0;
        float _290 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _292 = _116 * _284;
        float _294 = 1.0 / _288;
        float _296 = _290 * 0.693147182464599609375;
        float _298 = exp2(_292);
        float _300 = 1.0 / _296;
        float _302 = _298 + (-1.0);
        float _304 = -_302;
        float _306 = fma(_304, _300, _116);
        float _308 = _306 * _294;
        float _310 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _280 = _310;
        _260 = _298;
    }
    float _312 = _280;
    float _314 = _260;
    float _316 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _318 = _314;
    if (!_152)
    {
        _318 = _116;
    }
    float _320 = _318;
    bool _322 = !_152;
    float _324 = _320;
    if (!_322)
    {
        float _326 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _328 = log2(_326);
        float _330 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _332 = _330 + 1.0;
        float _334 = 1.0 / _332;
        float _336 = _116 * _328;
        float _338 = exp2(_336);
        float _340 = -_338;
        float _342 = _340 + 1.0;
        float _344 = _342 * _334;
        _324 = _344;
    }
    float _346 = _324;
    float _348 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _350 = fma(_346, _138, _316);
    float _352 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _354 = fma(_346, _136, _348);
    float _356 = -_350;
    float _358 = _270 + _356;
    float _360 = fma(_346, _140, _352);
    float _362 = -_354;
    float _364 = _268 + _362;
    float _366 = _358 * _358;
    float _368 = -_360;
    float _370 = _272 + _368;
    float _372 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _374 = sqrt(_174);
    float _376 = fma(_364, _364, _366);
    float _378 = in.m_39.w;
    float _380 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _372);
    float _382 = _358 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _384 = fma(_370, _370, _376);
    float _386 = _358 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _388 = sqrt(_176);
    float _390 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[14].y, _382);
    float _392 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[14].z, _386);
    float _394 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _380);
    float _396 = _358 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _398 = sqrt(_384);
    float _400 = in.m_32.x;
    float _402 = in.m_32.y;
    float _404 = in.m_32.z;
    float _406 = _358 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _408 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[14].x, _396);
    float _410 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[16].z, _392);
    float _412 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[14].w, _406);
    float _414 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[16].x, _408);
    float _416 = sqrt(_394);
    float _418 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[16].y, _390);
    float _420 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[16].w, _412);
    float _422 = _374 * _414;
    float _424 = _388 * _418;
    bool _426 = _398 >= 9.9999999747524270787835121154785e-07;
    bool _428 = isnan(_398);
    bool _430 = _426 || _428;
    bool _432 = isnan(9.9999999747524270787835121154785e-07);
    bool _434 = _430 || _432;
    float _436 = _424 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _438 = _424 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _440 = _424 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _442 = fma(_422, (*spvDescriptorSet0.vp_c8)._m0[24].x, _436);
    float _444 = fma(_422, (*spvDescriptorSet0.vp_c8)._m0[25].x, _438);
    float _446 = fma(_422, (*spvDescriptorSet0.vp_c8)._m0[26].x, _440);
    float _448 = _416 * _410;
    float _450 = fma(_268, _378, _400);
    float _452 = fma(_270, _378, _402);
    float _454 = fma(_272, _378, _404);
    float _456 = fma(_448, (*spvDescriptorSet0.vp_c8)._m0[24].z, _442);
    float _458 = fma(_448, (*spvDescriptorSet0.vp_c8)._m0[25].z, _444);
    float _460 = fma(_448, (*spvDescriptorSet0.vp_c8)._m0[26].z, _446);
    float _462 = fma(_420, (*spvDescriptorSet0.vp_c8)._m0[24].w, _456);
    float _464 = fma(_420, (*spvDescriptorSet0.vp_c8)._m0[25].w, _458);
    float _466 = fma(_420, (*spvDescriptorSet0.vp_c8)._m0[26].w, _460);
    float _468 = _464;
    float _470 = _462;
    float _472 = _466;
    if (!_434)
    {
        bool _474 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _476 = !_474;
        if (!_476)
        {
            float _478 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].y;
            float _480 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].x;
            float _482 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].z;
            float _484 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].y, _478);
            float _486 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].x, _480);
            float _488 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].z, _482);
            float _490 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].y, _484);
            float _492 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].x, _486);
            float _494 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].w;
            float _496 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].z, _488);
            float _498 = _388 * _490;
            float _500 = _374 * _492;
            float _502 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].w, _494);
            float _504 = _416 * _496;
            float _506 = _498 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
            float _508 = _498 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
            float _510 = _498 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
            float _512 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].w, _502);
            float _514 = fma(_500, (*spvDescriptorSet0.vp_c8)._m0[25].x, _506);
            float _516 = fma(_500, (*spvDescriptorSet0.vp_c8)._m0[24].x, _508);
            float _518 = fma(_500, (*spvDescriptorSet0.vp_c8)._m0[26].x, _510);
            float _520 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[25].z, _514);
            float _522 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[24].z, _516);
            float _524 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[26].z, _518);
            float _526 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[25].w, _520);
            float _528 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[24].w, _522);
            float _530 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[26].w, _524);
            float _532 = _526 * _526;
            float _534 = fma(_528, _528, _532);
            float _536 = fma(_530, _530, _534);
            float _538 = rsqrt(_536);
            float _540 = _538 * 9.9999999747524270787835121154785e-07;
            float _542 = _526 * _540;
            float _544 = _528 * _540;
            float _546 = _530 * _540;
            _468 = _542;
            _470 = _544;
            _472 = _546;
            _548 = true;
        }
        else
        {
            float _550 = _138 * _138;
            float _552 = fma(_136, _136, _550);
            float _554 = fma(_140, _140, _552);
            float _556 = sqrt(_554);
            bool _558 = _556 >= 9.9999999747524270787835121154785e-07;
            bool _560 = isnan(_556);
            bool _562 = _558 || _560;
            bool _564 = isnan(9.9999999747524270787835121154785e-07);
            bool _566 = _562 || _564;
            if (!_566)
            {
                float _568 = _402 * _402;
                float _570 = fma(_400, _400, _568);
                float _572 = fma(_404, _404, _570);
                float _574 = sqrt(_572);
                bool _576 = _574 >= 9.9999999747524270787835121154785e-07;
                bool _578 = isnan(_574);
                bool _580 = _576 || _578;
                bool _582 = isnan(9.9999999747524270787835121154785e-07);
                bool _584 = _580 || _582;
                if (!_584)
                {
                    float _586 = _388 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _588 = _374 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _590 = _416 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _592 = _586 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _594 = _586 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _596 = _586 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _598 = fma(_588, (*spvDescriptorSet0.vp_c8)._m0[25].x, _592);
                    float _600 = fma(_588, (*spvDescriptorSet0.vp_c8)._m0[24].x, _594);
                    float _602 = fma(_588, (*spvDescriptorSet0.vp_c8)._m0[26].x, _596);
                    float _604 = fma(_590, (*spvDescriptorSet0.vp_c8)._m0[25].z, _598);
                    float _606 = fma(_590, (*spvDescriptorSet0.vp_c8)._m0[24].z, _600);
                    float _608 = fma(_590, (*spvDescriptorSet0.vp_c8)._m0[26].z, _602);
                    float _610 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[25].w, _604);
                    float _612 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[24].w, _606);
                    float _614 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[26].w, _608);
                    float _616 = _610 * _610;
                    float _618 = fma(_612, _612, _616);
                    float _620 = fma(_614, _614, _618);
                    float _622 = rsqrt(_620);
                    float _624 = _622 * 9.9999999747524270787835121154785e-07;
                    float _626 = _610 * _624;
                    float _628 = _612 * _624;
                    float _630 = _614 * _624;
                    _468 = _626;
                    _470 = _628;
                    _472 = _630;
                    _548 = true;
                }
                else
                {
                    float _632 = _402 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _634 = _402 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _636 = _402 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _638 = _402 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                    float _640 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[14].y, _632);
                    float _642 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[14].x, _634);
                    float _644 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[14].z, _636);
                    float _646 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[14].w, _638);
                    float _648 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[16].y, _640);
                    float _650 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[16].x, _642);
                    float _652 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[16].z, _644);
                    float _654 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[16].w, _646);
                    float _656 = _388 * _648;
                    float _658 = _374 * _650;
                    float _660 = _416 * _652;
                    float _662 = _656 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _664 = _656 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _666 = _656 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _668 = fma(_658, (*spvDescriptorSet0.vp_c8)._m0[25].x, _662);
                    float _670 = fma(_658, (*spvDescriptorSet0.vp_c8)._m0[24].x, _664);
                    float _672 = fma(_658, (*spvDescriptorSet0.vp_c8)._m0[26].x, _666);
                    float _674 = fma(_660, (*spvDescriptorSet0.vp_c8)._m0[25].z, _668);
                    float _676 = fma(_660, (*spvDescriptorSet0.vp_c8)._m0[24].z, _670);
                    float _678 = fma(_660, (*spvDescriptorSet0.vp_c8)._m0[26].z, _672);
                    float _680 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[25].w, _674);
                    float _682 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[24].w, _676);
                    float _684 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[26].w, _678);
                    float _686 = _680 * _680;
                    float _688 = fma(_682, _682, _686);
                    float _690 = fma(_684, _684, _688);
                    float _692 = rsqrt(_690);
                    float _694 = _692 * 9.9999999747524270787835121154785e-07;
                    float _696 = _682 * _694;
                    float _698 = _680 * _694;
                    float _700 = _684 * _694;
                    _468 = _698;
                    _470 = _696;
                    _472 = _700;
                    _548 = true;
                }
            }
            else
            {
                float _702 = _138 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                float _704 = _138 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                float _706 = _138 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                float _708 = _138 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                float _710 = fma(_136, (*spvDescriptorSet0.vp_c10)._m0[14].y, _702);
                float _712 = fma(_136, (*spvDescriptorSet0.vp_c10)._m0[14].x, _704);
                float _714 = fma(_136, (*spvDescriptorSet0.vp_c10)._m0[14].z, _706);
                float _716 = fma(_136, (*spvDescriptorSet0.vp_c10)._m0[14].w, _708);
                float _718 = fma(_140, (*spvDescriptorSet0.vp_c10)._m0[16].y, _710);
                float _720 = fma(_140, (*spvDescriptorSet0.vp_c10)._m0[16].x, _712);
                float _722 = fma(_140, (*spvDescriptorSet0.vp_c10)._m0[16].z, _714);
                float _724 = fma(_140, (*spvDescriptorSet0.vp_c10)._m0[16].w, _716);
                float _726 = _388 * _718;
                float _728 = _374 * _720;
                float _730 = _416 * _722;
                float _732 = _726 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                float _734 = _726 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                float _736 = _726 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                float _738 = fma(_728, (*spvDescriptorSet0.vp_c8)._m0[25].x, _732);
                float _740 = fma(_728, (*spvDescriptorSet0.vp_c8)._m0[24].x, _734);
                float _742 = fma(_728, (*spvDescriptorSet0.vp_c8)._m0[26].x, _736);
                float _744 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[25].z, _738);
                float _746 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[24].z, _740);
                float _748 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[26].z, _742);
                float _750 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[25].w, _744);
                float _752 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[24].w, _746);
                float _754 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[26].w, _748);
                float _756 = _750 * _750;
                float _758 = fma(_752, _752, _756);
                float _760 = fma(_754, _754, _758);
                float _762 = rsqrt(_760);
                float _764 = _762 * 9.9999999747524270787835121154785e-07;
                float _766 = _752 * _764;
                float _768 = _750 * _764;
                float _770 = _754 * _764;
                _468 = _768;
                _470 = _766;
                _472 = _770;
            }
        }
    }
    _548 = false;
    float _772 = _468;
    float _774 = _470;
    float _776 = _472;
    bool _778 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    bool _780 = !_778;
    float _798;
    if (!_780)
    {
        float _782 = in.m_41.x;
        float _784 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _786 = _782 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _788 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _790 = _788 * _784;
        float _792 = floor(_790);
        float _794 = -_792;
        float _796 = _790 + _794;
        _798 = _796;
        _800 = true;
    }
    else
    {
        float _802 = float(_82);
        float _804 = 1.0 / _802;
        float _806 = _116 * _804;
        _798 = _806;
    }
    _800 = false;
    float _808 = _798;
    float _810 = _772 * _772;
    float _812 = in.m_41.y;
    float _814 = _452 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _816 = _452 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _818 = fma(_774, _774, _810);
    float _820 = _452 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _822 = _452 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _824 = in.m_39.x;
    float _826 = in.m_39.y;
    float _828 = in.m_39.z;
    float _830 = fma(_776, _776, _818);
    float _832 = fma(_450, (*spvDescriptorSet0.vp_c10)._m0[14].w, _822);
    float _834 = fma(_450, (*spvDescriptorSet0.vp_c10)._m0[14].x, _814);
    float _836 = fma(_450, (*spvDescriptorSet0.vp_c10)._m0[14].y, _816);
    float _838 = fma(_450, (*spvDescriptorSet0.vp_c10)._m0[14].z, _820);
    float _840 = rsqrt(_830);
    int _842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _844 = _842 != 0;
    float _846 = in.m_43.x;
    int _848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _850 = _848 != 0;
    float _852 = fma(_454, (*spvDescriptorSet0.vp_c10)._m0[16].y, _836);
    float _854 = fma(_454, (*spvDescriptorSet0.vp_c10)._m0[16].z, _838);
    float _856 = in.m_43.z;
    bool _858 = _812 > 0.5;
    float _860 = in.m_43.y;
    float _862 = _840 * _776;
    float _864 = _840 * _774;
    float _866 = _840 * _772;
    float _868 = in.m_45.x;
    float _870 = in.m_45.y;
    float _872 = in.m_45.z;
    float _874 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _876 = _862 * _874;
    float _878 = _826 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _880 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _882 = _866 * _880;
    float _884 = _824 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _886 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _888 = -_876;
    float _890 = fma(_864, _886, _888);
    float _892 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _894 = _864 * _892;
    float _896 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _898 = -_882;
    float _900 = fma(_862, _896, _898);
    float _902 = _878 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _904 = _890 * _890;
    float _906 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _908 = -_894;
    float _910 = fma(_866, _906, _908);
    float _912 = fma(_454, (*spvDescriptorSet0.vp_c10)._m0[16].x, _834);
    float _914 = _884 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _916 = fma(_900, _900, _904);
    out.m_47.x = _846;
    float _918 = _828 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _920 = _912 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _922 = fma(_910, _910, _916);
    float _924 = fma(_454, (*spvDescriptorSet0.vp_c10)._m0[16].w, _832);
    float _926 = _918 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    out.m_47.z = _856;
    float _928 = rsqrt(_922);
    float _930 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _870);
    float _932 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _868);
    out.m_47.y = _860;
    bool _934 = _870 != 0.0;
    bool _936 = isnan(_870);
    bool _938 = _934 || _936;
    bool _940 = isnan(0.0);
    bool _942 = _938 || _940;
    float _944 = _902 * _930;
    float _946 = _852 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _948 = _914 * _932;
    float _950 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _872);
    float _952 = _854 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _954 = _388 * _946;
    float _956 = _374 * _920;
    float _958 = _926 * _950;
    float _960 = in.m_49.y;
    float _962 = _416 * _952;
    float _964 = _900 * _928;
    float _966 = _890 * _928;
    float _968 = _954 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _970 = _954 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _972 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _974 = _972 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _976 = _910 * _928;
    float _978 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[24].x, _968);
    float _980 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[26].x, _970);
    float _982 = 1.0 / _974;
    float _984 = _924 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _986 = fma(_962, (*spvDescriptorSet0.vp_c8)._m0[24].z, _978);
    float _988 = _944 * _864;
    float _990 = fma(_962, (*spvDescriptorSet0.vp_c8)._m0[26].z, _980);
    float _992 = _944 * _862;
    float _994 = _866 * _976;
    float _996 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[24].w, _986);
    float _998 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[26].w, _990);
    float _1000 = _864 * _966;
    float _1002 = fma(_948, _964, _988);
    float _1004 = -_994;
    float _1006 = fma(_862, _966, _1004);
    float _1008 = fma(_948, _976, _992);
    float _1010 = -_1000;
    float _1012 = fma(_866, _964, _1010);
    float _1014 = _996 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1016 = fma(_958, _1006, _1002);
    float _1018 = _998 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1020 = fma(_958, _1012, _1008);
    float _1022 = _1014 + _1016;
    float _1024 = 0.0;
    float _1026 = _962;
    float _1028 = _862;
    float _1030 = _866;
    if (_844)
    {
        float _1032 = in.m_41.x;
        _1024 = _1032;
    }
    float _1034 = _1024;
    float _1036 = _1018 + _1020;
    float _1038 = -_960;
    float _1040 = _1038 + 1.0;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1042;
    float _1046 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1048 = _1022 + _1046;
    float _1050 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1052 = _1036 + _1050;
    float _1054 = in.m_51.x;
    float _1056 = in.m_51.y;
    float _1058 = in.m_51.z;
    float _1060 = _1044 * _982;
    float _1062 = _1048 * _1048;
    float _1064 = _1052 * _1052;
    float _1066 = _960;
    if (_850)
    {
        float _1068 = _858 ? _1040 : _960;
        _1066 = _1068;
    }
    float _1070 = _1066;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1074 = _808 + _1072;
    float _1076 = in.m_49.x;
    float _1078 = _954 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1080 = _868 == 0.0;
    bool _1082 = !_942;
    bool _1084 = _1080 && _1082;
    float _1086 = _1062 + _1064;
    float _1088 = fma(_1060, _1074, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1090 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1078);
    bool _1092 = _872 == 0.0;
    bool _1094 = _1092 && _1084;
    float _1096 = sqrt(_1086);
    bool _1098 = _808 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1100 = isnan(_808);
    bool _1102 = _1098 || _1100;
    bool _1104 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1106 = _1102 || _1104;
    float _1108 = float(_1106);
    float _1110 = fma(_962, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1090);
    float _1112 = _944 * _866;
    bool _1114 = _808 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1116 = isnan(_808);
    bool _1118 = _1114 || _1116;
    bool _1120 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1122 = _1118 || _1120;
    float _1124 = float(_1122);
    bool _1126 = _1034 > 0.5;
    bool _1128 = _1126 && _844;
    float _1130 = fma(_948, _966, _1112);
    float _1132 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1110);
    float _1134 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1136 = _1056;
    float _1138 = _1054;
    float _1140 = _1058;
    float _1142 = _1112;
    if (!_1094)
    {
        float _1144 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1056);
        _1136 = _1144;
    }
    float _1146 = _1136;
    float _1148 = _862 * _964;
    float _1150 = _1146;
    if (!_1094)
    {
        float _1152 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1054);
        _1138 = _1152;
    }
    float _1154 = _1138;
    if (!_1094)
    {
        float _1156 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1058);
        _1140 = _1156;
    }
    float _1158 = _1140;
    bool _1160 = _1096 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1162 = -_1108;
    float _1164 = _1162 + 1.0;
    float _1166 = -_1148;
    float _1168 = fma(_864, _976, _1166);
    if (_844)
    {
        _1026 = _1076;
    }
    float _1170 = _1026;
    float _1172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1174 = _1124 * _1164;
    float _1176 = fma(_958, _1168, _1130);
    float _1178 = _1132 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1180 = _1170;
    if (_1128)
    {
        float _1182 = -_1170;
        float _1184 = _1182 + 1.0;
        _1180 = _1184;
    }
    float _1186 = _1180;
    if (!_844)
    {
        _1142 = _1076;
    }
    float _1188 = _1142;
    float _1190 = _1088 * _1174;
    float _1192 = -_1124;
    float _1194 = _1192 + 1.0;
    float _1196 = _1178 + _1176;
    float _1198 = _1188;
    float _1200 = _1190;
    float _1202 = _1194;
    if (_844)
    {
        _1198 = _1186;
    }
    float _1204 = _1198;
    float _1206 = _864 * _1146;
    float _1208 = _866 * _1146;
    float _1210 = _862 * _1146;
    float _1212 = fma(_1194, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1190);
    if (!_1160)
    {
        _1028 = _1064;
    }
    float _1214 = _1028;
    float _1216 = _1214;
    if (!_1160)
    {
        _1150 = _1062;
    }
    float _1218 = _1150;
    float _1220 = _1218;
    if (!_1160)
    {
        _1200 = _1022;
    }
    float _1222 = _1200;
    float _1224 = _1222;
    if (!_1160)
    {
        _1202 = _1036;
    }
    float _1226 = _1202;
    float _1228 = _1226;
    if (!_1160)
    {
        _1030 = _1196;
    }
    float _1230 = _1030;
    bool _1232 = !_1160;
    float _1234 = _1230;
    float _1236 = _1172;
    if (!_1232)
    {
        float _1238 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1240 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1242 = _1096 + _1240;
        float _1244 = rsqrt(_1086);
        float _1246 = _1242 * _1238;
        float _1248 = _1196 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1250 = _1246 * 0.15915493667125701904296875;
        float _1252 = _1250 * 6.283185482025146484375;
        float _1254 = sin(_1252);
        float _1256 = _1250 * 6.283185482025146484375;
        float _1258 = cos(_1256);
        float _1260 = fma(_1254, _1248, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1262 = _1244 * _1260;
        float _1264 = _1258 + (-1.0);
        float _1266 = fma(_1048, _1262, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1268 = fma(_1052, _1262, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1270 = _1264 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1272 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1274 = _1266 + _1272;
        float _1276 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1278 = _1268 + _1276;
        float _1280 = fma(_1196, _1258, _1270);
        float _1282 = _1274 * _1274;
        float _1284 = _1278 * _1278;
        _1234 = _1280;
        _1220 = _1282;
        _1216 = _1284;
        _1224 = _1266;
        _1228 = _1268;
    }
    float _1286 = _1234;
    float _1288 = _1220;
    float _1290 = _1216;
    float _1292 = _1224;
    float _1294 = _1228;
    float _1296 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1298 = _1286 + _1296;
    float _1300 = fma(_966, _1154, _1208);
    float _1302 = fma(_964, _1154, _1206);
    float _1304 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1306 = fma(_1298, _1298, _1288);
    float _1308 = fma(_976, _1154, _1210);
    float _1310 = fma(_1006, _1158, _1302);
    float _1312 = _1304 * _1134;
    float _1314 = _1306 + _1290;
    float _1316 = fma(_1168, _1158, _1300);
    float _1318 = in.m_43.w;
    float _1320 = fma(_1108, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1212);
    float _1322 = sqrt(_1314);
    float _1324 = _1204 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1326 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1328 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1330 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1332 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1338 = _1324 * _1172;
    float _1340 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1342 = _1326 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1344 = _1328 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1346 = _1332 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1348 = _1334 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1350 = _1336 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1352 = _1330 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1354 = _1320 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1356 = fma(_1012, _1158, _1308);
    out.m_47.w = _1318;
    bool _1358 = _1322 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1360 = isnan(_1322);
    bool _1362 = _1358 || _1360;
    bool _1364 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1366 = _1362 || _1364;
    out.m_53.x = _1346;
    out.m_53.y = _1348;
    out.m_53.z = _1350;
    out.m_53.w = _1340;
    out.m_55.x = _1338;
    out.m_55.y = _1312;
    out.m_57.x = _1342;
    out.m_57.y = _1344;
    out.m_57.z = _1352;
    out.m_57.w = _1354;
    if (!_1366)
    {
        _1236 = 1.0;
    }
    float _1368 = _1236;
    out.m_59.x = _1310;
    out.m_59.y = _1316;
    out.m_59.z = _1356;
    bool _1370 = !_1366;
    float _1372 = _1368;
    if (!_1370)
    {
        bool _1374 = _1322 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1376 = isnan(_1322);
        bool _1378 = _1374 || _1376;
        bool _1380 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1382 = _1378 || _1380;
        if (!_1382)
        {
            float _1384 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1386 = _1322 + _1384;
            float _1388 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1390 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1388;
            float _1392 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1394 = _1392 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1396 = 1.0 / _1390;
            float _1398 = _1386 * _1396;
            float _1400 = fma(_1398, _1394, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1372 = _1400;
            _1402 = true;
        }
        else
        {
            bool _1404 = _1322 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1406 = isnan(_1322);
            bool _1408 = _1404 || _1406;
            bool _1410 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1412 = _1408 || _1410;
            if (!_1412)
            {
                float _1414 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1416 = _1322 + _1414;
                float _1418 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1420 = _1418 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1422 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1424 = _1422 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1426 = 1.0 / _1420;
                float _1428 = _1416 * _1426;
                float _1430 = fma(_1428, _1424, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1372 = _1430;
                _1402 = true;
            }
            else
            {
                _1372 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1402 = false;
    float _1432 = _1372;
    float _1434 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1436 = _1286 + _1434;
    float _1438 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1440 = _1292 + _1438;
    float _1442 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1444 = _1294 + _1442;
    float _1446 = fma(_1436, _1432, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1448 = fma(_1440, _1432, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1450 = fma(_1444, _1432, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1452 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1454 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1456 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1458 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1460 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1452);
    float _1462 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1454);
    float _1464 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1456);
    float _1466 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1458);
    float _1468 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1460);
    float _1470 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1462);
    float _1472 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1464);
    float _1474 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1466);
    float _1476 = _1468 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1478 = _1470 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1480 = _1472 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1482 = _1474 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1484 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1486 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1488 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1490 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1492 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1484);
    float _1494 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1486);
    float _1496 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1488);
    float _1498 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1490);
    float _1500 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1492);
    float _1502 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1494);
    float _1504 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1496);
    float _1506 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1498);
    float _1508 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1500);
    float _1510 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1502);
    float _1512 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1514 = _1448 + _1512;
    float _1516 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1504);
    float _1518 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1520 = _1446 + _1518;
    float _1522 = _1508 + _1510;
    float _1524 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1506);
    float _1526 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1528 = _1450 + _1526;
    float _1530 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1532 = _1522 * 0.5;
    out.m_35.x = _1530;
    out.m_61.x = _1514;
    out.m_61.y = _1520;
    out.m_61.z = _1528;
    out.gl_Position.x = _1516;
    out.gl_Position.y = _1524;
    out.gl_Position.z = _1508;
    out.gl_Position.w = _1510;
    out.m_63.z = _1532;
    out.m_63.w = _1510;
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
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1402 = false;
    bool _800 = false;
    bool _548 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _77 = in.m_32.w;
    float _79 = trunc(_77);
    int _82 = int(_79);
    bool _86 = _82 >= 1;
    float _88 = 0.0;
    if (!_86)
    {
        _88 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _90 = _88;
    float _92 = _90;
    if (!_86)
    {
        out.m_35.x = 0.0;
    }
    int _94 = 0;
    if (!_86)
    {
        float _96 = _90 * 5.0;
        _94 = as_type<int>(_96);
    }
    int _98 = _94;
    int _100 = _98;
    if (!_86)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1589 = as_type<float>(_98);
        out.gl_Position.z = _1589;
    }
    if (!_86)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _102 = in.m_37.w;
    bool _104 = _102 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _106 = isnan(_102);
    bool _108 = _104 || _106;
    bool _110 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _112 = _108 || _110;
    float _114 = -_102;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_112)
    {
        float _118 = float(_82);
        _92 = _118;
    }
    float _120 = _92;
    bool _122 = _116 >= _120;
    bool _124 = !_112;
    bool _126 = _122 || _124;
    float _128 = _120;
    if (_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _128;
    if (_126)
    {
        out.m_35.x = 0.0;
    }
    if (_126)
    {
        float _132 = _130 * 5.0;
        _100 = as_type<int>(_132);
    }
    int _134 = _100;
    if (_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1658 = as_type<float>(_134);
        out.gl_Position.z = _1658;
    }
    if (_126)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _136 = in.m_37.x;
    float _138 = in.m_37.y;
    float _140 = in.m_37.z;
    float _142 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _144 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _146 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _148 = _144 || _146;
    bool _150 = isnan(1.0);
    bool _152 = _148 || _150;
    float _154 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _156 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _154);
    float _158 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _160 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _158);
    float _162 = _158;
    float _164 = (*spvDescriptorSet0.vp_c10)._m0[19].z;
    float _166 = _142;
    if (!_152)
    {
        float _168 = _142 * _142;
        float _170 = _168 * 0.5;
        _162 = _170;
    }
    float _172 = _162;
    float _174 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _156);
    float _176 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _160);
    float _178 = _172;
    if (!_152)
    {
        float _180 = _172 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    bool _184 = !_152;
    float _186 = _182;
    if (!_184)
    {
        float _188 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = log2(_188);
        float _192 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _194 = _192 + 1.0;
        float _196 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = _142 * _190;
        float _200 = exp2(_198);
        float _202 = _196 * 0.693147182464599609375;
        float _204 = 1.0 / _202;
        float _206 = 1.0 / _194;
        float _208 = _200 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _204, _142);
        float _214 = _212 * _206;
        float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _216;
        _164 = _200;
    }
    float _218 = _186;
    float _220 = _164;
    bool _222 = !_152;
    float _224 = _220;
    if (!_222)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = 1.0 / _232;
        float _236 = _142 * _228;
        float _238 = exp2(_236);
        float _240 = -_238;
        float _242 = _240 + 1.0;
        float _244 = _242 * _234;
        _166 = _244;
        _224 = _234;
    }
    float _246 = _166;
    float _248 = _224;
    float _250 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _252 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _254 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _256 = _248;
    float _258 = _250;
    float _260 = _254;
    if (!_152)
    {
        float _262 = _116 * _116;
        float _264 = _262 * 0.5;
        _256 = _264;
    }
    float _266 = _256;
    float _268 = fma(_246, _136, _250);
    float _270 = fma(_246, _138, _252);
    float _272 = fma(_246, _140, _254);
    if (!_152)
    {
        float _274 = _266 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _258 = _274;
    }
    float _276 = _258;
    bool _278 = !_152;
    float _280 = _276;
    if (!_278)
    {
        float _282 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _284 = log2(_282);
        float _286 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _288 = _286 + 1.0;
        float _290 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _292 = _116 * _284;
        float _294 = 1.0 / _288;
        float _296 = _290 * 0.693147182464599609375;
        float _298 = exp2(_292);
        float _300 = 1.0 / _296;
        float _302 = _298 + (-1.0);
        float _304 = -_302;
        float _306 = fma(_304, _300, _116);
        float _308 = _306 * _294;
        float _310 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _280 = _310;
        _260 = _298;
    }
    float _312 = _280;
    float _314 = _260;
    float _316 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _318 = _314;
    if (!_152)
    {
        _318 = _116;
    }
    float _320 = _318;
    bool _322 = !_152;
    float _324 = _320;
    if (!_322)
    {
        float _326 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _328 = log2(_326);
        float _330 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _332 = _330 + 1.0;
        float _334 = 1.0 / _332;
        float _336 = _116 * _328;
        float _338 = exp2(_336);
        float _340 = -_338;
        float _342 = _340 + 1.0;
        float _344 = _342 * _334;
        _324 = _344;
    }
    float _346 = _324;
    float _348 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _350 = fma(_346, _138, _316);
    float _352 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _354 = fma(_346, _136, _348);
    float _356 = -_350;
    float _358 = _270 + _356;
    float _360 = fma(_346, _140, _352);
    float _362 = -_354;
    float _364 = _268 + _362;
    float _366 = _358 * _358;
    float _368 = -_360;
    float _370 = _272 + _368;
    float _372 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _374 = sqrt(_174);
    float _376 = fma(_364, _364, _366);
    float _378 = in.m_39.w;
    float _380 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _372);
    float _382 = _358 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _384 = fma(_370, _370, _376);
    float _386 = _358 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _388 = sqrt(_176);
    float _390 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[14].y, _382);
    float _392 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[14].z, _386);
    float _394 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _380);
    float _396 = _358 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _398 = sqrt(_384);
    float _400 = in.m_32.x;
    float _402 = in.m_32.y;
    float _404 = in.m_32.z;
    float _406 = _358 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _408 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[14].x, _396);
    float _410 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[16].z, _392);
    float _412 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[14].w, _406);
    float _414 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[16].x, _408);
    float _416 = sqrt(_394);
    float _418 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[16].y, _390);
    float _420 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[16].w, _412);
    float _422 = _374 * _414;
    float _424 = _388 * _418;
    bool _426 = _398 >= 9.9999999747524270787835121154785e-07;
    bool _428 = isnan(_398);
    bool _430 = _426 || _428;
    bool _432 = isnan(9.9999999747524270787835121154785e-07);
    bool _434 = _430 || _432;
    float _436 = _424 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _438 = _424 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _440 = _424 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _442 = fma(_422, (*spvDescriptorSet0.vp_c8)._m0[24].x, _436);
    float _444 = fma(_422, (*spvDescriptorSet0.vp_c8)._m0[25].x, _438);
    float _446 = fma(_422, (*spvDescriptorSet0.vp_c8)._m0[26].x, _440);
    float _448 = _416 * _410;
    float _450 = fma(_268, _378, _400);
    float _452 = fma(_270, _378, _402);
    float _454 = fma(_272, _378, _404);
    float _456 = fma(_448, (*spvDescriptorSet0.vp_c8)._m0[24].z, _442);
    float _458 = fma(_448, (*spvDescriptorSet0.vp_c8)._m0[25].z, _444);
    float _460 = fma(_448, (*spvDescriptorSet0.vp_c8)._m0[26].z, _446);
    float _462 = fma(_420, (*spvDescriptorSet0.vp_c8)._m0[24].w, _456);
    float _464 = fma(_420, (*spvDescriptorSet0.vp_c8)._m0[25].w, _458);
    float _466 = fma(_420, (*spvDescriptorSet0.vp_c8)._m0[26].w, _460);
    float _468 = _464;
    float _470 = _462;
    float _472 = _466;
    if (!_434)
    {
        bool _474 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _476 = !_474;
        if (!_476)
        {
            float _478 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].y;
            float _480 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].x;
            float _482 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].z;
            float _484 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].y, _478);
            float _486 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].x, _480);
            float _488 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].z, _482);
            float _490 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].y, _484);
            float _492 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].x, _486);
            float _494 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].w;
            float _496 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].z, _488);
            float _498 = _388 * _490;
            float _500 = _374 * _492;
            float _502 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].w, _494);
            float _504 = _416 * _496;
            float _506 = _498 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
            float _508 = _498 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
            float _510 = _498 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
            float _512 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].w, _502);
            float _514 = fma(_500, (*spvDescriptorSet0.vp_c8)._m0[25].x, _506);
            float _516 = fma(_500, (*spvDescriptorSet0.vp_c8)._m0[24].x, _508);
            float _518 = fma(_500, (*spvDescriptorSet0.vp_c8)._m0[26].x, _510);
            float _520 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[25].z, _514);
            float _522 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[24].z, _516);
            float _524 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[26].z, _518);
            float _526 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[25].w, _520);
            float _528 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[24].w, _522);
            float _530 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[26].w, _524);
            float _532 = _526 * _526;
            float _534 = fma(_528, _528, _532);
            float _536 = fma(_530, _530, _534);
            float _538 = rsqrt(_536);
            float _540 = _538 * 9.9999999747524270787835121154785e-07;
            float _542 = _526 * _540;
            float _544 = _528 * _540;
            float _546 = _530 * _540;
            _468 = _542;
            _470 = _544;
            _472 = _546;
            _548 = true;
        }
        else
        {
            float _550 = _138 * _138;
            float _552 = fma(_136, _136, _550);
            float _554 = fma(_140, _140, _552);
            float _556 = sqrt(_554);
            bool _558 = _556 >= 9.9999999747524270787835121154785e-07;
            bool _560 = isnan(_556);
            bool _562 = _558 || _560;
            bool _564 = isnan(9.9999999747524270787835121154785e-07);
            bool _566 = _562 || _564;
            if (!_566)
            {
                float _568 = _402 * _402;
                float _570 = fma(_400, _400, _568);
                float _572 = fma(_404, _404, _570);
                float _574 = sqrt(_572);
                bool _576 = _574 >= 9.9999999747524270787835121154785e-07;
                bool _578 = isnan(_574);
                bool _580 = _576 || _578;
                bool _582 = isnan(9.9999999747524270787835121154785e-07);
                bool _584 = _580 || _582;
                if (!_584)
                {
                    float _586 = _388 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _588 = _374 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _590 = _416 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _592 = _586 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _594 = _586 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _596 = _586 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _598 = fma(_588, (*spvDescriptorSet0.vp_c8)._m0[25].x, _592);
                    float _600 = fma(_588, (*spvDescriptorSet0.vp_c8)._m0[24].x, _594);
                    float _602 = fma(_588, (*spvDescriptorSet0.vp_c8)._m0[26].x, _596);
                    float _604 = fma(_590, (*spvDescriptorSet0.vp_c8)._m0[25].z, _598);
                    float _606 = fma(_590, (*spvDescriptorSet0.vp_c8)._m0[24].z, _600);
                    float _608 = fma(_590, (*spvDescriptorSet0.vp_c8)._m0[26].z, _602);
                    float _610 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[25].w, _604);
                    float _612 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[24].w, _606);
                    float _614 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[26].w, _608);
                    float _616 = _610 * _610;
                    float _618 = fma(_612, _612, _616);
                    float _620 = fma(_614, _614, _618);
                    float _622 = rsqrt(_620);
                    float _624 = _622 * 9.9999999747524270787835121154785e-07;
                    float _626 = _610 * _624;
                    float _628 = _612 * _624;
                    float _630 = _614 * _624;
                    _468 = _626;
                    _470 = _628;
                    _472 = _630;
                    _548 = true;
                }
                else
                {
                    float _632 = _402 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _634 = _402 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _636 = _402 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _638 = _402 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                    float _640 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[14].y, _632);
                    float _642 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[14].x, _634);
                    float _644 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[14].z, _636);
                    float _646 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[14].w, _638);
                    float _648 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[16].y, _640);
                    float _650 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[16].x, _642);
                    float _652 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[16].z, _644);
                    float _654 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[16].w, _646);
                    float _656 = _388 * _648;
                    float _658 = _374 * _650;
                    float _660 = _416 * _652;
                    float _662 = _656 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _664 = _656 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _666 = _656 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _668 = fma(_658, (*spvDescriptorSet0.vp_c8)._m0[25].x, _662);
                    float _670 = fma(_658, (*spvDescriptorSet0.vp_c8)._m0[24].x, _664);
                    float _672 = fma(_658, (*spvDescriptorSet0.vp_c8)._m0[26].x, _666);
                    float _674 = fma(_660, (*spvDescriptorSet0.vp_c8)._m0[25].z, _668);
                    float _676 = fma(_660, (*spvDescriptorSet0.vp_c8)._m0[24].z, _670);
                    float _678 = fma(_660, (*spvDescriptorSet0.vp_c8)._m0[26].z, _672);
                    float _680 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[25].w, _674);
                    float _682 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[24].w, _676);
                    float _684 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[26].w, _678);
                    float _686 = _680 * _680;
                    float _688 = fma(_682, _682, _686);
                    float _690 = fma(_684, _684, _688);
                    float _692 = rsqrt(_690);
                    float _694 = _692 * 9.9999999747524270787835121154785e-07;
                    float _696 = _682 * _694;
                    float _698 = _680 * _694;
                    float _700 = _684 * _694;
                    _468 = _698;
                    _470 = _696;
                    _472 = _700;
                    _548 = true;
                }
            }
            else
            {
                float _702 = _138 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                float _704 = _138 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                float _706 = _138 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                float _708 = _138 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                float _710 = fma(_136, (*spvDescriptorSet0.vp_c10)._m0[14].y, _702);
                float _712 = fma(_136, (*spvDescriptorSet0.vp_c10)._m0[14].x, _704);
                float _714 = fma(_136, (*spvDescriptorSet0.vp_c10)._m0[14].z, _706);
                float _716 = fma(_136, (*spvDescriptorSet0.vp_c10)._m0[14].w, _708);
                float _718 = fma(_140, (*spvDescriptorSet0.vp_c10)._m0[16].y, _710);
                float _720 = fma(_140, (*spvDescriptorSet0.vp_c10)._m0[16].x, _712);
                float _722 = fma(_140, (*spvDescriptorSet0.vp_c10)._m0[16].z, _714);
                float _724 = fma(_140, (*spvDescriptorSet0.vp_c10)._m0[16].w, _716);
                float _726 = _388 * _718;
                float _728 = _374 * _720;
                float _730 = _416 * _722;
                float _732 = _726 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                float _734 = _726 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                float _736 = _726 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                float _738 = fma(_728, (*spvDescriptorSet0.vp_c8)._m0[25].x, _732);
                float _740 = fma(_728, (*spvDescriptorSet0.vp_c8)._m0[24].x, _734);
                float _742 = fma(_728, (*spvDescriptorSet0.vp_c8)._m0[26].x, _736);
                float _744 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[25].z, _738);
                float _746 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[24].z, _740);
                float _748 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[26].z, _742);
                float _750 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[25].w, _744);
                float _752 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[24].w, _746);
                float _754 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[26].w, _748);
                float _756 = _750 * _750;
                float _758 = fma(_752, _752, _756);
                float _760 = fma(_754, _754, _758);
                float _762 = rsqrt(_760);
                float _764 = _762 * 9.9999999747524270787835121154785e-07;
                float _766 = _752 * _764;
                float _768 = _750 * _764;
                float _770 = _754 * _764;
                _468 = _768;
                _470 = _766;
                _472 = _770;
            }
        }
    }
    _548 = false;
    float _772 = _468;
    float _774 = _470;
    float _776 = _472;
    bool _778 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    bool _780 = !_778;
    float _798;
    if (!_780)
    {
        float _782 = in.m_41.x;
        float _784 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _786 = _782 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _788 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _790 = _788 * _784;
        float _792 = floor(_790);
        float _794 = -_792;
        float _796 = _790 + _794;
        _798 = _796;
        _800 = true;
    }
    else
    {
        float _802 = float(_82);
        float _804 = 1.0 / _802;
        float _806 = _116 * _804;
        _798 = _806;
    }
    _800 = false;
    float _808 = _798;
    float _810 = _772 * _772;
    float _812 = in.m_41.y;
    float _814 = _452 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _816 = _452 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _818 = fma(_774, _774, _810);
    float _820 = _452 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _822 = _452 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _824 = in.m_39.x;
    float _826 = in.m_39.y;
    float _828 = in.m_39.z;
    float _830 = fma(_776, _776, _818);
    float _832 = fma(_450, (*spvDescriptorSet0.vp_c10)._m0[14].w, _822);
    float _834 = fma(_450, (*spvDescriptorSet0.vp_c10)._m0[14].x, _814);
    float _836 = fma(_450, (*spvDescriptorSet0.vp_c10)._m0[14].y, _816);
    float _838 = fma(_450, (*spvDescriptorSet0.vp_c10)._m0[14].z, _820);
    float _840 = rsqrt(_830);
    int _842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _844 = _842 != 0;
    float _846 = in.m_43.x;
    int _848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _850 = _848 != 0;
    float _852 = fma(_454, (*spvDescriptorSet0.vp_c10)._m0[16].y, _836);
    float _854 = fma(_454, (*spvDescriptorSet0.vp_c10)._m0[16].z, _838);
    float _856 = in.m_43.z;
    bool _858 = _812 > 0.5;
    float _860 = in.m_43.y;
    float _862 = _840 * _776;
    float _864 = _840 * _774;
    float _866 = _840 * _772;
    float _868 = in.m_45.x;
    float _870 = in.m_45.y;
    float _872 = in.m_45.z;
    float _874 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _876 = _862 * _874;
    float _878 = _826 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _880 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _882 = _866 * _880;
    float _884 = _824 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _886 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _888 = -_876;
    float _890 = fma(_864, _886, _888);
    float _892 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _894 = _864 * _892;
    float _896 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _898 = -_882;
    float _900 = fma(_862, _896, _898);
    float _902 = _878 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _904 = _890 * _890;
    float _906 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _908 = -_894;
    float _910 = fma(_866, _906, _908);
    float _912 = fma(_454, (*spvDescriptorSet0.vp_c10)._m0[16].x, _834);
    float _914 = _884 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _916 = fma(_900, _900, _904);
    out.m_47.x = _846;
    float _918 = _828 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _920 = _912 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _922 = fma(_910, _910, _916);
    float _924 = fma(_454, (*spvDescriptorSet0.vp_c10)._m0[16].w, _832);
    float _926 = _918 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    out.m_47.z = _856;
    float _928 = rsqrt(_922);
    float _930 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _870);
    float _932 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _868);
    out.m_47.y = _860;
    bool _934 = _870 != 0.0;
    bool _936 = isnan(_870);
    bool _938 = _934 || _936;
    bool _940 = isnan(0.0);
    bool _942 = _938 || _940;
    float _944 = _902 * _930;
    float _946 = _852 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _948 = _914 * _932;
    float _950 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _872);
    float _952 = _854 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _954 = _388 * _946;
    float _956 = _374 * _920;
    float _958 = _926 * _950;
    float _960 = in.m_49.y;
    float _962 = _416 * _952;
    float _964 = _900 * _928;
    float _966 = _890 * _928;
    float _968 = _954 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _970 = _954 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _972 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _974 = _972 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _976 = _910 * _928;
    float _978 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[24].x, _968);
    float _980 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[26].x, _970);
    float _982 = 1.0 / _974;
    float _984 = _924 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _986 = fma(_962, (*spvDescriptorSet0.vp_c8)._m0[24].z, _978);
    float _988 = _944 * _864;
    float _990 = fma(_962, (*spvDescriptorSet0.vp_c8)._m0[26].z, _980);
    float _992 = _944 * _862;
    float _994 = _866 * _976;
    float _996 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[24].w, _986);
    float _998 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[26].w, _990);
    float _1000 = _864 * _966;
    float _1002 = fma(_948, _964, _988);
    float _1004 = -_994;
    float _1006 = fma(_862, _966, _1004);
    float _1008 = fma(_948, _976, _992);
    float _1010 = -_1000;
    float _1012 = fma(_866, _964, _1010);
    float _1014 = _996 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1016 = fma(_958, _1006, _1002);
    float _1018 = _998 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1020 = fma(_958, _1012, _1008);
    float _1022 = _1014 + _1016;
    float _1024 = 0.0;
    float _1026 = _962;
    float _1028 = _862;
    float _1030 = _866;
    if (_844)
    {
        float _1032 = in.m_41.x;
        _1024 = _1032;
    }
    float _1034 = _1024;
    float _1036 = _1018 + _1020;
    float _1038 = -_960;
    float _1040 = _1038 + 1.0;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1042;
    float _1046 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1048 = _1022 + _1046;
    float _1050 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1052 = _1036 + _1050;
    float _1054 = in.m_51.x;
    float _1056 = in.m_51.y;
    float _1058 = in.m_51.z;
    float _1060 = _1044 * _982;
    float _1062 = _1048 * _1048;
    float _1064 = _1052 * _1052;
    float _1066 = _960;
    if (_850)
    {
        float _1068 = _858 ? _1040 : _960;
        _1066 = _1068;
    }
    float _1070 = _1066;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1074 = _808 + _1072;
    float _1076 = in.m_49.x;
    float _1078 = _954 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1080 = _868 == 0.0;
    bool _1082 = !_942;
    bool _1084 = _1080 && _1082;
    float _1086 = _1062 + _1064;
    float _1088 = fma(_1060, _1074, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1090 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1078);
    bool _1092 = _872 == 0.0;
    bool _1094 = _1092 && _1084;
    float _1096 = sqrt(_1086);
    bool _1098 = _808 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1100 = isnan(_808);
    bool _1102 = _1098 || _1100;
    bool _1104 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1106 = _1102 || _1104;
    float _1108 = float(_1106);
    float _1110 = fma(_962, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1090);
    float _1112 = _944 * _866;
    bool _1114 = _808 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1116 = isnan(_808);
    bool _1118 = _1114 || _1116;
    bool _1120 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1122 = _1118 || _1120;
    float _1124 = float(_1122);
    bool _1126 = _1034 > 0.5;
    bool _1128 = _1126 && _844;
    float _1130 = fma(_948, _966, _1112);
    float _1132 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1110);
    float _1134 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1136 = _1056;
    float _1138 = _1054;
    float _1140 = _1058;
    float _1142 = _1112;
    if (!_1094)
    {
        float _1144 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1056);
        _1136 = _1144;
    }
    float _1146 = _1136;
    float _1148 = _862 * _964;
    float _1150 = _1146;
    if (!_1094)
    {
        float _1152 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1054);
        _1138 = _1152;
    }
    float _1154 = _1138;
    if (!_1094)
    {
        float _1156 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1058);
        _1140 = _1156;
    }
    float _1158 = _1140;
    bool _1160 = _1096 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1162 = -_1108;
    float _1164 = _1162 + 1.0;
    float _1166 = -_1148;
    float _1168 = fma(_864, _976, _1166);
    if (_844)
    {
        _1026 = _1076;
    }
    float _1170 = _1026;
    float _1172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1174 = _1124 * _1164;
    float _1176 = fma(_958, _1168, _1130);
    float _1178 = _1132 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1180 = _1170;
    if (_1128)
    {
        float _1182 = -_1170;
        float _1184 = _1182 + 1.0;
        _1180 = _1184;
    }
    float _1186 = _1180;
    if (!_844)
    {
        _1142 = _1076;
    }
    float _1188 = _1142;
    float _1190 = _1088 * _1174;
    float _1192 = -_1124;
    float _1194 = _1192 + 1.0;
    float _1196 = _1178 + _1176;
    float _1198 = _1188;
    float _1200 = _1190;
    float _1202 = _1194;
    if (_844)
    {
        _1198 = _1186;
    }
    float _1204 = _1198;
    float _1206 = _864 * _1146;
    float _1208 = _866 * _1146;
    float _1210 = _862 * _1146;
    float _1212 = fma(_1194, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1190);
    if (!_1160)
    {
        _1028 = _1064;
    }
    float _1214 = _1028;
    float _1216 = _1214;
    if (!_1160)
    {
        _1150 = _1062;
    }
    float _1218 = _1150;
    float _1220 = _1218;
    if (!_1160)
    {
        _1200 = _1022;
    }
    float _1222 = _1200;
    float _1224 = _1222;
    if (!_1160)
    {
        _1202 = _1036;
    }
    float _1226 = _1202;
    float _1228 = _1226;
    if (!_1160)
    {
        _1030 = _1196;
    }
    float _1230 = _1030;
    bool _1232 = !_1160;
    float _1234 = _1230;
    float _1236 = _1172;
    if (!_1232)
    {
        float _1238 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1240 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1242 = _1096 + _1240;
        float _1244 = rsqrt(_1086);
        float _1246 = _1242 * _1238;
        float _1248 = _1196 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1250 = _1246 * 0.15915493667125701904296875;
        float _1252 = _1250 * 6.283185482025146484375;
        float _1254 = sin(_1252);
        float _1256 = _1250 * 6.283185482025146484375;
        float _1258 = cos(_1256);
        float _1260 = fma(_1254, _1248, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1262 = _1244 * _1260;
        float _1264 = _1258 + (-1.0);
        float _1266 = fma(_1048, _1262, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1268 = fma(_1052, _1262, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1270 = _1264 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1272 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1274 = _1266 + _1272;
        float _1276 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1278 = _1268 + _1276;
        float _1280 = fma(_1196, _1258, _1270);
        float _1282 = _1274 * _1274;
        float _1284 = _1278 * _1278;
        _1234 = _1280;
        _1220 = _1282;
        _1216 = _1284;
        _1224 = _1266;
        _1228 = _1268;
    }
    float _1286 = _1234;
    float _1288 = _1220;
    float _1290 = _1216;
    float _1292 = _1224;
    float _1294 = _1228;
    float _1296 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1298 = _1286 + _1296;
    float _1300 = fma(_966, _1154, _1208);
    float _1302 = fma(_964, _1154, _1206);
    float _1304 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1306 = fma(_1298, _1298, _1288);
    float _1308 = fma(_976, _1154, _1210);
    float _1310 = fma(_1006, _1158, _1302);
    float _1312 = _1304 * _1134;
    float _1314 = _1306 + _1290;
    float _1316 = fma(_1168, _1158, _1300);
    float _1318 = in.m_43.w;
    float _1320 = fma(_1108, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1212);
    float _1322 = sqrt(_1314);
    float _1324 = _1204 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1326 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1328 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1330 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1332 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1338 = _1324 * _1172;
    float _1340 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1342 = _1326 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1344 = _1328 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1346 = _1332 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1348 = _1334 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1350 = _1336 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1352 = _1330 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1354 = _1320 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1356 = fma(_1012, _1158, _1308);
    out.m_47.w = _1318;
    bool _1358 = _1322 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1360 = isnan(_1322);
    bool _1362 = _1358 || _1360;
    bool _1364 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1366 = _1362 || _1364;
    out.m_53.x = _1346;
    out.m_53.y = _1348;
    out.m_53.z = _1350;
    out.m_53.w = _1340;
    out.m_55.x = _1338;
    out.m_55.y = _1312;
    out.m_57.x = _1342;
    out.m_57.y = _1344;
    out.m_57.z = _1352;
    out.m_57.w = _1354;
    if (!_1366)
    {
        _1236 = 1.0;
    }
    float _1368 = _1236;
    out.m_59.x = _1310;
    out.m_59.y = _1316;
    out.m_59.z = _1356;
    bool _1370 = !_1366;
    float _1372 = _1368;
    if (!_1370)
    {
        bool _1374 = _1322 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1376 = isnan(_1322);
        bool _1378 = _1374 || _1376;
        bool _1380 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1382 = _1378 || _1380;
        if (!_1382)
        {
            float _1384 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1386 = _1322 + _1384;
            float _1388 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1390 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1388;
            float _1392 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1394 = _1392 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1396 = 1.0 / _1390;
            float _1398 = _1386 * _1396;
            float _1400 = fma(_1398, _1394, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1372 = _1400;
            _1402 = true;
        }
        else
        {
            bool _1404 = _1322 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1406 = isnan(_1322);
            bool _1408 = _1404 || _1406;
            bool _1410 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1412 = _1408 || _1410;
            if (!_1412)
            {
                float _1414 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1416 = _1322 + _1414;
                float _1418 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1420 = _1418 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1422 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1424 = _1422 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1426 = 1.0 / _1420;
                float _1428 = _1416 * _1426;
                float _1430 = fma(_1428, _1424, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1372 = _1430;
                _1402 = true;
            }
            else
            {
                _1372 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1402 = false;
    float _1432 = _1372;
    float _1434 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1436 = _1286 + _1434;
    float _1438 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1440 = _1292 + _1438;
    float _1442 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1444 = _1294 + _1442;
    float _1446 = fma(_1436, _1432, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1448 = fma(_1440, _1432, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1450 = fma(_1444, _1432, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1452 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1454 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1456 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1458 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1460 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1452);
    float _1462 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1454);
    float _1464 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1456);
    float _1466 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1458);
    float _1468 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1460);
    float _1470 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1462);
    float _1472 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1464);
    float _1474 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1466);
    float _1476 = _1468 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1478 = _1470 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1480 = _1472 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1482 = _1474 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1484 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1486 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1488 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1490 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1492 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1484);
    float _1494 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1486);
    float _1496 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1488);
    float _1498 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1490);
    float _1500 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1492);
    float _1502 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1494);
    float _1504 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1496);
    float _1506 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1498);
    float _1508 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1500);
    float _1510 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1502);
    float _1512 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1514 = _1448 + _1512;
    float _1516 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1504);
    float _1518 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1520 = _1446 + _1518;
    float _1522 = _1508 + _1510;
    float _1524 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1506);
    float _1526 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1528 = _1450 + _1526;
    float _1530 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1532 = _1522 * 0.5;
    out.m_35.x = _1530;
    out.m_61.x = _1514;
    out.m_61.y = _1520;
    out.m_61.z = _1528;
    out.gl_Position.x = _1516;
    out.gl_Position.y = _1524;
    out.gl_Position.z = _1508;
    out.gl_Position.w = _1510;
    out.m_63.z = _1532;
    out.m_63.w = _1510;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

