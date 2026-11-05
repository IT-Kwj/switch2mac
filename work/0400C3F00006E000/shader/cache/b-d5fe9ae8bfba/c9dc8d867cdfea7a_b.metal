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
    constant _16* fp_c10 [[id(0)]];
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c9 [[id(2)]];
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
    float4 m_41 [[user(locn1), flat]];
    float4 m_35 [[user(locn2)]];
    float4 m_39 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _51 = gl_FragCoord.w;
    float _53 = in.m_35.x;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_35.y;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = 1.0 / _51;
    float _67 = _65 * _57;
    float _69 = _65 * _63;
    float2 _1093 = float2(_67, _69);
    float2 _73 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1093, float2(0.0), isnan(_1093))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1093, float2(0.0), isnan(_1093))).xy;
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
    float _95 = fma(_75, 0.119999997317790985107421875, _91);
    float _97 = fma(_77, 0.119999997317790985107421875, _93);
    float2 _1137 = float2(_95, _97);
    float2 _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1137, float2(0.0), isnan(_1137))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1137, float2(0.0), isnan(_1137))).xw;
    float _101 = _99.x;
    float _103 = _99.y;
    float _105 = in.m_37.x;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_39.y;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_39.x;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = _65 * _109;
    float _125 = in.m_39.z;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _133 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _135 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _137 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[2].x, _135);
    float _139 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[0].x, _131);
    float _141 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[1].x, _133);
    float _143 = _103 * _103;
    float _145 = 0.0 + _143;
    float _147 = precise::clamp(_145, 0.0, 1.0);
    float _149 = _147 * _123;
    bool _153 = _149 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _155 = isnan(_149);
    bool _157 = _153 || _155;
    bool _159 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _161 = _157 || _159;
    if (!_161)
    {
        discard_fragment();
    }
    float _163 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[2].z, _137);
    float _165 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[0].z, _139);
    float _167 = _65 * _115;
    float _169 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[1].z, _141);
    float _171 = _163 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _173 = _65 * _121;
    float _175 = _167 * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _177 = _65 * _129;
    float _179 = 1.0 / _171;
    float _181 = _165 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _183 = fma(_173, (*spvDescriptorSet0.fp_c8)._m0[2].x, _175);
    float _185 = _169 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _187 = fma(_177, (*spvDescriptorSet0.fp_c8)._m0[2].z, _183);
    float _189 = _187 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _191 = _189 * _179;
    float _193 = _167 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _195 = fma(_173, (*spvDescriptorSet0.fp_c8)._m0[0].x, _193);
    float _197 = fma(_177, (*spvDescriptorSet0.fp_c8)._m0[0].z, _195);
    float _199 = _197 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _201 = -_199;
    float _203 = fma(_181, _191, _201);
    float _205 = _167 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _207 = fma(_173, (*spvDescriptorSet0.fp_c8)._m0[1].x, _205);
    float _209 = fma(_177, (*spvDescriptorSet0.fp_c8)._m0[1].z, _207);
    float _211 = _209 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _213 = -_211;
    float _215 = fma(_185, _191, _213);
    float _217 = abs(_203);
    float _219 = abs(_215);
    float _221 = precise::max(_217, _219);
    bool _223 = _221 >= 16.0;
    float _225 = _203;
    float _227 = _215;
    int _230 = as_type<int>(_221);
    if (_223)
    {
        float _232 = _203 * 0.0625;
        _225 = _232;
    }
    float _234 = _225;
    if (_223)
    {
        float _236 = _215 * 0.0625;
        _227 = _236;
    }
    float _238 = _227;
    float _240 = abs(_234);
    bool _242 = _240 != 0.0;
    bool _244 = isnan(_240);
    bool _246 = _242 || _244;
    bool _248 = isnan(0.0);
    bool _250 = _246 || _248;
    float _252 = abs(_238);
    bool _254 = _252 == 0.0;
    float _256 = abs(_238);
    bool _258 = _256 == 0.0;
    bool _260 = !_250;
    bool _262 = _258 && _260;
    bool _264 = false;
    if (_262)
    {
        bool _266 = as_type<int>(_238) >= 0;
        _264 = _266;
    }
    bool _268 = _264;
    int _270 = _268 ? (-1) : 0;
    if (_262)
    {
        int _272 = _268 ? 0 : 1078530011;
        _230 = _272;
    }
    int _274 = _230;
    int _276 = _274;
    if (_262)
    {
        int _278 = int(0x80000000) & as_type<int>(_234);
        int _280 = _274 | _278;
        _276 = _280;
    }
    int _282 = _276;
    bool _284 = !_250;
    bool _286 = _284 && _254;
    int _288 = _282;
    float _290 = as_type<float>(_282);
    if (!_286)
    {
        float _292 = abs(_234);
        bool _294 = _292 != as_type<float>(0x7f800000u /* inf */);
        bool _296 = isnan(_292);
        bool _298 = _294 || _296;
        bool _300 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _302 = _298 || _300;
        float _304 = abs(_238);
        bool _306 = _304 == as_type<float>(0x7f800000u /* inf */);
        float _308 = abs(_238);
        bool _310 = _308 == as_type<float>(0x7f800000u /* inf */);
        bool _312 = !_302;
        bool _314 = _310 && _312;
        if (_314)
        {
            bool _316 = as_type<int>(_238) >= 0;
            _270 = _316 ? (-1) : 0;
        }
        int _318 = _270;
        if (_314)
        {
            _288 = 1075235812;
        }
        int _320 = _288;
        int _322 = _320;
        if (_314)
        {
            int _324 = ~_318;
            int _326 = (_324 != 0) ? _320 : 1061752795;
            _322 = _326;
        }
        int _328 = _322;
        float _330 = as_type<float>(_328);
        if (_314)
        {
            int _332 = int(0x80000000) & as_type<int>(_234);
            int _334 = _328 | _332;
            _330 = as_type<float>(_334);
        }
        float _336 = _330;
        bool _338 = !_302;
        bool _340 = _338 && _306;
        _290 = _336;
        if (!_340)
        {
            float _342 = abs(_234);
            float _344 = abs(_238);
            float _346 = precise::max(_342, _344);
            float _348 = abs(_234);
            float _350 = abs(_238);
            float _352 = precise::min(_348, _350);
            float _354 = 1.0 / _346;
            float _356 = abs(_234);
            float _358 = abs(_238);
            bool _360 = _356 > _358;
            bool _362 = as_type<int>(_238) >= 0;
            float _364 = _352 * _354;
            float _366 = abs(_234);
            float _368 = abs(_238);
            float _370 = _366 + _368;
            int _372 = as_type<int>(_234) & int(0x80000000);
            float _374 = _364 * _364;
            bool _376 = _370 > as_type<float>(0x7f800000u /* inf */);
            bool _378 = isnan(_370);
            bool _380 = _376 || _378;
            bool _382 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _384 = _380 || _382;
            float _386 = _374 + 11.33538818359375;
            float _388 = fma(_374, _386, 28.84246826171875);
            float _390 = fma(_374, _388, 19.6966705322265625);
            float _392 = fma(_374, -0.82336294651031494140625, -5.674867153167724609375);
            float _394 = fma(_374, _392, -6.565555095672607421875);
            float _396 = 1.0 / _390;
            float _398 = _374 * _394;
            float _400 = _364 * _398;
            float _402 = fma(_400, _396, _364);
            float _404 = _402;
            _290 = _370;
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
            if (!_384)
            {
                int _420 = _372 | _418;
                _290 = as_type<float>(_420);
            }
        }
    }
    float _422 = _290;
    float _424 = in.m_41.x;
    float _426 = in.m_41.y;
    float _428 = -_167;
    float _430 = _428 + (*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _432 = -_173;
    float _434 = _432 + (*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _436 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _438 = (*spvDescriptorSet0.fp_c9)._m0[108].w + _436;
    float _440 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _442 = _440 + (*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _444 = _430 * _430;
    float _446 = 1.0 / _438;
    float _448 = fma(_434, _434, _444);
    float _450 = -_177;
    float _452 = _450 + (*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _454 = -(*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _456 = (*spvDescriptorSet0.fp_c9)._m0[191].y + _454;
    float _458 = fma(_452, _452, _448);
    float _460 = 1.0 / _442;
    float _462 = -(*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _464 = (*spvDescriptorSet0.fp_c9)._m0[110].z + _462;
    float _466 = 1.0 / _456;
    float _468 = fma(_424, 0.4000000059604644775390625, _422);
    float _470 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _472 = (*spvDescriptorSet0.fp_c9)._m0[110].w + _470;
    float _474 = _468 * 1.5;
    float _476 = 1.0 / _472;
    float _478 = _474 * 0.15915493667125701904296875;
    float _480 = -(*spvDescriptorSet0.fp_c9)._m0[110].w;
    float _482 = _480 + (*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _484 = -(*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _486 = (*spvDescriptorSet0.fp_c9)._m0[112].w + _484;
    float _488 = -(*spvDescriptorSet0.fp_c9)._m0[112].w;
    float _490 = _488 + (*spvDescriptorSet0.fp_c9)._m0[113].w;
    float _492 = 1.0 / _482;
    float _494 = fma(_426, 0.5, 0.5);
    float _496 = _478 * 6.283185482025146484375;
    float _498 = sin(_496);
    float _500 = 1.0 / _490;
    float _502 = fma(_498, 0.5, 0.5);
    float _504 = precise::clamp(_502, 0.0, 1.0);
    float _506 = 1.0 / _486;
    float _508 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _510 = _504 + _508;
    float _512 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _514 = _504 + _512;
    float _516 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _518 = _504 + _516;
    float _520 = -(*spvDescriptorSet0.fp_c9)._m0[112].w;
    float _522 = _504 + _520;
    float _524 = _510 * _446;
    float _526 = _514 * _476;
    float _528 = _518 * _460;
    float _530 = _522 * _500;
    float _532 = -(*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _534 = (*spvDescriptorSet0.fp_c9)._m0[108].z + _532;
    float _536 = -(*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _538 = (*spvDescriptorSet0.fp_c9)._m0[108].x + _536;
    float _540 = -(*spvDescriptorSet0.fp_c9)._m0[108].x;
    float _542 = _540 + (*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _544 = -(*spvDescriptorSet0.fp_c9)._m0[108].y;
    float _546 = _544 + (*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _548 = -(*spvDescriptorSet0.fp_c9)._m0[108].z;
    float _550 = _548 + (*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _552 = -(*spvDescriptorSet0.fp_c9)._m0[110].w;
    float _554 = _504 + _552;
    float _556 = fma(_542, _528, (*spvDescriptorSet0.fp_c9)._m0[108].x);
    float _558 = fma(_546, _528, (*spvDescriptorSet0.fp_c9)._m0[108].y);
    float _560 = fma(_550, _528, (*spvDescriptorSet0.fp_c9)._m0[108].z);
    float _562 = _554 * _492;
    float _564 = sqrt(_458);
    float _566 = -(*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _568 = (*spvDescriptorSet0.fp_c9)._m0[108].y + _566;
    float _570 = -(*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _572 = _504 + _570;
    float _574 = fma(_538, _524, (*spvDescriptorSet0.fp_c9)._m0[107].x);
    float _576 = -(*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _578 = (*spvDescriptorSet0.fp_c9)._m0[110].x + _576;
    float _580 = fma(_568, _524, (*spvDescriptorSet0.fp_c9)._m0[107].y);
    float _582 = -(*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _584 = (*spvDescriptorSet0.fp_c9)._m0[110].y + _582;
    float _586 = -(*spvDescriptorSet0.fp_c9)._m0[110].x;
    float _588 = _586 + (*spvDescriptorSet0.fp_c9)._m0[111].x;
    float _590 = fma(_578, _526, (*spvDescriptorSet0.fp_c9)._m0[109].x);
    float _592 = -(*spvDescriptorSet0.fp_c9)._m0[110].z;
    float _594 = _592 + (*spvDescriptorSet0.fp_c9)._m0[111].z;
    float _596 = fma(_584, _526, (*spvDescriptorSet0.fp_c9)._m0[109].y);
    float _598 = fma(_464, _526, (*spvDescriptorSet0.fp_c9)._m0[109].z);
    float _600 = _572 * _506;
    float _602 = precise::max(_564, (*spvDescriptorSet0.fp_c9)._m0[191].x);
    float _604 = -(*spvDescriptorSet0.fp_c9)._m0[110].y;
    float _606 = _604 + (*spvDescriptorSet0.fp_c9)._m0[111].y;
    float _608 = fma(_534, _524, (*spvDescriptorSet0.fp_c9)._m0[107].z);
    float _610 = -(*spvDescriptorSet0.fp_c9)._m0[111].y;
    float _612 = (*spvDescriptorSet0.fp_c9)._m0[112].y + _610;
    float _614 = precise::min(_602, (*spvDescriptorSet0.fp_c9)._m0[191].y);
    float _616 = fma(_588, _562, (*spvDescriptorSet0.fp_c9)._m0[110].x);
    bool _618 = _504 >= (*spvDescriptorSet0.fp_c9)._m0[112].w;
    bool _620 = isnan(_504);
    bool _622 = _618 || _620;
    bool _624 = isnan((*spvDescriptorSet0.fp_c9)._m0[112].w);
    bool _626 = _622 || _624;
    float _628 = float(_626);
    float _630 = fma(_606, _562, (*spvDescriptorSet0.fp_c9)._m0[110].y);
    float _632 = -(*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _634 = _614 + _632;
    float _636 = fma(_612, _600, (*spvDescriptorSet0.fp_c9)._m0[111].y);
    float _638 = -_628;
    float _640 = _638 + 1.0;
    float _642 = _634 * _466;
    bool _644 = _504 >= (*spvDescriptorSet0.fp_c9)._m0[111].w;
    bool _646 = isnan(_504);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.fp_c9)._m0[111].w);
    bool _652 = _648 || _650;
    float _654 = float(_652);
    float _656 = fma(_594, _562, (*spvDescriptorSet0.fp_c9)._m0[110].z);
    float _658 = -(*spvDescriptorSet0.fp_c9)._m0[111].x;
    float _660 = (*spvDescriptorSet0.fp_c9)._m0[112].x + _658;
    float _662 = -(*spvDescriptorSet0.fp_c9)._m0[111].z;
    float _664 = (*spvDescriptorSet0.fp_c9)._m0[112].z + _662;
    float _666 = -(*spvDescriptorSet0.fp_c9)._m0[112].x;
    float _668 = _666 + (*spvDescriptorSet0.fp_c9)._m0[113].x;
    float _670 = _654 * _640;
    float _672 = fma(_660, _600, (*spvDescriptorSet0.fp_c9)._m0[111].x);
    float _674 = abs(_642);
    float _676 = log2(_674);
    float _678 = fma(_664, _600, (*spvDescriptorSet0.fp_c9)._m0[111].z);
    bool _680 = _504 >= (*spvDescriptorSet0.fp_c9)._m0[110].w;
    bool _682 = isnan(_504);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.fp_c9)._m0[110].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = -_654;
    float _694 = _692 + 1.0;
    bool _696 = _504 >= (*spvDescriptorSet0.fp_c9)._m0[109].w;
    bool _698 = isnan(_504);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.fp_c9)._m0[109].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    float _708 = -(*spvDescriptorSet0.fp_c9)._m0[112].y;
    float _710 = _708 + (*spvDescriptorSet0.fp_c9)._m0[113].y;
    float _712 = fma(_668, _530, (*spvDescriptorSet0.fp_c9)._m0[112].x);
    float _714 = _690 * _694;
    float _716 = -_690;
    float _718 = _716 + 1.0;
    float _720 = fma(_642, -60.0, 120.0);
    bool _722 = _504 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _724 = isnan(_504);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _730 = _726 || _728;
    float _732 = float(_730);
    float _734 = -(*spvDescriptorSet0.fp_c9)._m0[112].z;
    float _736 = _734 + (*spvDescriptorSet0.fp_c9)._m0[113].z;
    float _738 = _706 * _718;
    float _740 = -_706;
    float _742 = _740 + 1.0;
    bool _744 = _504 >= (*spvDescriptorSet0.fp_c9)._m0[113].w;
    bool _746 = isnan(_504);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.fp_c9)._m0[113].w);
    bool _752 = _748 || _750;
    float _754 = float(_752);
    float _756 = fma(_710, _530, (*spvDescriptorSet0.fp_c9)._m0[112].y);
    float _758 = _676 * 1.5;
    float _760 = _732 * _742;
    bool _762 = _504 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _764 = isnan(_504);
    bool _766 = _762 || _764;
    bool _768 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _770 = _766 || _768;
    float _772 = float(_770);
    float _774 = -_732;
    float _776 = _774 + 1.0;
    float _778 = exp2(_758);
    float _780 = -_754;
    float _782 = _780 + 1.0;
    float _784 = _720 * _494;
    float _786 = _772 * _776;
    float _788 = -_772;
    float _790 = _788 + 1.0;
    float _792 = _628 * _782;
    float _794 = fma(_736, _530, (*spvDescriptorSet0.fp_c9)._m0[112].z);
    float _796 = _574 * _786;
    float _798 = _580 * _786;
    float _800 = _608 * _786;
    float _802 = fma(_790, (*spvDescriptorSet0.fp_c9)._m0[107].x, _796);
    float _804 = fma(_790, (*spvDescriptorSet0.fp_c9)._m0[107].y, _798);
    float _806 = 1.0 / _784;
    float _808 = fma(_790, (*spvDescriptorSet0.fp_c9)._m0[107].z, _800);
    float _810 = fma(_556, _760, _802);
    float _812 = _778 * 60.0;
    float _814 = fma(_558, _760, _804);
    float _816 = -(*spvDescriptorSet0.fp_c9)._m0[123].w;
    float _818 = (*spvDescriptorSet0.fp_c9)._m0[124].w + _816;
    float _820 = fma(_590, _738, _810);
    float _822 = _812 + _784;
    float _824 = precise::max(_812, (*spvDescriptorSet0.fp_c10)._m0[2].x);
    float _826 = -(*spvDescriptorSet0.fp_c9)._m0[124].w;
    float _828 = _826 + (*spvDescriptorSet0.fp_c9)._m0[125].w;
    float _830 = 1.0 / _818;
    float _832 = fma(_596, _738, _814);
    float _834 = precise::min(_822, _824);
    float _836 = fma(_616, _714, _820);
    float _838 = fma(_560, _760, _808);
    float _840 = -(*spvDescriptorSet0.fp_c9)._m0[125].w;
    float _842 = (*spvDescriptorSet0.fp_c9)._m0[126].w + _840;
    float _844 = fma(_630, _714, _832);
    float _846 = -_812;
    float _848 = _846 + _834;
    float _850 = 1.0 / _828;
    float _852 = fma(_598, _738, _838);
    float _854 = fma(_672, _670, _836);
    float _856 = _848 * _806;
    float _858 = precise::clamp(_856, 0.0, 1.0);
    float _860 = fma(_636, _670, _844);
    float _862 = fma(_656, _714, _852);
    float _864 = -(*spvDescriptorSet0.fp_c9)._m0[123].w;
    float _866 = _858 + _864;
    float _868 = 1.0 / _842;
    float _870 = fma(_678, _670, _862);
    float _872 = _866 * _830;
    float _874 = -(*spvDescriptorSet0.fp_c9)._m0[124].w;
    float _876 = _858 + _874;
    float _878 = fma(_756, _792, _860);
    float _880 = -(*spvDescriptorSet0.fp_c9)._m0[123].y;
    float _882 = (*spvDescriptorSet0.fp_c9)._m0[124].y + _880;
    float _884 = -(*spvDescriptorSet0.fp_c9)._m0[123].z;
    float _886 = (*spvDescriptorSet0.fp_c9)._m0[124].z + _884;
    float _888 = _876 * _850;
    float _890 = -(*spvDescriptorSet0.fp_c9)._m0[123].x;
    float _892 = (*spvDescriptorSet0.fp_c9)._m0[124].x + _890;
    float _894 = -(*spvDescriptorSet0.fp_c9)._m0[125].w;
    float _896 = _858 + _894;
    float _898 = fma(_882, _872, (*spvDescriptorSet0.fp_c9)._m0[123].y);
    float _900 = fma(_886, _872, (*spvDescriptorSet0.fp_c9)._m0[123].z);
    float _902 = fma(_892, _872, (*spvDescriptorSet0.fp_c9)._m0[123].x);
    bool _904 = _858 >= (*spvDescriptorSet0.fp_c9)._m0[124].w;
    bool _906 = isnan(_858);
    bool _908 = _904 || _906;
    bool _910 = isnan((*spvDescriptorSet0.fp_c9)._m0[124].w);
    bool _912 = _908 || _910;
    float _914 = float(_912);
    float _916 = _896 * _868;
    bool _918 = _858 >= (*spvDescriptorSet0.fp_c9)._m0[126].w;
    bool _920 = isnan(_858);
    bool _922 = _918 || _920;
    bool _924 = isnan((*spvDescriptorSet0.fp_c9)._m0[126].w);
    bool _926 = _922 || _924;
    float _928 = float(_926);
    float _930 = -(*spvDescriptorSet0.fp_c9)._m0[124].x;
    float _932 = _930 + (*spvDescriptorSet0.fp_c9)._m0[125].x;
    bool _934 = _858 >= (*spvDescriptorSet0.fp_c9)._m0[125].w;
    bool _936 = isnan(_858);
    bool _938 = _934 || _936;
    bool _940 = isnan((*spvDescriptorSet0.fp_c9)._m0[125].w);
    bool _942 = _938 || _940;
    float _944 = float(_942);
    float _946 = -(*spvDescriptorSet0.fp_c9)._m0[124].y;
    float _948 = _946 + (*spvDescriptorSet0.fp_c9)._m0[125].y;
    float _950 = -(*spvDescriptorSet0.fp_c9)._m0[124].z;
    float _952 = _950 + (*spvDescriptorSet0.fp_c9)._m0[125].z;
    bool _954 = _858 >= (*spvDescriptorSet0.fp_c9)._m0[123].w;
    bool _956 = isnan(_858);
    bool _958 = _954 || _956;
    bool _960 = isnan((*spvDescriptorSet0.fp_c9)._m0[123].w);
    bool _962 = _958 || _960;
    float _964 = float(_962);
    float _966 = fma(_712, _792, _854);
    float _968 = -_914;
    float _970 = _968 + 1.0;
    float _972 = -_928;
    float _974 = _972 + 1.0;
    float _976 = -_944;
    float _978 = _976 + 1.0;
    float _980 = fma(_932, _888, (*spvDescriptorSet0.fp_c9)._m0[124].x);
    float _982 = fma(_948, _888, (*spvDescriptorSet0.fp_c9)._m0[124].y);
    float _984 = fma(_952, _888, (*spvDescriptorSet0.fp_c9)._m0[124].z);
    float _986 = _944 * _974;
    float _988 = _964 * _970;
    float _990 = _914 * _978;
    float _992 = -_964;
    float _994 = _992 + 1.0;
    float _996 = _902 * _988;
    float _998 = _898 * _988;
    float _1000 = _900 * _988;
    float _1002 = -(*spvDescriptorSet0.fp_c9)._m0[125].x;
    float _1004 = (*spvDescriptorSet0.fp_c9)._m0[126].x + _1002;
    float _1006 = -(*spvDescriptorSet0.fp_c9)._m0[125].y;
    float _1008 = (*spvDescriptorSet0.fp_c9)._m0[126].y + _1006;
    float _1010 = fma(_994, (*spvDescriptorSet0.fp_c9)._m0[123].x, _996);
    float _1012 = fma(_994, (*spvDescriptorSet0.fp_c9)._m0[123].y, _998);
    float _1014 = -(*spvDescriptorSet0.fp_c9)._m0[125].z;
    float _1016 = (*spvDescriptorSet0.fp_c9)._m0[126].z + _1014;
    float _1018 = fma(_994, (*spvDescriptorSet0.fp_c9)._m0[123].z, _1000);
    float _1020 = fma(_1004, _916, (*spvDescriptorSet0.fp_c9)._m0[125].x);
    float _1022 = fma(_1008, _916, (*spvDescriptorSet0.fp_c9)._m0[125].y);
    float _1024 = fma(_980, _990, _1010);
    float _1026 = fma(_982, _990, _1012);
    float _1028 = fma(_1016, _916, (*spvDescriptorSet0.fp_c9)._m0[125].z);
    float _1030 = fma(_984, _990, _1018);
    float _1032 = fma(_1020, _986, _1024);
    float _1034 = fma(_1022, _986, _1026);
    float _1036 = fma(_794, _792, _870);
    float _1038 = fma(_1028, _986, _1030);
    float _1040 = fma(_754, (*spvDescriptorSet0.fp_c9)._m0[113].x, _966);
    float _1042 = fma(_754, (*spvDescriptorSet0.fp_c9)._m0[113].y, _878);
    float _1044 = fma(_928, (*spvDescriptorSet0.fp_c9)._m0[126].x, _1032);
    float _1046 = fma(_928, (*spvDescriptorSet0.fp_c9)._m0[126].y, _1034);
    float _1048 = fma(_754, (*spvDescriptorSet0.fp_c9)._m0[113].z, _1036);
    float _1050 = fma(_928, (*spvDescriptorSet0.fp_c9)._m0[126].z, _1038);
    float _1052 = fma(_1044, _101, _1040);
    float _1054 = fma(_1046, _101, _1042);
    float _1056 = fma(_1050, _101, _1048);
    if (!_161)
    {
        out.m_44.x = _1052;
        out.m_44.y = _1054;
        out.m_44.z = _1056;
        out.m_44.w = _143;
        return out;
    }
    float _1058 = 0.0 + _149;
    float _1060 = precise::clamp(_1058, 0.0, 1.0);
    out.m_44.x = _1052;
    out.m_44.y = _1054;
    out.m_44.z = _1056;
    out.m_44.w = _1060;
    return out;
}

