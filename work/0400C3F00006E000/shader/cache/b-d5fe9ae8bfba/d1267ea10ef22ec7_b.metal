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
    bool _552 = false;
    bool _352 = false;
    bool _149 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _47 = in.m_22.x;
    float _49 = in.m_22.y;
    float _51 = in.m_22.z;
    bool _55 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    float _57 = 255.0 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _59 = _49 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
    float _61 = _47 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
    float _63 = _59 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _65 = _59 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _67 = _59 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _69 = fma(_61, (*spvDescriptorSet0.vp_c3)._m0[5].x, _63);
    float _71 = fma(_61, (*spvDescriptorSet0.vp_c3)._m0[4].x, _65);
    float _73 = fma(_61, (*spvDescriptorSet0.vp_c3)._m0[6].x, _67);
    float _75 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[5].z, _69);
    float _77 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[4].z, _71);
    float _79 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].z, _73);
    float _81 = _75 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _83 = _77 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _85 = _79 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _87 = _81 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _89 = _81 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _91 = _81 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _93 = _81 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _95 = fma(_83, (*spvDescriptorSet0.vp_c3)._m0[1].x, _87);
    float _97 = fma(_83, (*spvDescriptorSet0.vp_c3)._m0[0].x, _89);
    float _99 = fma(_83, (*spvDescriptorSet0.vp_c3)._m0[2].x, _91);
    float _101 = fma(_83, (*spvDescriptorSet0.vp_c3)._m0[3].x, _93);
    float _103 = fma(_85, (*spvDescriptorSet0.vp_c3)._m0[1].z, _95);
    float _105 = fma(_85, (*spvDescriptorSet0.vp_c3)._m0[0].z, _97);
    float _107 = fma(_85, (*spvDescriptorSet0.vp_c3)._m0[2].z, _99);
    float _109 = fma(_85, (*spvDescriptorSet0.vp_c3)._m0[3].z, _101);
    float _111 = 255.0 * (*spvDescriptorSet0.vp_c3)._m0[13].x;
    float _113 = 255.0 * (*spvDescriptorSet0.vp_c3)._m0[13].z;
    float _115 = 255.0 * (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _117 = _105 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _119 = _103 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _121 = _107 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _123 = _109 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.m_25.x = _111;
    out.m_25.y = _57;
    out.m_25.z = _113;
    out.m_25.w = _115;
    out.gl_Position.x = _117;
    out.gl_Position.y = _119;
    out.gl_Position.z = _121;
    out.gl_Position.w = _123;
    bool _125 = !_55;
    float _127 = _83;
    float _145;
    float _147;
    if (!_125)
    {
        float _129 = _59 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _131 = _59 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _133 = fma(_61, (*spvDescriptorSet0.vp_c3)._m0[14].x, _129);
        float _135 = fma(_61, (*spvDescriptorSet0.vp_c3)._m0[15].x, _131);
        float _137 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[14].z, _133);
        float _139 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[15].z, _135);
        float _141 = _137 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _143 = _139 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _145 = _143;
        _147 = _141;
        _149 = true;
    }
    else
    {
        int _152 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _154 = _152 != 0;
        float _156 = _117;
        float _158 = _119;
        if (!_154)
        {
            float _160 = in.m_27.x;
            float _162 = in.m_27.y;
            _156 = _160;
            _158 = _162;
        }
        float _164 = _156;
        float _166 = _158;
        bool _168 = !_154;
        _145 = _166;
        _147 = _164;
        if (!_168)
        {
            int _170 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _172 = _170 != 0;
            float _174 = _164;
            float _176 = _166;
            if (!_172)
            {
                float _178 = in.m_27.x;
                float _180 = in.m_27.y;
                _174 = _178;
                _176 = _180;
            }
            float _182 = _174;
            float _184 = _176;
            bool _186 = !_172;
            float _188 = _182;
            int _190 = as_type<int>(_182);
            float _192 = _184;
            if (!_186)
            {
                int _194 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _196 = _194 != 0;
                float _198 = in.m_27.x;
                float _200 = in.m_27.y;
                int _202 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _204 = _202 != 0;
                int _206 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _208 = _206 != 0;
                int _210 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _212 = _210 != 0;
                int _214 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _216 = _214 != 0;
                if (_196)
                {
                    _188 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _218 = _188;
                float _220 = _218;
                if (_196)
                {
                    _127 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _222 = _127;
                float _224 = _222;
                if (!_196)
                {
                    _220 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _226 = _220;
                if (!_196)
                {
                    _224 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _228 = _224;
                float _230 = _226 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _232 = _228 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _234 = _198;
                float _236 = _200;
                if (_212)
                {
                    float _238 = _230 * _198;
                    _234 = _238;
                }
                float _240 = _234;
                float _242 = -_230;
                float _244 = _242 + 1.0;
                int _246 = as_type<int>(_240);
                if (_216)
                {
                    float _248 = _232 * _200;
                    _236 = _248;
                }
                float _250 = _236;
                float _252 = -_232;
                float _254 = _252 + 1.0;
                float _256 = _250;
                if (_204)
                {
                    float _258 = _240 + _244;
                    _246 = as_type<int>(_258);
                }
                int _260 = _246;
                if (_208)
                {
                    float _262 = _250 + _254;
                    _256 = _262;
                }
                float _264 = _256;
                _190 = _260;
                _192 = _264;
            }
            int _266 = _190;
            float _268 = _192;
            int _270 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _272 = _270 != 0;
            int _274 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _276 = _274 != 0;
            int _278 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _280 = _278 != 0;
            int _282 = _266;
            int _284 = as_type<int>(_268);
            if (_276)
            {
                float _286 = -as_type<float>(_266);
                float _288 = _286 + 1.0;
                _282 = as_type<int>(_288);
            }
            int _290 = _282;
            if (_280)
            {
                float _292 = -_268;
                float _294 = _292 + 1.0;
                _284 = as_type<int>(_294);
            }
            int _296 = _284;
            bool _298 = !_272;
            float _300 = _298 ? as_type<float>(_290) : as_type<float>(_296);
            bool _302 = !_272;
            float _304 = _302 ? as_type<float>(_296) : as_type<float>(_290);
            _145 = _304;
            _147 = _300;
        }
    }
    _149 = false;
    float _306 = _145;
    float _308 = _147;
    float _310 = _306 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _312 = _306 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    bool _314 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _316 = fma(_308, (*spvDescriptorSet0.vp_c3)._m0[8].x, _310);
    float _318 = fma(_308, (*spvDescriptorSet0.vp_c3)._m0[7].x, _312);
    float _320 = _316 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _322 = _318 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _324 = -_320;
    float _326 = _324 + 1.0;
    out.m_29.x = _322;
    out.m_29.y = _326;
    bool _328 = !_314;
    float _330 = _320;
    float _348;
    float _350;
    if (!_328)
    {
        float _332 = _59 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _334 = _59 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _336 = fma(_61, (*spvDescriptorSet0.vp_c3)._m0[18].x, _332);
        float _338 = fma(_61, (*spvDescriptorSet0.vp_c3)._m0[19].x, _334);
        float _340 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[18].z, _336);
        float _342 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[19].z, _338);
        float _344 = _340 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _346 = _342 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _348 = _346;
        _350 = _344;
        _352 = true;
    }
    else
    {
        int _354 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _356 = _354 != 0;
        float _358 = _322;
        float _360 = _326;
        if (!_356)
        {
            float _362 = in.m_27.x;
            float _364 = in.m_27.y;
            _358 = _362;
            _360 = _364;
        }
        float _366 = _358;
        float _368 = _360;
        bool _370 = !_356;
        _348 = _368;
        _350 = _366;
        if (!_370)
        {
            int _372 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _374 = _372 != 0;
            float _376 = _366;
            float _378 = _368;
            if (!_374)
            {
                float _380 = in.m_27.x;
                float _382 = in.m_27.y;
                _376 = _380;
                _378 = _382;
            }
            float _384 = _376;
            float _386 = _378;
            bool _388 = !_374;
            float _390 = _384;
            int _392 = as_type<int>(_384);
            float _394 = _386;
            if (!_388)
            {
                int _396 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _398 = _396 != 0;
                float _400 = in.m_27.x;
                float _402 = in.m_27.y;
                int _404 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _406 = _404 != 0;
                int _408 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _410 = _408 != 0;
                int _412 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _414 = _412 != 0;
                int _416 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _418 = _416 != 0;
                if (_398)
                {
                    _390 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _420 = _390;
                float _422 = _420;
                if (_398)
                {
                    _330 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _424 = _330;
                float _426 = _424;
                if (!_398)
                {
                    _422 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _428 = _422;
                if (!_398)
                {
                    _426 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _430 = _426;
                float _432 = _428 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _434 = _430 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _436 = _400;
                float _438 = _402;
                if (_414)
                {
                    float _440 = _432 * _400;
                    _436 = _440;
                }
                float _442 = _436;
                float _444 = -_432;
                float _446 = _444 + 1.0;
                int _448 = as_type<int>(_442);
                if (_418)
                {
                    float _450 = _434 * _402;
                    _438 = _450;
                }
                float _452 = _438;
                float _454 = -_434;
                float _456 = _454 + 1.0;
                float _458 = _452;
                if (_406)
                {
                    float _460 = _442 + _446;
                    _448 = as_type<int>(_460);
                }
                int _462 = _448;
                if (_410)
                {
                    float _464 = _452 + _456;
                    _458 = _464;
                }
                float _466 = _458;
                _392 = _462;
                _394 = _466;
            }
            int _468 = _392;
            float _470 = _394;
            int _472 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _474 = _472 != 0;
            int _476 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _478 = _476 != 0;
            int _480 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _482 = _480 != 0;
            int _484 = _468;
            int _486 = as_type<int>(_470);
            if (_478)
            {
                float _488 = -as_type<float>(_468);
                float _490 = _488 + 1.0;
                _484 = as_type<int>(_490);
            }
            int _492 = _484;
            if (_482)
            {
                float _494 = -_470;
                float _496 = _494 + 1.0;
                _486 = as_type<int>(_496);
            }
            int _498 = _486;
            bool _500 = !_474;
            float _502 = _500 ? as_type<float>(_492) : as_type<float>(_498);
            bool _504 = !_474;
            float _506 = _504 ? as_type<float>(_498) : as_type<float>(_492);
            _348 = _506;
            _350 = _502;
        }
    }
    _352 = false;
    float _508 = _348;
    float _510 = _350;
    float _512 = _508 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _514 = _508 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    bool _516 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].z);
    float _518 = fma(_510, (*spvDescriptorSet0.vp_c3)._m0[10].x, _512);
    float _520 = fma(_510, (*spvDescriptorSet0.vp_c3)._m0[9].x, _514);
    float _522 = _518 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _524 = _520 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _526 = -_522;
    float _528 = _526 + 1.0;
    out.m_31.x = _524;
    out.m_31.y = _528;
    bool _530 = !_516;
    float _548;
    float _550;
    if (!_530)
    {
        float _532 = _59 * (*spvDescriptorSet0.vp_c3)._m0[22].y;
        float _534 = _59 * (*spvDescriptorSet0.vp_c3)._m0[23].y;
        float _536 = fma(_61, (*spvDescriptorSet0.vp_c3)._m0[22].x, _532);
        float _538 = fma(_61, (*spvDescriptorSet0.vp_c3)._m0[23].x, _534);
        float _540 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[22].z, _536);
        float _542 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[23].z, _538);
        float _544 = _540 + (*spvDescriptorSet0.vp_c3)._m0[22].w;
        float _546 = _542 + (*spvDescriptorSet0.vp_c3)._m0[23].w;
        _548 = _546;
        _550 = _544;
        _552 = true;
    }
    else
    {
        int _554 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _556 = _554 != 0;
        float _558 = _61;
        float _560 = _59;
        if (!_556)
        {
            float _562 = in.m_27.x;
            float _564 = in.m_27.y;
            _558 = _562;
            _560 = _564;
        }
        float _566 = _558;
        float _568 = _560;
        bool _570 = !_556;
        _548 = _568;
        _550 = _566;
        if (!_570)
        {
            int _572 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _574 = _572 != 0;
            float _576 = _566;
            float _578 = _568;
            if (!_574)
            {
                float _580 = in.m_27.x;
                float _582 = in.m_27.y;
                _576 = _580;
                _578 = _582;
            }
            float _584 = _576;
            float _586 = _578;
            bool _588 = !_574;
            float _590 = _586;
            float _592 = _584;
            int _594 = as_type<int>(_584);
            float _596 = _586;
            if (!_588)
            {
                float _598 = in.m_27.x;
                float _600 = in.m_27.y;
                int _602 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _604 = _602 != 0;
                int _606 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _608 = _606 != 0;
                int _610 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _612 = _610 != 0;
                int _614 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _616 = _614 != 0;
                int _618 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _620 = _618 != 0;
                if (_604)
                {
                    _590 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _622 = _590;
                float _624 = _622;
                if (_604)
                {
                    _592 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _626 = _592;
                float _628 = _626;
                if (!_604)
                {
                    _624 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _630 = _624;
                if (!_604)
                {
                    _628 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _632 = _628;
                float _634 = _630 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _636 = _632 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _638 = _598;
                float _640 = _600;
                if (_616)
                {
                    float _642 = _634 * _598;
                    _638 = _642;
                }
                float _644 = _638;
                float _646 = -_634;
                float _648 = _646 + 1.0;
                int _650 = as_type<int>(_644);
                if (_620)
                {
                    float _652 = _636 * _600;
                    _640 = _652;
                }
                float _654 = _640;
                float _656 = -_636;
                float _658 = _656 + 1.0;
                float _660 = _654;
                if (_608)
                {
                    float _662 = _644 + _648;
                    _650 = as_type<int>(_662);
                }
                int _664 = _650;
                if (_612)
                {
                    float _666 = _654 + _658;
                    _660 = _666;
                }
                float _668 = _660;
                _594 = _664;
                _596 = _668;
            }
            int _670 = _594;
            float _672 = _596;
            int _674 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _676 = _674 != 0;
            int _678 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _680 = _678 != 0;
            int _682 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _684 = _682 != 0;
            int _686 = _670;
            int _688 = as_type<int>(_672);
            if (_680)
            {
                float _690 = -as_type<float>(_670);
                float _692 = _690 + 1.0;
                _686 = as_type<int>(_692);
            }
            int _694 = _686;
            if (_684)
            {
                float _696 = -_672;
                float _698 = _696 + 1.0;
                _688 = as_type<int>(_698);
            }
            int _700 = _688;
            bool _702 = !_676;
            float _704 = _702 ? as_type<float>(_694) : as_type<float>(_700);
            bool _706 = !_676;
            float _708 = _706 ? as_type<float>(_700) : as_type<float>(_694);
            _548 = _708;
            _550 = _704;
        }
    }
    _552 = false;
    float _710 = _548;
    float _712 = _550;
    float _714 = _710 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _716 = _710 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _718 = fma(_712, (*spvDescriptorSet0.vp_c3)._m0[12].x, _714);
    float _720 = fma(_712, (*spvDescriptorSet0.vp_c3)._m0[11].x, _716);
    float _722 = _718 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _724 = _720 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _726 = -_722;
    float _728 = _726 + 1.0;
    out.m_33.x = _724;
    out.m_33.y = _728;
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
    bool _552 = false;
    bool _352 = false;
    bool _149 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _47 = in.m_22.x;
    float _49 = in.m_22.y;
    float _51 = in.m_22.z;
    bool _55 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    float _57 = 255.0 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _59 = _49 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
    float _61 = _47 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
    float _63 = _59 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _65 = _59 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _67 = _59 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _69 = fma(_61, (*spvDescriptorSet0.vp_c3)._m0[5].x, _63);
    float _71 = fma(_61, (*spvDescriptorSet0.vp_c3)._m0[4].x, _65);
    float _73 = fma(_61, (*spvDescriptorSet0.vp_c3)._m0[6].x, _67);
    float _75 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[5].z, _69);
    float _77 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[4].z, _71);
    float _79 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].z, _73);
    float _81 = _75 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _83 = _77 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _85 = _79 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _87 = _81 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _89 = _81 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _91 = _81 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _93 = _81 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _95 = fma(_83, (*spvDescriptorSet0.vp_c3)._m0[1].x, _87);
    float _97 = fma(_83, (*spvDescriptorSet0.vp_c3)._m0[0].x, _89);
    float _99 = fma(_83, (*spvDescriptorSet0.vp_c3)._m0[2].x, _91);
    float _101 = fma(_83, (*spvDescriptorSet0.vp_c3)._m0[3].x, _93);
    float _103 = fma(_85, (*spvDescriptorSet0.vp_c3)._m0[1].z, _95);
    float _105 = fma(_85, (*spvDescriptorSet0.vp_c3)._m0[0].z, _97);
    float _107 = fma(_85, (*spvDescriptorSet0.vp_c3)._m0[2].z, _99);
    float _109 = fma(_85, (*spvDescriptorSet0.vp_c3)._m0[3].z, _101);
    float _111 = 255.0 * (*spvDescriptorSet0.vp_c3)._m0[13].x;
    float _113 = 255.0 * (*spvDescriptorSet0.vp_c3)._m0[13].z;
    float _115 = 255.0 * (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _117 = _105 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _119 = _103 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _121 = _107 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _123 = _109 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.m_25.x = _111;
    out.m_25.y = _57;
    out.m_25.z = _113;
    out.m_25.w = _115;
    out.gl_Position.x = _117;
    out.gl_Position.y = _119;
    out.gl_Position.z = _121;
    out.gl_Position.w = _123;
    bool _125 = !_55;
    float _127 = _83;
    float _145;
    float _147;
    if (!_125)
    {
        float _129 = _59 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _131 = _59 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _133 = fma(_61, (*spvDescriptorSet0.vp_c3)._m0[14].x, _129);
        float _135 = fma(_61, (*spvDescriptorSet0.vp_c3)._m0[15].x, _131);
        float _137 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[14].z, _133);
        float _139 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[15].z, _135);
        float _141 = _137 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _143 = _139 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _145 = _143;
        _147 = _141;
        _149 = true;
    }
    else
    {
        int _152 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _154 = _152 != 0;
        float _156 = _117;
        float _158 = _119;
        if (!_154)
        {
            float _160 = in.m_27.x;
            float _162 = in.m_27.y;
            _156 = _160;
            _158 = _162;
        }
        float _164 = _156;
        float _166 = _158;
        bool _168 = !_154;
        _145 = _166;
        _147 = _164;
        if (!_168)
        {
            int _170 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _172 = _170 != 0;
            float _174 = _164;
            float _176 = _166;
            if (!_172)
            {
                float _178 = in.m_27.x;
                float _180 = in.m_27.y;
                _174 = _178;
                _176 = _180;
            }
            float _182 = _174;
            float _184 = _176;
            bool _186 = !_172;
            float _188 = _182;
            int _190 = as_type<int>(_182);
            float _192 = _184;
            if (!_186)
            {
                int _194 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _196 = _194 != 0;
                float _198 = in.m_27.x;
                float _200 = in.m_27.y;
                int _202 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _204 = _202 != 0;
                int _206 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _208 = _206 != 0;
                int _210 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _212 = _210 != 0;
                int _214 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _216 = _214 != 0;
                if (_196)
                {
                    _188 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _218 = _188;
                float _220 = _218;
                if (_196)
                {
                    _127 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _222 = _127;
                float _224 = _222;
                if (!_196)
                {
                    _220 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _226 = _220;
                if (!_196)
                {
                    _224 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _228 = _224;
                float _230 = _226 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _232 = _228 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _234 = _198;
                float _236 = _200;
                if (_212)
                {
                    float _238 = _230 * _198;
                    _234 = _238;
                }
                float _240 = _234;
                float _242 = -_230;
                float _244 = _242 + 1.0;
                int _246 = as_type<int>(_240);
                if (_216)
                {
                    float _248 = _232 * _200;
                    _236 = _248;
                }
                float _250 = _236;
                float _252 = -_232;
                float _254 = _252 + 1.0;
                float _256 = _250;
                if (_204)
                {
                    float _258 = _240 + _244;
                    _246 = as_type<int>(_258);
                }
                int _260 = _246;
                if (_208)
                {
                    float _262 = _250 + _254;
                    _256 = _262;
                }
                float _264 = _256;
                _190 = _260;
                _192 = _264;
            }
            int _266 = _190;
            float _268 = _192;
            int _270 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _272 = _270 != 0;
            int _274 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _276 = _274 != 0;
            int _278 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _280 = _278 != 0;
            int _282 = _266;
            int _284 = as_type<int>(_268);
            if (_276)
            {
                float _286 = -as_type<float>(_266);
                float _288 = _286 + 1.0;
                _282 = as_type<int>(_288);
            }
            int _290 = _282;
            if (_280)
            {
                float _292 = -_268;
                float _294 = _292 + 1.0;
                _284 = as_type<int>(_294);
            }
            int _296 = _284;
            bool _298 = !_272;
            float _300 = _298 ? as_type<float>(_290) : as_type<float>(_296);
            bool _302 = !_272;
            float _304 = _302 ? as_type<float>(_296) : as_type<float>(_290);
            _145 = _304;
            _147 = _300;
        }
    }
    _149 = false;
    float _306 = _145;
    float _308 = _147;
    float _310 = _306 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _312 = _306 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    bool _314 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _316 = fma(_308, (*spvDescriptorSet0.vp_c3)._m0[8].x, _310);
    float _318 = fma(_308, (*spvDescriptorSet0.vp_c3)._m0[7].x, _312);
    float _320 = _316 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _322 = _318 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _324 = -_320;
    float _326 = _324 + 1.0;
    out.m_29.x = _322;
    out.m_29.y = _326;
    bool _328 = !_314;
    float _330 = _320;
    float _348;
    float _350;
    if (!_328)
    {
        float _332 = _59 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _334 = _59 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _336 = fma(_61, (*spvDescriptorSet0.vp_c3)._m0[18].x, _332);
        float _338 = fma(_61, (*spvDescriptorSet0.vp_c3)._m0[19].x, _334);
        float _340 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[18].z, _336);
        float _342 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[19].z, _338);
        float _344 = _340 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _346 = _342 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _348 = _346;
        _350 = _344;
        _352 = true;
    }
    else
    {
        int _354 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _356 = _354 != 0;
        float _358 = _322;
        float _360 = _326;
        if (!_356)
        {
            float _362 = in.m_27.x;
            float _364 = in.m_27.y;
            _358 = _362;
            _360 = _364;
        }
        float _366 = _358;
        float _368 = _360;
        bool _370 = !_356;
        _348 = _368;
        _350 = _366;
        if (!_370)
        {
            int _372 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _374 = _372 != 0;
            float _376 = _366;
            float _378 = _368;
            if (!_374)
            {
                float _380 = in.m_27.x;
                float _382 = in.m_27.y;
                _376 = _380;
                _378 = _382;
            }
            float _384 = _376;
            float _386 = _378;
            bool _388 = !_374;
            float _390 = _384;
            int _392 = as_type<int>(_384);
            float _394 = _386;
            if (!_388)
            {
                int _396 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _398 = _396 != 0;
                float _400 = in.m_27.x;
                float _402 = in.m_27.y;
                int _404 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _406 = _404 != 0;
                int _408 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _410 = _408 != 0;
                int _412 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _414 = _412 != 0;
                int _416 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _418 = _416 != 0;
                if (_398)
                {
                    _390 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _420 = _390;
                float _422 = _420;
                if (_398)
                {
                    _330 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _424 = _330;
                float _426 = _424;
                if (!_398)
                {
                    _422 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _428 = _422;
                if (!_398)
                {
                    _426 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _430 = _426;
                float _432 = _428 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _434 = _430 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _436 = _400;
                float _438 = _402;
                if (_414)
                {
                    float _440 = _432 * _400;
                    _436 = _440;
                }
                float _442 = _436;
                float _444 = -_432;
                float _446 = _444 + 1.0;
                int _448 = as_type<int>(_442);
                if (_418)
                {
                    float _450 = _434 * _402;
                    _438 = _450;
                }
                float _452 = _438;
                float _454 = -_434;
                float _456 = _454 + 1.0;
                float _458 = _452;
                if (_406)
                {
                    float _460 = _442 + _446;
                    _448 = as_type<int>(_460);
                }
                int _462 = _448;
                if (_410)
                {
                    float _464 = _452 + _456;
                    _458 = _464;
                }
                float _466 = _458;
                _392 = _462;
                _394 = _466;
            }
            int _468 = _392;
            float _470 = _394;
            int _472 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _474 = _472 != 0;
            int _476 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _478 = _476 != 0;
            int _480 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _482 = _480 != 0;
            int _484 = _468;
            int _486 = as_type<int>(_470);
            if (_478)
            {
                float _488 = -as_type<float>(_468);
                float _490 = _488 + 1.0;
                _484 = as_type<int>(_490);
            }
            int _492 = _484;
            if (_482)
            {
                float _494 = -_470;
                float _496 = _494 + 1.0;
                _486 = as_type<int>(_496);
            }
            int _498 = _486;
            bool _500 = !_474;
            float _502 = _500 ? as_type<float>(_492) : as_type<float>(_498);
            bool _504 = !_474;
            float _506 = _504 ? as_type<float>(_498) : as_type<float>(_492);
            _348 = _506;
            _350 = _502;
        }
    }
    _352 = false;
    float _508 = _348;
    float _510 = _350;
    float _512 = _508 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _514 = _508 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    bool _516 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].z);
    float _518 = fma(_510, (*spvDescriptorSet0.vp_c3)._m0[10].x, _512);
    float _520 = fma(_510, (*spvDescriptorSet0.vp_c3)._m0[9].x, _514);
    float _522 = _518 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _524 = _520 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _526 = -_522;
    float _528 = _526 + 1.0;
    out.m_31.x = _524;
    out.m_31.y = _528;
    bool _530 = !_516;
    float _548;
    float _550;
    if (!_530)
    {
        float _532 = _59 * (*spvDescriptorSet0.vp_c3)._m0[22].y;
        float _534 = _59 * (*spvDescriptorSet0.vp_c3)._m0[23].y;
        float _536 = fma(_61, (*spvDescriptorSet0.vp_c3)._m0[22].x, _532);
        float _538 = fma(_61, (*spvDescriptorSet0.vp_c3)._m0[23].x, _534);
        float _540 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[22].z, _536);
        float _542 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[23].z, _538);
        float _544 = _540 + (*spvDescriptorSet0.vp_c3)._m0[22].w;
        float _546 = _542 + (*spvDescriptorSet0.vp_c3)._m0[23].w;
        _548 = _546;
        _550 = _544;
        _552 = true;
    }
    else
    {
        int _554 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _556 = _554 != 0;
        float _558 = _61;
        float _560 = _59;
        if (!_556)
        {
            float _562 = in.m_27.x;
            float _564 = in.m_27.y;
            _558 = _562;
            _560 = _564;
        }
        float _566 = _558;
        float _568 = _560;
        bool _570 = !_556;
        _548 = _568;
        _550 = _566;
        if (!_570)
        {
            int _572 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _574 = _572 != 0;
            float _576 = _566;
            float _578 = _568;
            if (!_574)
            {
                float _580 = in.m_27.x;
                float _582 = in.m_27.y;
                _576 = _580;
                _578 = _582;
            }
            float _584 = _576;
            float _586 = _578;
            bool _588 = !_574;
            float _590 = _586;
            float _592 = _584;
            int _594 = as_type<int>(_584);
            float _596 = _586;
            if (!_588)
            {
                float _598 = in.m_27.x;
                float _600 = in.m_27.y;
                int _602 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _604 = _602 != 0;
                int _606 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _608 = _606 != 0;
                int _610 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _612 = _610 != 0;
                int _614 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _616 = _614 != 0;
                int _618 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _620 = _618 != 0;
                if (_604)
                {
                    _590 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _622 = _590;
                float _624 = _622;
                if (_604)
                {
                    _592 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _626 = _592;
                float _628 = _626;
                if (!_604)
                {
                    _624 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _630 = _624;
                if (!_604)
                {
                    _628 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _632 = _628;
                float _634 = _630 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _636 = _632 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _638 = _598;
                float _640 = _600;
                if (_616)
                {
                    float _642 = _634 * _598;
                    _638 = _642;
                }
                float _644 = _638;
                float _646 = -_634;
                float _648 = _646 + 1.0;
                int _650 = as_type<int>(_644);
                if (_620)
                {
                    float _652 = _636 * _600;
                    _640 = _652;
                }
                float _654 = _640;
                float _656 = -_636;
                float _658 = _656 + 1.0;
                float _660 = _654;
                if (_608)
                {
                    float _662 = _644 + _648;
                    _650 = as_type<int>(_662);
                }
                int _664 = _650;
                if (_612)
                {
                    float _666 = _654 + _658;
                    _660 = _666;
                }
                float _668 = _660;
                _594 = _664;
                _596 = _668;
            }
            int _670 = _594;
            float _672 = _596;
            int _674 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _676 = _674 != 0;
            int _678 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _680 = _678 != 0;
            int _682 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _684 = _682 != 0;
            int _686 = _670;
            int _688 = as_type<int>(_672);
            if (_680)
            {
                float _690 = -as_type<float>(_670);
                float _692 = _690 + 1.0;
                _686 = as_type<int>(_692);
            }
            int _694 = _686;
            if (_684)
            {
                float _696 = -_672;
                float _698 = _696 + 1.0;
                _688 = as_type<int>(_698);
            }
            int _700 = _688;
            bool _702 = !_676;
            float _704 = _702 ? as_type<float>(_694) : as_type<float>(_700);
            bool _706 = !_676;
            float _708 = _706 ? as_type<float>(_700) : as_type<float>(_694);
            _548 = _708;
            _550 = _704;
        }
    }
    _552 = false;
    float _710 = _548;
    float _712 = _550;
    float _714 = _710 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _716 = _710 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _718 = fma(_712, (*spvDescriptorSet0.vp_c3)._m0[12].x, _714);
    float _720 = fma(_712, (*spvDescriptorSet0.vp_c3)._m0[11].x, _716);
    float _722 = _718 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _724 = _720 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _726 = -_722;
    float _728 = _726 + 1.0;
    out.m_33.x = _724;
    out.m_33.y = _728;
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
    bool _552 = false;
    bool _352 = false;
    bool _149 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _47 = in.m_22.x;
    float _49 = in.m_22.y;
    float _51 = in.m_22.z;
    bool _55 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    float _57 = 255.0 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _59 = _49 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
    float _61 = _47 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
    float _63 = _59 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _65 = _59 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _67 = _59 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _69 = fma(_61, (*spvDescriptorSet0.vp_c3)._m0[5].x, _63);
    float _71 = fma(_61, (*spvDescriptorSet0.vp_c3)._m0[4].x, _65);
    float _73 = fma(_61, (*spvDescriptorSet0.vp_c3)._m0[6].x, _67);
    float _75 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[5].z, _69);
    float _77 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[4].z, _71);
    float _79 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].z, _73);
    float _81 = _75 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _83 = _77 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _85 = _79 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _87 = _81 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _89 = _81 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _91 = _81 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _93 = _81 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _95 = fma(_83, (*spvDescriptorSet0.vp_c3)._m0[1].x, _87);
    float _97 = fma(_83, (*spvDescriptorSet0.vp_c3)._m0[0].x, _89);
    float _99 = fma(_83, (*spvDescriptorSet0.vp_c3)._m0[2].x, _91);
    float _101 = fma(_83, (*spvDescriptorSet0.vp_c3)._m0[3].x, _93);
    float _103 = fma(_85, (*spvDescriptorSet0.vp_c3)._m0[1].z, _95);
    float _105 = fma(_85, (*spvDescriptorSet0.vp_c3)._m0[0].z, _97);
    float _107 = fma(_85, (*spvDescriptorSet0.vp_c3)._m0[2].z, _99);
    float _109 = fma(_85, (*spvDescriptorSet0.vp_c3)._m0[3].z, _101);
    float _111 = 255.0 * (*spvDescriptorSet0.vp_c3)._m0[13].x;
    float _113 = 255.0 * (*spvDescriptorSet0.vp_c3)._m0[13].z;
    float _115 = 255.0 * (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _117 = _105 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _119 = _103 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _121 = _107 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _123 = _109 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.m_25.x = _111;
    out.m_25.y = _57;
    out.m_25.z = _113;
    out.m_25.w = _115;
    out.gl_Position.x = _117;
    out.gl_Position.y = _119;
    out.gl_Position.z = _121;
    out.gl_Position.w = _123;
    bool _125 = !_55;
    float _127 = _83;
    float _145;
    float _147;
    if (!_125)
    {
        float _129 = _59 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _131 = _59 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _133 = fma(_61, (*spvDescriptorSet0.vp_c3)._m0[14].x, _129);
        float _135 = fma(_61, (*spvDescriptorSet0.vp_c3)._m0[15].x, _131);
        float _137 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[14].z, _133);
        float _139 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[15].z, _135);
        float _141 = _137 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _143 = _139 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _145 = _143;
        _147 = _141;
        _149 = true;
    }
    else
    {
        int _152 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _154 = _152 != 0;
        float _156 = _117;
        float _158 = _119;
        if (!_154)
        {
            float _160 = in.m_27.x;
            float _162 = in.m_27.y;
            _156 = _160;
            _158 = _162;
        }
        float _164 = _156;
        float _166 = _158;
        bool _168 = !_154;
        _145 = _166;
        _147 = _164;
        if (!_168)
        {
            int _170 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _172 = _170 != 0;
            float _174 = _164;
            float _176 = _166;
            if (!_172)
            {
                float _178 = in.m_27.x;
                float _180 = in.m_27.y;
                _174 = _178;
                _176 = _180;
            }
            float _182 = _174;
            float _184 = _176;
            bool _186 = !_172;
            float _188 = _182;
            int _190 = as_type<int>(_182);
            float _192 = _184;
            if (!_186)
            {
                int _194 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _196 = _194 != 0;
                float _198 = in.m_27.x;
                float _200 = in.m_27.y;
                int _202 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _204 = _202 != 0;
                int _206 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _208 = _206 != 0;
                int _210 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _212 = _210 != 0;
                int _214 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _216 = _214 != 0;
                if (_196)
                {
                    _188 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _218 = _188;
                float _220 = _218;
                if (_196)
                {
                    _127 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _222 = _127;
                float _224 = _222;
                if (!_196)
                {
                    _220 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _226 = _220;
                if (!_196)
                {
                    _224 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _228 = _224;
                float _230 = _226 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _232 = _228 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _234 = _198;
                float _236 = _200;
                if (_212)
                {
                    float _238 = _230 * _198;
                    _234 = _238;
                }
                float _240 = _234;
                float _242 = -_230;
                float _244 = _242 + 1.0;
                int _246 = as_type<int>(_240);
                if (_216)
                {
                    float _248 = _232 * _200;
                    _236 = _248;
                }
                float _250 = _236;
                float _252 = -_232;
                float _254 = _252 + 1.0;
                float _256 = _250;
                if (_204)
                {
                    float _258 = _240 + _244;
                    _246 = as_type<int>(_258);
                }
                int _260 = _246;
                if (_208)
                {
                    float _262 = _250 + _254;
                    _256 = _262;
                }
                float _264 = _256;
                _190 = _260;
                _192 = _264;
            }
            int _266 = _190;
            float _268 = _192;
            int _270 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _272 = _270 != 0;
            int _274 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _276 = _274 != 0;
            int _278 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _280 = _278 != 0;
            int _282 = _266;
            int _284 = as_type<int>(_268);
            if (_276)
            {
                float _286 = -as_type<float>(_266);
                float _288 = _286 + 1.0;
                _282 = as_type<int>(_288);
            }
            int _290 = _282;
            if (_280)
            {
                float _292 = -_268;
                float _294 = _292 + 1.0;
                _284 = as_type<int>(_294);
            }
            int _296 = _284;
            bool _298 = !_272;
            float _300 = _298 ? as_type<float>(_290) : as_type<float>(_296);
            bool _302 = !_272;
            float _304 = _302 ? as_type<float>(_296) : as_type<float>(_290);
            _145 = _304;
            _147 = _300;
        }
    }
    _149 = false;
    float _306 = _145;
    float _308 = _147;
    float _310 = _306 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _312 = _306 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    bool _314 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _316 = fma(_308, (*spvDescriptorSet0.vp_c3)._m0[8].x, _310);
    float _318 = fma(_308, (*spvDescriptorSet0.vp_c3)._m0[7].x, _312);
    float _320 = _316 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _322 = _318 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _324 = -_320;
    float _326 = _324 + 1.0;
    out.m_29.x = _322;
    out.m_29.y = _326;
    bool _328 = !_314;
    float _330 = _320;
    float _348;
    float _350;
    if (!_328)
    {
        float _332 = _59 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _334 = _59 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _336 = fma(_61, (*spvDescriptorSet0.vp_c3)._m0[18].x, _332);
        float _338 = fma(_61, (*spvDescriptorSet0.vp_c3)._m0[19].x, _334);
        float _340 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[18].z, _336);
        float _342 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[19].z, _338);
        float _344 = _340 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _346 = _342 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _348 = _346;
        _350 = _344;
        _352 = true;
    }
    else
    {
        int _354 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _356 = _354 != 0;
        float _358 = _322;
        float _360 = _326;
        if (!_356)
        {
            float _362 = in.m_27.x;
            float _364 = in.m_27.y;
            _358 = _362;
            _360 = _364;
        }
        float _366 = _358;
        float _368 = _360;
        bool _370 = !_356;
        _348 = _368;
        _350 = _366;
        if (!_370)
        {
            int _372 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _374 = _372 != 0;
            float _376 = _366;
            float _378 = _368;
            if (!_374)
            {
                float _380 = in.m_27.x;
                float _382 = in.m_27.y;
                _376 = _380;
                _378 = _382;
            }
            float _384 = _376;
            float _386 = _378;
            bool _388 = !_374;
            float _390 = _384;
            int _392 = as_type<int>(_384);
            float _394 = _386;
            if (!_388)
            {
                int _396 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _398 = _396 != 0;
                float _400 = in.m_27.x;
                float _402 = in.m_27.y;
                int _404 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _406 = _404 != 0;
                int _408 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _410 = _408 != 0;
                int _412 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _414 = _412 != 0;
                int _416 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _418 = _416 != 0;
                if (_398)
                {
                    _390 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _420 = _390;
                float _422 = _420;
                if (_398)
                {
                    _330 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _424 = _330;
                float _426 = _424;
                if (!_398)
                {
                    _422 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _428 = _422;
                if (!_398)
                {
                    _426 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _430 = _426;
                float _432 = _428 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _434 = _430 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _436 = _400;
                float _438 = _402;
                if (_414)
                {
                    float _440 = _432 * _400;
                    _436 = _440;
                }
                float _442 = _436;
                float _444 = -_432;
                float _446 = _444 + 1.0;
                int _448 = as_type<int>(_442);
                if (_418)
                {
                    float _450 = _434 * _402;
                    _438 = _450;
                }
                float _452 = _438;
                float _454 = -_434;
                float _456 = _454 + 1.0;
                float _458 = _452;
                if (_406)
                {
                    float _460 = _442 + _446;
                    _448 = as_type<int>(_460);
                }
                int _462 = _448;
                if (_410)
                {
                    float _464 = _452 + _456;
                    _458 = _464;
                }
                float _466 = _458;
                _392 = _462;
                _394 = _466;
            }
            int _468 = _392;
            float _470 = _394;
            int _472 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _474 = _472 != 0;
            int _476 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _478 = _476 != 0;
            int _480 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _482 = _480 != 0;
            int _484 = _468;
            int _486 = as_type<int>(_470);
            if (_478)
            {
                float _488 = -as_type<float>(_468);
                float _490 = _488 + 1.0;
                _484 = as_type<int>(_490);
            }
            int _492 = _484;
            if (_482)
            {
                float _494 = -_470;
                float _496 = _494 + 1.0;
                _486 = as_type<int>(_496);
            }
            int _498 = _486;
            bool _500 = !_474;
            float _502 = _500 ? as_type<float>(_492) : as_type<float>(_498);
            bool _504 = !_474;
            float _506 = _504 ? as_type<float>(_498) : as_type<float>(_492);
            _348 = _506;
            _350 = _502;
        }
    }
    _352 = false;
    float _508 = _348;
    float _510 = _350;
    float _512 = _508 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _514 = _508 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    bool _516 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].z);
    float _518 = fma(_510, (*spvDescriptorSet0.vp_c3)._m0[10].x, _512);
    float _520 = fma(_510, (*spvDescriptorSet0.vp_c3)._m0[9].x, _514);
    float _522 = _518 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _524 = _520 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _526 = -_522;
    float _528 = _526 + 1.0;
    out.m_31.x = _524;
    out.m_31.y = _528;
    bool _530 = !_516;
    float _548;
    float _550;
    if (!_530)
    {
        float _532 = _59 * (*spvDescriptorSet0.vp_c3)._m0[22].y;
        float _534 = _59 * (*spvDescriptorSet0.vp_c3)._m0[23].y;
        float _536 = fma(_61, (*spvDescriptorSet0.vp_c3)._m0[22].x, _532);
        float _538 = fma(_61, (*spvDescriptorSet0.vp_c3)._m0[23].x, _534);
        float _540 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[22].z, _536);
        float _542 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[23].z, _538);
        float _544 = _540 + (*spvDescriptorSet0.vp_c3)._m0[22].w;
        float _546 = _542 + (*spvDescriptorSet0.vp_c3)._m0[23].w;
        _548 = _546;
        _550 = _544;
        _552 = true;
    }
    else
    {
        int _554 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _556 = _554 != 0;
        float _558 = _61;
        float _560 = _59;
        if (!_556)
        {
            float _562 = in.m_27.x;
            float _564 = in.m_27.y;
            _558 = _562;
            _560 = _564;
        }
        float _566 = _558;
        float _568 = _560;
        bool _570 = !_556;
        _548 = _568;
        _550 = _566;
        if (!_570)
        {
            int _572 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _574 = _572 != 0;
            float _576 = _566;
            float _578 = _568;
            if (!_574)
            {
                float _580 = in.m_27.x;
                float _582 = in.m_27.y;
                _576 = _580;
                _578 = _582;
            }
            float _584 = _576;
            float _586 = _578;
            bool _588 = !_574;
            float _590 = _586;
            float _592 = _584;
            int _594 = as_type<int>(_584);
            float _596 = _586;
            if (!_588)
            {
                float _598 = in.m_27.x;
                float _600 = in.m_27.y;
                int _602 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _604 = _602 != 0;
                int _606 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _608 = _606 != 0;
                int _610 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _612 = _610 != 0;
                int _614 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _616 = _614 != 0;
                int _618 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _620 = _618 != 0;
                if (_604)
                {
                    _590 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _622 = _590;
                float _624 = _622;
                if (_604)
                {
                    _592 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _626 = _592;
                float _628 = _626;
                if (!_604)
                {
                    _624 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _630 = _624;
                if (!_604)
                {
                    _628 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _632 = _628;
                float _634 = _630 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _636 = _632 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _638 = _598;
                float _640 = _600;
                if (_616)
                {
                    float _642 = _634 * _598;
                    _638 = _642;
                }
                float _644 = _638;
                float _646 = -_634;
                float _648 = _646 + 1.0;
                int _650 = as_type<int>(_644);
                if (_620)
                {
                    float _652 = _636 * _600;
                    _640 = _652;
                }
                float _654 = _640;
                float _656 = -_636;
                float _658 = _656 + 1.0;
                float _660 = _654;
                if (_608)
                {
                    float _662 = _644 + _648;
                    _650 = as_type<int>(_662);
                }
                int _664 = _650;
                if (_612)
                {
                    float _666 = _654 + _658;
                    _660 = _666;
                }
                float _668 = _660;
                _594 = _664;
                _596 = _668;
            }
            int _670 = _594;
            float _672 = _596;
            int _674 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _676 = _674 != 0;
            int _678 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _680 = _678 != 0;
            int _682 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _684 = _682 != 0;
            int _686 = _670;
            int _688 = as_type<int>(_672);
            if (_680)
            {
                float _690 = -as_type<float>(_670);
                float _692 = _690 + 1.0;
                _686 = as_type<int>(_692);
            }
            int _694 = _686;
            if (_684)
            {
                float _696 = -_672;
                float _698 = _696 + 1.0;
                _688 = as_type<int>(_698);
            }
            int _700 = _688;
            bool _702 = !_676;
            float _704 = _702 ? as_type<float>(_694) : as_type<float>(_700);
            bool _706 = !_676;
            float _708 = _706 ? as_type<float>(_700) : as_type<float>(_694);
            _548 = _708;
            _550 = _704;
        }
    }
    _552 = false;
    float _710 = _548;
    float _712 = _550;
    float _714 = _710 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _716 = _710 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _718 = fma(_712, (*spvDescriptorSet0.vp_c3)._m0[12].x, _714);
    float _720 = fma(_712, (*spvDescriptorSet0.vp_c3)._m0[11].x, _716);
    float _722 = _718 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _724 = _720 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _726 = -_722;
    float _728 = _726 + 1.0;
    out.m_33.x = _724;
    out.m_33.y = _728;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_25.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_25.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_25.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_25.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

