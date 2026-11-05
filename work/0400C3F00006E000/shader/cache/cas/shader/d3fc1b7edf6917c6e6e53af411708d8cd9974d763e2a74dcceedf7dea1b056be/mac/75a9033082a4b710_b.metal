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
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_41 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _53 = gl_FragCoord.w;
    float _55 = in.m_35.x;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_35.y;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = 1.0 / _53;
    float _69 = _67 * _59;
    float _71 = _67 * _65;
    float2 _797 = float2(_69, _71);
    float2 _75 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_797, float2(0.0), isnan(_797))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_797, float2(0.0), isnan(_797))).xy;
    float _77 = _75.x;
    float _79 = _75.y;
    float _81 = in.m_35.z;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_35.w;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = _67 * _85;
    float _95 = _67 * _91;
    float _97 = fma(_77, (*spvDescriptorSet0.fp_c9)._m0[191].x, _93);
    float _99 = fma(_79, (*spvDescriptorSet0.fp_c9)._m0[191].x, _95);
    float2 _846 = float2(_97, _99);
    float _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_846, float2(0.0), isnan(_846))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_846, float2(0.0), isnan(_846))).w;
    float _103 = in.m_37.w;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_39.x;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = _67 * _107;
    float _117 = _67 * _113;
    float _119 = in.m_41.y;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_41.x;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_41.z;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _139 = _67 * _123;
    float _141 = _139 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _143 = _139 * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _145 = _115 * _101;
    float _147 = 0.0 + _145;
    float _149 = precise::clamp(_147, 0.0, 1.0);
    float _151 = _149 * _117;
    bool _155 = _151 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _157 = isnan(_151);
    bool _159 = _155 || _157;
    bool _161 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _163 = _159 || _161;
    if (!_163)
    {
        discard_fragment();
    }
    float _165 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _167 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _169 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[0].x, _165);
    float _171 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[1].x, _137);
    float _173 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[2].x, _167);
    float _175 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[2].z, _173);
    float _177 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[0].z, _169);
    float _179 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[1].z, _171);
    float _181 = _67 * _129;
    float _183 = _175 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _185 = _139 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _187 = _67 * _135;
    float _189 = fma(_181, (*spvDescriptorSet0.fp_c8)._m0[1].x, _141);
    float _191 = _177 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _193 = fma(_181, (*spvDescriptorSet0.fp_c8)._m0[0].x, _185);
    float _195 = 1.0 / _183;
    float _197 = fma(_181, (*spvDescriptorSet0.fp_c8)._m0[2].x, _143);
    float _199 = fma(_187, (*spvDescriptorSet0.fp_c8)._m0[1].z, _189);
    float _201 = fma(_187, (*spvDescriptorSet0.fp_c8)._m0[0].z, _193);
    float _203 = _179 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _205 = fma(_187, (*spvDescriptorSet0.fp_c8)._m0[2].z, _197);
    float _207 = _201 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _209 = _205 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _211 = _209 * _195;
    float _213 = -_207;
    float _215 = fma(_191, _211, _213);
    float _217 = _199 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _219 = -_217;
    float _221 = fma(_203, _211, _219);
    float _223 = abs(_215);
    float _225 = abs(_221);
    float _227 = precise::max(_223, _225);
    bool _229 = _227 >= 16.0;
    float _231 = _215;
    float _233 = _221;
    int _236 = as_type<int>(_195);
    float _238 = _227;
    if (_229)
    {
        float _240 = _215 * 0.0625;
        _231 = _240;
    }
    float _242 = _231;
    if (_229)
    {
        float _244 = _221 * 0.0625;
        _233 = _244;
    }
    float _246 = _233;
    float _248 = abs(_242);
    bool _250 = _248 != 0.0;
    bool _252 = isnan(_248);
    bool _254 = _250 || _252;
    bool _256 = isnan(0.0);
    bool _258 = _254 || _256;
    float _260 = abs(_246);
    bool _262 = _260 == 0.0;
    float _264 = abs(_246);
    bool _266 = _264 == 0.0;
    bool _268 = !_258;
    bool _270 = _266 && _268;
    bool _272 = false;
    if (_270)
    {
        bool _274 = as_type<int>(_246) >= 0;
        _272 = _274;
    }
    bool _276 = _272;
    int _278 = _276 ? (-1) : 0;
    if (_270)
    {
        int _280 = _276 ? 0 : 1078530011;
        _236 = _280;
    }
    int _282 = _236;
    int _284 = _282;
    if (_270)
    {
        int _286 = int(0x80000000) & as_type<int>(_242);
        int _288 = _282 | _286;
        _238 = as_type<float>(_288);
    }
    float _290 = _238;
    bool _292 = !_258;
    bool _294 = _292 && _262;
    float _296 = _290;
    float _298 = _290;
    if (!_294)
    {
        float _300 = abs(_242);
        bool _302 = _300 != as_type<float>(0x7f800000u /* inf */);
        bool _304 = isnan(_300);
        bool _306 = _302 || _304;
        bool _308 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _310 = _306 || _308;
        float _312 = abs(_246);
        bool _314 = _312 == as_type<float>(0x7f800000u /* inf */);
        float _316 = abs(_246);
        bool _318 = _316 == as_type<float>(0x7f800000u /* inf */);
        bool _320 = !_310;
        bool _322 = _318 && _320;
        if (_322)
        {
            bool _324 = as_type<int>(_246) >= 0;
            _278 = _324 ? (-1) : 0;
        }
        int _326 = _278;
        if (_322)
        {
            _284 = 1075235812;
        }
        int _328 = _284;
        int _330 = _328;
        if (_322)
        {
            int _332 = ~_326;
            int _334 = (_332 != 0) ? _328 : 1061752795;
            _330 = _334;
        }
        int _336 = _330;
        if (_322)
        {
            int _338 = int(0x80000000) & as_type<int>(_242);
            int _340 = _336 | _338;
            _296 = as_type<float>(_340);
        }
        float _342 = _296;
        bool _344 = !_310;
        bool _346 = _344 && _314;
        _298 = _342;
        if (!_346)
        {
            float _348 = abs(_242);
            float _350 = abs(_246);
            float _352 = precise::max(_348, _350);
            float _354 = abs(_242);
            float _356 = abs(_246);
            float _358 = precise::min(_354, _356);
            float _360 = 1.0 / _352;
            float _362 = abs(_242);
            float _364 = abs(_246);
            bool _366 = _362 > _364;
            bool _368 = as_type<int>(_246) >= 0;
            float _370 = _358 * _360;
            float _372 = abs(_242);
            float _374 = abs(_246);
            float _376 = _372 + _374;
            int _378 = as_type<int>(_242) & int(0x80000000);
            float _380 = _370 * _370;
            bool _382 = _376 > as_type<float>(0x7f800000u /* inf */);
            bool _384 = isnan(_376);
            bool _386 = _382 || _384;
            bool _388 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _390 = _386 || _388;
            float _392 = _380 + 11.33538818359375;
            float _394 = fma(_380, _392, 28.84246826171875);
            float _396 = fma(_380, _394, 19.6966705322265625);
            float _398 = fma(_380, -0.82336294651031494140625, -5.674867153167724609375);
            float _400 = fma(_380, _398, -6.565555095672607421875);
            float _402 = 1.0 / _396;
            float _404 = _380 * _400;
            float _406 = _370 * _404;
            float _408 = fma(_406, _402, _370);
            float _410 = _408;
            _298 = _376;
            if (_366)
            {
                float _412 = -_408;
                float _414 = _412 + 1.57079637050628662109375;
                _410 = _414;
            }
            float _416 = _410;
            int _418 = as_type<int>(_416);
            if (!_368)
            {
                float _420 = -_416;
                float _422 = _420 + 3.1415927410125732421875;
                _418 = as_type<int>(_422);
            }
            int _424 = _418;
            if (!_390)
            {
                int _426 = _378 | _424;
                _298 = as_type<float>(_426);
            }
        }
    }
    float _428 = _298;
    float _430 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _432 = (*spvDescriptorSet0.fp_c9)._m0[108].w + _430;
    float _434 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _436 = _434 + (*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _438 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _440 = (*spvDescriptorSet0.fp_c9)._m0[110].w + _438;
    float _442 = -(*spvDescriptorSet0.fp_c9)._m0[110].w;
    float _444 = _442 + (*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _446 = 1.0 / _436;
    float _448 = -(*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _450 = (*spvDescriptorSet0.fp_c9)._m0[112].w + _448;
    float _452 = fma(_428, 0.15915493667125701904296875, 0.5);
    float _454 = precise::clamp(_452, 0.0, 1.0);
    float _456 = 1.0 / _444;
    float _458 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _460 = _454 + _458;
    float _462 = -(*spvDescriptorSet0.fp_c9)._m0[110].w;
    float _464 = _454 + _462;
    float _466 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _468 = _454 + _466;
    bool _470 = _454 >= (*spvDescriptorSet0.fp_c9)._m0[110].w;
    bool _472 = isnan(_454);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.fp_c9)._m0[110].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = -(*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _484 = (*spvDescriptorSet0.fp_c9)._m0[110].y + _482;
    float _486 = -(*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _488 = (*spvDescriptorSet0.fp_c9)._m0[110].z + _486;
    bool _490 = _454 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _492 = isnan(_454);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = 1.0 / _432;
    float _504 = _460 * _446;
    float _506 = -_480;
    float _508 = _506 + 1.0;
    float _510 = -(*spvDescriptorSet0.fp_c9)._m0[110].y;
    float _512 = _510 + (*spvDescriptorSet0.fp_c9)._m0[111].y;
    float _514 = -(*spvDescriptorSet0.fp_c9)._m0[110].z;
    float _516 = _514 + (*spvDescriptorSet0.fp_c9)._m0[111].z;
    float _518 = -(*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _520 = (*spvDescriptorSet0.fp_c9)._m0[108].x + _518;
    float _522 = 1.0 / _440;
    float _524 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _526 = _454 + _524;
    float _528 = _464 * _456;
    float _530 = -(*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _532 = (*spvDescriptorSet0.fp_c9)._m0[108].z + _530;
    float _534 = -(*spvDescriptorSet0.fp_c9)._m0[108].x;
    float _536 = _534 + (*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _538 = -(*spvDescriptorSet0.fp_c9)._m0[108].z;
    float _540 = _538 + (*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _542 = 1.0 / _450;
    float _544 = _526 * _502;
    float _546 = -(*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _548 = _454 + _546;
    float _550 = fma(_536, _504, (*spvDescriptorSet0.fp_c9)._m0[108].x);
    float _552 = fma(_540, _504, (*spvDescriptorSet0.fp_c9)._m0[108].z);
    float _554 = -(*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _556 = (*spvDescriptorSet0.fp_c9)._m0[108].y + _554;
    float _558 = fma(_520, _544, (*spvDescriptorSet0.fp_c9)._m0[107].x);
    float _560 = _468 * _522;
    float _562 = -(*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _564 = (*spvDescriptorSet0.fp_c9)._m0[110].x + _562;
    float _566 = fma(_556, _544, (*spvDescriptorSet0.fp_c9)._m0[107].y);
    float _568 = fma(_532, _544, (*spvDescriptorSet0.fp_c9)._m0[107].z);
    float _570 = -(*spvDescriptorSet0.fp_c9)._m0[108].y;
    float _572 = _570 + (*spvDescriptorSet0.fp_c9)._m0[109].y;
    bool _574 = _454 >= (*spvDescriptorSet0.fp_c9)._m0[109].w;
    bool _576 = isnan(_454);
    bool _578 = _574 || _576;
    bool _580 = isnan((*spvDescriptorSet0.fp_c9)._m0[109].w);
    bool _582 = _578 || _580;
    float _584 = float(_582);
    float _586 = -(*spvDescriptorSet0.fp_c9)._m0[110].x;
    float _588 = _586 + (*spvDescriptorSet0.fp_c9)._m0[111].x;
    float _590 = _548 * _542;
    float _592 = fma(_564, _560, (*spvDescriptorSet0.fp_c9)._m0[109].x);
    float _594 = fma(_484, _560, (*spvDescriptorSet0.fp_c9)._m0[109].y);
    float _596 = fma(_488, _560, (*spvDescriptorSet0.fp_c9)._m0[109].z);
    float _598 = fma(_572, _504, (*spvDescriptorSet0.fp_c9)._m0[108].y);
    bool _600 = _454 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _602 = isnan(_454);
    bool _604 = _600 || _602;
    bool _606 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _608 = _604 || _606;
    float _610 = float(_608);
    float _612 = -_584;
    float _614 = _612 + 1.0;
    float _616 = _584 * _508;
    bool _618 = _454 >= (*spvDescriptorSet0.fp_c9)._m0[111].w;
    bool _620 = isnan(_454);
    bool _622 = _618 || _620;
    bool _624 = isnan((*spvDescriptorSet0.fp_c9)._m0[111].w);
    bool _626 = _622 || _624;
    float _628 = float(_626);
    float _630 = fma(_588, _528, (*spvDescriptorSet0.fp_c9)._m0[110].x);
    float _632 = _610 * _614;
    float _634 = -_610;
    float _636 = _634 + 1.0;
    float _638 = -_628;
    float _640 = _638 + 1.0;
    bool _642 = _454 >= (*spvDescriptorSet0.fp_c9)._m0[112].w;
    bool _644 = isnan(_454);
    bool _646 = _642 || _644;
    bool _648 = isnan((*spvDescriptorSet0.fp_c9)._m0[112].w);
    bool _650 = _646 || _648;
    float _652 = float(_650);
    float _654 = _500 * _636;
    float _656 = -_500;
    float _658 = _656 + 1.0;
    float _660 = _480 * _640;
    float _662 = fma(_512, _528, (*spvDescriptorSet0.fp_c9)._m0[110].y);
    float _664 = _558 * _654;
    float _666 = _568 * _654;
    float _668 = in.m_43.x;
    float _670 = gl_FragCoord.w;
    float _672 = _668 * _670;
    float _674 = in.m_43.y;
    float _676 = gl_FragCoord.w;
    float _678 = _674 * _676;
    float _680 = in.m_43.z;
    float _682 = gl_FragCoord.w;
    float _684 = _680 * _682;
    float _686 = _566 * _654;
    float _688 = fma(_516, _528, (*spvDescriptorSet0.fp_c9)._m0[110].z);
    float _690 = fma(_658, (*spvDescriptorSet0.fp_c9)._m0[107].x, _664);
    float _692 = fma(_658, (*spvDescriptorSet0.fp_c9)._m0[107].z, _666);
    float _694 = fma(_658, (*spvDescriptorSet0.fp_c9)._m0[107].y, _686);
    float _696 = fma(_550, _632, _690);
    float _698 = fma(_552, _632, _692);
    float _700 = fma(_598, _632, _694);
    float _702 = -(*spvDescriptorSet0.fp_c9)._m0[111].y;
    float _704 = (*spvDescriptorSet0.fp_c9)._m0[112].y + _702;
    float _706 = -(*spvDescriptorSet0.fp_c9)._m0[111].x;
    float _708 = (*spvDescriptorSet0.fp_c9)._m0[112].x + _706;
    float _710 = -_652;
    float _712 = _710 + 1.0;
    float _714 = fma(_592, _616, _696);
    float _716 = fma(_594, _616, _700);
    float _718 = -(*spvDescriptorSet0.fp_c9)._m0[111].z;
    float _720 = (*spvDescriptorSet0.fp_c9)._m0[112].z + _718;
    float _722 = fma(_596, _616, _698);
    float _724 = fma(_708, _590, (*spvDescriptorSet0.fp_c9)._m0[111].x);
    float _726 = fma(_704, _590, (*spvDescriptorSet0.fp_c9)._m0[111].y);
    float _728 = _628 * _712;
    float _730 = fma(_630, _660, _714);
    float _732 = fma(_662, _660, _716);
    float _734 = fma(_720, _590, (*spvDescriptorSet0.fp_c9)._m0[111].z);
    float _736 = fma(_688, _660, _722);
    float _738 = fma(_724, _728, _730);
    float _740 = fma(_726, _728, _732);
    float _742 = fma(_734, _728, _736);
    float _744 = fma(_652, (*spvDescriptorSet0.fp_c9)._m0[112].y, _740);
    float _746 = _67 * _672;
    float _748 = _67 * _678;
    float _750 = _67 * _684;
    float _752 = fma(_652, (*spvDescriptorSet0.fp_c9)._m0[112].x, _738);
    float _754 = fma(_652, (*spvDescriptorSet0.fp_c9)._m0[112].z, _742);
    float _756 = _744 + _748;
    float _758 = _752 + _746;
    float _760 = _754 + _750;
    if (!_163)
    {
        out.m_46.x = _758;
        out.m_46.y = _756;
        out.m_46.z = _760;
        out.m_46.w = _145;
        return out;
    }
    float _762 = 0.0 + _151;
    float _764 = precise::clamp(_762, 0.0, 1.0);
    out.m_46.x = _758;
    out.m_46.y = _756;
    out.m_46.z = _760;
    out.m_46.w = _764;
    return out;
}

