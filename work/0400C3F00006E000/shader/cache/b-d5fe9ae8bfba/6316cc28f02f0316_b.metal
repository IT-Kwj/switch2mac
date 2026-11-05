#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c10 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_39 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _51 = gl_FragCoord.w;
    float _53 = in.m_35.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_35.x;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = 1.0 / _51;
    float _67 = _65 * _57;
    float _69 = _65 * _63;
    float2 _791 = float2(_69, _67);
    float2 _73 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_791, float2(0.0), isnan(_791))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_791, float2(0.0), isnan(_791))).xy;
    float _75 = _73.x;
    float _77 = _73.y;
    float _79 = in.m_35.z;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_35.w;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = _65 * _83;
    float _93 = _65 * _89;
    float _95 = fma(_75, (*spvDescriptorSet0.fp_c9)._m0[191].x, _91);
    float _97 = fma(_77, (*spvDescriptorSet0.fp_c9)._m0[191].x, _93);
    float2 _840 = float2(_95, _97);
    float2 _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_840, float2(0.0), isnan(_840))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_840, float2(0.0), isnan(_840))).xw;
    float _101 = _99.x;
    float _103 = _99.y;
    float _105 = in.m_37.x;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_39.y;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = _65 * _109;
    float _119 = in.m_39.z;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = _103 * _103;
    float _127 = 0.0 + _125;
    float _129 = precise::clamp(_127, 0.0, 1.0);
    float _131 = _129 * _117;
    bool _135 = _131 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _137 = isnan(_131);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _143 = _139 || _141;
    float _145 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _147 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    if (!_143)
    {
        discard_fragment();
    }
    float _149 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _151 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[0].x, _145);
    float _153 = in.m_39.x;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    float _159 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[1].x, _147);
    float _161 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[2].x, _149);
    float _163 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[2].z, _161);
    float _165 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[0].z, _151);
    float _167 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[1].z, _159);
    float _169 = _65 * _115;
    float _171 = _163 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _173 = _165 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _175 = _167 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _177 = _169 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _179 = _169 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _181 = _169 * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _183 = 1.0 / _171;
    float _185 = _65 * _123;
    float _187 = _65 * _157;
    float _189 = fma(_187, (*spvDescriptorSet0.fp_c8)._m0[0].x, _177);
    float _191 = fma(_187, (*spvDescriptorSet0.fp_c8)._m0[1].x, _179);
    float _193 = fma(_187, (*spvDescriptorSet0.fp_c8)._m0[2].x, _181);
    float _195 = fma(_185, (*spvDescriptorSet0.fp_c8)._m0[0].z, _189);
    float _197 = fma(_185, (*spvDescriptorSet0.fp_c8)._m0[1].z, _191);
    float _199 = fma(_185, (*spvDescriptorSet0.fp_c8)._m0[2].z, _193);
    float _201 = _199 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _203 = _201 * _183;
    float _205 = _195 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _207 = -_205;
    float _209 = fma(_173, _203, _207);
    float _211 = _197 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _213 = -_211;
    float _215 = fma(_175, _203, _213);
    float _217 = abs(_209);
    float _219 = abs(_215);
    float _221 = precise::max(_217, _219);
    bool _223 = _221 >= 16.0;
    float _225 = _209;
    float _227 = _215;
    int _230 = as_type<int>(_185);
    float _232 = _221;
    if (_223)
    {
        float _234 = _209 * 0.0625;
        _225 = _234;
    }
    float _236 = _225;
    if (_223)
    {
        float _238 = _215 * 0.0625;
        _227 = _238;
    }
    float _240 = _227;
    float _242 = abs(_236);
    bool _244 = _242 != 0.0;
    bool _246 = isnan(_242);
    bool _248 = _244 || _246;
    bool _250 = isnan(0.0);
    bool _252 = _248 || _250;
    float _254 = abs(_240);
    bool _256 = _254 == 0.0;
    float _258 = abs(_240);
    bool _260 = _258 == 0.0;
    bool _262 = !_252;
    bool _264 = _260 && _262;
    bool _266 = false;
    if (_264)
    {
        bool _268 = as_type<int>(_240) >= 0;
        _266 = _268;
    }
    bool _270 = _266;
    int _272 = _270 ? (-1) : 0;
    if (_264)
    {
        int _274 = _270 ? 0 : 1078530011;
        _230 = _274;
    }
    int _276 = _230;
    int _278 = _276;
    if (_264)
    {
        int _280 = int(0x80000000) & as_type<int>(_236);
        int _282 = _276 | _280;
        _232 = as_type<float>(_282);
    }
    float _284 = _232;
    bool _286 = !_252;
    bool _288 = _286 && _256;
    float _290 = _284;
    float _292 = _284;
    if (!_288)
    {
        float _294 = abs(_236);
        bool _296 = _294 != as_type<float>(0x7f800000u /* inf */);
        bool _298 = isnan(_294);
        bool _300 = _296 || _298;
        bool _302 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _304 = _300 || _302;
        float _306 = abs(_240);
        bool _308 = _306 == as_type<float>(0x7f800000u /* inf */);
        float _310 = abs(_240);
        bool _312 = _310 == as_type<float>(0x7f800000u /* inf */);
        bool _314 = !_304;
        bool _316 = _312 && _314;
        if (_316)
        {
            bool _318 = as_type<int>(_240) >= 0;
            _272 = _318 ? (-1) : 0;
        }
        int _320 = _272;
        if (_316)
        {
            _278 = 1075235812;
        }
        int _322 = _278;
        int _324 = _322;
        if (_316)
        {
            int _326 = ~_320;
            int _328 = (_326 != 0) ? _322 : 1061752795;
            _324 = _328;
        }
        int _330 = _324;
        if (_316)
        {
            int _332 = int(0x80000000) & as_type<int>(_236);
            int _334 = _330 | _332;
            _290 = as_type<float>(_334);
        }
        float _336 = _290;
        bool _338 = !_304;
        bool _340 = _338 && _308;
        _292 = _336;
        if (!_340)
        {
            float _342 = abs(_236);
            float _344 = abs(_240);
            float _346 = precise::max(_342, _344);
            float _348 = abs(_236);
            float _350 = abs(_240);
            float _352 = precise::min(_348, _350);
            float _354 = 1.0 / _346;
            float _356 = abs(_236);
            float _358 = abs(_240);
            bool _360 = _356 > _358;
            bool _362 = as_type<int>(_240) >= 0;
            float _364 = abs(_236);
            float _366 = abs(_240);
            float _368 = _364 + _366;
            int _370 = as_type<int>(_236) & int(0x80000000);
            bool _372 = _368 > as_type<float>(0x7f800000u /* inf */);
            bool _374 = isnan(_368);
            bool _376 = _372 || _374;
            bool _378 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _380 = _376 || _378;
            float _382 = _352 * _354;
            float _384 = _382 * _382;
            float _386 = _384 + 11.33538818359375;
            float _388 = fma(_384, _386, 28.84246826171875);
            float _390 = fma(_384, _388, 19.6966705322265625);
            float _392 = fma(_384, -0.82336294651031494140625, -5.674867153167724609375);
            float _394 = fma(_384, _392, -6.565555095672607421875);
            float _396 = 1.0 / _390;
            float _398 = _384 * _394;
            float _400 = _382 * _398;
            float _402 = fma(_400, _396, _382);
            float _404 = _402;
            _292 = _368;
            if (_360)
            {
                float _406 = -_402;
                float _408 = _406 + 1.57079637050628662109375;
                _404 = _408;
            }
            float _410 = _404;
            int _412 = as_type<int>(_410);
            if (!_362)
            {
                float _414 = -_410;
                float _416 = _414 + 3.1415927410125732421875;
                _412 = as_type<int>(_416);
            }
            int _418 = _412;
            if (!_380)
            {
                int _420 = _370 | _418;
                _292 = as_type<float>(_420);
            }
        }
    }
    float _422 = _292;
    float _424 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _426 = (*spvDescriptorSet0.fp_c9)._m0[108].w + _424;
    float _428 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _430 = _428 + (*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _432 = fma(_422, 0.15915493667125701904296875, 0.5);
    float _434 = precise::clamp(_432, 0.0, 1.0);
    float _436 = 1.0 / _426;
    float _438 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _440 = (*spvDescriptorSet0.fp_c9)._m0[110].w + _438;
    float _442 = -(*spvDescriptorSet0.fp_c9)._m0[110].w;
    float _444 = _442 + (*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _446 = -(*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _448 = (*spvDescriptorSet0.fp_c9)._m0[112].w + _446;
    float _450 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _452 = _434 + _450;
    float _454 = -(*spvDescriptorSet0.fp_c9)._m0[110].w;
    float _456 = _434 + _454;
    float _458 = 1.0 / _430;
    float _460 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _462 = _434 + _460;
    bool _464 = _434 >= (*spvDescriptorSet0.fp_c9)._m0[110].w;
    bool _466 = isnan(_434);
    bool _468 = _464 || _466;
    bool _470 = isnan((*spvDescriptorSet0.fp_c9)._m0[110].w);
    bool _472 = _468 || _470;
    float _474 = float(_472);
    float _476 = -(*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _478 = (*spvDescriptorSet0.fp_c9)._m0[110].z + _476;
    bool _480 = _434 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _482 = isnan(_434);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = -(*spvDescriptorSet0.fp_c9)._m0[110].z;
    float _494 = _492 + (*spvDescriptorSet0.fp_c9)._m0[111].z;
    float _496 = -_474;
    float _498 = _496 + 1.0;
    float _500 = 1.0 / _440;
    float _502 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _504 = _434 + _502;
    float _506 = _462 * _436;
    float _508 = -(*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _510 = _434 + _508;
    float _512 = 1.0 / _448;
    float _514 = _504 * _458;
    float _516 = -(*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _518 = (*spvDescriptorSet0.fp_c9)._m0[108].x + _516;
    float _520 = 1.0 / _444;
    float _522 = -(*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _524 = (*spvDescriptorSet0.fp_c9)._m0[108].y + _522;
    float _526 = _452 * _500;
    float _528 = fma(_518, _506, (*spvDescriptorSet0.fp_c9)._m0[107].x);
    float _530 = -(*spvDescriptorSet0.fp_c9)._m0[108].x;
    float _532 = _530 + (*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _534 = fma(_524, _506, (*spvDescriptorSet0.fp_c9)._m0[107].y);
    float _536 = -(*spvDescriptorSet0.fp_c9)._m0[108].y;
    float _538 = _536 + (*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _540 = -(*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _542 = (*spvDescriptorSet0.fp_c9)._m0[110].x + _540;
    float _544 = _510 * _512;
    float _546 = fma(_532, _514, (*spvDescriptorSet0.fp_c9)._m0[108].x);
    float _548 = fma(_538, _514, (*spvDescriptorSet0.fp_c9)._m0[108].y);
    float _550 = fma(_542, _526, (*spvDescriptorSet0.fp_c9)._m0[109].x);
    float _552 = -(*spvDescriptorSet0.fp_c9)._m0[110].x;
    float _554 = _552 + (*spvDescriptorSet0.fp_c9)._m0[111].x;
    float _556 = -(*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _558 = (*spvDescriptorSet0.fp_c9)._m0[108].z + _556;
    float _560 = -(*spvDescriptorSet0.fp_c9)._m0[108].z;
    float _562 = _560 + (*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _564 = _456 * _520;
    bool _566 = _434 >= (*spvDescriptorSet0.fp_c9)._m0[109].w;
    bool _568 = isnan(_434);
    bool _570 = _566 || _568;
    bool _572 = isnan((*spvDescriptorSet0.fp_c9)._m0[109].w);
    bool _574 = _570 || _572;
    float _576 = float(_574);
    float _578 = fma(_558, _506, (*spvDescriptorSet0.fp_c9)._m0[107].z);
    float _580 = fma(_562, _514, (*spvDescriptorSet0.fp_c9)._m0[108].z);
    bool _582 = _434 >= (*spvDescriptorSet0.fp_c9)._m0[111].w;
    bool _584 = isnan(_434);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.fp_c9)._m0[111].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = -(*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _596 = (*spvDescriptorSet0.fp_c9)._m0[110].y + _594;
    float _598 = -(*spvDescriptorSet0.fp_c9)._m0[110].y;
    float _600 = _598 + (*spvDescriptorSet0.fp_c9)._m0[111].y;
    float _602 = fma(_554, _564, (*spvDescriptorSet0.fp_c9)._m0[110].x);
    float _604 = fma(_596, _526, (*spvDescriptorSet0.fp_c9)._m0[109].y);
    float _606 = fma(_478, _526, (*spvDescriptorSet0.fp_c9)._m0[109].z);
    bool _608 = _434 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _610 = isnan(_434);
    bool _612 = _608 || _610;
    bool _614 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _616 = _612 || _614;
    float _618 = float(_616);
    float _620 = _576 * _498;
    float _622 = -_576;
    float _624 = _622 + 1.0;
    float _626 = fma(_600, _564, (*spvDescriptorSet0.fp_c9)._m0[110].y);
    float _628 = in.m_41.z;
    float _630 = gl_FragCoord.w;
    float _632 = _628 * _630;
    float _634 = in.m_41.y;
    float _636 = gl_FragCoord.w;
    float _638 = _634 * _636;
    float _640 = _618 * _624;
    float _642 = -_618;
    float _644 = _642 + 1.0;
    float _646 = -_592;
    float _648 = _646 + 1.0;
    float _650 = fma(_494, _564, (*spvDescriptorSet0.fp_c9)._m0[110].z);
    bool _652 = _434 >= (*spvDescriptorSet0.fp_c9)._m0[112].w;
    bool _654 = isnan(_434);
    bool _656 = _652 || _654;
    bool _658 = isnan((*spvDescriptorSet0.fp_c9)._m0[112].w);
    bool _660 = _656 || _658;
    float _662 = float(_660);
    float _664 = _490 * _644;
    float _666 = -_490;
    float _668 = _666 + 1.0;
    float _670 = _474 * _648;
    float _672 = _534 * _664;
    float _674 = _528 * _664;
    float _676 = in.m_41.x;
    float _678 = gl_FragCoord.w;
    float _680 = _676 * _678;
    float _682 = _578 * _664;
    float _684 = fma(_668, (*spvDescriptorSet0.fp_c9)._m0[107].y, _672);
    float _686 = fma(_668, (*spvDescriptorSet0.fp_c9)._m0[107].x, _674);
    float _688 = -(*spvDescriptorSet0.fp_c9)._m0[111].x;
    float _690 = (*spvDescriptorSet0.fp_c9)._m0[112].x + _688;
    float _692 = fma(_668, (*spvDescriptorSet0.fp_c9)._m0[107].z, _682);
    float _694 = fma(_548, _640, _684);
    float _696 = fma(_546, _640, _686);
    float _698 = -_662;
    float _700 = _698 + 1.0;
    float _702 = fma(_580, _640, _692);
    float _704 = -(*spvDescriptorSet0.fp_c9)._m0[111].y;
    float _706 = (*spvDescriptorSet0.fp_c9)._m0[112].y + _704;
    float _708 = fma(_550, _620, _696);
    float _710 = fma(_604, _620, _694);
    float _712 = -(*spvDescriptorSet0.fp_c9)._m0[111].z;
    float _714 = (*spvDescriptorSet0.fp_c9)._m0[112].z + _712;
    float _716 = fma(_606, _620, _702);
    float _718 = fma(_690, _544, (*spvDescriptorSet0.fp_c9)._m0[111].x);
    float _720 = _592 * _700;
    float _722 = fma(_602, _670, _708);
    float _724 = fma(_706, _544, (*spvDescriptorSet0.fp_c9)._m0[111].y);
    float _726 = fma(_626, _670, _710);
    float _728 = fma(_714, _544, (*spvDescriptorSet0.fp_c9)._m0[111].z);
    float _730 = fma(_650, _670, _716);
    float _732 = fma(_718, _720, _722);
    float _734 = fma(_724, _720, _726);
    float _736 = _65 * _638;
    float _738 = fma(_728, _720, _730);
    float _740 = fma(_662, (*spvDescriptorSet0.fp_c9)._m0[112].x, _732);
    float _742 = fma(_662, (*spvDescriptorSet0.fp_c9)._m0[112].y, _734);
    float _744 = _65 * _632;
    float _746 = fma(_662, (*spvDescriptorSet0.fp_c9)._m0[112].z, _738);
    float _748 = _65 * _680;
    float _750 = fma(_748, _101, _740);
    float _752 = fma(_736, _101, _742);
    float _754 = fma(_744, _101, _746);
    if (!_143)
    {
        out.m_44.x = _750;
        out.m_44.y = _752;
        out.m_44.z = _754;
        out.m_44.w = _125;
        return out;
    }
    float _756 = 0.0 + _131;
    float _758 = precise::clamp(_756, 0.0, 1.0);
    out.m_44.x = _750;
    out.m_44.y = _752;
    out.m_44.z = _754;
    out.m_44.w = _758;
    return out;
}

