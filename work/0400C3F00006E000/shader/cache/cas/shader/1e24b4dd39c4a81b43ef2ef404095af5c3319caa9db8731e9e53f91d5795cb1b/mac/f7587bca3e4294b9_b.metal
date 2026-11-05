#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

// Implementation of the GLSL mod() function, which is slightly different than Metal fmod()
template<typename Tx, typename Ty>
inline Tx mod(Tx x, Ty y)
{
    return x - y * floor(x / y);
}

struct _10
{
    uint _m0;
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    constant _16* fp_c4 [[id(2)]];
    constant _16* fp_c5 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    texture3d<float> fp_t_tcb_C [[id(8)]];
    sampler fp_t_tcb_CSmplr [[id(9)]];
    texture3d<float> fp_t_tcb_E [[id(10)]];
    sampler fp_t_tcb_ESmplr [[id(11)]];
    sampler fp_t_tcb_CSmplr_w [[id(12)]];
    sampler fp_t_tcb_ESmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _51(thread const int& _4729, thread const int& _4730, constant _10& support_buffer)
{
    int _4733 = 1 + _4730;
    float _4735 = support_buffer._m5[_4733].x;
    float _4737 = abs(_4735);
    bool _4739 = _4737 == 1.0;
    if (_4739)
    {
        return _4729;
    }
    float _4741 = float(_4729);
    float _4743 = _4741 / _4737;
    int _4745 = int(_4743);
    return _4745;
}

static inline __attribute__((always_inline))
int _53(thread const int& _4767, thread const int& _4768, thread const int& _4769, constant _10& support_buffer, thread float4& gl_FragCoord)
{
    int _4772 = 1 + _4768;
    float _4774 = support_buffer._m5[_4772].x;
    bool _4776 = _4774 == 1.0;
    if (_4776)
    {
        return _4767;
    }
    bool _4778 = _4774 < 0.0;
    if (_4778)
    {
        float _4780 = -_4774;
        float _4782 = float(_4767);
        float _4784 = _4782 * _4780;
        float _4786 = gl_FragCoord.x;
        float _4788 = gl_FragCoord.y;
        float _4790 = (_4769 != 0) ? _4788 : _4786;
        float _4792 = mod(_4790, _4780);
        float _4794 = _4784 + _4792;
        int _4796 = int(_4794);
        return _4796;
    }
    float _4798 = float(_4767);
    float _4800 = _4798 * _4774;
    int _4802 = int(_4800);
    return _4802;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _1809 = false;
    bool _1393 = false;
    bool _993 = false;
    bool _601 = false;
    int _56 = int2(spvDescriptorSet0.fp_t_tcb_8.get_width(), spvDescriptorSet0.fp_t_tcb_8.get_height()).x;
    int _58 = _56;
    int _60 = 0;
    int _62 = _51(_58, _60, (*spvDescriptorSet0.support_buffer));
    int _64 = int2(spvDescriptorSet0.fp_t_tcb_8.get_width(), spvDescriptorSet0.fp_t_tcb_8.get_height()).y;
    int _66 = _64;
    int _68 = 0;
    int _70 = _51(_66, _68, (*spvDescriptorSet0.support_buffer));
    float _73 = gl_FragCoord.w;
    float _75 = in.m_42.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_42.y;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = 1.0 / _73;
    float _89 = _87 * _79;
    float _91 = _87 * _85;
    float _93 = float(_70);
    float _95 = float(_62);
    float _97 = fma(_91, _93, -0.4999000132083892822265625);
    float _99 = fma(_89, _95, -0.4999000132083892822265625);
    float _101 = floor(_97);
    int _103 = int(_101);
    float _105 = floor(_99);
    int _107 = int(_105);
    int _109 = _103 + 1;
    int _111 = _107;
    int _113 = 1;
    int _115 = 0;
    int _117 = _53(_111, _113, _115, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _119 = _103;
    int _121 = 1;
    int _123 = 1;
    int _125 = _53(_119, _121, _123, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float _127 = spvDescriptorSet0.fp_t_tcb_A.read(uint2(int2(_117, _125)), 0).x;
    int _129 = _107;
    int _131 = 0;
    int _133 = 0;
    int _135 = _53(_129, _131, _133, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _137 = _103;
    int _139 = 0;
    int _141 = 1;
    int _143 = _53(_137, _139, _141, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float4 _146 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_135, _143)), 0).xyzw;
    float _148 = _146.x;
    float _150 = _146.y;
    float _152 = _146.z;
    float _154 = _146.w;
    int _156 = _107;
    int _158 = 1;
    int _160 = 0;
    int _162 = _53(_156, _158, _160, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _164 = _109;
    int _166 = 1;
    int _168 = 1;
    int _170 = _53(_164, _166, _168, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float _172 = spvDescriptorSet0.fp_t_tcb_A.read(uint2(int2(_162, _170)), 0).x;
    int _174 = _107 + 1;
    int _176 = _174;
    int _178 = 1;
    int _180 = 0;
    int _182 = _53(_176, _178, _180, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _184 = _109;
    int _186 = 1;
    int _188 = 1;
    int _190 = _53(_184, _186, _188, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float _192 = spvDescriptorSet0.fp_t_tcb_A.read(uint2(int2(_182, _190)), 0).x;
    int _194 = _174;
    int _196 = 1;
    int _198 = 0;
    int _200 = _53(_194, _196, _198, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _202 = _103;
    int _204 = 1;
    int _206 = 1;
    int _208 = _53(_202, _204, _206, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float _210 = spvDescriptorSet0.fp_t_tcb_A.read(uint2(int2(_200, _208)), 0).x;
    int _212 = _107;
    int _214 = 0;
    int _216 = 0;
    int _218 = _53(_212, _214, _216, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _220 = _109;
    int _222 = 0;
    int _224 = 1;
    int _226 = _53(_220, _222, _224, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float4 _228 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_218, _226)), 0).xyzw;
    float _230 = _228.x;
    float _232 = _228.y;
    float _234 = _228.z;
    float _236 = _228.w;
    int _238 = _174;
    int _240 = 0;
    int _242 = 0;
    int _244 = _53(_238, _240, _242, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _246 = _109;
    int _248 = 0;
    int _250 = 1;
    int _252 = _53(_246, _248, _250, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float4 _254 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_244, _252)), 0).xyzw;
    float _256 = _254.x;
    float _258 = _254.y;
    float _260 = _254.z;
    float _262 = _254.w;
    int _264 = _174;
    int _266 = 0;
    int _268 = 0;
    int _270 = _53(_264, _266, _268, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _272 = _103;
    int _274 = 0;
    int _276 = 1;
    int _278 = _53(_272, _274, _276, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float4 _280 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_270, _278)), 0).xyzw;
    float _282 = _280.x;
    float _284 = _280.y;
    float _286 = _280.z;
    float _288 = _280.w;
    float _290 = floor(_99);
    float _292 = float(_103);
    float _294 = float(_107);
    float _296 = float(_109);
    float _298 = _292 + 0.5;
    float _300 = float(_174);
    float _302 = floor(_97);
    float _304 = 1.0 / _93;
    float _306 = -_290;
    float _308 = _99 + _306;
    float _310 = 1.0 / _95;
    float _312 = -_302;
    float _314 = _97 + _312;
    float _316 = -_308;
    float _318 = _316 + 1.0;
    float _320 = _294 + 0.5;
    float _322 = _296 + 0.5;
    float _324 = -_314;
    float _326 = _324 + 1.0;
    float _328 = _300 + 0.5;
    float _330 = _314 * _318;
    float _332 = _298 * _304;
    float _334 = _318 * _326;
    float _336 = _322 * _304;
    float _338 = _320 * _310;
    float _340 = _328 * _310;
    bool _344 = _127 >= 1.0;
    bool _346 = isnan(_127);
    bool _348 = _344 || _346;
    bool _350 = isnan(1.0);
    bool _352 = _348 || _350;
    float _354 = _308 * _314;
    float _356 = _308 * _326;
    float _358 = _318;
    float _360 = as_type<float>(_107);
    float _362 = _326;
    float _364 = _152;
    float _366 = _148;
    float _368 = _150;
    float _370 = _230;
    float _372 = _232;
    float _374 = _236;
    float _376 = _260;
    float _378 = _256;
    float _380 = _262;
    float _382 = _282;
    if (_352)
    {
        _358 = _148;
    }
    float _384 = _358;
    float _386 = _384;
    float _388 = _384;
    if (_352)
    {
        _360 = _150;
    }
    float _390 = _360;
    float _392 = _390;
    float _394 = _390;
    if (_352)
    {
        _362 = _152;
    }
    float _396 = _362;
    float _398 = _396;
    float _400 = _396;
    if (!_352)
    {
        bool _402 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
        bool _404 = isnan(0.0);
        bool _406 = _402 || _404;
        bool _408 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
        bool _410 = _406 || _408;
        if (!_410)
        {
            float _412 = _148 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _386 = _412;
        }
        float _414 = _386;
        _388 = _414;
        if (!_410)
        {
            float _416 = _150 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _392 = _416;
        }
        float _418 = _392;
        _394 = _418;
        if (!_410)
        {
            float _420 = _152 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _398 = _420;
        }
        float _422 = _398;
        bool _424 = !_410;
        _400 = _422;
        if (!_424)
        {
            float _426 = _150 * 0.715200006961822509765625;
            float _428 = fma(_148, 0.2125999927520751953125, _426);
            float _430 = fma(_152, 0.072200000286102294921875, _428);
            float _432 = 1.0 / _430;
            float _434 = _432 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            float _436 = precise::clamp(_434, 0.0, 1.0);
            float _438 = fma(_436, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
            float _440 = _148 * _438;
            float _442 = _150 * _438;
            float _444 = _152 * _438;
            _400 = _444;
            _388 = _440;
            _394 = _442;
        }
    }
    float _446 = _400;
    float _448 = _388;
    float _450 = _394;
    if (_352)
    {
        _364 = _446;
    }
    float _452 = _364;
    float _454 = _452;
    if (_352)
    {
        _366 = _448;
    }
    float _456 = _366;
    float _458 = _456;
    if (_352)
    {
        _368 = _450;
    }
    float _460 = _368;
    float _462 = _460;
    if (!_352)
    {
        float _464 = _332 + (-0.5);
        float _466 = _338 + (-0.5);
        float _468 = _446 * 4.0;
        float _470 = fma(_464, (*spvDescriptorSet0.fp_c4)._m0[7].x, (*spvDescriptorSet0.fp_c4)._m0[6].y);
        float _472 = _466 + (*spvDescriptorSet0.fp_c4)._m0[6].x;
        bool _474 = (*spvDescriptorSet0.fp_c4)._m0[6].w > (-1.0999999631167156621813774108887e-06);
        float _476 = _470 * _470;
        bool _478 = (*spvDescriptorSet0.fp_c4)._m0[6].w >= (-1.0999999631167156621813774108887e-06);
        bool _480 = isnan((*spvDescriptorSet0.fp_c4)._m0[6].w);
        bool _482 = _478 || _480;
        bool _484 = isnan(-1.0999999631167156621813774108887e-06);
        bool _486 = _482 || _484;
        float _488 = abs((*spvDescriptorSet0.fp_c4)._m0[6].w);
        float _490 = -_488;
        float _492 = fma(_490, 2.0, (*spvDescriptorSet0.fp_c4)._m0[6].z);
        uint _495 = as_type<uint>(half2(float2(_468, 0.0)));
        float _497 = fma(_472, _472, _476);
        float _499 = precise::max(0.0, (*spvDescriptorSet0.fp_c4)._m0[6].z);
        float _501 = precise::max(0.0, _492);
        int _503 = _486 ? 0 : 1;
        float _505 = sqrt(_497);
        uint _507 = extract_bits(_495, 0u, 8u);
        int _509 = int(_507) & 255;
        uint _511 = extract_bits(_495, 8u, 8u);
        int _513 = int(_511) & 255;
        int _515 = _513 << 8;
        int _517 = _509 | _515;
        float _519 = -_501;
        float _521 = _499 + _519;
        float _523 = _448 * 4.0;
        float _525 = _450 * 4.0;
        int _527 = ~_503;
        int _529 = _527 + 1;
        int _531 = _529 + 1;
        int _533 = _531;
        if (!_474)
        {
            int _535 = ~_503;
            int _537 = _535 + 1;
            _533 = _537;
        }
        int _539 = _533;
        float _541 = 1.0 / _521;
        uint _543 = as_type<uint>(half2(float2(_523, _525)));
        float _545 = float(_539);
        int _547 = int(_543) & 32767;
        float _549 = float(uint(_517));
        float _551 = -_501;
        float _553 = _505 + _551;
        float _555 = float(uint(_547));
        float _557 = _553 * _541;
        float _559 = precise::clamp(_557, 0.0, 1.0);
        float _561 = fma(_559, -2.0, 3.0);
        float _563 = _559 * _559;
        uint _565 = extract_bits(_543, 16u, 16u);
        float _567 = float(_565);
        float _569 = fma(_563, _561, -0.5);
        float _571 = fma(_569, _545, 0.5);
        float _573 = fma(_549, 6.103515625e-05, -0.3125);
        float _575 = fma(_555, 6.103515625e-05, -0.3125);
        float _577 = precise::max(_571, (*spvDescriptorSet0.fp_c4)._m0[5].w);
        bool _579 = _577 > 0.999000012874603271484375;
        float _581 = fma(_567, 6.103515625e-05, -0.3125);
        float _583 = fma(_573, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        float _585 = fma(_575, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        float _587 = fma(_581, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        bool _589 = !_579;
        if (!_589)
        {
            float3 _2599 = float3(_585, _587, _583);
            float3 _593 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2599, float3(0.0), isnan(_2599))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2599, float3(0.0), isnan(_2599))).xyz;
            float _595 = _593.x;
            float _597 = _593.y;
            float _599 = _593.z;
            _458 = _595;
            _454 = _599;
            _462 = _597;
            _601 = true;
        }
        else
        {
            bool _603 = _577 >= 0.001000000047497451305389404296875;
            bool _605 = isnan(_577);
            bool _607 = _603 || _605;
            bool _609 = isnan(0.001000000047497451305389404296875);
            bool _611 = _607 || _609;
            if (!_611)
            {
                float3 _2636 = float3(_585, _587, _583);
                float3 _613 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2636, float3(0.0), isnan(_2636))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2636, float3(0.0), isnan(_2636))).xyz;
                float _615 = _613.x;
                float _617 = _613.y;
                float _619 = _613.z;
                _458 = _615;
                _454 = _619;
                _462 = _617;
                _601 = true;
            }
            else
            {
                float3 _2655 = float3(_585, _587, _583);
                float3 _621 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2655, float3(0.0), isnan(_2655))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2655, float3(0.0), isnan(_2655))).xyz;
                float _623 = _621.x;
                float _625 = _621.y;
                float _627 = _621.z;
                float3 _2670 = float3(_585, _587, _583);
                float3 _629 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2670, float3(0.0), isnan(_2670))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2670, float3(0.0), isnan(_2670))).xyz;
                float _631 = _629.x;
                float _633 = _629.y;
                float _635 = _629.z;
                float _637 = -_623;
                float _639 = _631 + _637;
                float _641 = -_625;
                float _643 = _633 + _641;
                float _645 = -_627;
                float _647 = _635 + _645;
                float _649 = fma(_639, _577, _623);
                float _651 = fma(_643, _577, _625);
                float _653 = fma(_647, _577, _627);
                _458 = _649;
                _454 = _653;
                _462 = _651;
            }
        }
    }
    _601 = false;
    float _655 = _458;
    float _657 = _454;
    float _659 = _462;
    bool _661 = _172 >= 1.0;
    bool _663 = isnan(_172);
    bool _665 = _661 || _663;
    bool _667 = isnan(1.0);
    bool _669 = _665 || _667;
    float _671 = _657;
    float _673 = _655;
    float _675 = _655;
    float _677 = _659;
    float _679 = _655;
    float _681 = _659;
    float _683 = _657;
    float _685 = _659;
    if (_669)
    {
        _671 = _230;
    }
    float _687 = _671;
    float _689 = _687;
    float _691 = _687;
    if (_669)
    {
        _673 = _232;
    }
    float _693 = _673;
    float _695 = _693;
    float _697 = _693;
    if (!_352)
    {
        bool _699 = _655 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _701 = isnan(_655);
        bool _703 = _699 || _701;
        bool _705 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _707 = _703 || _705;
        bool _709 = _659 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _711 = isnan(_659);
        bool _713 = _709 || _711;
        bool _715 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _717 = _713 || _715;
        float _719 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _655, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _721 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _659, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _723 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _657, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        bool _725 = _657 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _727 = isnan(_657);
        bool _729 = _725 || _727;
        bool _731 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _733 = _729 || _731;
        float _735 = exp2(_719);
        float _737 = exp2(_721);
        float _739 = exp2(_723);
        _685 = _735;
        if (_707)
        {
            float _741 = -_735;
            float _743 = _741 + 1.0;
            _675 = _743;
        }
        float _745 = _675;
        _679 = _745;
        if (_717)
        {
            float _747 = -_737;
            float _749 = _747 + 1.0;
            _677 = _749;
        }
        float _751 = _677;
        _681 = _751;
        if (_733)
        {
            float _753 = -_739;
            float _755 = _753 + 1.0;
            _683 = _755;
        }
    }
    float _757 = _679;
    float _759 = _681;
    float _761 = _683;
    float _763 = _685;
    float _765 = _763;
    float _767 = _757;
    float _769 = _759;
    float _771 = _761;
    if (_669)
    {
        _765 = _234;
    }
    float _773 = _765;
    float _775 = _773;
    float _777 = _773;
    if (!_669)
    {
        bool _779 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
        bool _781 = isnan(0.0);
        bool _783 = _779 || _781;
        bool _785 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
        bool _787 = _783 || _785;
        if (!_787)
        {
            float _789 = _230 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _689 = _789;
        }
        float _791 = _689;
        _691 = _791;
        if (!_787)
        {
            float _793 = _232 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _695 = _793;
        }
        float _795 = _695;
        _697 = _795;
        if (!_787)
        {
            float _797 = _234 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _775 = _797;
        }
        float _799 = _775;
        bool _801 = !_787;
        _777 = _799;
        if (!_801)
        {
            float _803 = _232 * 0.715200006961822509765625;
            float _805 = fma(_230, 0.2125999927520751953125, _803);
            float _807 = fma(_234, 0.072200000286102294921875, _805);
            float _809 = 1.0 / _807;
            float _811 = _809 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            float _813 = precise::clamp(_811, 0.0, 1.0);
            float _815 = fma(_813, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
            float _817 = _230 * _815;
            float _819 = _232 * _815;
            float _821 = _234 * _815;
            _691 = _817;
            _697 = _819;
            _777 = _821;
        }
    }
    float _823 = _691;
    float _825 = _697;
    float _827 = _777;
    float _829 = _827;
    if (!_352)
    {
        float _831 = _757 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _767 = _831;
    }
    float _833 = _767;
    if (!_352)
    {
        float _835 = _759 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _769 = _835;
    }
    float _837 = _769;
    if (!_352)
    {
        float _839 = _761 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _771 = _839;
    }
    float _841 = _771;
    float _843 = _154 * _334;
    float _845 = _334 * _833;
    float _847 = _334 * _837;
    float _849 = _334 * _841;
    if (_669)
    {
        _370 = _823;
    }
    float _851 = _370;
    float _853 = _851;
    if (_669)
    {
        _372 = _825;
    }
    float _855 = _372;
    float _857 = _855;
    if (!_669)
    {
        float _859 = _336 + (-0.5);
        float _861 = _338 + (-0.5);
        float _863 = fma(_859, (*spvDescriptorSet0.fp_c4)._m0[7].x, (*spvDescriptorSet0.fp_c4)._m0[6].y);
        float _865 = precise::max(0.0, (*spvDescriptorSet0.fp_c4)._m0[6].z);
        float _867 = _861 + (*spvDescriptorSet0.fp_c4)._m0[6].x;
        bool _869 = (*spvDescriptorSet0.fp_c4)._m0[6].w > (-1.0999999631167156621813774108887e-06);
        float _871 = abs((*spvDescriptorSet0.fp_c4)._m0[6].w);
        float _873 = -_871;
        float _875 = fma(_873, 2.0, (*spvDescriptorSet0.fp_c4)._m0[6].z);
        float _877 = _863 * _863;
        bool _879 = (*spvDescriptorSet0.fp_c4)._m0[6].w >= (-1.0999999631167156621813774108887e-06);
        bool _881 = isnan((*spvDescriptorSet0.fp_c4)._m0[6].w);
        bool _883 = _879 || _881;
        bool _885 = isnan(-1.0999999631167156621813774108887e-06);
        bool _887 = _883 || _885;
        float _889 = _825 * 4.0;
        float _891 = _827 * 4.0;
        float _893 = precise::max(0.0, _875);
        float _895 = fma(_867, _867, _877);
        uint _897 = as_type<uint>(half2(float2(_891, 0.0)));
        float _899 = -_893;
        float _901 = _865 + _899;
        float _903 = _823 * 4.0;
        float _905 = sqrt(_895);
        uint _907 = extract_bits(_897, 0u, 8u);
        int _909 = int(_907) & 255;
        uint _911 = extract_bits(_897, 8u, 8u);
        int _913 = int(_911) & 255;
        int _915 = _913 << 8;
        int _917 = _909 | _915;
        uint _919 = as_type<uint>(half2(float2(_903, _889)));
        float _921 = float(uint(_917));
        float _923 = 1.0 / _901;
        float _925 = -_893;
        float _927 = _925 + _905;
        int _929 = _887 ? 0 : 1;
        uint _931 = extract_bits(_919, 16u, 16u);
        float _933 = float(_931);
        int _935 = ~_929;
        int _937 = _935 + 1;
        int _939 = _937 + 1;
        int _941 = _939;
        if (!_869)
        {
            int _943 = ~_929;
            int _945 = _943 + 1;
            _941 = _945;
        }
        int _947 = _941;
        float _949 = _923 * _927;
        float _951 = precise::clamp(_949, 0.0, 1.0);
        float _953 = fma(_951, -2.0, 3.0);
        float _955 = _951 * _951;
        float _957 = fma(_955, _953, -0.5);
        float _959 = float(_947);
        float _961 = fma(_957, _959, 0.5);
        int _963 = int(_919) & 32767;
        float _965 = fma(_933, 6.103515625e-05, -0.3125);
        float _967 = fma(_921, 6.103515625e-05, -0.3125);
        float _969 = precise::max(_961, (*spvDescriptorSet0.fp_c4)._m0[5].w);
        float _971 = float(uint(_963));
        bool _973 = _969 > 0.999000012874603271484375;
        float _975 = fma(_971, 6.103515625e-05, -0.3125);
        float _977 = fma(_965, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        float _979 = fma(_967, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        float _981 = fma(_975, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        bool _983 = !_973;
        if (!_983)
        {
            float3 _3200 = float3(_981, _977, _979);
            float3 _985 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_3200, float3(0.0), isnan(_3200))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_3200, float3(0.0), isnan(_3200))).xyz;
            float _987 = _985.x;
            float _989 = _985.y;
            float _991 = _985.z;
            _853 = _987;
            _857 = _989;
            _829 = _991;
            _993 = true;
        }
        else
        {
            bool _995 = _969 >= 0.001000000047497451305389404296875;
            bool _997 = isnan(_969);
            bool _999 = _995 || _997;
            bool _1001 = isnan(0.001000000047497451305389404296875);
            bool _1003 = _999 || _1001;
            if (!_1003)
            {
                float3 _3233 = float3(_981, _977, _979);
                float3 _1005 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_3233, float3(0.0), isnan(_3233))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_3233, float3(0.0), isnan(_3233))).xyz;
                float _1007 = _1005.x;
                float _1009 = _1005.y;
                float _1011 = _1005.z;
                _853 = _1007;
                _857 = _1009;
                _829 = _1011;
                _993 = true;
            }
            else
            {
                float3 _3252 = float3(_981, _977, _979);
                float3 _1013 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_3252, float3(0.0), isnan(_3252))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_3252, float3(0.0), isnan(_3252))).xyz;
                float _1015 = _1013.x;
                float _1017 = _1013.y;
                float _1019 = _1013.z;
                float3 _3267 = float3(_981, _977, _979);
                float3 _1021 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_3267, float3(0.0), isnan(_3267))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_3267, float3(0.0), isnan(_3267))).xyz;
                float _1023 = _1021.x;
                float _1025 = _1021.y;
                float _1027 = _1021.z;
                float _1029 = -_1015;
                float _1031 = _1023 + _1029;
                float _1033 = -_1017;
                float _1035 = _1025 + _1033;
                float _1037 = -_1019;
                float _1039 = _1027 + _1037;
                float _1041 = fma(_969, _1031, _1015);
                float _1043 = fma(_969, _1035, _1017);
                float _1045 = fma(_969, _1039, _1019);
                _853 = _1041;
                _857 = _1043;
                _829 = _1045;
            }
        }
    }
    _993 = false;
    float _1047 = _853;
    float _1049 = _857;
    float _1051 = _829;
    float _1053 = fma(_236, _330, _843);
    bool _1055 = _192 >= 1.0;
    bool _1057 = isnan(_192);
    bool _1059 = _1055 || _1057;
    bool _1061 = isnan(1.0);
    bool _1063 = _1059 || _1061;
    float _1065 = _1047;
    float _1067 = _1047;
    float _1069 = _1051;
    float _1071 = _1049;
    float _1073 = _1049;
    float _1075 = _1047;
    if (_669)
    {
        _374 = _1047;
    }
    float _1077 = _374;
    float _1079 = _1077;
    if (_669)
    {
        _1065 = _1051;
    }
    float _1081 = _1065;
    float _1083 = _1081;
    if (!_669)
    {
        bool _1085 = _1047 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _1087 = isnan(_1047);
        bool _1089 = _1085 || _1087;
        bool _1091 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1093 = _1089 || _1091;
        bool _1095 = _1051 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _1097 = isnan(_1051);
        bool _1099 = _1095 || _1097;
        bool _1101 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1103 = _1099 || _1101;
        float _1105 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _1047, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _1107 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _1051, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _1109 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _1049, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        bool _1111 = _1049 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _1113 = isnan(_1049);
        bool _1115 = _1111 || _1113;
        bool _1117 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1119 = _1115 || _1117;
        float _1121 = exp2(_1105);
        float _1123 = exp2(_1107);
        float _1125 = exp2(_1109);
        if (_1093)
        {
            float _1127 = -_1121;
            float _1129 = _1127 + 1.0;
            _1067 = _1129;
        }
        float _1131 = _1067;
        _1079 = _1131;
        _1075 = _1131;
        if (_1103)
        {
            float _1133 = -_1123;
            float _1135 = _1133 + 1.0;
            _1069 = _1135;
        }
        float _1137 = _1069;
        if (_1119)
        {
            float _1139 = -_1125;
            float _1141 = _1139 + 1.0;
            _1071 = _1141;
        }
        float _1143 = _1071;
        _1073 = _1143;
        _1083 = _1137;
    }
    float _1145 = _1079;
    float _1147 = _1073;
    float _1149 = _1083;
    float _1151 = _1075;
    float _1153 = _1145;
    float _1155 = _1147;
    float _1157 = _1147;
    float _1159 = _1151;
    float _1161 = _1149;
    float _1163 = _1149;
    if (!_669)
    {
        float _1165 = _1145 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1153 = _1165;
    }
    float _1167 = _1153;
    if (_1063)
    {
        _1155 = _256;
    }
    float _1169 = _1155;
    float _1171 = _1169;
    float _1173 = _1169;
    if (!_669)
    {
        float _1175 = _1147 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1157 = _1175;
    }
    float _1177 = _1157;
    if (_1063)
    {
        _1159 = _258;
    }
    float _1179 = _1159;
    float _1181 = _1179;
    float _1183 = _1179;
    if (!_669)
    {
        float _1185 = _1149 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1161 = _1185;
    }
    float _1187 = _1161;
    if (_1063)
    {
        _1163 = _260;
    }
    float _1189 = _1163;
    float _1191 = _1189;
    float _1193 = _1189;
    if (!_1063)
    {
        bool _1195 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
        bool _1197 = isnan(0.0);
        bool _1199 = _1195 || _1197;
        bool _1201 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
        bool _1203 = _1199 || _1201;
        if (!_1203)
        {
            float _1205 = _256 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _1171 = _1205;
        }
        float _1207 = _1171;
        _1173 = _1207;
        if (!_1203)
        {
            float _1209 = _258 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _1181 = _1209;
        }
        float _1211 = _1181;
        _1183 = _1211;
        if (!_1203)
        {
            float _1213 = _260 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _1191 = _1213;
        }
        float _1215 = _1191;
        bool _1217 = !_1203;
        _1193 = _1215;
        if (!_1217)
        {
            float _1219 = _258 * 0.715200006961822509765625;
            float _1221 = fma(_256, 0.2125999927520751953125, _1219);
            float _1223 = fma(_260, 0.072200000286102294921875, _1221);
            float _1225 = 1.0 / _1223;
            float _1227 = _1225 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            float _1229 = precise::clamp(_1227, 0.0, 1.0);
            float _1231 = fma(_1229, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
            float _1233 = _256 * _1231;
            float _1235 = _258 * _1231;
            float _1237 = _260 * _1231;
            _1193 = _1237;
            _1183 = _1235;
            _1173 = _1233;
        }
    }
    float _1239 = _1193;
    float _1241 = _1183;
    float _1243 = _1173;
    float _1245 = fma(_330, _1167, _845);
    float _1247 = fma(_330, _1177, _847);
    float _1249 = fma(_330, _1187, _849);
    float _1251 = _1241;
    float _1253 = _1243;
    if (_1063)
    {
        _376 = _1239;
    }
    float _1255 = _376;
    float _1257 = _1255;
    if (!_1063)
    {
        float _1259 = _336 + (-0.5);
        float _1261 = _340 + (-0.5);
        float _1263 = fma(_1259, (*spvDescriptorSet0.fp_c4)._m0[7].x, (*spvDescriptorSet0.fp_c4)._m0[6].y);
        bool _1265 = (*spvDescriptorSet0.fp_c4)._m0[6].w > (-1.0999999631167156621813774108887e-06);
        float _1267 = _1261 + (*spvDescriptorSet0.fp_c4)._m0[6].x;
        bool _1269 = (*spvDescriptorSet0.fp_c4)._m0[6].w >= (-1.0999999631167156621813774108887e-06);
        bool _1271 = isnan((*spvDescriptorSet0.fp_c4)._m0[6].w);
        bool _1273 = _1269 || _1271;
        bool _1275 = isnan(-1.0999999631167156621813774108887e-06);
        bool _1277 = _1273 || _1275;
        float _1279 = abs((*spvDescriptorSet0.fp_c4)._m0[6].w);
        float _1281 = -_1279;
        float _1283 = fma(_1281, 2.0, (*spvDescriptorSet0.fp_c4)._m0[6].z);
        float _1285 = _1263 * _1263;
        float _1287 = precise::max(0.0, (*spvDescriptorSet0.fp_c4)._m0[6].z);
        float _1289 = _1241 * 4.0;
        int _1291 = _1277 ? 0 : 1;
        float _1293 = fma(_1267, _1267, _1285);
        float _1295 = precise::max(0.0, _1283);
        float _1297 = _1239 * 4.0;
        float _1299 = -_1295;
        float _1301 = _1287 + _1299;
        float _1303 = sqrt(_1293);
        float _1305 = _1243 * 4.0;
        int _1307 = ~_1291;
        int _1309 = _1307 + 1;
        int _1311 = _1309 + 1;
        int _1313 = _1311;
        if (!_1265)
        {
            int _1315 = ~_1291;
            int _1317 = _1315 + 1;
            _1313 = _1317;
        }
        int _1319 = _1313;
        uint _1321 = as_type<uint>(half2(float2(_1305, _1289)));
        float _1323 = 1.0 / _1301;
        uint _1325 = as_type<uint>(half2(float2(_1297, 0.0)));
        uint _1327 = extract_bits(_1325, 0u, 8u);
        int _1329 = int(_1327) & 255;
        uint _1331 = extract_bits(_1325, 8u, 8u);
        int _1333 = int(_1331) & 255;
        int _1335 = _1333 << 8;
        int _1337 = _1329 | _1335;
        float _1339 = -_1295;
        float _1341 = _1339 + _1303;
        uint _1343 = extract_bits(_1321, 16u, 16u);
        float _1345 = float(_1343);
        int _1347 = int(_1321) & 32767;
        float _1349 = float(uint(_1337));
        float _1351 = float(uint(_1347));
        float _1353 = _1323 * _1341;
        float _1355 = precise::clamp(_1353, 0.0, 1.0);
        float _1357 = fma(_1349, 6.103515625e-05, -0.3125);
        float _1359 = fma(_1351, 6.103515625e-05, -0.3125);
        float _1361 = fma(_1355, -2.0, 3.0);
        float _1363 = _1355 * _1355;
        float _1365 = fma(_1363, _1361, -0.5);
        float _1367 = float(_1319);
        float _1369 = fma(_1365, _1367, 0.5);
        float _1371 = fma(_1345, 6.103515625e-05, -0.3125);
        float _1373 = fma(_1357, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        float _1375 = fma(_1359, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        float _1377 = precise::max(_1369, (*spvDescriptorSet0.fp_c4)._m0[5].w);
        float _1379 = fma(_1371, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        bool _1381 = _1377 > 0.999000012874603271484375;
        bool _1383 = !_1381;
        _378 = _1369;
        if (!_1383)
        {
            float3 _3811 = float3(_1375, _1379, _1373);
            float3 _1385 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_3811, float3(0.0), isnan(_3811))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_3811, float3(0.0), isnan(_3811))).xyz;
            float _1387 = _1385.x;
            float _1389 = _1385.y;
            float _1391 = _1385.z;
            _1257 = _1391;
            _1251 = _1389;
            _1253 = _1387;
            _1393 = true;
        }
        else
        {
            bool _1395 = _1377 >= 0.001000000047497451305389404296875;
            bool _1397 = isnan(_1377);
            bool _1399 = _1395 || _1397;
            bool _1401 = isnan(0.001000000047497451305389404296875);
            bool _1403 = _1399 || _1401;
            if (!_1403)
            {
                float3 _3844 = float3(_1375, _1379, _1373);
                float3 _1405 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_3844, float3(0.0), isnan(_3844))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_3844, float3(0.0), isnan(_3844))).xyz;
                float _1407 = _1405.x;
                float _1409 = _1405.y;
                float _1411 = _1405.z;
                _1257 = _1411;
                _1251 = _1409;
                _1253 = _1407;
                _1393 = true;
            }
            else
            {
                float3 _3863 = float3(_1375, _1379, _1373);
                float3 _1413 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_3863, float3(0.0), isnan(_3863))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_3863, float3(0.0), isnan(_3863))).xyz;
                float _1415 = _1413.x;
                float _1417 = _1413.y;
                float _1419 = _1413.z;
                float3 _3878 = float3(_1375, _1379, _1373);
                float3 _1421 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_3878, float3(0.0), isnan(_3878))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_3878, float3(0.0), isnan(_3878))).xyz;
                float _1423 = _1421.x;
                float _1425 = _1421.y;
                float _1427 = _1421.z;
                float _1429 = -_1415;
                float _1431 = _1423 + _1429;
                float _1433 = -_1417;
                float _1435 = _1425 + _1433;
                float _1437 = -_1419;
                float _1439 = _1427 + _1437;
                float _1441 = fma(_1377, _1431, _1415);
                float _1443 = fma(_1377, _1435, _1417);
                float _1445 = fma(_1377, _1439, _1419);
                _1257 = _1445;
                _1251 = _1443;
                _1253 = _1441;
                _378 = _1435;
            }
        }
    }
    _1393 = false;
    float _1447 = _1257;
    float _1449 = _1251;
    float _1451 = _1253;
    float _1453 = _378;
    bool _1455 = _210 >= 1.0;
    bool _1457 = isnan(_210);
    bool _1459 = _1455 || _1457;
    bool _1461 = isnan(1.0);
    bool _1463 = _1459 || _1461;
    float _1465 = fma(_262, _354, _1053);
    float _1467 = _1453;
    float _1469 = _1451;
    float _1471 = _1447;
    float _1473 = _1449;
    float _1475 = _1449;
    float _1477 = _1447;
    if (_1063)
    {
        _1467 = _1451;
    }
    float _1479 = _1467;
    float _1481 = _1479;
    float _1483 = _1447;
    if (!_1063)
    {
        bool _1485 = _1451 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _1487 = isnan(_1451);
        bool _1489 = _1485 || _1487;
        bool _1491 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1493 = _1489 || _1491;
        bool _1495 = _1447 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _1497 = isnan(_1447);
        bool _1499 = _1495 || _1497;
        bool _1501 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1503 = _1499 || _1501;
        float _1505 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _1451, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _1507 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _1449, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _1509 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _1447, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        bool _1511 = _1449 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _1513 = isnan(_1449);
        bool _1515 = _1511 || _1513;
        bool _1517 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1519 = _1515 || _1517;
        float _1521 = exp2(_1505);
        float _1523 = exp2(_1509);
        float _1525 = exp2(_1507);
        if (_1493)
        {
            float _1527 = -_1521;
            float _1529 = _1527 + 1.0;
            _1469 = _1529;
        }
        float _1531 = _1469;
        _1481 = _1531;
        _380 = _1523;
        if (_1503)
        {
            float _1533 = -_1523;
            float _1535 = _1533 + 1.0;
            _1471 = _1535;
        }
        float _1537 = _1471;
        _1477 = _1537;
        if (_1519)
        {
            float _1539 = -_1525;
            float _1541 = _1539 + 1.0;
            _1473 = _1541;
        }
        float _1543 = _1473;
        _1475 = _1543;
        _1483 = _1537;
    }
    float _1545 = _1481;
    float _1547 = _1475;
    float _1549 = _1483;
    float _1551 = _380;
    float _1553 = _1477;
    float _1555 = _1545;
    float _1557 = _1551;
    float _1559 = _1547;
    float _1561 = _1549;
    float _1563 = _1549;
    float _1565 = _1545;
    float _1567 = _1547;
    float _1569 = _1553;
    if (!_1063)
    {
        float _1571 = _1545 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1555 = _1571;
    }
    float _1573 = _1555;
    if (_1463)
    {
        _1557 = _282;
    }
    float _1575 = _1557;
    float _1577 = _1575;
    float _1579 = _1575;
    if (!_1063)
    {
        float _1581 = _1547 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1559 = _1581;
    }
    float _1583 = _1559;
    if (_1463)
    {
        _1561 = _284;
    }
    float _1585 = _1561;
    float _1587 = _1585;
    float _1589 = _1585;
    if (!_1063)
    {
        float _1591 = _1549 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1563 = _1591;
    }
    float _1593 = _1563;
    if (_1463)
    {
        _1565 = _286;
    }
    float _1595 = _1565;
    float _1597 = _1595;
    float _1599 = _1595;
    if (!_1463)
    {
        bool _1601 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
        bool _1603 = isnan(0.0);
        bool _1605 = _1601 || _1603;
        bool _1607 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
        bool _1609 = _1605 || _1607;
        if (!_1609)
        {
            float _1611 = _282 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _1577 = _1611;
        }
        float _1613 = _1577;
        _1579 = _1613;
        if (!_1609)
        {
            float _1615 = _284 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _1587 = _1615;
        }
        float _1617 = _1587;
        _1589 = _1617;
        if (!_1609)
        {
            float _1619 = _286 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _1597 = _1619;
        }
        float _1621 = _1597;
        bool _1623 = !_1609;
        _1599 = _1621;
        if (!_1623)
        {
            float _1625 = _284 * 0.715200006961822509765625;
            float _1627 = fma(_282, 0.2125999927520751953125, _1625);
            float _1629 = fma(_286, 0.072200000286102294921875, _1627);
            float _1631 = 1.0 / _1629;
            float _1633 = _1631 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            float _1635 = precise::clamp(_1633, 0.0, 1.0);
            float _1637 = fma(_1635, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
            float _1639 = _282 * _1637;
            float _1641 = _284 * _1637;
            float _1643 = _286 * _1637;
            _1579 = _1639;
            _1589 = _1641;
            _1599 = _1643;
            _1567 = _1631;
            _1569 = _1637;
        }
    }
    float _1645 = _1579;
    float _1647 = _1589;
    float _1649 = _1599;
    float _1651 = _1567;
    float _1653 = _1569;
    float _1655 = fma(_354, _1573, _1245);
    float _1657 = fma(_354, _1583, _1247);
    float _1659 = fma(_354, _1593, _1249);
    float _1661 = _1651;
    float _1663 = _1653;
    float _1665 = _1649;
    if (_1463)
    {
        _1661 = _1645;
    }
    float _1667 = _1661;
    float _1669 = _1667;
    if (_1463)
    {
        _1663 = _1647;
    }
    float _1671 = _1663;
    float _1673 = _1671;
    if (!_1463)
    {
        float _1675 = _332 + (-0.5);
        float _1677 = _340 + (-0.5);
        float _1679 = fma(_1675, (*spvDescriptorSet0.fp_c4)._m0[7].x, (*spvDescriptorSet0.fp_c4)._m0[6].y);
        float _1681 = precise::max(0.0, (*spvDescriptorSet0.fp_c4)._m0[6].z);
        float _1683 = _1677 + (*spvDescriptorSet0.fp_c4)._m0[6].x;
        bool _1685 = (*spvDescriptorSet0.fp_c4)._m0[6].w > (-1.0999999631167156621813774108887e-06);
        float _1687 = abs((*spvDescriptorSet0.fp_c4)._m0[6].w);
        float _1689 = -_1687;
        float _1691 = fma(_1689, 2.0, (*spvDescriptorSet0.fp_c4)._m0[6].z);
        float _1693 = _1679 * _1679;
        bool _1695 = (*spvDescriptorSet0.fp_c4)._m0[6].w >= (-1.0999999631167156621813774108887e-06);
        bool _1697 = isnan((*spvDescriptorSet0.fp_c4)._m0[6].w);
        bool _1699 = _1695 || _1697;
        bool _1701 = isnan(-1.0999999631167156621813774108887e-06);
        bool _1703 = _1699 || _1701;
        float _1705 = _1645 * 4.0;
        float _1707 = _1647 * 4.0;
        float _1709 = fma(_1683, _1683, _1693);
        float _1711 = precise::max(0.0, _1691);
        float _1713 = _1649 * 4.0;
        uint _1715 = as_type<uint>(half2(float2(_1705, _1707)));
        float _1717 = sqrt(_1709);
        float _1719 = -_1711;
        float _1721 = _1681 + _1719;
        uint _1723 = as_type<uint>(half2(float2(_1713, 0.0)));
        uint _1725 = extract_bits(_1723, 0u, 8u);
        int _1727 = int(_1725) & 255;
        uint _1729 = extract_bits(_1723, 8u, 8u);
        int _1731 = int(_1729) & 255;
        int _1733 = _1731 << 8;
        int _1735 = _1727 | _1733;
        float _1737 = 1.0 / _1721;
        float _1739 = float(uint(_1735));
        float _1741 = -_1711;
        float _1743 = _1741 + _1717;
        int _1745 = _1703 ? 0 : 1;
        uint _1747 = extract_bits(_1715, 16u, 16u);
        float _1749 = float(_1747);
        int _1751 = ~_1745;
        int _1753 = _1751 + 1;
        int _1755 = _1753 + 1;
        int _1757 = _1755;
        if (!_1685)
        {
            int _1759 = ~_1745;
            int _1761 = _1759 + 1;
            _1757 = _1761;
        }
        int _1763 = _1757;
        float _1765 = _1737 * _1743;
        float _1767 = precise::clamp(_1765, 0.0, 1.0);
        float _1769 = float(_1763);
        float _1771 = fma(_1767, -2.0, 3.0);
        float _1773 = _1767 * _1767;
        float _1775 = fma(_1773, _1771, -0.5);
        int _1777 = int(_1715) & 32767;
        float _1779 = fma(_1749, 6.103515625e-05, -0.3125);
        float _1781 = fma(_1739, 6.103515625e-05, -0.3125);
        float _1783 = fma(_1775, _1769, 0.5);
        float _1785 = float(uint(_1777));
        float _1787 = precise::max(_1783, (*spvDescriptorSet0.fp_c4)._m0[5].w);
        float _1789 = fma(_1785, 6.103515625e-05, -0.3125);
        bool _1791 = _1787 > 0.999000012874603271484375;
        float _1793 = fma(_1779, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        float _1795 = fma(_1781, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        float _1797 = fma(_1789, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        bool _1799 = !_1791;
        _382 = _1789;
        if (!_1799)
        {
            float3 _4434 = float3(_1797, _1793, _1795);
            float3 _1801 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_4434, float3(0.0), isnan(_4434))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_4434, float3(0.0), isnan(_4434))).xyz;
            float _1803 = _1801.x;
            float _1805 = _1801.y;
            float _1807 = _1801.z;
            _1665 = _1807;
            _1669 = _1803;
            _1673 = _1805;
            _1809 = true;
        }
        else
        {
            bool _1811 = _1787 >= 0.001000000047497451305389404296875;
            bool _1813 = isnan(_1787);
            bool _1815 = _1811 || _1813;
            bool _1817 = isnan(0.001000000047497451305389404296875);
            bool _1819 = _1815 || _1817;
            if (!_1819)
            {
                float3 _4467 = float3(_1797, _1793, _1795);
                float3 _1821 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_4467, float3(0.0), isnan(_4467))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_4467, float3(0.0), isnan(_4467))).xyz;
                float _1823 = _1821.x;
                float _1825 = _1821.y;
                float _1827 = _1821.z;
                _1665 = _1827;
                _1669 = _1823;
                _1673 = _1825;
                _1809 = true;
            }
            else
            {
                float3 _4486 = float3(_1797, _1793, _1795);
                float3 _1829 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_4486, float3(0.0), isnan(_4486))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_4486, float3(0.0), isnan(_4486))).xyz;
                float _1831 = _1829.x;
                float _1833 = _1829.y;
                float _1835 = _1829.z;
                float3 _4501 = float3(_1797, _1793, _1795);
                float3 _1837 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_4501, float3(0.0), isnan(_4501))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_4501, float3(0.0), isnan(_4501))).xyz;
                float _1839 = _1837.x;
                float _1841 = _1837.y;
                float _1843 = _1837.z;
                float _1845 = -_1831;
                float _1847 = _1839 + _1845;
                float _1849 = -_1833;
                float _1851 = _1841 + _1849;
                float _1853 = -_1835;
                float _1855 = _1843 + _1853;
                float _1857 = fma(_1787, _1847, _1831);
                float _1859 = fma(_1787, _1851, _1833);
                float _1861 = fma(_1787, _1855, _1835);
                _1665 = _1861;
                _1669 = _1857;
                _1673 = _1859;
                _382 = _1851;
            }
        }
    }
    _1809 = false;
    float _1863 = _1665;
    float _1865 = _1669;
    float _1867 = _1673;
    float _1869 = _382;
    float _1871 = _1863;
    float _1873 = _1869;
    float _1875 = _1867;
    float _1877 = _1863;
    float _1879 = _1865;
    if (_1463)
    {
        _1871 = _1867;
    }
    float _1881 = _1871;
    float _1883 = _1881;
    if (_1463)
    {
        _1873 = _1863;
    }
    float _1885 = _1873;
    float _1887 = _1885;
    if (!_1463)
    {
        bool _1889 = _1867 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _1891 = isnan(_1867);
        bool _1893 = _1889 || _1891;
        bool _1895 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1897 = _1893 || _1895;
        bool _1899 = _1863 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _1901 = isnan(_1863);
        bool _1903 = _1899 || _1901;
        bool _1905 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1907 = _1903 || _1905;
        float _1909 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _1867, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _1911 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _1863, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _1913 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _1865, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        bool _1915 = _1865 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _1917 = isnan(_1865);
        bool _1919 = _1915 || _1917;
        bool _1921 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1923 = _1919 || _1921;
        float _1925 = exp2(_1909);
        float _1927 = exp2(_1911);
        float _1929 = exp2(_1913);
        if (_1897)
        {
            float _1931 = -_1925;
            float _1933 = _1931 + 1.0;
            _1875 = _1933;
        }
        float _1935 = _1875;
        if (_1907)
        {
            float _1937 = -_1927;
            float _1939 = _1937 + 1.0;
            _1877 = _1939;
        }
        float _1941 = _1877;
        _1883 = _1935;
        _1887 = _1941;
        if (_1923)
        {
            float _1943 = -_1929;
            float _1945 = _1943 + 1.0;
            _1879 = _1945;
        }
    }
    float _1947 = _1879;
    float _1949 = _1883;
    float _1951 = _1887;
    float _1953 = _1947;
    float _1955 = _1949;
    float _1957 = _1951;
    if (!_1463)
    {
        float _1959 = _1947 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1953 = _1959;
    }
    float _1961 = _1953;
    if (!_1463)
    {
        float _1963 = _1949 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1955 = _1963;
    }
    float _1965 = _1955;
    if (!_1463)
    {
        float _1967 = _1951 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1957 = _1967;
    }
    float _1969 = _1957;
    float _1971 = fma(_288, _356, _1465);
    float _1973 = fma(_356, _1961, _1655);
    float _1975 = fma(_356, _1965, _1657);
    float _1977 = fma(_356, _1969, _1659);
    out.m_45.x = _1973;
    out.m_45.y = _1975;
    out.m_45.z = _1977;
    out.m_45.w = _1971;
    return out;
}

