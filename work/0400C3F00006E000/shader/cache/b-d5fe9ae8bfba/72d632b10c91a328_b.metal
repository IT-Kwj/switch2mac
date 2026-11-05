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
    float4 m_25 [[user(locn0)]];
    float4 m_29 [[user(locn1)]];
    float4 m_31 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_22 [[attribute(0)]];
    float4 m_27 [[attribute(1)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    bool _546 = false;
    bool _346 = false;
    bool _143 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _47 = in.m_22.x;
    float _49 = in.m_22.y;
    float _51 = in.m_22.z;
    bool _55 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    float _57 = _49 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
    float _59 = _47 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
    float _61 = _57 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _63 = _57 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _65 = _57 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _67 = fma(_59, (*spvDescriptorSet0.vp_c3)._m0[5].x, _61);
    float _69 = fma(_59, (*spvDescriptorSet0.vp_c3)._m0[4].x, _63);
    float _71 = fma(_59, (*spvDescriptorSet0.vp_c3)._m0[6].x, _65);
    float _73 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[5].z, _67);
    float _75 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[4].z, _69);
    float _77 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].z, _71);
    float _79 = _73 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _81 = _75 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _83 = _77 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _85 = _79 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _87 = _79 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _89 = _79 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _91 = _79 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _93 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[1].x, _85);
    float _95 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[0].x, _87);
    float _97 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[2].x, _89);
    float _99 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[3].x, _91);
    float _101 = fma(_83, (*spvDescriptorSet0.vp_c3)._m0[1].z, _93);
    float _103 = fma(_83, (*spvDescriptorSet0.vp_c3)._m0[0].z, _95);
    float _105 = fma(_83, (*spvDescriptorSet0.vp_c3)._m0[2].z, _97);
    float _107 = fma(_83, (*spvDescriptorSet0.vp_c3)._m0[3].z, _99);
    float _109 = _101 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _111 = (*spvDescriptorSet0.vp_c3)._m0[13].w * 255.0;
    float _113 = _103 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _115 = _105 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _117 = _107 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.m_25.w = _111;
    out.gl_Position.x = _113;
    out.gl_Position.y = _109;
    out.gl_Position.z = _115;
    out.gl_Position.w = _117;
    bool _119 = !_55;
    float _121 = _111;
    float _139;
    float _141;
    if (!_119)
    {
        float _123 = _57 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _125 = _57 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _127 = fma(_59, (*spvDescriptorSet0.vp_c3)._m0[14].x, _123);
        float _129 = fma(_59, (*spvDescriptorSet0.vp_c3)._m0[15].x, _125);
        float _131 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[14].z, _127);
        float _133 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[15].z, _129);
        float _135 = _131 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _137 = _133 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _139 = _137;
        _141 = _135;
        _143 = true;
    }
    else
    {
        int _146 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _148 = _146 != 0;
        float _150 = _113;
        float _152 = _109;
        if (!_148)
        {
            float _154 = in.m_27.x;
            float _156 = in.m_27.y;
            _150 = _154;
            _152 = _156;
        }
        float _158 = _150;
        float _160 = _152;
        bool _162 = !_148;
        _139 = _160;
        _141 = _158;
        if (!_162)
        {
            int _164 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _166 = _164 != 0;
            float _168 = _158;
            float _170 = _160;
            if (!_166)
            {
                float _172 = in.m_27.x;
                float _174 = in.m_27.y;
                _168 = _172;
                _170 = _174;
            }
            float _176 = _168;
            float _178 = _170;
            bool _180 = !_166;
            float _182 = _176;
            int _184 = as_type<int>(_176);
            float _186 = _178;
            if (!_180)
            {
                int _188 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _190 = _188 != 0;
                float _192 = in.m_27.x;
                float _194 = in.m_27.y;
                int _196 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _198 = _196 != 0;
                int _200 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _202 = _200 != 0;
                int _204 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _206 = _204 != 0;
                int _208 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _210 = _208 != 0;
                if (_190)
                {
                    _182 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _212 = _182;
                float _214 = _212;
                if (_190)
                {
                    _121 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _216 = _121;
                float _218 = _216;
                if (!_190)
                {
                    _214 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _220 = _214;
                if (!_190)
                {
                    _218 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _222 = _218;
                float _224 = _220 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _226 = _222 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _228 = _192;
                float _230 = _194;
                if (_206)
                {
                    float _232 = _224 * _192;
                    _228 = _232;
                }
                float _234 = _228;
                float _236 = -_224;
                float _238 = _236 + 1.0;
                int _240 = as_type<int>(_234);
                if (_210)
                {
                    float _242 = _226 * _194;
                    _230 = _242;
                }
                float _244 = _230;
                float _246 = -_226;
                float _248 = _246 + 1.0;
                float _250 = _244;
                if (_198)
                {
                    float _252 = _234 + _238;
                    _240 = as_type<int>(_252);
                }
                int _254 = _240;
                if (_202)
                {
                    float _256 = _244 + _248;
                    _250 = _256;
                }
                float _258 = _250;
                _184 = _254;
                _186 = _258;
            }
            int _260 = _184;
            float _262 = _186;
            int _264 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _266 = _264 != 0;
            int _268 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _270 = _268 != 0;
            int _272 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _274 = _272 != 0;
            int _276 = _260;
            int _278 = as_type<int>(_262);
            if (_270)
            {
                float _280 = -as_type<float>(_260);
                float _282 = _280 + 1.0;
                _276 = as_type<int>(_282);
            }
            int _284 = _276;
            if (_274)
            {
                float _286 = -_262;
                float _288 = _286 + 1.0;
                _278 = as_type<int>(_288);
            }
            int _290 = _278;
            bool _292 = !_266;
            float _294 = _292 ? as_type<float>(_284) : as_type<float>(_290);
            bool _296 = !_266;
            float _298 = _296 ? as_type<float>(_290) : as_type<float>(_284);
            _139 = _298;
            _141 = _294;
        }
    }
    _143 = false;
    float _300 = _139;
    float _302 = _141;
    float _304 = _300 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _306 = _300 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    bool _308 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _310 = fma(_302, (*spvDescriptorSet0.vp_c3)._m0[8].x, _304);
    float _312 = fma(_302, (*spvDescriptorSet0.vp_c3)._m0[7].x, _306);
    float _314 = _310 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _316 = _312 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _318 = -_314;
    float _320 = _318 + 1.0;
    out.m_29.x = _316;
    out.m_29.y = _320;
    bool _322 = !_308;
    float _324 = _314;
    float _342;
    float _344;
    if (!_322)
    {
        float _326 = _57 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _328 = _57 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _330 = fma(_59, (*spvDescriptorSet0.vp_c3)._m0[18].x, _326);
        float _332 = fma(_59, (*spvDescriptorSet0.vp_c3)._m0[19].x, _328);
        float _334 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[18].z, _330);
        float _336 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[19].z, _332);
        float _338 = _334 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _340 = _336 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _342 = _340;
        _344 = _338;
        _346 = true;
    }
    else
    {
        int _348 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _350 = _348 != 0;
        float _352 = _316;
        float _354 = _320;
        if (!_350)
        {
            float _356 = in.m_27.x;
            float _358 = in.m_27.y;
            _352 = _356;
            _354 = _358;
        }
        float _360 = _352;
        float _362 = _354;
        bool _364 = !_350;
        _342 = _362;
        _344 = _360;
        if (!_364)
        {
            int _366 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _368 = _366 != 0;
            float _370 = _360;
            float _372 = _362;
            if (!_368)
            {
                float _374 = in.m_27.x;
                float _376 = in.m_27.y;
                _370 = _374;
                _372 = _376;
            }
            float _378 = _370;
            float _380 = _372;
            bool _382 = !_368;
            float _384 = _378;
            int _386 = as_type<int>(_378);
            float _388 = _380;
            if (!_382)
            {
                int _390 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _392 = _390 != 0;
                float _394 = in.m_27.x;
                float _396 = in.m_27.y;
                int _398 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _400 = _398 != 0;
                int _402 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _404 = _402 != 0;
                int _406 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _408 = _406 != 0;
                int _410 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _412 = _410 != 0;
                if (_392)
                {
                    _384 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _414 = _384;
                float _416 = _414;
                if (_392)
                {
                    _324 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _418 = _324;
                float _420 = _418;
                if (!_392)
                {
                    _416 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _422 = _416;
                if (!_392)
                {
                    _420 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _424 = _420;
                float _426 = _422 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _428 = _424 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _430 = _394;
                float _432 = _396;
                if (_408)
                {
                    float _434 = _426 * _394;
                    _430 = _434;
                }
                float _436 = _430;
                float _438 = -_426;
                float _440 = _438 + 1.0;
                int _442 = as_type<int>(_436);
                if (_412)
                {
                    float _444 = _428 * _396;
                    _432 = _444;
                }
                float _446 = _432;
                float _448 = -_428;
                float _450 = _448 + 1.0;
                float _452 = _446;
                if (_400)
                {
                    float _454 = _436 + _440;
                    _442 = as_type<int>(_454);
                }
                int _456 = _442;
                if (_404)
                {
                    float _458 = _446 + _450;
                    _452 = _458;
                }
                float _460 = _452;
                _386 = _456;
                _388 = _460;
            }
            int _462 = _386;
            float _464 = _388;
            int _466 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _468 = _466 != 0;
            int _470 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _472 = _470 != 0;
            int _474 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _476 = _474 != 0;
            int _478 = _462;
            int _480 = as_type<int>(_464);
            if (_472)
            {
                float _482 = -as_type<float>(_462);
                float _484 = _482 + 1.0;
                _478 = as_type<int>(_484);
            }
            int _486 = _478;
            if (_476)
            {
                float _488 = -_464;
                float _490 = _488 + 1.0;
                _480 = as_type<int>(_490);
            }
            int _492 = _480;
            bool _494 = !_468;
            float _496 = _494 ? as_type<float>(_486) : as_type<float>(_492);
            bool _498 = !_468;
            float _500 = _498 ? as_type<float>(_492) : as_type<float>(_486);
            _342 = _500;
            _344 = _496;
        }
    }
    _346 = false;
    float _502 = _342;
    float _504 = _344;
    float _506 = _502 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _508 = _502 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    bool _510 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].z);
    float _512 = fma(_504, (*spvDescriptorSet0.vp_c3)._m0[10].x, _506);
    float _514 = fma(_504, (*spvDescriptorSet0.vp_c3)._m0[9].x, _508);
    float _516 = _512 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _518 = _514 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _520 = -_516;
    float _522 = _520 + 1.0;
    out.m_31.x = _518;
    out.m_31.y = _522;
    bool _524 = !_510;
    float _542;
    float _544;
    if (!_524)
    {
        float _526 = _57 * (*spvDescriptorSet0.vp_c3)._m0[22].y;
        float _528 = _57 * (*spvDescriptorSet0.vp_c3)._m0[23].y;
        float _530 = fma(_59, (*spvDescriptorSet0.vp_c3)._m0[22].x, _526);
        float _532 = fma(_59, (*spvDescriptorSet0.vp_c3)._m0[23].x, _528);
        float _534 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[22].z, _530);
        float _536 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[23].z, _532);
        float _538 = _534 + (*spvDescriptorSet0.vp_c3)._m0[22].w;
        float _540 = _536 + (*spvDescriptorSet0.vp_c3)._m0[23].w;
        _542 = _540;
        _544 = _538;
        _546 = true;
    }
    else
    {
        int _548 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _550 = _548 != 0;
        float _552 = _59;
        float _554 = _57;
        if (!_550)
        {
            float _556 = in.m_27.x;
            float _558 = in.m_27.y;
            _552 = _556;
            _554 = _558;
        }
        float _560 = _552;
        float _562 = _554;
        bool _564 = !_550;
        _542 = _562;
        _544 = _560;
        if (!_564)
        {
            int _566 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _568 = _566 != 0;
            float _570 = _560;
            float _572 = _562;
            if (!_568)
            {
                float _574 = in.m_27.x;
                float _576 = in.m_27.y;
                _570 = _574;
                _572 = _576;
            }
            float _578 = _570;
            float _580 = _572;
            bool _582 = !_568;
            float _584 = _580;
            float _586 = _578;
            int _588 = as_type<int>(_578);
            float _590 = _580;
            if (!_582)
            {
                float _592 = in.m_27.x;
                float _594 = in.m_27.y;
                int _596 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _598 = _596 != 0;
                int _600 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _602 = _600 != 0;
                int _604 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _606 = _604 != 0;
                int _608 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _610 = _608 != 0;
                int _612 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _614 = _612 != 0;
                if (_598)
                {
                    _584 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _616 = _584;
                float _618 = _616;
                if (_598)
                {
                    _586 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _620 = _586;
                float _622 = _620;
                if (!_598)
                {
                    _618 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _624 = _618;
                if (!_598)
                {
                    _622 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _626 = _622;
                float _628 = _624 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _630 = _626 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _632 = _592;
                float _634 = _594;
                if (_610)
                {
                    float _636 = _628 * _592;
                    _632 = _636;
                }
                float _638 = _632;
                float _640 = -_628;
                float _642 = _640 + 1.0;
                int _644 = as_type<int>(_638);
                if (_614)
                {
                    float _646 = _630 * _594;
                    _634 = _646;
                }
                float _648 = _634;
                float _650 = -_630;
                float _652 = _650 + 1.0;
                float _654 = _648;
                if (_602)
                {
                    float _656 = _638 + _642;
                    _644 = as_type<int>(_656);
                }
                int _658 = _644;
                if (_606)
                {
                    float _660 = _648 + _652;
                    _654 = _660;
                }
                float _662 = _654;
                _588 = _658;
                _590 = _662;
            }
            int _664 = _588;
            float _666 = _590;
            int _668 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _670 = _668 != 0;
            int _672 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _674 = _672 != 0;
            int _676 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _678 = _676 != 0;
            int _680 = _664;
            int _682 = as_type<int>(_666);
            if (_674)
            {
                float _684 = -as_type<float>(_664);
                float _686 = _684 + 1.0;
                _680 = as_type<int>(_686);
            }
            int _688 = _680;
            if (_678)
            {
                float _690 = -_666;
                float _692 = _690 + 1.0;
                _682 = as_type<int>(_692);
            }
            int _694 = _682;
            bool _696 = !_670;
            float _698 = _696 ? as_type<float>(_688) : as_type<float>(_694);
            bool _700 = !_670;
            float _702 = _700 ? as_type<float>(_694) : as_type<float>(_688);
            _542 = _702;
            _544 = _698;
        }
    }
    _546 = false;
    float _704 = _542;
    float _706 = _544;
    float _708 = _704 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _710 = _704 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _712 = fma(_706, (*spvDescriptorSet0.vp_c3)._m0[12].x, _708);
    float _714 = fma(_706, (*spvDescriptorSet0.vp_c3)._m0[11].x, _710);
    float _716 = _712 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _718 = _714 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _720 = -_716;
    float _722 = _720 + 1.0;
    out.m_33.x = _718;
    out.m_33.y = _722;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    bool _546 = false;
    bool _346 = false;
    bool _143 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _47 = in.m_22.x;
    float _49 = in.m_22.y;
    float _51 = in.m_22.z;
    bool _55 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    float _57 = _49 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
    float _59 = _47 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
    float _61 = _57 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _63 = _57 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _65 = _57 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _67 = fma(_59, (*spvDescriptorSet0.vp_c3)._m0[5].x, _61);
    float _69 = fma(_59, (*spvDescriptorSet0.vp_c3)._m0[4].x, _63);
    float _71 = fma(_59, (*spvDescriptorSet0.vp_c3)._m0[6].x, _65);
    float _73 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[5].z, _67);
    float _75 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[4].z, _69);
    float _77 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].z, _71);
    float _79 = _73 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _81 = _75 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _83 = _77 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _85 = _79 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _87 = _79 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _89 = _79 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _91 = _79 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _93 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[1].x, _85);
    float _95 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[0].x, _87);
    float _97 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[2].x, _89);
    float _99 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[3].x, _91);
    float _101 = fma(_83, (*spvDescriptorSet0.vp_c3)._m0[1].z, _93);
    float _103 = fma(_83, (*spvDescriptorSet0.vp_c3)._m0[0].z, _95);
    float _105 = fma(_83, (*spvDescriptorSet0.vp_c3)._m0[2].z, _97);
    float _107 = fma(_83, (*spvDescriptorSet0.vp_c3)._m0[3].z, _99);
    float _109 = _101 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _111 = (*spvDescriptorSet0.vp_c3)._m0[13].w * 255.0;
    float _113 = _103 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _115 = _105 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _117 = _107 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.m_25.w = _111;
    out.gl_Position.x = _113;
    out.gl_Position.y = _109;
    out.gl_Position.z = _115;
    out.gl_Position.w = _117;
    bool _119 = !_55;
    float _121 = _111;
    float _139;
    float _141;
    if (!_119)
    {
        float _123 = _57 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _125 = _57 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _127 = fma(_59, (*spvDescriptorSet0.vp_c3)._m0[14].x, _123);
        float _129 = fma(_59, (*spvDescriptorSet0.vp_c3)._m0[15].x, _125);
        float _131 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[14].z, _127);
        float _133 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[15].z, _129);
        float _135 = _131 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _137 = _133 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _139 = _137;
        _141 = _135;
        _143 = true;
    }
    else
    {
        int _146 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _148 = _146 != 0;
        float _150 = _113;
        float _152 = _109;
        if (!_148)
        {
            float _154 = in.m_27.x;
            float _156 = in.m_27.y;
            _150 = _154;
            _152 = _156;
        }
        float _158 = _150;
        float _160 = _152;
        bool _162 = !_148;
        _139 = _160;
        _141 = _158;
        if (!_162)
        {
            int _164 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _166 = _164 != 0;
            float _168 = _158;
            float _170 = _160;
            if (!_166)
            {
                float _172 = in.m_27.x;
                float _174 = in.m_27.y;
                _168 = _172;
                _170 = _174;
            }
            float _176 = _168;
            float _178 = _170;
            bool _180 = !_166;
            float _182 = _176;
            int _184 = as_type<int>(_176);
            float _186 = _178;
            if (!_180)
            {
                int _188 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _190 = _188 != 0;
                float _192 = in.m_27.x;
                float _194 = in.m_27.y;
                int _196 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _198 = _196 != 0;
                int _200 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _202 = _200 != 0;
                int _204 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _206 = _204 != 0;
                int _208 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _210 = _208 != 0;
                if (_190)
                {
                    _182 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _212 = _182;
                float _214 = _212;
                if (_190)
                {
                    _121 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _216 = _121;
                float _218 = _216;
                if (!_190)
                {
                    _214 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _220 = _214;
                if (!_190)
                {
                    _218 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _222 = _218;
                float _224 = _220 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _226 = _222 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _228 = _192;
                float _230 = _194;
                if (_206)
                {
                    float _232 = _224 * _192;
                    _228 = _232;
                }
                float _234 = _228;
                float _236 = -_224;
                float _238 = _236 + 1.0;
                int _240 = as_type<int>(_234);
                if (_210)
                {
                    float _242 = _226 * _194;
                    _230 = _242;
                }
                float _244 = _230;
                float _246 = -_226;
                float _248 = _246 + 1.0;
                float _250 = _244;
                if (_198)
                {
                    float _252 = _234 + _238;
                    _240 = as_type<int>(_252);
                }
                int _254 = _240;
                if (_202)
                {
                    float _256 = _244 + _248;
                    _250 = _256;
                }
                float _258 = _250;
                _184 = _254;
                _186 = _258;
            }
            int _260 = _184;
            float _262 = _186;
            int _264 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _266 = _264 != 0;
            int _268 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _270 = _268 != 0;
            int _272 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _274 = _272 != 0;
            int _276 = _260;
            int _278 = as_type<int>(_262);
            if (_270)
            {
                float _280 = -as_type<float>(_260);
                float _282 = _280 + 1.0;
                _276 = as_type<int>(_282);
            }
            int _284 = _276;
            if (_274)
            {
                float _286 = -_262;
                float _288 = _286 + 1.0;
                _278 = as_type<int>(_288);
            }
            int _290 = _278;
            bool _292 = !_266;
            float _294 = _292 ? as_type<float>(_284) : as_type<float>(_290);
            bool _296 = !_266;
            float _298 = _296 ? as_type<float>(_290) : as_type<float>(_284);
            _139 = _298;
            _141 = _294;
        }
    }
    _143 = false;
    float _300 = _139;
    float _302 = _141;
    float _304 = _300 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _306 = _300 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    bool _308 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _310 = fma(_302, (*spvDescriptorSet0.vp_c3)._m0[8].x, _304);
    float _312 = fma(_302, (*spvDescriptorSet0.vp_c3)._m0[7].x, _306);
    float _314 = _310 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _316 = _312 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _318 = -_314;
    float _320 = _318 + 1.0;
    out.m_29.x = _316;
    out.m_29.y = _320;
    bool _322 = !_308;
    float _324 = _314;
    float _342;
    float _344;
    if (!_322)
    {
        float _326 = _57 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _328 = _57 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _330 = fma(_59, (*spvDescriptorSet0.vp_c3)._m0[18].x, _326);
        float _332 = fma(_59, (*spvDescriptorSet0.vp_c3)._m0[19].x, _328);
        float _334 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[18].z, _330);
        float _336 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[19].z, _332);
        float _338 = _334 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _340 = _336 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _342 = _340;
        _344 = _338;
        _346 = true;
    }
    else
    {
        int _348 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _350 = _348 != 0;
        float _352 = _316;
        float _354 = _320;
        if (!_350)
        {
            float _356 = in.m_27.x;
            float _358 = in.m_27.y;
            _352 = _356;
            _354 = _358;
        }
        float _360 = _352;
        float _362 = _354;
        bool _364 = !_350;
        _342 = _362;
        _344 = _360;
        if (!_364)
        {
            int _366 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _368 = _366 != 0;
            float _370 = _360;
            float _372 = _362;
            if (!_368)
            {
                float _374 = in.m_27.x;
                float _376 = in.m_27.y;
                _370 = _374;
                _372 = _376;
            }
            float _378 = _370;
            float _380 = _372;
            bool _382 = !_368;
            float _384 = _378;
            int _386 = as_type<int>(_378);
            float _388 = _380;
            if (!_382)
            {
                int _390 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _392 = _390 != 0;
                float _394 = in.m_27.x;
                float _396 = in.m_27.y;
                int _398 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _400 = _398 != 0;
                int _402 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _404 = _402 != 0;
                int _406 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _408 = _406 != 0;
                int _410 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _412 = _410 != 0;
                if (_392)
                {
                    _384 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _414 = _384;
                float _416 = _414;
                if (_392)
                {
                    _324 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _418 = _324;
                float _420 = _418;
                if (!_392)
                {
                    _416 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _422 = _416;
                if (!_392)
                {
                    _420 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _424 = _420;
                float _426 = _422 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _428 = _424 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _430 = _394;
                float _432 = _396;
                if (_408)
                {
                    float _434 = _426 * _394;
                    _430 = _434;
                }
                float _436 = _430;
                float _438 = -_426;
                float _440 = _438 + 1.0;
                int _442 = as_type<int>(_436);
                if (_412)
                {
                    float _444 = _428 * _396;
                    _432 = _444;
                }
                float _446 = _432;
                float _448 = -_428;
                float _450 = _448 + 1.0;
                float _452 = _446;
                if (_400)
                {
                    float _454 = _436 + _440;
                    _442 = as_type<int>(_454);
                }
                int _456 = _442;
                if (_404)
                {
                    float _458 = _446 + _450;
                    _452 = _458;
                }
                float _460 = _452;
                _386 = _456;
                _388 = _460;
            }
            int _462 = _386;
            float _464 = _388;
            int _466 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _468 = _466 != 0;
            int _470 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _472 = _470 != 0;
            int _474 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _476 = _474 != 0;
            int _478 = _462;
            int _480 = as_type<int>(_464);
            if (_472)
            {
                float _482 = -as_type<float>(_462);
                float _484 = _482 + 1.0;
                _478 = as_type<int>(_484);
            }
            int _486 = _478;
            if (_476)
            {
                float _488 = -_464;
                float _490 = _488 + 1.0;
                _480 = as_type<int>(_490);
            }
            int _492 = _480;
            bool _494 = !_468;
            float _496 = _494 ? as_type<float>(_486) : as_type<float>(_492);
            bool _498 = !_468;
            float _500 = _498 ? as_type<float>(_492) : as_type<float>(_486);
            _342 = _500;
            _344 = _496;
        }
    }
    _346 = false;
    float _502 = _342;
    float _504 = _344;
    float _506 = _502 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _508 = _502 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    bool _510 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].z);
    float _512 = fma(_504, (*spvDescriptorSet0.vp_c3)._m0[10].x, _506);
    float _514 = fma(_504, (*spvDescriptorSet0.vp_c3)._m0[9].x, _508);
    float _516 = _512 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _518 = _514 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _520 = -_516;
    float _522 = _520 + 1.0;
    out.m_31.x = _518;
    out.m_31.y = _522;
    bool _524 = !_510;
    float _542;
    float _544;
    if (!_524)
    {
        float _526 = _57 * (*spvDescriptorSet0.vp_c3)._m0[22].y;
        float _528 = _57 * (*spvDescriptorSet0.vp_c3)._m0[23].y;
        float _530 = fma(_59, (*spvDescriptorSet0.vp_c3)._m0[22].x, _526);
        float _532 = fma(_59, (*spvDescriptorSet0.vp_c3)._m0[23].x, _528);
        float _534 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[22].z, _530);
        float _536 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[23].z, _532);
        float _538 = _534 + (*spvDescriptorSet0.vp_c3)._m0[22].w;
        float _540 = _536 + (*spvDescriptorSet0.vp_c3)._m0[23].w;
        _542 = _540;
        _544 = _538;
        _546 = true;
    }
    else
    {
        int _548 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _550 = _548 != 0;
        float _552 = _59;
        float _554 = _57;
        if (!_550)
        {
            float _556 = in.m_27.x;
            float _558 = in.m_27.y;
            _552 = _556;
            _554 = _558;
        }
        float _560 = _552;
        float _562 = _554;
        bool _564 = !_550;
        _542 = _562;
        _544 = _560;
        if (!_564)
        {
            int _566 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _568 = _566 != 0;
            float _570 = _560;
            float _572 = _562;
            if (!_568)
            {
                float _574 = in.m_27.x;
                float _576 = in.m_27.y;
                _570 = _574;
                _572 = _576;
            }
            float _578 = _570;
            float _580 = _572;
            bool _582 = !_568;
            float _584 = _580;
            float _586 = _578;
            int _588 = as_type<int>(_578);
            float _590 = _580;
            if (!_582)
            {
                float _592 = in.m_27.x;
                float _594 = in.m_27.y;
                int _596 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _598 = _596 != 0;
                int _600 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _602 = _600 != 0;
                int _604 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _606 = _604 != 0;
                int _608 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _610 = _608 != 0;
                int _612 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _614 = _612 != 0;
                if (_598)
                {
                    _584 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _616 = _584;
                float _618 = _616;
                if (_598)
                {
                    _586 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _620 = _586;
                float _622 = _620;
                if (!_598)
                {
                    _618 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _624 = _618;
                if (!_598)
                {
                    _622 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _626 = _622;
                float _628 = _624 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _630 = _626 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _632 = _592;
                float _634 = _594;
                if (_610)
                {
                    float _636 = _628 * _592;
                    _632 = _636;
                }
                float _638 = _632;
                float _640 = -_628;
                float _642 = _640 + 1.0;
                int _644 = as_type<int>(_638);
                if (_614)
                {
                    float _646 = _630 * _594;
                    _634 = _646;
                }
                float _648 = _634;
                float _650 = -_630;
                float _652 = _650 + 1.0;
                float _654 = _648;
                if (_602)
                {
                    float _656 = _638 + _642;
                    _644 = as_type<int>(_656);
                }
                int _658 = _644;
                if (_606)
                {
                    float _660 = _648 + _652;
                    _654 = _660;
                }
                float _662 = _654;
                _588 = _658;
                _590 = _662;
            }
            int _664 = _588;
            float _666 = _590;
            int _668 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _670 = _668 != 0;
            int _672 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _674 = _672 != 0;
            int _676 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _678 = _676 != 0;
            int _680 = _664;
            int _682 = as_type<int>(_666);
            if (_674)
            {
                float _684 = -as_type<float>(_664);
                float _686 = _684 + 1.0;
                _680 = as_type<int>(_686);
            }
            int _688 = _680;
            if (_678)
            {
                float _690 = -_666;
                float _692 = _690 + 1.0;
                _682 = as_type<int>(_692);
            }
            int _694 = _682;
            bool _696 = !_670;
            float _698 = _696 ? as_type<float>(_688) : as_type<float>(_694);
            bool _700 = !_670;
            float _702 = _700 ? as_type<float>(_694) : as_type<float>(_688);
            _542 = _702;
            _544 = _698;
        }
    }
    _546 = false;
    float _704 = _542;
    float _706 = _544;
    float _708 = _704 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _710 = _704 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _712 = fma(_706, (*spvDescriptorSet0.vp_c3)._m0[12].x, _708);
    float _714 = fma(_706, (*spvDescriptorSet0.vp_c3)._m0[11].x, _710);
    float _716 = _712 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _718 = _714 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _720 = -_716;
    float _722 = _720 + 1.0;
    out.m_33.x = _718;
    out.m_33.y = _722;
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
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    bool _546 = false;
    bool _346 = false;
    bool _143 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _47 = in.m_22.x;
    float _49 = in.m_22.y;
    float _51 = in.m_22.z;
    bool _55 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    float _57 = _49 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
    float _59 = _47 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
    float _61 = _57 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _63 = _57 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _65 = _57 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _67 = fma(_59, (*spvDescriptorSet0.vp_c3)._m0[5].x, _61);
    float _69 = fma(_59, (*spvDescriptorSet0.vp_c3)._m0[4].x, _63);
    float _71 = fma(_59, (*spvDescriptorSet0.vp_c3)._m0[6].x, _65);
    float _73 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[5].z, _67);
    float _75 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[4].z, _69);
    float _77 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].z, _71);
    float _79 = _73 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _81 = _75 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _83 = _77 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _85 = _79 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _87 = _79 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _89 = _79 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _91 = _79 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _93 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[1].x, _85);
    float _95 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[0].x, _87);
    float _97 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[2].x, _89);
    float _99 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[3].x, _91);
    float _101 = fma(_83, (*spvDescriptorSet0.vp_c3)._m0[1].z, _93);
    float _103 = fma(_83, (*spvDescriptorSet0.vp_c3)._m0[0].z, _95);
    float _105 = fma(_83, (*spvDescriptorSet0.vp_c3)._m0[2].z, _97);
    float _107 = fma(_83, (*spvDescriptorSet0.vp_c3)._m0[3].z, _99);
    float _109 = _101 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _111 = (*spvDescriptorSet0.vp_c3)._m0[13].w * 255.0;
    float _113 = _103 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _115 = _105 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _117 = _107 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.m_25.w = _111;
    out.gl_Position.x = _113;
    out.gl_Position.y = _109;
    out.gl_Position.z = _115;
    out.gl_Position.w = _117;
    bool _119 = !_55;
    float _121 = _111;
    float _139;
    float _141;
    if (!_119)
    {
        float _123 = _57 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _125 = _57 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _127 = fma(_59, (*spvDescriptorSet0.vp_c3)._m0[14].x, _123);
        float _129 = fma(_59, (*spvDescriptorSet0.vp_c3)._m0[15].x, _125);
        float _131 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[14].z, _127);
        float _133 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[15].z, _129);
        float _135 = _131 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _137 = _133 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _139 = _137;
        _141 = _135;
        _143 = true;
    }
    else
    {
        int _146 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _148 = _146 != 0;
        float _150 = _113;
        float _152 = _109;
        if (!_148)
        {
            float _154 = in.m_27.x;
            float _156 = in.m_27.y;
            _150 = _154;
            _152 = _156;
        }
        float _158 = _150;
        float _160 = _152;
        bool _162 = !_148;
        _139 = _160;
        _141 = _158;
        if (!_162)
        {
            int _164 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _166 = _164 != 0;
            float _168 = _158;
            float _170 = _160;
            if (!_166)
            {
                float _172 = in.m_27.x;
                float _174 = in.m_27.y;
                _168 = _172;
                _170 = _174;
            }
            float _176 = _168;
            float _178 = _170;
            bool _180 = !_166;
            float _182 = _176;
            int _184 = as_type<int>(_176);
            float _186 = _178;
            if (!_180)
            {
                int _188 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _190 = _188 != 0;
                float _192 = in.m_27.x;
                float _194 = in.m_27.y;
                int _196 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _198 = _196 != 0;
                int _200 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _202 = _200 != 0;
                int _204 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _206 = _204 != 0;
                int _208 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _210 = _208 != 0;
                if (_190)
                {
                    _182 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _212 = _182;
                float _214 = _212;
                if (_190)
                {
                    _121 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _216 = _121;
                float _218 = _216;
                if (!_190)
                {
                    _214 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _220 = _214;
                if (!_190)
                {
                    _218 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _222 = _218;
                float _224 = _220 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _226 = _222 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _228 = _192;
                float _230 = _194;
                if (_206)
                {
                    float _232 = _224 * _192;
                    _228 = _232;
                }
                float _234 = _228;
                float _236 = -_224;
                float _238 = _236 + 1.0;
                int _240 = as_type<int>(_234);
                if (_210)
                {
                    float _242 = _226 * _194;
                    _230 = _242;
                }
                float _244 = _230;
                float _246 = -_226;
                float _248 = _246 + 1.0;
                float _250 = _244;
                if (_198)
                {
                    float _252 = _234 + _238;
                    _240 = as_type<int>(_252);
                }
                int _254 = _240;
                if (_202)
                {
                    float _256 = _244 + _248;
                    _250 = _256;
                }
                float _258 = _250;
                _184 = _254;
                _186 = _258;
            }
            int _260 = _184;
            float _262 = _186;
            int _264 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _266 = _264 != 0;
            int _268 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _270 = _268 != 0;
            int _272 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _274 = _272 != 0;
            int _276 = _260;
            int _278 = as_type<int>(_262);
            if (_270)
            {
                float _280 = -as_type<float>(_260);
                float _282 = _280 + 1.0;
                _276 = as_type<int>(_282);
            }
            int _284 = _276;
            if (_274)
            {
                float _286 = -_262;
                float _288 = _286 + 1.0;
                _278 = as_type<int>(_288);
            }
            int _290 = _278;
            bool _292 = !_266;
            float _294 = _292 ? as_type<float>(_284) : as_type<float>(_290);
            bool _296 = !_266;
            float _298 = _296 ? as_type<float>(_290) : as_type<float>(_284);
            _139 = _298;
            _141 = _294;
        }
    }
    _143 = false;
    float _300 = _139;
    float _302 = _141;
    float _304 = _300 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _306 = _300 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    bool _308 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _310 = fma(_302, (*spvDescriptorSet0.vp_c3)._m0[8].x, _304);
    float _312 = fma(_302, (*spvDescriptorSet0.vp_c3)._m0[7].x, _306);
    float _314 = _310 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _316 = _312 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _318 = -_314;
    float _320 = _318 + 1.0;
    out.m_29.x = _316;
    out.m_29.y = _320;
    bool _322 = !_308;
    float _324 = _314;
    float _342;
    float _344;
    if (!_322)
    {
        float _326 = _57 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _328 = _57 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _330 = fma(_59, (*spvDescriptorSet0.vp_c3)._m0[18].x, _326);
        float _332 = fma(_59, (*spvDescriptorSet0.vp_c3)._m0[19].x, _328);
        float _334 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[18].z, _330);
        float _336 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[19].z, _332);
        float _338 = _334 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _340 = _336 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _342 = _340;
        _344 = _338;
        _346 = true;
    }
    else
    {
        int _348 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _350 = _348 != 0;
        float _352 = _316;
        float _354 = _320;
        if (!_350)
        {
            float _356 = in.m_27.x;
            float _358 = in.m_27.y;
            _352 = _356;
            _354 = _358;
        }
        float _360 = _352;
        float _362 = _354;
        bool _364 = !_350;
        _342 = _362;
        _344 = _360;
        if (!_364)
        {
            int _366 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _368 = _366 != 0;
            float _370 = _360;
            float _372 = _362;
            if (!_368)
            {
                float _374 = in.m_27.x;
                float _376 = in.m_27.y;
                _370 = _374;
                _372 = _376;
            }
            float _378 = _370;
            float _380 = _372;
            bool _382 = !_368;
            float _384 = _378;
            int _386 = as_type<int>(_378);
            float _388 = _380;
            if (!_382)
            {
                int _390 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _392 = _390 != 0;
                float _394 = in.m_27.x;
                float _396 = in.m_27.y;
                int _398 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _400 = _398 != 0;
                int _402 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _404 = _402 != 0;
                int _406 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _408 = _406 != 0;
                int _410 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _412 = _410 != 0;
                if (_392)
                {
                    _384 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _414 = _384;
                float _416 = _414;
                if (_392)
                {
                    _324 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _418 = _324;
                float _420 = _418;
                if (!_392)
                {
                    _416 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _422 = _416;
                if (!_392)
                {
                    _420 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _424 = _420;
                float _426 = _422 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _428 = _424 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _430 = _394;
                float _432 = _396;
                if (_408)
                {
                    float _434 = _426 * _394;
                    _430 = _434;
                }
                float _436 = _430;
                float _438 = -_426;
                float _440 = _438 + 1.0;
                int _442 = as_type<int>(_436);
                if (_412)
                {
                    float _444 = _428 * _396;
                    _432 = _444;
                }
                float _446 = _432;
                float _448 = -_428;
                float _450 = _448 + 1.0;
                float _452 = _446;
                if (_400)
                {
                    float _454 = _436 + _440;
                    _442 = as_type<int>(_454);
                }
                int _456 = _442;
                if (_404)
                {
                    float _458 = _446 + _450;
                    _452 = _458;
                }
                float _460 = _452;
                _386 = _456;
                _388 = _460;
            }
            int _462 = _386;
            float _464 = _388;
            int _466 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _468 = _466 != 0;
            int _470 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _472 = _470 != 0;
            int _474 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _476 = _474 != 0;
            int _478 = _462;
            int _480 = as_type<int>(_464);
            if (_472)
            {
                float _482 = -as_type<float>(_462);
                float _484 = _482 + 1.0;
                _478 = as_type<int>(_484);
            }
            int _486 = _478;
            if (_476)
            {
                float _488 = -_464;
                float _490 = _488 + 1.0;
                _480 = as_type<int>(_490);
            }
            int _492 = _480;
            bool _494 = !_468;
            float _496 = _494 ? as_type<float>(_486) : as_type<float>(_492);
            bool _498 = !_468;
            float _500 = _498 ? as_type<float>(_492) : as_type<float>(_486);
            _342 = _500;
            _344 = _496;
        }
    }
    _346 = false;
    float _502 = _342;
    float _504 = _344;
    float _506 = _502 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _508 = _502 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    bool _510 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].z);
    float _512 = fma(_504, (*spvDescriptorSet0.vp_c3)._m0[10].x, _506);
    float _514 = fma(_504, (*spvDescriptorSet0.vp_c3)._m0[9].x, _508);
    float _516 = _512 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _518 = _514 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _520 = -_516;
    float _522 = _520 + 1.0;
    out.m_31.x = _518;
    out.m_31.y = _522;
    bool _524 = !_510;
    float _542;
    float _544;
    if (!_524)
    {
        float _526 = _57 * (*spvDescriptorSet0.vp_c3)._m0[22].y;
        float _528 = _57 * (*spvDescriptorSet0.vp_c3)._m0[23].y;
        float _530 = fma(_59, (*spvDescriptorSet0.vp_c3)._m0[22].x, _526);
        float _532 = fma(_59, (*spvDescriptorSet0.vp_c3)._m0[23].x, _528);
        float _534 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[22].z, _530);
        float _536 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[23].z, _532);
        float _538 = _534 + (*spvDescriptorSet0.vp_c3)._m0[22].w;
        float _540 = _536 + (*spvDescriptorSet0.vp_c3)._m0[23].w;
        _542 = _540;
        _544 = _538;
        _546 = true;
    }
    else
    {
        int _548 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _550 = _548 != 0;
        float _552 = _59;
        float _554 = _57;
        if (!_550)
        {
            float _556 = in.m_27.x;
            float _558 = in.m_27.y;
            _552 = _556;
            _554 = _558;
        }
        float _560 = _552;
        float _562 = _554;
        bool _564 = !_550;
        _542 = _562;
        _544 = _560;
        if (!_564)
        {
            int _566 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _568 = _566 != 0;
            float _570 = _560;
            float _572 = _562;
            if (!_568)
            {
                float _574 = in.m_27.x;
                float _576 = in.m_27.y;
                _570 = _574;
                _572 = _576;
            }
            float _578 = _570;
            float _580 = _572;
            bool _582 = !_568;
            float _584 = _580;
            float _586 = _578;
            int _588 = as_type<int>(_578);
            float _590 = _580;
            if (!_582)
            {
                float _592 = in.m_27.x;
                float _594 = in.m_27.y;
                int _596 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _598 = _596 != 0;
                int _600 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _602 = _600 != 0;
                int _604 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _606 = _604 != 0;
                int _608 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _610 = _608 != 0;
                int _612 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _614 = _612 != 0;
                if (_598)
                {
                    _584 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _616 = _584;
                float _618 = _616;
                if (_598)
                {
                    _586 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _620 = _586;
                float _622 = _620;
                if (!_598)
                {
                    _618 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _624 = _618;
                if (!_598)
                {
                    _622 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _626 = _622;
                float _628 = _624 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _630 = _626 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _632 = _592;
                float _634 = _594;
                if (_610)
                {
                    float _636 = _628 * _592;
                    _632 = _636;
                }
                float _638 = _632;
                float _640 = -_628;
                float _642 = _640 + 1.0;
                int _644 = as_type<int>(_638);
                if (_614)
                {
                    float _646 = _630 * _594;
                    _634 = _646;
                }
                float _648 = _634;
                float _650 = -_630;
                float _652 = _650 + 1.0;
                float _654 = _648;
                if (_602)
                {
                    float _656 = _638 + _642;
                    _644 = as_type<int>(_656);
                }
                int _658 = _644;
                if (_606)
                {
                    float _660 = _648 + _652;
                    _654 = _660;
                }
                float _662 = _654;
                _588 = _658;
                _590 = _662;
            }
            int _664 = _588;
            float _666 = _590;
            int _668 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _670 = _668 != 0;
            int _672 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _674 = _672 != 0;
            int _676 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _678 = _676 != 0;
            int _680 = _664;
            int _682 = as_type<int>(_666);
            if (_674)
            {
                float _684 = -as_type<float>(_664);
                float _686 = _684 + 1.0;
                _680 = as_type<int>(_686);
            }
            int _688 = _680;
            if (_678)
            {
                float _690 = -_666;
                float _692 = _690 + 1.0;
                _682 = as_type<int>(_692);
            }
            int _694 = _682;
            bool _696 = !_670;
            float _698 = _696 ? as_type<float>(_688) : as_type<float>(_694);
            bool _700 = !_670;
            float _702 = _700 ? as_type<float>(_694) : as_type<float>(_688);
            _542 = _702;
            _544 = _698;
        }
    }
    _546 = false;
    float _704 = _542;
    float _706 = _544;
    float _708 = _704 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _710 = _704 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _712 = fma(_706, (*spvDescriptorSet0.vp_c3)._m0[12].x, _708);
    float _714 = fma(_706, (*spvDescriptorSet0.vp_c3)._m0[11].x, _710);
    float _716 = _712 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _718 = _714 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _720 = -_716;
    float _722 = _720 + 1.0;
    out.m_33.x = _718;
    out.m_33.y = _722;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_25.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_25.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_25.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_25.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

