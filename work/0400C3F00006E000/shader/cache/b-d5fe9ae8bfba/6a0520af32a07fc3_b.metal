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
    constant _16* fp_c13 [[id(1)]];
    constant _16* fp_c7 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    constant _16* fp_c8 [[id(4)]];
    texture2d<float> fp_t_tcb_20 [[id(5)]];
    sampler fp_t_tcb_20Smplr [[id(6)]];
    sampler fp_t_tcb_20Smplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_46 [[user(locn2)]];
    float4 m_41 [[user(locn3)]];
    float4 m_39 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _53 = gl_FragCoord.w;
    float _55 = in.m_37.w;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_39.w;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_41.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = 1.0 / _53;
    float _75 = _73 * _59;
    float _77 = _73 * _65;
    float _79 = _73 * _71;
    float _81 = _75 * _77;
    float _83 = 0.0 + _81;
    float _85 = precise::clamp(_83, 0.0, 1.0);
    float _87 = _85 * _79;
    bool _91 = _87 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _93 = isnan(_87);
    bool _95 = _91 || _93;
    bool _97 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _99 = _95 || _97;
    float _101 = in.m_37.y;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_37.x;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_39.x;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_39.y;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_37.z;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_39.z;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = _75;
    if (!_99)
    {
        discard_fragment();
    }
    float _139 = _73 * _105;
    float _141 = _73 * _111;
    float _143 = _73 * _117;
    float _145 = _73 * _123;
    float _147 = _73 * _129;
    float _149 = _73 * _135;
    float _151 = _141 * _143;
    float _153 = _139 * _145;
    float _155 = _147 * _149;
    if (!_99)
    {
        out.m_44.x = _151;
        out.m_44.y = _153;
        out.m_44.z = _155;
        out.m_44.w = _81;
        return out;
    }
    float _157 = in.m_46.w;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = in.m_46.y;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = in.m_46.x;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = (*spvDescriptorSet0.fp_c13)._m0[2].w * 0.5;
    float _177 = precise::max(0.001000000047497451305389404296875, (*spvDescriptorSet0.fp_c13)._m0[0].y);
    float _179 = precise::max(0.001000000047497451305389404296875, (*spvDescriptorSet0.fp_c13)._m0[0].x);
    float _181 = _177 * (*spvDescriptorSet0.fp_c7)._m0[0].y;
    float _183 = _179 * (*spvDescriptorSet0.fp_c7)._m0[0].x;
    float _185 = _181 * 0.5;
    float _187 = 1.0 / _185;
    float _189 = _73 * _161;
    float _191 = _73 * _167;
    float _193 = _175 + (-0.5);
    float _195 = _73 * _173;
    float _197 = 1.0 / _189;
    float _199 = fma(_191, _197, _193);
    float _201 = fma(_195, _197, -0.5);
    float _203 = _183 * 0.5;
    float _205 = _199 * (*spvDescriptorSet0.fp_c7)._m0[0].y;
    float _207 = _201 * (*spvDescriptorSet0.fp_c7)._m0[0].x;
    float _209 = 1.0 / _203;
    float _211 = (*spvDescriptorSet0.fp_c7)._m0[0].x * 0.5;
    float _213 = _205 * _205;
    float _215 = _205 * 0.0625;
    float _217 = fma(_207, _207, _213);
    float _219 = rsqrt(_217);
    float _221 = sqrt(_217);
    float _223 = _205 * _219;
    float _225 = _207 * _219;
    float _227 = _223 * _187;
    bool _229 = _223 >= 0.0;
    bool _231 = isnan(_223);
    bool _233 = _229 || _231;
    bool _235 = isnan(0.0);
    bool _237 = _233 || _235;
    float _239 = _225 * _209;
    float _241 = abs(_225);
    float _243 = precise::max(_241, 0.001000000047497451305389404296875);
    float _245 = _227 * _227;
    float _247 = fma(_239, _239, _245);
    float _249 = 1.0 / _243;
    float _251 = _175 * (*spvDescriptorSet0.fp_c7)._m0[0].y;
    float _253 = precise::min((*spvDescriptorSet0.fp_c7)._m0[0].x, (*spvDescriptorSet0.fp_c7)._m0[0].y);
    float _255 = -_251;
    float _257 = fma((*spvDescriptorSet0.fp_c7)._m0[0].y, 0.5, _255);
    float _259 = abs(_207);
    float _261 = abs(_205);
    float _263 = precise::max(_259, _261);
    float _265 = _253 * 0.5;
    float _267 = 0.0;
    int _270 = as_type<int>(_215);
    if (!_237)
    {
        float _272 = 1.0 / _211;
        _267 = _272;
    }
    float _274 = _267;
    bool _276 = _263 >= 16.0;
    float _278 = _207 * 0.0625;
    float _280 = _276 ? _215 : _205;
    float _282 = rsqrt(_247);
    float _284 = abs(_223);
    float _286 = _284 * _249;
    float _288 = _276 ? _278 : _207;
    float _290 = abs(_280);
    bool _292 = _290 != 0.0;
    bool _294 = isnan(_290);
    bool _296 = _292 || _294;
    bool _298 = isnan(0.0);
    bool _300 = _296 || _298;
    float _302 = abs(_288);
    bool _304 = _302 == 0.0;
    float _306 = _249;
    float _308 = _288;
    if (!_237)
    {
        float _310 = _257 * _274;
        _306 = _310;
    }
    float _312 = _306;
    float _314 = abs(_288);
    bool _316 = _314 == 0.0;
    bool _318 = !_300;
    bool _320 = _316 && _318;
    float _322 = 1.0 / _265;
    bool _324 = _286 > _312;
    bool _326 = !_237;
    bool _328 = _324 && _326;
    bool _330 = _286 > _312;
    float _332 = _227 * _282;
    float _334 = _239 * _282;
    float _336 = _185 * _332;
    float _338 = _203 * _334;
    bool _340 = false;
    if (_320)
    {
        bool _342 = as_type<int>(_288) >= 0;
        _340 = _342;
    }
    bool _344 = _340;
    float _346 = _336 * _336;
    float _348 = _203;
    int _350 = _344 ? (-1) : 0;
    if (_328)
    {
        float _352 = abs(_223);
        float _354 = 1.0 / _352;
        _348 = _354;
    }
    float _356 = _348;
    if (_320)
    {
        int _358 = _344 ? 0 : 1078530011;
        _270 = _358;
    }
    int _360 = _270;
    float _362 = fma(_338, _338, _346);
    int _364 = _360;
    if (_320)
    {
        int _366 = int(0x80000000) & as_type<int>(_280);
        int _368 = _360 | _366;
        _364 = _368;
    }
    int _370 = _364;
    float _372 = sqrt(_362);
    bool _374 = !_300;
    bool _376 = _374 && _304;
    int _378 = _370;
    float _380 = as_type<float>(_370);
    float _382 = _356;
    if (!_376)
    {
        float _384 = abs(_280);
        bool _386 = _384 != as_type<float>(0x7f800000u /* inf */);
        bool _388 = isnan(_384);
        bool _390 = _386 || _388;
        bool _392 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _394 = _390 || _392;
        float _396 = abs(_288);
        bool _398 = _396 == as_type<float>(0x7f800000u /* inf */);
        float _400 = abs(_288);
        bool _402 = _400 == as_type<float>(0x7f800000u /* inf */);
        bool _404 = !_394;
        bool _406 = _402 && _404;
        if (_406)
        {
            bool _408 = as_type<int>(_288) >= 0;
            _350 = _408 ? (-1) : 0;
        }
        int _410 = _350;
        if (_406)
        {
            _378 = 1075235812;
        }
        int _412 = _378;
        int _414 = _412;
        if (_406)
        {
            int _416 = ~_410;
            int _418 = (_416 != 0) ? _412 : 1061752795;
            _414 = _418;
        }
        int _420 = _414;
        float _422 = as_type<float>(_420);
        if (_406)
        {
            int _424 = int(0x80000000) & as_type<int>(_280);
            int _426 = _420 | _424;
            _422 = as_type<float>(_426);
        }
        float _428 = _422;
        bool _430 = !_394;
        bool _432 = _430 && _398;
        _380 = _428;
        if (!_432)
        {
            float _434 = abs(_280);
            float _436 = abs(_288);
            float _438 = precise::max(_434, _436);
            float _440 = abs(_280);
            float _442 = abs(_288);
            float _444 = _440 + _442;
            float _446 = abs(_280);
            float _448 = abs(_288);
            float _450 = precise::min(_446, _448);
            float _452 = 1.0 / _438;
            float _454 = abs(_280);
            float _456 = abs(_288);
            bool _458 = _454 > _456;
            bool _460 = as_type<int>(_288) >= 0;
            bool _462 = _444 > as_type<float>(0x7f800000u /* inf */);
            bool _464 = isnan(_444);
            bool _466 = _462 || _464;
            bool _468 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _470 = _466 || _468;
            int _472 = as_type<int>(_280) & int(0x80000000);
            float _474 = _450 * _452;
            float _476 = _474 * _474;
            float _478 = _476 + 11.33538818359375;
            float _480 = fma(_476, _478, 28.84246826171875);
            float _482 = fma(_476, _480, 19.6966705322265625);
            float _484 = fma(_476, -0.82336294651031494140625, -5.674867153167724609375);
            float _486 = fma(_476, _484, -6.565555095672607421875);
            float _488 = 1.0 / _482;
            float _490 = _476 * _486;
            float _492 = _474 * _490;
            float _494 = fma(_492, _488, _474);
            float _496 = _494;
            _308 = as_type<float>(_472);
            _380 = _444;
            if (_458)
            {
                float _498 = -_494;
                float _500 = _498 + 1.57079637050628662109375;
                _496 = _500;
            }
            float _502 = _496;
            int _504 = as_type<int>(_502);
            if (!_460)
            {
                float _506 = -_502;
                float _508 = _506 + 3.1415927410125732421875;
                _504 = as_type<int>(_508);
            }
            int _510 = _504;
            if (!_470)
            {
                int _512 = _472 | _510;
                _380 = as_type<float>(_512);
            }
        }
    }
    float _514 = _308;
    float _516 = _380;
    if (_328)
    {
        float _518 = _257 * _356;
        _382 = _518;
    }
    float _520 = _382;
    bool _522 = !_237;
    bool _524 = _522 && _330;
    float _526 = _520;
    if (!_524)
    {
        bool _528 = _223 > 0.0;
        float _530 = fma((*spvDescriptorSet0.fp_c13)._m0[2].w, 0.5, 0.5);
        float _532 = _530 * (*spvDescriptorSet0.fp_c7)._m0[0].y;
        float _534 = _514;
        float _536 = 0.5;
        float _538 = _532;
        if (_528)
        {
            float _540 = 1.0 / _211;
            _534 = _540;
        }
        float _542 = _534;
        if (_528)
        {
            float _544 = _532 * _542;
            _536 = _544;
        }
        float _546 = _536;
        bool _548 = _286 > _546;
        bool _550 = _548 && _528;
        float _552 = _546;
        if (_550)
        {
            float _554 = abs(_223);
            float _556 = 1.0 / _554;
            _552 = _556;
        }
        float _558 = _552;
        float _560 = (*spvDescriptorSet0.fp_c13)._m0[2].w;
        if (!_550)
        {
            float _562 = abs(_225);
            float _564 = 1.0 / _562;
            _560 = _564;
        }
        float _566 = _560;
        if (_550)
        {
            float _568 = _532 * _558;
            _538 = _568;
        }
        float _570 = _538;
        _526 = _570;
        if (!_550)
        {
            float _572 = _211 * _566;
            _526 = _572;
        }
    }
    float _574 = _526;
    float _576 = -_372;
    float _578 = _576 + _574;
    float _580 = _221 * _322;
    float _582 = -_372;
    float _584 = _221 + _582;
    float _586 = precise::max(_578, 0.001000000047497451305389404296875);
    float _588 = (*spvDescriptorSet0.fp_c13)._m0[1].x * 1.60000002384185791015625;
    float _590 = fma(_516, -0.15915493667125701904296875, -0.25);
    float _592 = 1.0 / _586;
    float _594 = _588 * 2.0;
    float _596 = _588 * 3.0;
    float _598 = -_588;
    float _600 = fma(_580, _598, _221);
    float _602 = _588 * 4.0;
    float _604 = -_594;
    float _606 = fma(_580, _604, _221);
    float _608 = -_596;
    float _610 = fma(_580, _608, _221);
    float _612 = -_372;
    float _614 = _612 + _600;
    float _616 = -_602;
    float _618 = fma(_580, _616, _221);
    float _620 = -_372;
    float _622 = _620 + _606;
    float _624 = -_372;
    float _626 = _624 + _610;
    float _628 = -_372;
    float _630 = _628 + _618;
    float _632 = _584 * _592;
    float _634 = _592 * _614;
    float _636 = _592 * _622;
    float _638 = _592 * _626;
    float _640 = _592 * _630;
    float2 _1920 = float2(_590, _632);
    float3 _644 = dm_bs(spvDescriptorSet0.fp_t_tcb_20.sample(spvDescriptorSet0.fp_t_tcb_20Smplr, select(_1920, float2(0.0), isnan(_1920))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_20, spvDescriptorSet0.fp_t_tcb_20Smplr_w, select(_1920, float2(0.0), isnan(_1920))).xyz;
    float _646 = _644.x;
    float _648 = _644.y;
    float _650 = _644.z;
    float2 _1936 = float2(_590, _634);
    float3 _652 = dm_bs(spvDescriptorSet0.fp_t_tcb_20.sample(spvDescriptorSet0.fp_t_tcb_20Smplr, select(_1936, float2(0.0), isnan(_1936))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_20, spvDescriptorSet0.fp_t_tcb_20Smplr_w, select(_1936, float2(0.0), isnan(_1936))).xyz;
    float _654 = _652.x;
    float _656 = _652.y;
    float _658 = _652.z;
    float2 _1950 = float2(_590, _636);
    float3 _660 = dm_bs(spvDescriptorSet0.fp_t_tcb_20.sample(spvDescriptorSet0.fp_t_tcb_20Smplr, select(_1950, float2(0.0), isnan(_1950))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_20, spvDescriptorSet0.fp_t_tcb_20Smplr_w, select(_1950, float2(0.0), isnan(_1950))).xyz;
    float _662 = _660.x;
    float _664 = _660.y;
    float _666 = _660.z;
    float2 _1964 = float2(_590, _638);
    float3 _668 = dm_bs(spvDescriptorSet0.fp_t_tcb_20.sample(spvDescriptorSet0.fp_t_tcb_20Smplr, select(_1964, float2(0.0), isnan(_1964))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_20, spvDescriptorSet0.fp_t_tcb_20Smplr_w, select(_1964, float2(0.0), isnan(_1964))).xyz;
    float _670 = _668.x;
    float _672 = _668.y;
    float _674 = _668.z;
    float2 _1978 = float2(_590, _640);
    float3 _676 = dm_bs(spvDescriptorSet0.fp_t_tcb_20.sample(spvDescriptorSet0.fp_t_tcb_20Smplr, select(_1978, float2(0.0), isnan(_1978))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_20, spvDescriptorSet0.fp_t_tcb_20Smplr_w, select(_1978, float2(0.0), isnan(_1978))).xyz;
    float _678 = _676.x;
    float _680 = _676.y;
    float _682 = _676.z;
    float _684 = in.m_46.z;
    float _686 = gl_FragCoord.w;
    float _688 = _684 * _686;
    float _690 = _588 * 7.0;
    float _692 = _73 * _688;
    float _694 = _646 * 0.100000001490116119384765625;
    float _696 = _648 * 0.100000001490116119384765625;
    float _698 = _650 * 0.100000001490116119384765625;
    float _700 = fma(_654, 0.100000001490116119384765625, _694);
    float _702 = _588 * 5.0;
    float _704 = fma(_656, 0.100000001490116119384765625, _696);
    float _706 = _588 * 6.0;
    float _708 = fma(_658, 0.100000001490116119384765625, _698);
    float _710 = _588 * 8.0;
    float _712 = _588 * 9.0;
    float _714 = -_702;
    float _716 = fma(_580, _714, _221);
    float _718 = -_706;
    float _720 = fma(_580, _718, _221);
    float _722 = fma(_664, 0.100000001490116119384765625, _704);
    float _724 = -_690;
    float _726 = fma(_580, _724, _221);
    float _728 = -_710;
    float _730 = fma(_580, _728, _221);
    float _732 = -_712;
    float _734 = fma(_580, _732, _221);
    float _736 = fma(_662, 0.100000001490116119384765625, _700);
    float _738 = -_372;
    float _740 = _738 + _716;
    float _742 = -_372;
    float _744 = _742 + _720;
    float _746 = fma(_672, 0.100000001490116119384765625, _722);
    float _748 = -_372;
    float _750 = _748 + _726;
    float _752 = -_372;
    float _754 = _752 + _730;
    float _756 = fma(_666, 0.100000001490116119384765625, _708);
    float _758 = fma(_670, 0.100000001490116119384765625, _736);
    float _760 = -_372;
    float _762 = _760 + _734;
    float _764 = _592 * _740;
    float _766 = _592 * _744;
    float _768 = _592 * _750;
    float _770 = _592 * _754;
    float _772 = _762 * _592;
    float _774 = fma(_674, 0.100000001490116119384765625, _756);
    float _776 = fma(_680, 0.100000001490116119384765625, _746);
    float2 _2124 = float2(_590, _764);
    float3 _778 = dm_bs(spvDescriptorSet0.fp_t_tcb_20.sample(spvDescriptorSet0.fp_t_tcb_20Smplr, select(_2124, float2(0.0), isnan(_2124))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_20, spvDescriptorSet0.fp_t_tcb_20Smplr_w, select(_2124, float2(0.0), isnan(_2124))).xyz;
    float _780 = _778.x;
    float _782 = _778.y;
    float _784 = _778.z;
    float2 _2138 = float2(_590, _766);
    float3 _786 = dm_bs(spvDescriptorSet0.fp_t_tcb_20.sample(spvDescriptorSet0.fp_t_tcb_20Smplr, select(_2138, float2(0.0), isnan(_2138))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_20, spvDescriptorSet0.fp_t_tcb_20Smplr_w, select(_2138, float2(0.0), isnan(_2138))).xyz;
    float _788 = _786.x;
    float _790 = _786.y;
    float _792 = _786.z;
    float2 _2152 = float2(_590, _768);
    float3 _794 = dm_bs(spvDescriptorSet0.fp_t_tcb_20.sample(spvDescriptorSet0.fp_t_tcb_20Smplr, select(_2152, float2(0.0), isnan(_2152))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_20, spvDescriptorSet0.fp_t_tcb_20Smplr_w, select(_2152, float2(0.0), isnan(_2152))).xyz;
    float _796 = _794.x;
    float _798 = _794.y;
    float _800 = _794.z;
    float2 _2166 = float2(_590, _770);
    float3 _802 = dm_bs(spvDescriptorSet0.fp_t_tcb_20.sample(spvDescriptorSet0.fp_t_tcb_20Smplr, select(_2166, float2(0.0), isnan(_2166))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_20, spvDescriptorSet0.fp_t_tcb_20Smplr_w, select(_2166, float2(0.0), isnan(_2166))).xyz;
    float _804 = _802.x;
    float _806 = _802.y;
    float _808 = _802.z;
    float _810 = fma(_678, 0.100000001490116119384765625, _758);
    float2 _2183 = float2(_590, _772);
    float3 _812 = dm_bs(spvDescriptorSet0.fp_t_tcb_20.sample(spvDescriptorSet0.fp_t_tcb_20Smplr, select(_2183, float2(0.0), isnan(_2183))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_20, spvDescriptorSet0.fp_t_tcb_20Smplr_w, select(_2183, float2(0.0), isnan(_2183))).xyz;
    float _814 = _812.x;
    float _816 = _812.y;
    float _818 = _812.z;
    float _820 = _75 * _79;
    float _822 = fma(_682, 0.100000001490116119384765625, _774);
    float _824 = fma((*spvDescriptorSet0.fp_c13)._m0[2].z, (*spvDescriptorSet0.fp_c7)._m0[0].y, _181);
    float _826 = fma((*spvDescriptorSet0.fp_c7)._m0[0].x, (*spvDescriptorSet0.fp_c13)._m0[2].y, _183);
    float _828 = _824 * 0.5;
    float _830 = _826 * 0.5;
    float _832 = 1.0 / _828;
    float _834 = 1.0 / _830;
    float _836 = _223 * _832;
    float _838 = _225 * _834;
    float _840 = _836 * _836;
    float _842 = fma(_838, _838, _840);
    float _844 = rsqrt(_842);
    float _846 = _836 * _844;
    float _848 = _838 * _844;
    float _850 = _828 * _846;
    float _852 = _830 * _848;
    float _854 = _850 * _850;
    float _856 = fma(_852, _852, _854);
    float _858 = sqrt(_856);
    float _860 = -_372;
    float _862 = _860 + _858;
    float _864 = 1.0 / _862;
    float _866 = _864 * _584;
    bool _868 = _866 >= 0.0;
    bool _870 = isnan(_866);
    bool _872 = _868 || _870;
    bool _874 = isnan(0.0);
    bool _876 = _872 || _874;
    float _878 = _864;
    float _880 = _862;
    float _882 = _866;
    if (!_876)
    {
        _137 = 0.0;
    }
    float _884 = _137;
    bool _886 = !_876;
    float _888 = _884;
    float _890 = _884;
    float _892 = _806;
    if (!_886)
    {
        bool _894 = _866 >= 0.33329999446868896484375;
        bool _896 = isnan(_866);
        bool _898 = _894 || _896;
        bool _900 = isnan(0.33329999446868896484375);
        bool _902 = _898 || _900;
        if (!_902)
        {
            _878 = (*spvDescriptorSet0.fp_c13)._m0[1].y;
        }
        float _904 = _878;
        float _906 = _904;
        if (!_902)
        {
            float _908 = _866 * 3.0;
            _888 = _908;
        }
        float _910 = _888;
        float _912 = _910;
        if (!_902)
        {
            float _914 = -_904;
            float _916 = _914 + (*spvDescriptorSet0.fp_c13)._m0[1].z;
            _906 = _916;
        }
        float _918 = _906;
        float _920 = _918;
        if (!_902)
        {
            float _922 = fma(_910, _918, (*spvDescriptorSet0.fp_c13)._m0[1].y);
            _912 = _922;
        }
        float _924 = _912;
        float _926 = _924;
        if (!_902)
        {
            float _928 = _820 * _924;
            _926 = _928;
        }
        float _930 = _926;
        bool _932 = !_902;
        float _934 = _930;
        _890 = _930;
        if (!_932)
        {
            bool _936 = _866 >= 0.66670000553131103515625;
            bool _938 = isnan(_866);
            bool _940 = _936 || _938;
            bool _942 = isnan(0.66670000553131103515625);
            bool _944 = _940 || _942;
            float _946 = 3.0;
            if (!_944)
            {
                _920 = (*spvDescriptorSet0.fp_c13)._m0[1].z;
            }
            float _948 = _920;
            float _950 = _948;
            if (!_944)
            {
                float _952 = fma(_866, 3.0, -1.0);
                _934 = _952;
            }
            float _954 = _934;
            float _956 = _954;
            if (_944)
            {
                _880 = (*spvDescriptorSet0.fp_c13)._m0[1].w;
            }
            float _958 = _880;
            if (_944)
            {
                float _960 = fma(_866, 3.0, -2.0);
                _882 = _960;
            }
            float _962 = _882;
            float _964 = _962;
            if (!_944)
            {
                float _966 = -_948;
                float _968 = _966 + (*spvDescriptorSet0.fp_c13)._m0[1].w;
                _950 = _968;
            }
            float _970 = _950;
            if (_944)
            {
                float _972 = -_958;
                float _974 = _972 + (*spvDescriptorSet0.fp_c13)._m0[2].x;
                _946 = _974;
            }
            float _976 = _946;
            if (!_944)
            {
                float _978 = fma(_954, _970, (*spvDescriptorSet0.fp_c13)._m0[1].z);
                _956 = _978;
            }
            float _980 = _956;
            float _982 = _980;
            if (_944)
            {
                float _984 = fma(_962, _976, (*spvDescriptorSet0.fp_c13)._m0[1].w);
                _964 = _984;
            }
            float _986 = _964;
            if (!_944)
            {
                float _988 = _820 * _980;
                _982 = _988;
            }
            float _990 = _982;
            _890 = _990;
            if (_944)
            {
                float _992 = _820 * _986;
                _890 = _992;
            }
        }
    }
    float _994 = _890;
    float _996 = fma(_780, 0.100000001490116119384765625, _810);
    float _998 = fma(_782, 0.100000001490116119384765625, _776);
    float _1000 = fma(_784, 0.100000001490116119384765625, _822);
    float _1002 = fma(_788, 0.100000001490116119384765625, _996);
    float _1004 = fma(_790, 0.100000001490116119384765625, _998);
    float _1006 = fma(_792, 0.100000001490116119384765625, _1000);
    bool _1008 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _1010 = fma(_796, 0.100000001490116119384765625, _1002);
    float _1012 = fma(_798, 0.100000001490116119384765625, _1004);
    float _1014 = fma(_800, 0.100000001490116119384765625, _1006);
    float _1016 = fma(_804, 0.100000001490116119384765625, _1010);
    float _1018 = fma(_806, 0.100000001490116119384765625, _1012);
    float _1020 = fma(_808, 0.100000001490116119384765625, _1014);
    float _1022 = fma(_814, 0.100000001490116119384765625, _1016);
    float _1024 = fma(_816, 0.100000001490116119384765625, _1018);
    float _1026 = fma(_818, 0.100000001490116119384765625, _1020);
    float _1028 = _141 * _1022;
    float _1030 = _139 * _1024;
    float _1032 = _147 * _1026;
    if (!_1008)
    {
        _892 = _994;
    }
    float _1034 = _892;
    bool _1036 = !_1008;
    float _1038 = _1034;
    if (!_1036)
    {
        float _1040 = _692 * _197;
        float _1042 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _1044 = fma(_1040, (*spvDescriptorSet0.fp_c8)._m0[30].w, _1042);
        float _1046 = 1.0 / _1044;
        float _1048 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _1050 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _1052 = fma(_1046, _1048, _1050);
        float _1054 = _1052 * 8.0;
        float _1056 = precise::clamp(_1054, 0.0, 1.0);
        float _1058 = _1056 * _994;
        _1038 = _1058;
    }
    float _1060 = _1038;
    float _1062 = 0.0 + _1060;
    float _1064 = precise::clamp(_1062, 0.0, 1.0);
    out.m_44.x = _1028;
    out.m_44.y = _1030;
    out.m_44.z = _1032;
    out.m_44.w = _1064;
    return out;
}

