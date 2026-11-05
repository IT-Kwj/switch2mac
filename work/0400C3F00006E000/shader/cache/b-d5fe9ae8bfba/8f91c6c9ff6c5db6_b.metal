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
    float4 m_27 [[user(locn1)]];
    float4 m_29 [[user(locn2)]];
    float4 m_31 [[user(locn3)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_22 [[attribute(0)]];
    float4 m_24 [[attribute(1)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    bool _542 = false;
    bool _342 = false;
    bool _139 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _45 = in.m_22.x;
    float _47 = in.m_22.y;
    float _49 = in.m_22.z;
    bool _53 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    float _55 = _47 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
    float _57 = _45 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
    float _59 = _55 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _61 = _55 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _63 = _55 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _65 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[5].x, _59);
    float _67 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[4].x, _61);
    float _69 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[6].x, _63);
    float _71 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[5].z, _65);
    float _73 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[4].z, _67);
    float _75 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[6].z, _69);
    float _77 = _71 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _79 = _73 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _81 = _75 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _83 = _77 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _85 = _77 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _87 = _77 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _89 = _77 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _91 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[1].x, _83);
    float _93 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[0].x, _85);
    float _95 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[2].x, _87);
    float _97 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[3].x, _89);
    float _99 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[1].z, _91);
    float _101 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[0].z, _93);
    float _103 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[2].z, _95);
    float _105 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[3].z, _97);
    float _107 = _99 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _109 = _101 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _111 = _103 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _113 = _105 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _109;
    out.gl_Position.y = _107;
    out.gl_Position.z = _111;
    out.gl_Position.w = _113;
    bool _115 = !_53;
    float _117 = _79;
    float _135;
    float _137;
    if (!_115)
    {
        float _119 = _55 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _121 = _55 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _123 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[14].x, _119);
        float _125 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[15].x, _121);
        float _127 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[14].z, _123);
        float _129 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[15].z, _125);
        float _131 = _127 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _133 = _129 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _135 = _133;
        _137 = _131;
        _139 = true;
    }
    else
    {
        int _142 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _144 = _142 != 0;
        float _146 = _109;
        float _148 = _107;
        if (!_144)
        {
            float _150 = in.m_24.x;
            float _152 = in.m_24.y;
            _146 = _150;
            _148 = _152;
        }
        float _154 = _146;
        float _156 = _148;
        bool _158 = !_144;
        _135 = _156;
        _137 = _154;
        if (!_158)
        {
            int _160 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _162 = _160 != 0;
            float _164 = _154;
            float _166 = _156;
            if (!_162)
            {
                float _168 = in.m_24.x;
                float _170 = in.m_24.y;
                _164 = _168;
                _166 = _170;
            }
            float _172 = _164;
            float _174 = _166;
            bool _176 = !_162;
            float _178 = _172;
            int _180 = as_type<int>(_172);
            float _182 = _174;
            if (!_176)
            {
                int _184 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _186 = _184 != 0;
                float _188 = in.m_24.x;
                float _190 = in.m_24.y;
                int _192 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _194 = _192 != 0;
                int _196 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _198 = _196 != 0;
                int _200 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _202 = _200 != 0;
                int _204 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _206 = _204 != 0;
                if (_186)
                {
                    _178 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _208 = _178;
                float _210 = _208;
                if (_186)
                {
                    _117 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _212 = _117;
                float _214 = _212;
                if (!_186)
                {
                    _210 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _216 = _210;
                if (!_186)
                {
                    _214 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _218 = _214;
                float _220 = _216 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _222 = _218 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _224 = _188;
                float _226 = _190;
                if (_202)
                {
                    float _228 = _220 * _188;
                    _224 = _228;
                }
                float _230 = _224;
                float _232 = -_220;
                float _234 = _232 + 1.0;
                int _236 = as_type<int>(_230);
                if (_206)
                {
                    float _238 = _222 * _190;
                    _226 = _238;
                }
                float _240 = _226;
                float _242 = -_222;
                float _244 = _242 + 1.0;
                float _246 = _240;
                if (_194)
                {
                    float _248 = _230 + _234;
                    _236 = as_type<int>(_248);
                }
                int _250 = _236;
                if (_198)
                {
                    float _252 = _240 + _244;
                    _246 = _252;
                }
                float _254 = _246;
                _180 = _250;
                _182 = _254;
            }
            int _256 = _180;
            float _258 = _182;
            int _260 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _262 = _260 != 0;
            int _264 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _266 = _264 != 0;
            int _268 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _270 = _268 != 0;
            int _272 = _256;
            int _274 = as_type<int>(_258);
            if (_266)
            {
                float _276 = -as_type<float>(_256);
                float _278 = _276 + 1.0;
                _272 = as_type<int>(_278);
            }
            int _280 = _272;
            if (_270)
            {
                float _282 = -_258;
                float _284 = _282 + 1.0;
                _274 = as_type<int>(_284);
            }
            int _286 = _274;
            bool _288 = !_262;
            float _290 = _288 ? as_type<float>(_280) : as_type<float>(_286);
            bool _292 = !_262;
            float _294 = _292 ? as_type<float>(_286) : as_type<float>(_280);
            _135 = _294;
            _137 = _290;
        }
    }
    _139 = false;
    float _296 = _135;
    float _298 = _137;
    float _300 = _296 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _302 = _296 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    bool _304 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _306 = fma(_298, (*spvDescriptorSet0.vp_c3)._m0[8].x, _300);
    float _308 = fma(_298, (*spvDescriptorSet0.vp_c3)._m0[7].x, _302);
    float _310 = _306 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _312 = _308 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _314 = -_310;
    float _316 = _314 + 1.0;
    out.m_27.x = _312;
    out.m_27.y = _316;
    bool _318 = !_304;
    float _320 = _310;
    float _338;
    float _340;
    if (!_318)
    {
        float _322 = _55 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _324 = _55 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _326 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[18].x, _322);
        float _328 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[19].x, _324);
        float _330 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[18].z, _326);
        float _332 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[19].z, _328);
        float _334 = _330 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _336 = _332 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _338 = _336;
        _340 = _334;
        _342 = true;
    }
    else
    {
        int _344 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _346 = _344 != 0;
        float _348 = _312;
        float _350 = _316;
        if (!_346)
        {
            float _352 = in.m_24.x;
            float _354 = in.m_24.y;
            _348 = _352;
            _350 = _354;
        }
        float _356 = _348;
        float _358 = _350;
        bool _360 = !_346;
        _338 = _358;
        _340 = _356;
        if (!_360)
        {
            int _362 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _364 = _362 != 0;
            float _366 = _356;
            float _368 = _358;
            if (!_364)
            {
                float _370 = in.m_24.x;
                float _372 = in.m_24.y;
                _366 = _370;
                _368 = _372;
            }
            float _374 = _366;
            float _376 = _368;
            bool _378 = !_364;
            float _380 = _374;
            int _382 = as_type<int>(_374);
            float _384 = _376;
            if (!_378)
            {
                int _386 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _388 = _386 != 0;
                float _390 = in.m_24.x;
                float _392 = in.m_24.y;
                int _394 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _396 = _394 != 0;
                int _398 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _400 = _398 != 0;
                int _402 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _404 = _402 != 0;
                int _406 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _408 = _406 != 0;
                if (_388)
                {
                    _380 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _410 = _380;
                float _412 = _410;
                if (_388)
                {
                    _320 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _414 = _320;
                float _416 = _414;
                if (!_388)
                {
                    _412 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _418 = _412;
                if (!_388)
                {
                    _416 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _420 = _416;
                float _422 = _418 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _424 = _420 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _426 = _390;
                float _428 = _392;
                if (_404)
                {
                    float _430 = _422 * _390;
                    _426 = _430;
                }
                float _432 = _426;
                float _434 = -_422;
                float _436 = _434 + 1.0;
                int _438 = as_type<int>(_432);
                if (_408)
                {
                    float _440 = _424 * _392;
                    _428 = _440;
                }
                float _442 = _428;
                float _444 = -_424;
                float _446 = _444 + 1.0;
                float _448 = _442;
                if (_396)
                {
                    float _450 = _432 + _436;
                    _438 = as_type<int>(_450);
                }
                int _452 = _438;
                if (_400)
                {
                    float _454 = _442 + _446;
                    _448 = _454;
                }
                float _456 = _448;
                _382 = _452;
                _384 = _456;
            }
            int _458 = _382;
            float _460 = _384;
            int _462 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _464 = _462 != 0;
            int _466 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _468 = _466 != 0;
            int _470 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _472 = _470 != 0;
            int _474 = _458;
            int _476 = as_type<int>(_460);
            if (_468)
            {
                float _478 = -as_type<float>(_458);
                float _480 = _478 + 1.0;
                _474 = as_type<int>(_480);
            }
            int _482 = _474;
            if (_472)
            {
                float _484 = -_460;
                float _486 = _484 + 1.0;
                _476 = as_type<int>(_486);
            }
            int _488 = _476;
            bool _490 = !_464;
            float _492 = _490 ? as_type<float>(_482) : as_type<float>(_488);
            bool _494 = !_464;
            float _496 = _494 ? as_type<float>(_488) : as_type<float>(_482);
            _338 = _496;
            _340 = _492;
        }
    }
    _342 = false;
    float _498 = _338;
    float _500 = _340;
    float _502 = _498 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _504 = _498 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    bool _506 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].z);
    float _508 = fma(_500, (*spvDescriptorSet0.vp_c3)._m0[10].x, _502);
    float _510 = fma(_500, (*spvDescriptorSet0.vp_c3)._m0[9].x, _504);
    float _512 = _508 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _514 = _510 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _516 = -_512;
    float _518 = _516 + 1.0;
    out.m_29.x = _514;
    out.m_29.y = _518;
    bool _520 = !_506;
    float _538;
    float _540;
    if (!_520)
    {
        float _522 = _55 * (*spvDescriptorSet0.vp_c3)._m0[22].y;
        float _524 = _55 * (*spvDescriptorSet0.vp_c3)._m0[23].y;
        float _526 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[22].x, _522);
        float _528 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[23].x, _524);
        float _530 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[22].z, _526);
        float _532 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[23].z, _528);
        float _534 = _530 + (*spvDescriptorSet0.vp_c3)._m0[22].w;
        float _536 = _532 + (*spvDescriptorSet0.vp_c3)._m0[23].w;
        _538 = _536;
        _540 = _534;
        _542 = true;
    }
    else
    {
        int _544 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _546 = _544 != 0;
        float _548 = _57;
        float _550 = _55;
        if (!_546)
        {
            float _552 = in.m_24.x;
            float _554 = in.m_24.y;
            _548 = _552;
            _550 = _554;
        }
        float _556 = _548;
        float _558 = _550;
        bool _560 = !_546;
        _538 = _558;
        _540 = _556;
        if (!_560)
        {
            int _562 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _564 = _562 != 0;
            float _566 = _556;
            float _568 = _558;
            if (!_564)
            {
                float _570 = in.m_24.x;
                float _572 = in.m_24.y;
                _566 = _570;
                _568 = _572;
            }
            float _574 = _566;
            float _576 = _568;
            bool _578 = !_564;
            float _580 = _576;
            float _582 = _574;
            int _584 = as_type<int>(_574);
            float _586 = _576;
            if (!_578)
            {
                float _588 = in.m_24.x;
                float _590 = in.m_24.y;
                int _592 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _594 = _592 != 0;
                int _596 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _598 = _596 != 0;
                int _600 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _602 = _600 != 0;
                int _604 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _606 = _604 != 0;
                int _608 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _610 = _608 != 0;
                if (_594)
                {
                    _580 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _612 = _580;
                float _614 = _612;
                if (_594)
                {
                    _582 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _616 = _582;
                float _618 = _616;
                if (!_594)
                {
                    _614 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _620 = _614;
                if (!_594)
                {
                    _618 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _622 = _618;
                float _624 = _620 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _626 = _622 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _628 = _588;
                float _630 = _590;
                if (_606)
                {
                    float _632 = _624 * _588;
                    _628 = _632;
                }
                float _634 = _628;
                float _636 = -_624;
                float _638 = _636 + 1.0;
                int _640 = as_type<int>(_634);
                if (_610)
                {
                    float _642 = _626 * _590;
                    _630 = _642;
                }
                float _644 = _630;
                float _646 = -_626;
                float _648 = _646 + 1.0;
                float _650 = _644;
                if (_598)
                {
                    float _652 = _634 + _638;
                    _640 = as_type<int>(_652);
                }
                int _654 = _640;
                if (_602)
                {
                    float _656 = _644 + _648;
                    _650 = _656;
                }
                float _658 = _650;
                _584 = _654;
                _586 = _658;
            }
            int _660 = _584;
            float _662 = _586;
            int _664 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _666 = _664 != 0;
            int _668 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _670 = _668 != 0;
            int _672 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _674 = _672 != 0;
            int _676 = _660;
            int _678 = as_type<int>(_662);
            if (_670)
            {
                float _680 = -as_type<float>(_660);
                float _682 = _680 + 1.0;
                _676 = as_type<int>(_682);
            }
            int _684 = _676;
            if (_674)
            {
                float _686 = -_662;
                float _688 = _686 + 1.0;
                _678 = as_type<int>(_688);
            }
            int _690 = _678;
            bool _692 = !_666;
            float _694 = _692 ? as_type<float>(_684) : as_type<float>(_690);
            bool _696 = !_666;
            float _698 = _696 ? as_type<float>(_690) : as_type<float>(_684);
            _538 = _698;
            _540 = _694;
        }
    }
    _542 = false;
    float _700 = _538;
    float _702 = _540;
    float _704 = _700 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _706 = _700 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _708 = fma(_702, (*spvDescriptorSet0.vp_c3)._m0[12].x, _704);
    float _710 = fma(_702, (*spvDescriptorSet0.vp_c3)._m0[11].x, _706);
    float _712 = _708 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _714 = _710 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _716 = -_712;
    float _718 = _716 + 1.0;
    out.m_31.x = _714;
    out.m_31.y = _718;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    bool _542 = false;
    bool _342 = false;
    bool _139 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _45 = in.m_22.x;
    float _47 = in.m_22.y;
    float _49 = in.m_22.z;
    bool _53 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    float _55 = _47 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
    float _57 = _45 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
    float _59 = _55 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _61 = _55 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _63 = _55 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _65 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[5].x, _59);
    float _67 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[4].x, _61);
    float _69 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[6].x, _63);
    float _71 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[5].z, _65);
    float _73 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[4].z, _67);
    float _75 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[6].z, _69);
    float _77 = _71 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _79 = _73 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _81 = _75 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _83 = _77 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _85 = _77 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _87 = _77 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _89 = _77 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _91 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[1].x, _83);
    float _93 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[0].x, _85);
    float _95 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[2].x, _87);
    float _97 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[3].x, _89);
    float _99 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[1].z, _91);
    float _101 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[0].z, _93);
    float _103 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[2].z, _95);
    float _105 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[3].z, _97);
    float _107 = _99 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _109 = _101 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _111 = _103 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _113 = _105 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _109;
    out.gl_Position.y = _107;
    out.gl_Position.z = _111;
    out.gl_Position.w = _113;
    bool _115 = !_53;
    float _117 = _79;
    float _135;
    float _137;
    if (!_115)
    {
        float _119 = _55 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _121 = _55 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _123 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[14].x, _119);
        float _125 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[15].x, _121);
        float _127 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[14].z, _123);
        float _129 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[15].z, _125);
        float _131 = _127 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _133 = _129 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _135 = _133;
        _137 = _131;
        _139 = true;
    }
    else
    {
        int _142 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _144 = _142 != 0;
        float _146 = _109;
        float _148 = _107;
        if (!_144)
        {
            float _150 = in.m_24.x;
            float _152 = in.m_24.y;
            _146 = _150;
            _148 = _152;
        }
        float _154 = _146;
        float _156 = _148;
        bool _158 = !_144;
        _135 = _156;
        _137 = _154;
        if (!_158)
        {
            int _160 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _162 = _160 != 0;
            float _164 = _154;
            float _166 = _156;
            if (!_162)
            {
                float _168 = in.m_24.x;
                float _170 = in.m_24.y;
                _164 = _168;
                _166 = _170;
            }
            float _172 = _164;
            float _174 = _166;
            bool _176 = !_162;
            float _178 = _172;
            int _180 = as_type<int>(_172);
            float _182 = _174;
            if (!_176)
            {
                int _184 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _186 = _184 != 0;
                float _188 = in.m_24.x;
                float _190 = in.m_24.y;
                int _192 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _194 = _192 != 0;
                int _196 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _198 = _196 != 0;
                int _200 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _202 = _200 != 0;
                int _204 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _206 = _204 != 0;
                if (_186)
                {
                    _178 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _208 = _178;
                float _210 = _208;
                if (_186)
                {
                    _117 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _212 = _117;
                float _214 = _212;
                if (!_186)
                {
                    _210 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _216 = _210;
                if (!_186)
                {
                    _214 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _218 = _214;
                float _220 = _216 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _222 = _218 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _224 = _188;
                float _226 = _190;
                if (_202)
                {
                    float _228 = _220 * _188;
                    _224 = _228;
                }
                float _230 = _224;
                float _232 = -_220;
                float _234 = _232 + 1.0;
                int _236 = as_type<int>(_230);
                if (_206)
                {
                    float _238 = _222 * _190;
                    _226 = _238;
                }
                float _240 = _226;
                float _242 = -_222;
                float _244 = _242 + 1.0;
                float _246 = _240;
                if (_194)
                {
                    float _248 = _230 + _234;
                    _236 = as_type<int>(_248);
                }
                int _250 = _236;
                if (_198)
                {
                    float _252 = _240 + _244;
                    _246 = _252;
                }
                float _254 = _246;
                _180 = _250;
                _182 = _254;
            }
            int _256 = _180;
            float _258 = _182;
            int _260 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _262 = _260 != 0;
            int _264 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _266 = _264 != 0;
            int _268 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _270 = _268 != 0;
            int _272 = _256;
            int _274 = as_type<int>(_258);
            if (_266)
            {
                float _276 = -as_type<float>(_256);
                float _278 = _276 + 1.0;
                _272 = as_type<int>(_278);
            }
            int _280 = _272;
            if (_270)
            {
                float _282 = -_258;
                float _284 = _282 + 1.0;
                _274 = as_type<int>(_284);
            }
            int _286 = _274;
            bool _288 = !_262;
            float _290 = _288 ? as_type<float>(_280) : as_type<float>(_286);
            bool _292 = !_262;
            float _294 = _292 ? as_type<float>(_286) : as_type<float>(_280);
            _135 = _294;
            _137 = _290;
        }
    }
    _139 = false;
    float _296 = _135;
    float _298 = _137;
    float _300 = _296 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _302 = _296 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    bool _304 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _306 = fma(_298, (*spvDescriptorSet0.vp_c3)._m0[8].x, _300);
    float _308 = fma(_298, (*spvDescriptorSet0.vp_c3)._m0[7].x, _302);
    float _310 = _306 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _312 = _308 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _314 = -_310;
    float _316 = _314 + 1.0;
    out.m_27.x = _312;
    out.m_27.y = _316;
    bool _318 = !_304;
    float _320 = _310;
    float _338;
    float _340;
    if (!_318)
    {
        float _322 = _55 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _324 = _55 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _326 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[18].x, _322);
        float _328 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[19].x, _324);
        float _330 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[18].z, _326);
        float _332 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[19].z, _328);
        float _334 = _330 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _336 = _332 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _338 = _336;
        _340 = _334;
        _342 = true;
    }
    else
    {
        int _344 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _346 = _344 != 0;
        float _348 = _312;
        float _350 = _316;
        if (!_346)
        {
            float _352 = in.m_24.x;
            float _354 = in.m_24.y;
            _348 = _352;
            _350 = _354;
        }
        float _356 = _348;
        float _358 = _350;
        bool _360 = !_346;
        _338 = _358;
        _340 = _356;
        if (!_360)
        {
            int _362 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _364 = _362 != 0;
            float _366 = _356;
            float _368 = _358;
            if (!_364)
            {
                float _370 = in.m_24.x;
                float _372 = in.m_24.y;
                _366 = _370;
                _368 = _372;
            }
            float _374 = _366;
            float _376 = _368;
            bool _378 = !_364;
            float _380 = _374;
            int _382 = as_type<int>(_374);
            float _384 = _376;
            if (!_378)
            {
                int _386 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _388 = _386 != 0;
                float _390 = in.m_24.x;
                float _392 = in.m_24.y;
                int _394 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _396 = _394 != 0;
                int _398 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _400 = _398 != 0;
                int _402 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _404 = _402 != 0;
                int _406 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _408 = _406 != 0;
                if (_388)
                {
                    _380 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _410 = _380;
                float _412 = _410;
                if (_388)
                {
                    _320 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _414 = _320;
                float _416 = _414;
                if (!_388)
                {
                    _412 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _418 = _412;
                if (!_388)
                {
                    _416 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _420 = _416;
                float _422 = _418 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _424 = _420 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _426 = _390;
                float _428 = _392;
                if (_404)
                {
                    float _430 = _422 * _390;
                    _426 = _430;
                }
                float _432 = _426;
                float _434 = -_422;
                float _436 = _434 + 1.0;
                int _438 = as_type<int>(_432);
                if (_408)
                {
                    float _440 = _424 * _392;
                    _428 = _440;
                }
                float _442 = _428;
                float _444 = -_424;
                float _446 = _444 + 1.0;
                float _448 = _442;
                if (_396)
                {
                    float _450 = _432 + _436;
                    _438 = as_type<int>(_450);
                }
                int _452 = _438;
                if (_400)
                {
                    float _454 = _442 + _446;
                    _448 = _454;
                }
                float _456 = _448;
                _382 = _452;
                _384 = _456;
            }
            int _458 = _382;
            float _460 = _384;
            int _462 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _464 = _462 != 0;
            int _466 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _468 = _466 != 0;
            int _470 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _472 = _470 != 0;
            int _474 = _458;
            int _476 = as_type<int>(_460);
            if (_468)
            {
                float _478 = -as_type<float>(_458);
                float _480 = _478 + 1.0;
                _474 = as_type<int>(_480);
            }
            int _482 = _474;
            if (_472)
            {
                float _484 = -_460;
                float _486 = _484 + 1.0;
                _476 = as_type<int>(_486);
            }
            int _488 = _476;
            bool _490 = !_464;
            float _492 = _490 ? as_type<float>(_482) : as_type<float>(_488);
            bool _494 = !_464;
            float _496 = _494 ? as_type<float>(_488) : as_type<float>(_482);
            _338 = _496;
            _340 = _492;
        }
    }
    _342 = false;
    float _498 = _338;
    float _500 = _340;
    float _502 = _498 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _504 = _498 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    bool _506 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].z);
    float _508 = fma(_500, (*spvDescriptorSet0.vp_c3)._m0[10].x, _502);
    float _510 = fma(_500, (*spvDescriptorSet0.vp_c3)._m0[9].x, _504);
    float _512 = _508 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _514 = _510 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _516 = -_512;
    float _518 = _516 + 1.0;
    out.m_29.x = _514;
    out.m_29.y = _518;
    bool _520 = !_506;
    float _538;
    float _540;
    if (!_520)
    {
        float _522 = _55 * (*spvDescriptorSet0.vp_c3)._m0[22].y;
        float _524 = _55 * (*spvDescriptorSet0.vp_c3)._m0[23].y;
        float _526 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[22].x, _522);
        float _528 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[23].x, _524);
        float _530 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[22].z, _526);
        float _532 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[23].z, _528);
        float _534 = _530 + (*spvDescriptorSet0.vp_c3)._m0[22].w;
        float _536 = _532 + (*spvDescriptorSet0.vp_c3)._m0[23].w;
        _538 = _536;
        _540 = _534;
        _542 = true;
    }
    else
    {
        int _544 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _546 = _544 != 0;
        float _548 = _57;
        float _550 = _55;
        if (!_546)
        {
            float _552 = in.m_24.x;
            float _554 = in.m_24.y;
            _548 = _552;
            _550 = _554;
        }
        float _556 = _548;
        float _558 = _550;
        bool _560 = !_546;
        _538 = _558;
        _540 = _556;
        if (!_560)
        {
            int _562 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _564 = _562 != 0;
            float _566 = _556;
            float _568 = _558;
            if (!_564)
            {
                float _570 = in.m_24.x;
                float _572 = in.m_24.y;
                _566 = _570;
                _568 = _572;
            }
            float _574 = _566;
            float _576 = _568;
            bool _578 = !_564;
            float _580 = _576;
            float _582 = _574;
            int _584 = as_type<int>(_574);
            float _586 = _576;
            if (!_578)
            {
                float _588 = in.m_24.x;
                float _590 = in.m_24.y;
                int _592 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _594 = _592 != 0;
                int _596 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _598 = _596 != 0;
                int _600 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _602 = _600 != 0;
                int _604 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _606 = _604 != 0;
                int _608 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _610 = _608 != 0;
                if (_594)
                {
                    _580 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _612 = _580;
                float _614 = _612;
                if (_594)
                {
                    _582 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _616 = _582;
                float _618 = _616;
                if (!_594)
                {
                    _614 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _620 = _614;
                if (!_594)
                {
                    _618 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _622 = _618;
                float _624 = _620 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _626 = _622 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _628 = _588;
                float _630 = _590;
                if (_606)
                {
                    float _632 = _624 * _588;
                    _628 = _632;
                }
                float _634 = _628;
                float _636 = -_624;
                float _638 = _636 + 1.0;
                int _640 = as_type<int>(_634);
                if (_610)
                {
                    float _642 = _626 * _590;
                    _630 = _642;
                }
                float _644 = _630;
                float _646 = -_626;
                float _648 = _646 + 1.0;
                float _650 = _644;
                if (_598)
                {
                    float _652 = _634 + _638;
                    _640 = as_type<int>(_652);
                }
                int _654 = _640;
                if (_602)
                {
                    float _656 = _644 + _648;
                    _650 = _656;
                }
                float _658 = _650;
                _584 = _654;
                _586 = _658;
            }
            int _660 = _584;
            float _662 = _586;
            int _664 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _666 = _664 != 0;
            int _668 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _670 = _668 != 0;
            int _672 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _674 = _672 != 0;
            int _676 = _660;
            int _678 = as_type<int>(_662);
            if (_670)
            {
                float _680 = -as_type<float>(_660);
                float _682 = _680 + 1.0;
                _676 = as_type<int>(_682);
            }
            int _684 = _676;
            if (_674)
            {
                float _686 = -_662;
                float _688 = _686 + 1.0;
                _678 = as_type<int>(_688);
            }
            int _690 = _678;
            bool _692 = !_666;
            float _694 = _692 ? as_type<float>(_684) : as_type<float>(_690);
            bool _696 = !_666;
            float _698 = _696 ? as_type<float>(_690) : as_type<float>(_684);
            _538 = _698;
            _540 = _694;
        }
    }
    _542 = false;
    float _700 = _538;
    float _702 = _540;
    float _704 = _700 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _706 = _700 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _708 = fma(_702, (*spvDescriptorSet0.vp_c3)._m0[12].x, _704);
    float _710 = fma(_702, (*spvDescriptorSet0.vp_c3)._m0[11].x, _706);
    float _712 = _708 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _714 = _710 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _716 = -_712;
    float _718 = _716 + 1.0;
    out.m_31.x = _714;
    out.m_31.y = _718;
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
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    bool _542 = false;
    bool _342 = false;
    bool _139 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _45 = in.m_22.x;
    float _47 = in.m_22.y;
    float _49 = in.m_22.z;
    bool _53 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    float _55 = _47 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
    float _57 = _45 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
    float _59 = _55 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _61 = _55 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _63 = _55 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _65 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[5].x, _59);
    float _67 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[4].x, _61);
    float _69 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[6].x, _63);
    float _71 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[5].z, _65);
    float _73 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[4].z, _67);
    float _75 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[6].z, _69);
    float _77 = _71 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _79 = _73 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _81 = _75 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _83 = _77 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _85 = _77 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _87 = _77 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _89 = _77 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _91 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[1].x, _83);
    float _93 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[0].x, _85);
    float _95 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[2].x, _87);
    float _97 = fma(_79, (*spvDescriptorSet0.vp_c3)._m0[3].x, _89);
    float _99 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[1].z, _91);
    float _101 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[0].z, _93);
    float _103 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[2].z, _95);
    float _105 = fma(_81, (*spvDescriptorSet0.vp_c3)._m0[3].z, _97);
    float _107 = _99 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _109 = _101 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _111 = _103 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _113 = _105 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _109;
    out.gl_Position.y = _107;
    out.gl_Position.z = _111;
    out.gl_Position.w = _113;
    bool _115 = !_53;
    float _117 = _79;
    float _135;
    float _137;
    if (!_115)
    {
        float _119 = _55 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _121 = _55 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _123 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[14].x, _119);
        float _125 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[15].x, _121);
        float _127 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[14].z, _123);
        float _129 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[15].z, _125);
        float _131 = _127 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _133 = _129 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _135 = _133;
        _137 = _131;
        _139 = true;
    }
    else
    {
        int _142 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _144 = _142 != 0;
        float _146 = _109;
        float _148 = _107;
        if (!_144)
        {
            float _150 = in.m_24.x;
            float _152 = in.m_24.y;
            _146 = _150;
            _148 = _152;
        }
        float _154 = _146;
        float _156 = _148;
        bool _158 = !_144;
        _135 = _156;
        _137 = _154;
        if (!_158)
        {
            int _160 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _162 = _160 != 0;
            float _164 = _154;
            float _166 = _156;
            if (!_162)
            {
                float _168 = in.m_24.x;
                float _170 = in.m_24.y;
                _164 = _168;
                _166 = _170;
            }
            float _172 = _164;
            float _174 = _166;
            bool _176 = !_162;
            float _178 = _172;
            int _180 = as_type<int>(_172);
            float _182 = _174;
            if (!_176)
            {
                int _184 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _186 = _184 != 0;
                float _188 = in.m_24.x;
                float _190 = in.m_24.y;
                int _192 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _194 = _192 != 0;
                int _196 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _198 = _196 != 0;
                int _200 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _202 = _200 != 0;
                int _204 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _206 = _204 != 0;
                if (_186)
                {
                    _178 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _208 = _178;
                float _210 = _208;
                if (_186)
                {
                    _117 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _212 = _117;
                float _214 = _212;
                if (!_186)
                {
                    _210 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _216 = _210;
                if (!_186)
                {
                    _214 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _218 = _214;
                float _220 = _216 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _222 = _218 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _224 = _188;
                float _226 = _190;
                if (_202)
                {
                    float _228 = _220 * _188;
                    _224 = _228;
                }
                float _230 = _224;
                float _232 = -_220;
                float _234 = _232 + 1.0;
                int _236 = as_type<int>(_230);
                if (_206)
                {
                    float _238 = _222 * _190;
                    _226 = _238;
                }
                float _240 = _226;
                float _242 = -_222;
                float _244 = _242 + 1.0;
                float _246 = _240;
                if (_194)
                {
                    float _248 = _230 + _234;
                    _236 = as_type<int>(_248);
                }
                int _250 = _236;
                if (_198)
                {
                    float _252 = _240 + _244;
                    _246 = _252;
                }
                float _254 = _246;
                _180 = _250;
                _182 = _254;
            }
            int _256 = _180;
            float _258 = _182;
            int _260 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _262 = _260 != 0;
            int _264 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _266 = _264 != 0;
            int _268 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _270 = _268 != 0;
            int _272 = _256;
            int _274 = as_type<int>(_258);
            if (_266)
            {
                float _276 = -as_type<float>(_256);
                float _278 = _276 + 1.0;
                _272 = as_type<int>(_278);
            }
            int _280 = _272;
            if (_270)
            {
                float _282 = -_258;
                float _284 = _282 + 1.0;
                _274 = as_type<int>(_284);
            }
            int _286 = _274;
            bool _288 = !_262;
            float _290 = _288 ? as_type<float>(_280) : as_type<float>(_286);
            bool _292 = !_262;
            float _294 = _292 ? as_type<float>(_286) : as_type<float>(_280);
            _135 = _294;
            _137 = _290;
        }
    }
    _139 = false;
    float _296 = _135;
    float _298 = _137;
    float _300 = _296 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _302 = _296 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    bool _304 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _306 = fma(_298, (*spvDescriptorSet0.vp_c3)._m0[8].x, _300);
    float _308 = fma(_298, (*spvDescriptorSet0.vp_c3)._m0[7].x, _302);
    float _310 = _306 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _312 = _308 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _314 = -_310;
    float _316 = _314 + 1.0;
    out.m_27.x = _312;
    out.m_27.y = _316;
    bool _318 = !_304;
    float _320 = _310;
    float _338;
    float _340;
    if (!_318)
    {
        float _322 = _55 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _324 = _55 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _326 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[18].x, _322);
        float _328 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[19].x, _324);
        float _330 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[18].z, _326);
        float _332 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[19].z, _328);
        float _334 = _330 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _336 = _332 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _338 = _336;
        _340 = _334;
        _342 = true;
    }
    else
    {
        int _344 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _346 = _344 != 0;
        float _348 = _312;
        float _350 = _316;
        if (!_346)
        {
            float _352 = in.m_24.x;
            float _354 = in.m_24.y;
            _348 = _352;
            _350 = _354;
        }
        float _356 = _348;
        float _358 = _350;
        bool _360 = !_346;
        _338 = _358;
        _340 = _356;
        if (!_360)
        {
            int _362 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _364 = _362 != 0;
            float _366 = _356;
            float _368 = _358;
            if (!_364)
            {
                float _370 = in.m_24.x;
                float _372 = in.m_24.y;
                _366 = _370;
                _368 = _372;
            }
            float _374 = _366;
            float _376 = _368;
            bool _378 = !_364;
            float _380 = _374;
            int _382 = as_type<int>(_374);
            float _384 = _376;
            if (!_378)
            {
                int _386 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _388 = _386 != 0;
                float _390 = in.m_24.x;
                float _392 = in.m_24.y;
                int _394 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _396 = _394 != 0;
                int _398 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _400 = _398 != 0;
                int _402 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _404 = _402 != 0;
                int _406 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _408 = _406 != 0;
                if (_388)
                {
                    _380 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _410 = _380;
                float _412 = _410;
                if (_388)
                {
                    _320 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _414 = _320;
                float _416 = _414;
                if (!_388)
                {
                    _412 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _418 = _412;
                if (!_388)
                {
                    _416 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _420 = _416;
                float _422 = _418 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _424 = _420 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _426 = _390;
                float _428 = _392;
                if (_404)
                {
                    float _430 = _422 * _390;
                    _426 = _430;
                }
                float _432 = _426;
                float _434 = -_422;
                float _436 = _434 + 1.0;
                int _438 = as_type<int>(_432);
                if (_408)
                {
                    float _440 = _424 * _392;
                    _428 = _440;
                }
                float _442 = _428;
                float _444 = -_424;
                float _446 = _444 + 1.0;
                float _448 = _442;
                if (_396)
                {
                    float _450 = _432 + _436;
                    _438 = as_type<int>(_450);
                }
                int _452 = _438;
                if (_400)
                {
                    float _454 = _442 + _446;
                    _448 = _454;
                }
                float _456 = _448;
                _382 = _452;
                _384 = _456;
            }
            int _458 = _382;
            float _460 = _384;
            int _462 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _464 = _462 != 0;
            int _466 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _468 = _466 != 0;
            int _470 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _472 = _470 != 0;
            int _474 = _458;
            int _476 = as_type<int>(_460);
            if (_468)
            {
                float _478 = -as_type<float>(_458);
                float _480 = _478 + 1.0;
                _474 = as_type<int>(_480);
            }
            int _482 = _474;
            if (_472)
            {
                float _484 = -_460;
                float _486 = _484 + 1.0;
                _476 = as_type<int>(_486);
            }
            int _488 = _476;
            bool _490 = !_464;
            float _492 = _490 ? as_type<float>(_482) : as_type<float>(_488);
            bool _494 = !_464;
            float _496 = _494 ? as_type<float>(_488) : as_type<float>(_482);
            _338 = _496;
            _340 = _492;
        }
    }
    _342 = false;
    float _498 = _338;
    float _500 = _340;
    float _502 = _498 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _504 = _498 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    bool _506 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].z);
    float _508 = fma(_500, (*spvDescriptorSet0.vp_c3)._m0[10].x, _502);
    float _510 = fma(_500, (*spvDescriptorSet0.vp_c3)._m0[9].x, _504);
    float _512 = _508 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _514 = _510 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _516 = -_512;
    float _518 = _516 + 1.0;
    out.m_29.x = _514;
    out.m_29.y = _518;
    bool _520 = !_506;
    float _538;
    float _540;
    if (!_520)
    {
        float _522 = _55 * (*spvDescriptorSet0.vp_c3)._m0[22].y;
        float _524 = _55 * (*spvDescriptorSet0.vp_c3)._m0[23].y;
        float _526 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[22].x, _522);
        float _528 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[23].x, _524);
        float _530 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[22].z, _526);
        float _532 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[23].z, _528);
        float _534 = _530 + (*spvDescriptorSet0.vp_c3)._m0[22].w;
        float _536 = _532 + (*spvDescriptorSet0.vp_c3)._m0[23].w;
        _538 = _536;
        _540 = _534;
        _542 = true;
    }
    else
    {
        int _544 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _546 = _544 != 0;
        float _548 = _57;
        float _550 = _55;
        if (!_546)
        {
            float _552 = in.m_24.x;
            float _554 = in.m_24.y;
            _548 = _552;
            _550 = _554;
        }
        float _556 = _548;
        float _558 = _550;
        bool _560 = !_546;
        _538 = _558;
        _540 = _556;
        if (!_560)
        {
            int _562 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _564 = _562 != 0;
            float _566 = _556;
            float _568 = _558;
            if (!_564)
            {
                float _570 = in.m_24.x;
                float _572 = in.m_24.y;
                _566 = _570;
                _568 = _572;
            }
            float _574 = _566;
            float _576 = _568;
            bool _578 = !_564;
            float _580 = _576;
            float _582 = _574;
            int _584 = as_type<int>(_574);
            float _586 = _576;
            if (!_578)
            {
                float _588 = in.m_24.x;
                float _590 = in.m_24.y;
                int _592 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _594 = _592 != 0;
                int _596 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _598 = _596 != 0;
                int _600 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _602 = _600 != 0;
                int _604 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _606 = _604 != 0;
                int _608 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _610 = _608 != 0;
                if (_594)
                {
                    _580 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _612 = _580;
                float _614 = _612;
                if (_594)
                {
                    _582 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _616 = _582;
                float _618 = _616;
                if (!_594)
                {
                    _614 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _620 = _614;
                if (!_594)
                {
                    _618 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _622 = _618;
                float _624 = _620 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _626 = _622 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _628 = _588;
                float _630 = _590;
                if (_606)
                {
                    float _632 = _624 * _588;
                    _628 = _632;
                }
                float _634 = _628;
                float _636 = -_624;
                float _638 = _636 + 1.0;
                int _640 = as_type<int>(_634);
                if (_610)
                {
                    float _642 = _626 * _590;
                    _630 = _642;
                }
                float _644 = _630;
                float _646 = -_626;
                float _648 = _646 + 1.0;
                float _650 = _644;
                if (_598)
                {
                    float _652 = _634 + _638;
                    _640 = as_type<int>(_652);
                }
                int _654 = _640;
                if (_602)
                {
                    float _656 = _644 + _648;
                    _650 = _656;
                }
                float _658 = _650;
                _584 = _654;
                _586 = _658;
            }
            int _660 = _584;
            float _662 = _586;
            int _664 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _666 = _664 != 0;
            int _668 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _670 = _668 != 0;
            int _672 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _674 = _672 != 0;
            int _676 = _660;
            int _678 = as_type<int>(_662);
            if (_670)
            {
                float _680 = -as_type<float>(_660);
                float _682 = _680 + 1.0;
                _676 = as_type<int>(_682);
            }
            int _684 = _676;
            if (_674)
            {
                float _686 = -_662;
                float _688 = _686 + 1.0;
                _678 = as_type<int>(_688);
            }
            int _690 = _678;
            bool _692 = !_666;
            float _694 = _692 ? as_type<float>(_684) : as_type<float>(_690);
            bool _696 = !_666;
            float _698 = _696 ? as_type<float>(_690) : as_type<float>(_684);
            _538 = _698;
            _540 = _694;
        }
    }
    _542 = false;
    float _700 = _538;
    float _702 = _540;
    float _704 = _700 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _706 = _700 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _708 = fma(_702, (*spvDescriptorSet0.vp_c3)._m0[12].x, _704);
    float _710 = fma(_702, (*spvDescriptorSet0.vp_c3)._m0[11].x, _706);
    float _712 = _708 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _714 = _710 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _716 = -_712;
    float _718 = _716 + 1.0;
    out.m_31.x = _714;
    out.m_31.y = _718;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_27.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_27.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_27.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_27.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

