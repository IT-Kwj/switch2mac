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
    bool _586 = false;
    bool _370 = false;
    bool _152 = false;
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
    float _119 = _57;
    float _145;
    int _148;
    float _150;
    if (!_115)
    {
        float _121 = _55 * (*spvDescriptorSet0.vp_c3)._m0[17].y;
        float _123 = _55 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _125 = _55 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _127 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[17].x, _121);
        float _129 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[14].x, _123);
        float _131 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[15].x, _125);
        float _133 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[17].z, _127);
        float _135 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[14].z, _129);
        float _137 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[15].z, _131);
        float _139 = _133 + (*spvDescriptorSet0.vp_c3)._m0[17].w;
        float _141 = _135 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _143 = _137 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _145 = _143;
        _148 = as_type<int>(_139);
        _150 = _141;
        _152 = true;
    }
    else
    {
        int _154 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _156 = _154 != 0;
        float _158 = _109;
        float _160 = _107;
        if (!_156)
        {
            float _162 = in.m_24.x;
            float _164 = in.m_24.y;
            _158 = _162;
            _160 = _164;
        }
        float _166 = _158;
        float _168 = _160;
        if (!_156)
        {
            _117 = 1.0;
        }
        float _170 = _117;
        bool _172 = !_156;
        float _174 = _170;
        _145 = _168;
        _148 = as_type<int>(_170);
        _150 = _166;
        if (!_172)
        {
            int _176 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _178 = _176 != 0;
            float _180 = _166;
            float _182 = _168;
            if (!_178)
            {
                float _184 = in.m_24.x;
                float _186 = in.m_24.y;
                _180 = _184;
                _182 = _186;
            }
            float _188 = _180;
            float _190 = _182;
            bool _192 = !_178;
            float _194 = _188;
            int _196 = as_type<int>(_188);
            float _198 = _190;
            if (!_192)
            {
                int _200 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _202 = _200 != 0;
                float _204 = in.m_24.x;
                float _206 = in.m_24.y;
                int _208 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _210 = _208 != 0;
                int _212 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _214 = _212 != 0;
                int _216 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _218 = _216 != 0;
                int _220 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _222 = _220 != 0;
                if (_202)
                {
                    _194 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _224 = _194;
                float _226 = _224;
                if (_202)
                {
                    _174 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _228 = _174;
                float _230 = _228;
                if (!_202)
                {
                    _226 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _232 = _226;
                if (!_202)
                {
                    _230 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _234 = _230;
                float _236 = _232 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _238 = _234 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _240 = _204;
                float _242 = _206;
                if (_218)
                {
                    float _244 = _236 * _204;
                    _240 = _244;
                }
                float _246 = _240;
                float _248 = -_236;
                float _250 = _248 + 1.0;
                int _252 = as_type<int>(_246);
                if (_222)
                {
                    float _254 = _238 * _206;
                    _242 = _254;
                }
                float _256 = _242;
                float _258 = -_238;
                float _260 = _258 + 1.0;
                float _262 = _256;
                if (_210)
                {
                    float _264 = _246 + _250;
                    _252 = as_type<int>(_264);
                }
                int _266 = _252;
                if (_214)
                {
                    float _268 = _256 + _260;
                    _262 = _268;
                }
                float _270 = _262;
                _196 = _266;
                _198 = _270;
            }
            int _272 = _196;
            float _274 = _198;
            int _276 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _278 = _276 != 0;
            int _280 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _282 = _280 != 0;
            int _284 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _286 = _284 != 0;
            int _288 = _272;
            int _290 = as_type<int>(_274);
            _148 = 1065353216;
            if (_282)
            {
                float _292 = -as_type<float>(_272);
                float _294 = _292 + 1.0;
                _288 = as_type<int>(_294);
            }
            int _296 = _288;
            if (_286)
            {
                float _298 = -_274;
                float _300 = _298 + 1.0;
                _290 = as_type<int>(_300);
            }
            int _302 = _290;
            bool _304 = !_278;
            float _306 = _304 ? as_type<float>(_296) : as_type<float>(_302);
            bool _308 = !_278;
            float _310 = _308 ? as_type<float>(_302) : as_type<float>(_296);
            _145 = _310;
            _150 = _306;
        }
    }
    _152 = false;
    float _312 = _145;
    int _314 = _148;
    float _316 = _150;
    float _318 = _312 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _320 = _312 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    out.m_27.w = as_type<float>(_314);
    bool _322 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _324 = fma(_316, (*spvDescriptorSet0.vp_c3)._m0[8].x, _318);
    float _326 = fma(_316, (*spvDescriptorSet0.vp_c3)._m0[7].x, _320);
    float _328 = _324 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _330 = _326 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _332 = -_328;
    float _334 = _332 + 1.0;
    out.m_27.x = _330;
    out.m_27.y = _334;
    bool _336 = !_322;
    float _338 = as_type<float>(_314);
    float _364;
    int _366;
    float _368;
    if (!_336)
    {
        float _340 = _55 * (*spvDescriptorSet0.vp_c3)._m0[21].y;
        float _342 = _55 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _344 = _55 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _346 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[21].x, _340);
        float _348 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[18].x, _342);
        float _350 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[19].x, _344);
        float _352 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[21].z, _346);
        float _354 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[18].z, _348);
        float _356 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[19].z, _350);
        float _358 = _352 + (*spvDescriptorSet0.vp_c3)._m0[21].w;
        float _360 = _354 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _362 = _356 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _364 = _362;
        _366 = as_type<int>(_358);
        _368 = _360;
        _370 = true;
    }
    else
    {
        int _372 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _374 = _372 != 0;
        float _376 = _316;
        float _378 = _330;
        if (!_374)
        {
            float _380 = in.m_24.x;
            float _382 = in.m_24.y;
            _376 = _380;
            _378 = _382;
        }
        float _384 = _376;
        float _386 = _378;
        if (!_374)
        {
            _338 = 1.0;
        }
        float _388 = _338;
        bool _390 = !_374;
        float _392 = _388;
        _364 = _386;
        _366 = as_type<int>(_388);
        _368 = _384;
        if (!_390)
        {
            int _394 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _396 = _394 != 0;
            float _398 = _384;
            float _400 = _386;
            if (!_396)
            {
                float _402 = in.m_24.x;
                float _404 = in.m_24.y;
                _398 = _402;
                _400 = _404;
            }
            float _406 = _398;
            float _408 = _400;
            bool _410 = !_396;
            float _412 = _406;
            int _414 = as_type<int>(_406);
            float _416 = _408;
            if (!_410)
            {
                int _418 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _420 = _418 != 0;
                float _422 = in.m_24.x;
                float _424 = in.m_24.y;
                int _426 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _428 = _426 != 0;
                int _430 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _432 = _430 != 0;
                int _434 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _436 = _434 != 0;
                int _438 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _440 = _438 != 0;
                if (_420)
                {
                    _412 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _442 = _412;
                float _444 = _442;
                if (_420)
                {
                    _392 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _446 = _392;
                float _448 = _446;
                if (!_420)
                {
                    _444 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _450 = _444;
                if (!_420)
                {
                    _448 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _452 = _448;
                float _454 = _450 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _456 = _452 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _458 = _422;
                float _460 = _424;
                if (_436)
                {
                    float _462 = _454 * _422;
                    _458 = _462;
                }
                float _464 = _458;
                float _466 = -_454;
                float _468 = _466 + 1.0;
                int _470 = as_type<int>(_464);
                if (_440)
                {
                    float _472 = _456 * _424;
                    _460 = _472;
                }
                float _474 = _460;
                float _476 = -_456;
                float _478 = _476 + 1.0;
                float _480 = _474;
                if (_428)
                {
                    float _482 = _464 + _468;
                    _470 = as_type<int>(_482);
                }
                int _484 = _470;
                if (_432)
                {
                    float _486 = _474 + _478;
                    _480 = _486;
                }
                float _488 = _480;
                _414 = _484;
                _416 = _488;
            }
            int _490 = _414;
            float _492 = _416;
            int _494 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _496 = _494 != 0;
            int _498 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _500 = _498 != 0;
            int _502 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _504 = _502 != 0;
            int _506 = _490;
            int _508 = as_type<int>(_492);
            _366 = 1065353216;
            if (_500)
            {
                float _510 = -as_type<float>(_490);
                float _512 = _510 + 1.0;
                _506 = as_type<int>(_512);
            }
            int _514 = _506;
            if (_504)
            {
                float _516 = -_492;
                float _518 = _516 + 1.0;
                _508 = as_type<int>(_518);
            }
            int _520 = _508;
            bool _522 = !_496;
            float _524 = _522 ? as_type<float>(_514) : as_type<float>(_520);
            bool _526 = !_496;
            float _528 = _526 ? as_type<float>(_520) : as_type<float>(_514);
            _364 = _528;
            _368 = _524;
        }
    }
    _370 = false;
    float _530 = _364;
    int _532 = _366;
    float _534 = _368;
    float _536 = _530 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _538 = _530 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    out.m_29.w = as_type<float>(_532);
    bool _540 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].z);
    float _542 = fma(_534, (*spvDescriptorSet0.vp_c3)._m0[10].x, _536);
    float _544 = fma(_534, (*spvDescriptorSet0.vp_c3)._m0[9].x, _538);
    float _546 = _542 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _548 = _544 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _550 = -_546;
    float _552 = _550 + 1.0;
    out.m_29.x = _548;
    out.m_29.y = _552;
    bool _554 = !_540;
    float _580;
    int _582;
    float _584;
    if (!_554)
    {
        float _556 = _55 * (*spvDescriptorSet0.vp_c3)._m0[25].y;
        float _558 = _55 * (*spvDescriptorSet0.vp_c3)._m0[22].y;
        float _560 = _55 * (*spvDescriptorSet0.vp_c3)._m0[23].y;
        float _562 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[25].x, _556);
        float _564 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[22].x, _558);
        float _566 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[23].x, _560);
        float _568 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[25].z, _562);
        float _570 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[22].z, _564);
        float _572 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[23].z, _566);
        float _574 = _568 + (*spvDescriptorSet0.vp_c3)._m0[25].w;
        float _576 = _570 + (*spvDescriptorSet0.vp_c3)._m0[22].w;
        float _578 = _572 + (*spvDescriptorSet0.vp_c3)._m0[23].w;
        _580 = _578;
        _582 = as_type<int>(_574);
        _584 = _576;
        _586 = true;
    }
    else
    {
        int _588 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _590 = _588 != 0;
        float _592 = _49;
        float _594 = as_type<float>(_532);
        if (!_590)
        {
            float _596 = in.m_24.x;
            float _598 = in.m_24.y;
            _592 = _596;
            _594 = _598;
        }
        float _600 = _592;
        float _602 = _594;
        if (!_590)
        {
            _119 = 1.0;
        }
        float _604 = _119;
        bool _606 = !_590;
        _580 = _602;
        _582 = as_type<int>(_604);
        _584 = _600;
        if (!_606)
        {
            int _608 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _610 = _608 != 0;
            float _612 = _604;
            float _614 = _55;
            if (!_610)
            {
                float _616 = in.m_24.x;
                float _618 = in.m_24.y;
                _612 = _616;
                _614 = _618;
            }
            float _620 = _612;
            float _622 = _614;
            bool _624 = !_610;
            float _626 = _622;
            float _628 = _620;
            int _630 = as_type<int>(_620);
            float _632 = _622;
            if (!_624)
            {
                float _634 = in.m_24.x;
                float _636 = in.m_24.y;
                int _638 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _640 = _638 != 0;
                int _642 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _644 = _642 != 0;
                int _646 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _648 = _646 != 0;
                int _650 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _652 = _650 != 0;
                int _654 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _656 = _654 != 0;
                if (_640)
                {
                    _626 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _658 = _626;
                float _660 = _658;
                if (_640)
                {
                    _628 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _662 = _628;
                float _664 = _662;
                if (!_640)
                {
                    _660 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _666 = _660;
                if (!_640)
                {
                    _664 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _668 = _664;
                float _670 = _666 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _672 = _668 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _674 = _634;
                float _676 = _636;
                if (_652)
                {
                    float _678 = _670 * _634;
                    _674 = _678;
                }
                float _680 = _674;
                float _682 = -_670;
                float _684 = _682 + 1.0;
                int _686 = as_type<int>(_680);
                if (_656)
                {
                    float _688 = _672 * _636;
                    _676 = _688;
                }
                float _690 = _676;
                float _692 = -_672;
                float _694 = _692 + 1.0;
                float _696 = _690;
                if (_644)
                {
                    float _698 = _680 + _684;
                    _686 = as_type<int>(_698);
                }
                int _700 = _686;
                if (_648)
                {
                    float _702 = _690 + _694;
                    _696 = _702;
                }
                float _704 = _696;
                _630 = _700;
                _632 = _704;
            }
            int _706 = _630;
            float _708 = _632;
            int _710 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _712 = _710 != 0;
            int _714 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _716 = _714 != 0;
            int _718 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _720 = _718 != 0;
            int _722 = _706;
            int _724 = as_type<int>(_708);
            _582 = 1065353216;
            if (_716)
            {
                float _726 = -as_type<float>(_706);
                float _728 = _726 + 1.0;
                _722 = as_type<int>(_728);
            }
            int _730 = _722;
            if (_720)
            {
                float _732 = -_708;
                float _734 = _732 + 1.0;
                _724 = as_type<int>(_734);
            }
            int _736 = _724;
            bool _738 = !_712;
            float _740 = _738 ? as_type<float>(_730) : as_type<float>(_736);
            bool _742 = !_712;
            float _744 = _742 ? as_type<float>(_736) : as_type<float>(_730);
            _580 = _744;
            _584 = _740;
        }
    }
    _586 = false;
    float _746 = _580;
    int _748 = _582;
    float _750 = _584;
    float _752 = _746 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _754 = _746 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    out.m_31.w = as_type<float>(_748);
    float _756 = fma(_750, (*spvDescriptorSet0.vp_c3)._m0[12].x, _752);
    float _758 = fma(_750, (*spvDescriptorSet0.vp_c3)._m0[11].x, _754);
    float _760 = _756 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _762 = _758 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _764 = -_760;
    float _766 = _764 + 1.0;
    out.m_31.x = _762;
    out.m_31.y = _766;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    bool _586 = false;
    bool _370 = false;
    bool _152 = false;
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
    float _119 = _57;
    float _145;
    int _148;
    float _150;
    if (!_115)
    {
        float _121 = _55 * (*spvDescriptorSet0.vp_c3)._m0[17].y;
        float _123 = _55 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _125 = _55 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _127 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[17].x, _121);
        float _129 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[14].x, _123);
        float _131 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[15].x, _125);
        float _133 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[17].z, _127);
        float _135 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[14].z, _129);
        float _137 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[15].z, _131);
        float _139 = _133 + (*spvDescriptorSet0.vp_c3)._m0[17].w;
        float _141 = _135 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _143 = _137 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _145 = _143;
        _148 = as_type<int>(_139);
        _150 = _141;
        _152 = true;
    }
    else
    {
        int _154 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _156 = _154 != 0;
        float _158 = _109;
        float _160 = _107;
        if (!_156)
        {
            float _162 = in.m_24.x;
            float _164 = in.m_24.y;
            _158 = _162;
            _160 = _164;
        }
        float _166 = _158;
        float _168 = _160;
        if (!_156)
        {
            _117 = 1.0;
        }
        float _170 = _117;
        bool _172 = !_156;
        float _174 = _170;
        _145 = _168;
        _148 = as_type<int>(_170);
        _150 = _166;
        if (!_172)
        {
            int _176 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _178 = _176 != 0;
            float _180 = _166;
            float _182 = _168;
            if (!_178)
            {
                float _184 = in.m_24.x;
                float _186 = in.m_24.y;
                _180 = _184;
                _182 = _186;
            }
            float _188 = _180;
            float _190 = _182;
            bool _192 = !_178;
            float _194 = _188;
            int _196 = as_type<int>(_188);
            float _198 = _190;
            if (!_192)
            {
                int _200 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _202 = _200 != 0;
                float _204 = in.m_24.x;
                float _206 = in.m_24.y;
                int _208 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _210 = _208 != 0;
                int _212 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _214 = _212 != 0;
                int _216 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _218 = _216 != 0;
                int _220 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _222 = _220 != 0;
                if (_202)
                {
                    _194 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _224 = _194;
                float _226 = _224;
                if (_202)
                {
                    _174 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _228 = _174;
                float _230 = _228;
                if (!_202)
                {
                    _226 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _232 = _226;
                if (!_202)
                {
                    _230 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _234 = _230;
                float _236 = _232 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _238 = _234 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _240 = _204;
                float _242 = _206;
                if (_218)
                {
                    float _244 = _236 * _204;
                    _240 = _244;
                }
                float _246 = _240;
                float _248 = -_236;
                float _250 = _248 + 1.0;
                int _252 = as_type<int>(_246);
                if (_222)
                {
                    float _254 = _238 * _206;
                    _242 = _254;
                }
                float _256 = _242;
                float _258 = -_238;
                float _260 = _258 + 1.0;
                float _262 = _256;
                if (_210)
                {
                    float _264 = _246 + _250;
                    _252 = as_type<int>(_264);
                }
                int _266 = _252;
                if (_214)
                {
                    float _268 = _256 + _260;
                    _262 = _268;
                }
                float _270 = _262;
                _196 = _266;
                _198 = _270;
            }
            int _272 = _196;
            float _274 = _198;
            int _276 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _278 = _276 != 0;
            int _280 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _282 = _280 != 0;
            int _284 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _286 = _284 != 0;
            int _288 = _272;
            int _290 = as_type<int>(_274);
            _148 = 1065353216;
            if (_282)
            {
                float _292 = -as_type<float>(_272);
                float _294 = _292 + 1.0;
                _288 = as_type<int>(_294);
            }
            int _296 = _288;
            if (_286)
            {
                float _298 = -_274;
                float _300 = _298 + 1.0;
                _290 = as_type<int>(_300);
            }
            int _302 = _290;
            bool _304 = !_278;
            float _306 = _304 ? as_type<float>(_296) : as_type<float>(_302);
            bool _308 = !_278;
            float _310 = _308 ? as_type<float>(_302) : as_type<float>(_296);
            _145 = _310;
            _150 = _306;
        }
    }
    _152 = false;
    float _312 = _145;
    int _314 = _148;
    float _316 = _150;
    float _318 = _312 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _320 = _312 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    out.m_27.w = as_type<float>(_314);
    bool _322 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _324 = fma(_316, (*spvDescriptorSet0.vp_c3)._m0[8].x, _318);
    float _326 = fma(_316, (*spvDescriptorSet0.vp_c3)._m0[7].x, _320);
    float _328 = _324 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _330 = _326 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _332 = -_328;
    float _334 = _332 + 1.0;
    out.m_27.x = _330;
    out.m_27.y = _334;
    bool _336 = !_322;
    float _338 = as_type<float>(_314);
    float _364;
    int _366;
    float _368;
    if (!_336)
    {
        float _340 = _55 * (*spvDescriptorSet0.vp_c3)._m0[21].y;
        float _342 = _55 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _344 = _55 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _346 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[21].x, _340);
        float _348 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[18].x, _342);
        float _350 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[19].x, _344);
        float _352 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[21].z, _346);
        float _354 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[18].z, _348);
        float _356 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[19].z, _350);
        float _358 = _352 + (*spvDescriptorSet0.vp_c3)._m0[21].w;
        float _360 = _354 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _362 = _356 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _364 = _362;
        _366 = as_type<int>(_358);
        _368 = _360;
        _370 = true;
    }
    else
    {
        int _372 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _374 = _372 != 0;
        float _376 = _316;
        float _378 = _330;
        if (!_374)
        {
            float _380 = in.m_24.x;
            float _382 = in.m_24.y;
            _376 = _380;
            _378 = _382;
        }
        float _384 = _376;
        float _386 = _378;
        if (!_374)
        {
            _338 = 1.0;
        }
        float _388 = _338;
        bool _390 = !_374;
        float _392 = _388;
        _364 = _386;
        _366 = as_type<int>(_388);
        _368 = _384;
        if (!_390)
        {
            int _394 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _396 = _394 != 0;
            float _398 = _384;
            float _400 = _386;
            if (!_396)
            {
                float _402 = in.m_24.x;
                float _404 = in.m_24.y;
                _398 = _402;
                _400 = _404;
            }
            float _406 = _398;
            float _408 = _400;
            bool _410 = !_396;
            float _412 = _406;
            int _414 = as_type<int>(_406);
            float _416 = _408;
            if (!_410)
            {
                int _418 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _420 = _418 != 0;
                float _422 = in.m_24.x;
                float _424 = in.m_24.y;
                int _426 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _428 = _426 != 0;
                int _430 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _432 = _430 != 0;
                int _434 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _436 = _434 != 0;
                int _438 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _440 = _438 != 0;
                if (_420)
                {
                    _412 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _442 = _412;
                float _444 = _442;
                if (_420)
                {
                    _392 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _446 = _392;
                float _448 = _446;
                if (!_420)
                {
                    _444 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _450 = _444;
                if (!_420)
                {
                    _448 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _452 = _448;
                float _454 = _450 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _456 = _452 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _458 = _422;
                float _460 = _424;
                if (_436)
                {
                    float _462 = _454 * _422;
                    _458 = _462;
                }
                float _464 = _458;
                float _466 = -_454;
                float _468 = _466 + 1.0;
                int _470 = as_type<int>(_464);
                if (_440)
                {
                    float _472 = _456 * _424;
                    _460 = _472;
                }
                float _474 = _460;
                float _476 = -_456;
                float _478 = _476 + 1.0;
                float _480 = _474;
                if (_428)
                {
                    float _482 = _464 + _468;
                    _470 = as_type<int>(_482);
                }
                int _484 = _470;
                if (_432)
                {
                    float _486 = _474 + _478;
                    _480 = _486;
                }
                float _488 = _480;
                _414 = _484;
                _416 = _488;
            }
            int _490 = _414;
            float _492 = _416;
            int _494 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _496 = _494 != 0;
            int _498 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _500 = _498 != 0;
            int _502 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _504 = _502 != 0;
            int _506 = _490;
            int _508 = as_type<int>(_492);
            _366 = 1065353216;
            if (_500)
            {
                float _510 = -as_type<float>(_490);
                float _512 = _510 + 1.0;
                _506 = as_type<int>(_512);
            }
            int _514 = _506;
            if (_504)
            {
                float _516 = -_492;
                float _518 = _516 + 1.0;
                _508 = as_type<int>(_518);
            }
            int _520 = _508;
            bool _522 = !_496;
            float _524 = _522 ? as_type<float>(_514) : as_type<float>(_520);
            bool _526 = !_496;
            float _528 = _526 ? as_type<float>(_520) : as_type<float>(_514);
            _364 = _528;
            _368 = _524;
        }
    }
    _370 = false;
    float _530 = _364;
    int _532 = _366;
    float _534 = _368;
    float _536 = _530 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _538 = _530 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    out.m_29.w = as_type<float>(_532);
    bool _540 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].z);
    float _542 = fma(_534, (*spvDescriptorSet0.vp_c3)._m0[10].x, _536);
    float _544 = fma(_534, (*spvDescriptorSet0.vp_c3)._m0[9].x, _538);
    float _546 = _542 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _548 = _544 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _550 = -_546;
    float _552 = _550 + 1.0;
    out.m_29.x = _548;
    out.m_29.y = _552;
    bool _554 = !_540;
    float _580;
    int _582;
    float _584;
    if (!_554)
    {
        float _556 = _55 * (*spvDescriptorSet0.vp_c3)._m0[25].y;
        float _558 = _55 * (*spvDescriptorSet0.vp_c3)._m0[22].y;
        float _560 = _55 * (*spvDescriptorSet0.vp_c3)._m0[23].y;
        float _562 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[25].x, _556);
        float _564 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[22].x, _558);
        float _566 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[23].x, _560);
        float _568 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[25].z, _562);
        float _570 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[22].z, _564);
        float _572 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[23].z, _566);
        float _574 = _568 + (*spvDescriptorSet0.vp_c3)._m0[25].w;
        float _576 = _570 + (*spvDescriptorSet0.vp_c3)._m0[22].w;
        float _578 = _572 + (*spvDescriptorSet0.vp_c3)._m0[23].w;
        _580 = _578;
        _582 = as_type<int>(_574);
        _584 = _576;
        _586 = true;
    }
    else
    {
        int _588 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _590 = _588 != 0;
        float _592 = _49;
        float _594 = as_type<float>(_532);
        if (!_590)
        {
            float _596 = in.m_24.x;
            float _598 = in.m_24.y;
            _592 = _596;
            _594 = _598;
        }
        float _600 = _592;
        float _602 = _594;
        if (!_590)
        {
            _119 = 1.0;
        }
        float _604 = _119;
        bool _606 = !_590;
        _580 = _602;
        _582 = as_type<int>(_604);
        _584 = _600;
        if (!_606)
        {
            int _608 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _610 = _608 != 0;
            float _612 = _604;
            float _614 = _55;
            if (!_610)
            {
                float _616 = in.m_24.x;
                float _618 = in.m_24.y;
                _612 = _616;
                _614 = _618;
            }
            float _620 = _612;
            float _622 = _614;
            bool _624 = !_610;
            float _626 = _622;
            float _628 = _620;
            int _630 = as_type<int>(_620);
            float _632 = _622;
            if (!_624)
            {
                float _634 = in.m_24.x;
                float _636 = in.m_24.y;
                int _638 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _640 = _638 != 0;
                int _642 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _644 = _642 != 0;
                int _646 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _648 = _646 != 0;
                int _650 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _652 = _650 != 0;
                int _654 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _656 = _654 != 0;
                if (_640)
                {
                    _626 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _658 = _626;
                float _660 = _658;
                if (_640)
                {
                    _628 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _662 = _628;
                float _664 = _662;
                if (!_640)
                {
                    _660 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _666 = _660;
                if (!_640)
                {
                    _664 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _668 = _664;
                float _670 = _666 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _672 = _668 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _674 = _634;
                float _676 = _636;
                if (_652)
                {
                    float _678 = _670 * _634;
                    _674 = _678;
                }
                float _680 = _674;
                float _682 = -_670;
                float _684 = _682 + 1.0;
                int _686 = as_type<int>(_680);
                if (_656)
                {
                    float _688 = _672 * _636;
                    _676 = _688;
                }
                float _690 = _676;
                float _692 = -_672;
                float _694 = _692 + 1.0;
                float _696 = _690;
                if (_644)
                {
                    float _698 = _680 + _684;
                    _686 = as_type<int>(_698);
                }
                int _700 = _686;
                if (_648)
                {
                    float _702 = _690 + _694;
                    _696 = _702;
                }
                float _704 = _696;
                _630 = _700;
                _632 = _704;
            }
            int _706 = _630;
            float _708 = _632;
            int _710 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _712 = _710 != 0;
            int _714 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _716 = _714 != 0;
            int _718 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _720 = _718 != 0;
            int _722 = _706;
            int _724 = as_type<int>(_708);
            _582 = 1065353216;
            if (_716)
            {
                float _726 = -as_type<float>(_706);
                float _728 = _726 + 1.0;
                _722 = as_type<int>(_728);
            }
            int _730 = _722;
            if (_720)
            {
                float _732 = -_708;
                float _734 = _732 + 1.0;
                _724 = as_type<int>(_734);
            }
            int _736 = _724;
            bool _738 = !_712;
            float _740 = _738 ? as_type<float>(_730) : as_type<float>(_736);
            bool _742 = !_712;
            float _744 = _742 ? as_type<float>(_736) : as_type<float>(_730);
            _580 = _744;
            _584 = _740;
        }
    }
    _586 = false;
    float _746 = _580;
    int _748 = _582;
    float _750 = _584;
    float _752 = _746 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _754 = _746 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    out.m_31.w = as_type<float>(_748);
    float _756 = fma(_750, (*spvDescriptorSet0.vp_c3)._m0[12].x, _752);
    float _758 = fma(_750, (*spvDescriptorSet0.vp_c3)._m0[11].x, _754);
    float _760 = _756 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _762 = _758 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _764 = -_760;
    float _766 = _764 + 1.0;
    out.m_31.x = _762;
    out.m_31.y = _766;
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
    bool _586 = false;
    bool _370 = false;
    bool _152 = false;
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
    float _119 = _57;
    float _145;
    int _148;
    float _150;
    if (!_115)
    {
        float _121 = _55 * (*spvDescriptorSet0.vp_c3)._m0[17].y;
        float _123 = _55 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _125 = _55 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _127 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[17].x, _121);
        float _129 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[14].x, _123);
        float _131 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[15].x, _125);
        float _133 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[17].z, _127);
        float _135 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[14].z, _129);
        float _137 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[15].z, _131);
        float _139 = _133 + (*spvDescriptorSet0.vp_c3)._m0[17].w;
        float _141 = _135 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _143 = _137 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _145 = _143;
        _148 = as_type<int>(_139);
        _150 = _141;
        _152 = true;
    }
    else
    {
        int _154 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _156 = _154 != 0;
        float _158 = _109;
        float _160 = _107;
        if (!_156)
        {
            float _162 = in.m_24.x;
            float _164 = in.m_24.y;
            _158 = _162;
            _160 = _164;
        }
        float _166 = _158;
        float _168 = _160;
        if (!_156)
        {
            _117 = 1.0;
        }
        float _170 = _117;
        bool _172 = !_156;
        float _174 = _170;
        _145 = _168;
        _148 = as_type<int>(_170);
        _150 = _166;
        if (!_172)
        {
            int _176 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _178 = _176 != 0;
            float _180 = _166;
            float _182 = _168;
            if (!_178)
            {
                float _184 = in.m_24.x;
                float _186 = in.m_24.y;
                _180 = _184;
                _182 = _186;
            }
            float _188 = _180;
            float _190 = _182;
            bool _192 = !_178;
            float _194 = _188;
            int _196 = as_type<int>(_188);
            float _198 = _190;
            if (!_192)
            {
                int _200 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _202 = _200 != 0;
                float _204 = in.m_24.x;
                float _206 = in.m_24.y;
                int _208 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _210 = _208 != 0;
                int _212 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _214 = _212 != 0;
                int _216 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _218 = _216 != 0;
                int _220 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _222 = _220 != 0;
                if (_202)
                {
                    _194 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _224 = _194;
                float _226 = _224;
                if (_202)
                {
                    _174 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _228 = _174;
                float _230 = _228;
                if (!_202)
                {
                    _226 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _232 = _226;
                if (!_202)
                {
                    _230 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _234 = _230;
                float _236 = _232 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _238 = _234 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _240 = _204;
                float _242 = _206;
                if (_218)
                {
                    float _244 = _236 * _204;
                    _240 = _244;
                }
                float _246 = _240;
                float _248 = -_236;
                float _250 = _248 + 1.0;
                int _252 = as_type<int>(_246);
                if (_222)
                {
                    float _254 = _238 * _206;
                    _242 = _254;
                }
                float _256 = _242;
                float _258 = -_238;
                float _260 = _258 + 1.0;
                float _262 = _256;
                if (_210)
                {
                    float _264 = _246 + _250;
                    _252 = as_type<int>(_264);
                }
                int _266 = _252;
                if (_214)
                {
                    float _268 = _256 + _260;
                    _262 = _268;
                }
                float _270 = _262;
                _196 = _266;
                _198 = _270;
            }
            int _272 = _196;
            float _274 = _198;
            int _276 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _278 = _276 != 0;
            int _280 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _282 = _280 != 0;
            int _284 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _286 = _284 != 0;
            int _288 = _272;
            int _290 = as_type<int>(_274);
            _148 = 1065353216;
            if (_282)
            {
                float _292 = -as_type<float>(_272);
                float _294 = _292 + 1.0;
                _288 = as_type<int>(_294);
            }
            int _296 = _288;
            if (_286)
            {
                float _298 = -_274;
                float _300 = _298 + 1.0;
                _290 = as_type<int>(_300);
            }
            int _302 = _290;
            bool _304 = !_278;
            float _306 = _304 ? as_type<float>(_296) : as_type<float>(_302);
            bool _308 = !_278;
            float _310 = _308 ? as_type<float>(_302) : as_type<float>(_296);
            _145 = _310;
            _150 = _306;
        }
    }
    _152 = false;
    float _312 = _145;
    int _314 = _148;
    float _316 = _150;
    float _318 = _312 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _320 = _312 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    out.m_27.w = as_type<float>(_314);
    bool _322 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    float _324 = fma(_316, (*spvDescriptorSet0.vp_c3)._m0[8].x, _318);
    float _326 = fma(_316, (*spvDescriptorSet0.vp_c3)._m0[7].x, _320);
    float _328 = _324 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _330 = _326 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _332 = -_328;
    float _334 = _332 + 1.0;
    out.m_27.x = _330;
    out.m_27.y = _334;
    bool _336 = !_322;
    float _338 = as_type<float>(_314);
    float _364;
    int _366;
    float _368;
    if (!_336)
    {
        float _340 = _55 * (*spvDescriptorSet0.vp_c3)._m0[21].y;
        float _342 = _55 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _344 = _55 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _346 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[21].x, _340);
        float _348 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[18].x, _342);
        float _350 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[19].x, _344);
        float _352 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[21].z, _346);
        float _354 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[18].z, _348);
        float _356 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[19].z, _350);
        float _358 = _352 + (*spvDescriptorSet0.vp_c3)._m0[21].w;
        float _360 = _354 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _362 = _356 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _364 = _362;
        _366 = as_type<int>(_358);
        _368 = _360;
        _370 = true;
    }
    else
    {
        int _372 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _374 = _372 != 0;
        float _376 = _316;
        float _378 = _330;
        if (!_374)
        {
            float _380 = in.m_24.x;
            float _382 = in.m_24.y;
            _376 = _380;
            _378 = _382;
        }
        float _384 = _376;
        float _386 = _378;
        if (!_374)
        {
            _338 = 1.0;
        }
        float _388 = _338;
        bool _390 = !_374;
        float _392 = _388;
        _364 = _386;
        _366 = as_type<int>(_388);
        _368 = _384;
        if (!_390)
        {
            int _394 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _396 = _394 != 0;
            float _398 = _384;
            float _400 = _386;
            if (!_396)
            {
                float _402 = in.m_24.x;
                float _404 = in.m_24.y;
                _398 = _402;
                _400 = _404;
            }
            float _406 = _398;
            float _408 = _400;
            bool _410 = !_396;
            float _412 = _406;
            int _414 = as_type<int>(_406);
            float _416 = _408;
            if (!_410)
            {
                int _418 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _420 = _418 != 0;
                float _422 = in.m_24.x;
                float _424 = in.m_24.y;
                int _426 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _428 = _426 != 0;
                int _430 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _432 = _430 != 0;
                int _434 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _436 = _434 != 0;
                int _438 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _440 = _438 != 0;
                if (_420)
                {
                    _412 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _442 = _412;
                float _444 = _442;
                if (_420)
                {
                    _392 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _446 = _392;
                float _448 = _446;
                if (!_420)
                {
                    _444 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _450 = _444;
                if (!_420)
                {
                    _448 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _452 = _448;
                float _454 = _450 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _456 = _452 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _458 = _422;
                float _460 = _424;
                if (_436)
                {
                    float _462 = _454 * _422;
                    _458 = _462;
                }
                float _464 = _458;
                float _466 = -_454;
                float _468 = _466 + 1.0;
                int _470 = as_type<int>(_464);
                if (_440)
                {
                    float _472 = _456 * _424;
                    _460 = _472;
                }
                float _474 = _460;
                float _476 = -_456;
                float _478 = _476 + 1.0;
                float _480 = _474;
                if (_428)
                {
                    float _482 = _464 + _468;
                    _470 = as_type<int>(_482);
                }
                int _484 = _470;
                if (_432)
                {
                    float _486 = _474 + _478;
                    _480 = _486;
                }
                float _488 = _480;
                _414 = _484;
                _416 = _488;
            }
            int _490 = _414;
            float _492 = _416;
            int _494 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _496 = _494 != 0;
            int _498 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _500 = _498 != 0;
            int _502 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _504 = _502 != 0;
            int _506 = _490;
            int _508 = as_type<int>(_492);
            _366 = 1065353216;
            if (_500)
            {
                float _510 = -as_type<float>(_490);
                float _512 = _510 + 1.0;
                _506 = as_type<int>(_512);
            }
            int _514 = _506;
            if (_504)
            {
                float _516 = -_492;
                float _518 = _516 + 1.0;
                _508 = as_type<int>(_518);
            }
            int _520 = _508;
            bool _522 = !_496;
            float _524 = _522 ? as_type<float>(_514) : as_type<float>(_520);
            bool _526 = !_496;
            float _528 = _526 ? as_type<float>(_520) : as_type<float>(_514);
            _364 = _528;
            _368 = _524;
        }
    }
    _370 = false;
    float _530 = _364;
    int _532 = _366;
    float _534 = _368;
    float _536 = _530 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _538 = _530 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    out.m_29.w = as_type<float>(_532);
    bool _540 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].z);
    float _542 = fma(_534, (*spvDescriptorSet0.vp_c3)._m0[10].x, _536);
    float _544 = fma(_534, (*spvDescriptorSet0.vp_c3)._m0[9].x, _538);
    float _546 = _542 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _548 = _544 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _550 = -_546;
    float _552 = _550 + 1.0;
    out.m_29.x = _548;
    out.m_29.y = _552;
    bool _554 = !_540;
    float _580;
    int _582;
    float _584;
    if (!_554)
    {
        float _556 = _55 * (*spvDescriptorSet0.vp_c3)._m0[25].y;
        float _558 = _55 * (*spvDescriptorSet0.vp_c3)._m0[22].y;
        float _560 = _55 * (*spvDescriptorSet0.vp_c3)._m0[23].y;
        float _562 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[25].x, _556);
        float _564 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[22].x, _558);
        float _566 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[23].x, _560);
        float _568 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[25].z, _562);
        float _570 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[22].z, _564);
        float _572 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[23].z, _566);
        float _574 = _568 + (*spvDescriptorSet0.vp_c3)._m0[25].w;
        float _576 = _570 + (*spvDescriptorSet0.vp_c3)._m0[22].w;
        float _578 = _572 + (*spvDescriptorSet0.vp_c3)._m0[23].w;
        _580 = _578;
        _582 = as_type<int>(_574);
        _584 = _576;
        _586 = true;
    }
    else
    {
        int _588 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _590 = _588 != 0;
        float _592 = _49;
        float _594 = as_type<float>(_532);
        if (!_590)
        {
            float _596 = in.m_24.x;
            float _598 = in.m_24.y;
            _592 = _596;
            _594 = _598;
        }
        float _600 = _592;
        float _602 = _594;
        if (!_590)
        {
            _119 = 1.0;
        }
        float _604 = _119;
        bool _606 = !_590;
        _580 = _602;
        _582 = as_type<int>(_604);
        _584 = _600;
        if (!_606)
        {
            int _608 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _610 = _608 != 0;
            float _612 = _604;
            float _614 = _55;
            if (!_610)
            {
                float _616 = in.m_24.x;
                float _618 = in.m_24.y;
                _612 = _616;
                _614 = _618;
            }
            float _620 = _612;
            float _622 = _614;
            bool _624 = !_610;
            float _626 = _622;
            float _628 = _620;
            int _630 = as_type<int>(_620);
            float _632 = _622;
            if (!_624)
            {
                float _634 = in.m_24.x;
                float _636 = in.m_24.y;
                int _638 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _640 = _638 != 0;
                int _642 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _644 = _642 != 0;
                int _646 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _648 = _646 != 0;
                int _650 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _652 = _650 != 0;
                int _654 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _656 = _654 != 0;
                if (_640)
                {
                    _626 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _658 = _626;
                float _660 = _658;
                if (_640)
                {
                    _628 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _662 = _628;
                float _664 = _662;
                if (!_640)
                {
                    _660 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _666 = _660;
                if (!_640)
                {
                    _664 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _668 = _664;
                float _670 = _666 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _672 = _668 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _674 = _634;
                float _676 = _636;
                if (_652)
                {
                    float _678 = _670 * _634;
                    _674 = _678;
                }
                float _680 = _674;
                float _682 = -_670;
                float _684 = _682 + 1.0;
                int _686 = as_type<int>(_680);
                if (_656)
                {
                    float _688 = _672 * _636;
                    _676 = _688;
                }
                float _690 = _676;
                float _692 = -_672;
                float _694 = _692 + 1.0;
                float _696 = _690;
                if (_644)
                {
                    float _698 = _680 + _684;
                    _686 = as_type<int>(_698);
                }
                int _700 = _686;
                if (_648)
                {
                    float _702 = _690 + _694;
                    _696 = _702;
                }
                float _704 = _696;
                _630 = _700;
                _632 = _704;
            }
            int _706 = _630;
            float _708 = _632;
            int _710 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _712 = _710 != 0;
            int _714 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _716 = _714 != 0;
            int _718 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _720 = _718 != 0;
            int _722 = _706;
            int _724 = as_type<int>(_708);
            _582 = 1065353216;
            if (_716)
            {
                float _726 = -as_type<float>(_706);
                float _728 = _726 + 1.0;
                _722 = as_type<int>(_728);
            }
            int _730 = _722;
            if (_720)
            {
                float _732 = -_708;
                float _734 = _732 + 1.0;
                _724 = as_type<int>(_734);
            }
            int _736 = _724;
            bool _738 = !_712;
            float _740 = _738 ? as_type<float>(_730) : as_type<float>(_736);
            bool _742 = !_712;
            float _744 = _742 ? as_type<float>(_736) : as_type<float>(_730);
            _580 = _744;
            _584 = _740;
        }
    }
    _586 = false;
    float _746 = _580;
    int _748 = _582;
    float _750 = _584;
    float _752 = _746 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _754 = _746 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    out.m_31.w = as_type<float>(_748);
    float _756 = fma(_750, (*spvDescriptorSet0.vp_c3)._m0[12].x, _752);
    float _758 = fma(_750, (*spvDescriptorSet0.vp_c3)._m0[11].x, _754);
    float _760 = _756 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _762 = _758 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _764 = -_760;
    float _766 = _764 + 1.0;
    out.m_31.x = _762;
    out.m_31.y = _766;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_27.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_27.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_27.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_27.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

