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
    texture2d<float> fp_t_tcb_C [[id(8)]];
    sampler fp_t_tcb_CSmplr [[id(9)]];
    texture3d<float> fp_t_tcb_E [[id(10)]];
    sampler fp_t_tcb_ESmplr [[id(11)]];
    texture3d<float> fp_t_tcb_10 [[id(12)]];
    sampler fp_t_tcb_10Smplr [[id(13)]];
    sampler fp_t_tcb_CSmplr_w [[id(14)]];
    sampler fp_t_tcb_ESmplr_w [[id(15)]];
    sampler fp_t_tcb_10Smplr_w [[id(16)]];
    constant dm_border_t* dm_border [[id(17)]];
};

struct main0_out
{
    float4 m_47 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _53(thread const int& _4792, thread const int& _4793, constant _10& support_buffer)
{
    int _4796 = 1 + _4793;
    float _4798 = support_buffer._m5[_4796].x;
    float _4800 = abs(_4798);
    bool _4802 = _4800 == 1.0;
    if (_4802)
    {
        return _4792;
    }
    float _4804 = float(_4792);
    float _4806 = _4804 / _4800;
    int _4808 = int(_4806);
    return _4808;
}

static inline __attribute__((always_inline))
int _55(thread const int& _4830, thread const int& _4831, thread const int& _4832, constant _10& support_buffer, thread float4& gl_FragCoord)
{
    int _4835 = 1 + _4831;
    float _4837 = support_buffer._m5[_4835].x;
    bool _4839 = _4837 == 1.0;
    if (_4839)
    {
        return _4830;
    }
    bool _4841 = _4837 < 0.0;
    if (_4841)
    {
        float _4843 = -_4837;
        float _4845 = float(_4830);
        float _4847 = _4845 * _4843;
        float _4849 = gl_FragCoord.x;
        float _4851 = gl_FragCoord.y;
        float _4853 = (_4832 != 0) ? _4851 : _4849;
        float _4855 = mod(_4853, _4843);
        float _4857 = _4847 + _4855;
        int _4859 = int(_4857);
        return _4859;
    }
    float _4861 = float(_4830);
    float _4863 = _4861 * _4837;
    int _4865 = int(_4863);
    return _4865;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _1825 = false;
    bool _1413 = false;
    bool _999 = false;
    bool _599 = false;
    int _58 = int2(spvDescriptorSet0.fp_t_tcb_8.get_width(), spvDescriptorSet0.fp_t_tcb_8.get_height()).x;
    int _60 = _58;
    int _62 = 0;
    int _64 = _53(_60, _62, (*spvDescriptorSet0.support_buffer));
    int _66 = int2(spvDescriptorSet0.fp_t_tcb_8.get_width(), spvDescriptorSet0.fp_t_tcb_8.get_height()).y;
    int _68 = _66;
    int _70 = 0;
    int _72 = _53(_68, _70, (*spvDescriptorSet0.support_buffer));
    float _75 = gl_FragCoord.w;
    float _77 = in.m_44.x;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_44.y;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = 1.0 / _75;
    float _91 = _89 * _81;
    float _93 = _89 * _87;
    float _95 = float(_72);
    float _97 = float(_64);
    float _99 = fma(_93, _95, -0.4999000132083892822265625);
    float _101 = fma(_91, _97, -0.4999000132083892822265625);
    float _103 = floor(_99);
    int _105 = int(_103);
    float _107 = floor(_101);
    int _109 = int(_107);
    int _111 = _105 + 1;
    int _113 = _109;
    int _115 = 1;
    int _117 = 0;
    int _119 = _55(_113, _115, _117, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _121 = _105;
    int _123 = 1;
    int _125 = 1;
    int _127 = _55(_121, _123, _125, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float _129 = spvDescriptorSet0.fp_t_tcb_A.read(uint2(int2(_119, _127)), 0).x;
    int _131 = _109;
    int _133 = 0;
    int _135 = 0;
    int _137 = _55(_131, _133, _135, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _139 = _105;
    int _141 = 0;
    int _143 = 1;
    int _145 = _55(_139, _141, _143, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float4 _148 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_137, _145)), 0).xyzw;
    float _150 = _148.x;
    float _152 = _148.y;
    float _154 = _148.z;
    float _156 = _148.w;
    int _158 = _109;
    int _160 = 1;
    int _162 = 0;
    int _164 = _55(_158, _160, _162, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _166 = _111;
    int _168 = 1;
    int _170 = 1;
    int _172 = _55(_166, _168, _170, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float _174 = spvDescriptorSet0.fp_t_tcb_A.read(uint2(int2(_164, _172)), 0).x;
    int _176 = _109 + 1;
    int _178 = _176;
    int _180 = 1;
    int _182 = 0;
    int _184 = _55(_178, _180, _182, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _186 = _111;
    int _188 = 1;
    int _190 = 1;
    int _192 = _55(_186, _188, _190, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float _194 = spvDescriptorSet0.fp_t_tcb_A.read(uint2(int2(_184, _192)), 0).x;
    int _196 = _176;
    int _198 = 1;
    int _200 = 0;
    int _202 = _55(_196, _198, _200, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _204 = _105;
    int _206 = 1;
    int _208 = 1;
    int _210 = _55(_204, _206, _208, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float _212 = spvDescriptorSet0.fp_t_tcb_A.read(uint2(int2(_202, _210)), 0).x;
    int _214 = _109;
    int _216 = 0;
    int _218 = 0;
    int _220 = _55(_214, _216, _218, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _222 = _111;
    int _224 = 0;
    int _226 = 1;
    int _228 = _55(_222, _224, _226, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float4 _230 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_220, _228)), 0).xyzw;
    float _232 = _230.x;
    float _234 = _230.y;
    float _236 = _230.z;
    float _238 = _230.w;
    int _240 = _176;
    int _242 = 0;
    int _244 = 0;
    int _246 = _55(_240, _242, _244, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _248 = _111;
    int _250 = 0;
    int _252 = 1;
    int _254 = _55(_248, _250, _252, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float4 _256 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_246, _254)), 0).xyzw;
    float _258 = _256.x;
    float _260 = _256.y;
    float _262 = _256.z;
    float _264 = _256.w;
    int _266 = _176;
    int _268 = 0;
    int _270 = 0;
    int _272 = _55(_266, _268, _270, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _274 = _105;
    int _276 = 0;
    int _278 = 1;
    int _280 = _55(_274, _276, _278, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float4 _282 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_272, _280)), 0).xyzw;
    float _284 = _282.x;
    float _286 = _282.y;
    float _288 = _282.z;
    float _290 = _282.w;
    float _292 = floor(_101);
    float _294 = float(_105);
    float _296 = float(_109);
    float _298 = floor(_99);
    float _300 = 1.0 / _95;
    float _302 = -_292;
    float _304 = _101 + _302;
    float _306 = 1.0 / _97;
    float _308 = -_298;
    float _310 = _99 + _308;
    float _312 = float(_111);
    float _314 = -_304;
    float _316 = _314 + 1.0;
    float _318 = float(_176);
    float _320 = -_310;
    float _322 = _320 + 1.0;
    float _324 = _294 + 0.5;
    float _326 = _310 * _316;
    float _328 = _312 + 0.5;
    float _330 = _316 * _322;
    float _332 = _296 + 0.5;
    float _334 = _318 + 0.5;
    float _336 = _324 * _300;
    float _338 = _304 * _310;
    float _340 = _328 * _300;
    float _342 = _304 * _322;
    float _344 = _332 * _306;
    float _346 = _334 * _306;
    bool _350 = _129 >= 1.0;
    bool _352 = isnan(_129);
    bool _354 = _350 || _352;
    bool _356 = isnan(1.0);
    bool _358 = _354 || _356;
    float _360 = _99;
    float _362 = _328;
    float _364 = _310;
    float _366 = _318;
    float _368 = _150;
    float _370 = _152;
    float _372 = _154;
    float _374 = _129;
    float _376 = _156;
    float _378 = _238;
    float _380 = _264;
    float _382 = _284;
    if (_358)
    {
        _360 = _150;
    }
    float _384 = _360;
    float _386 = _384;
    float _388 = _384;
    if (_358)
    {
        _362 = _152;
    }
    float _390 = _362;
    float _392 = _390;
    float _394 = _390;
    if (_358)
    {
        _364 = _154;
    }
    float _396 = _364;
    float _398 = _396;
    float _400 = _396;
    if (!_358)
    {
        bool _402 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
        bool _404 = isnan(0.0);
        bool _406 = _402 || _404;
        bool _408 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
        bool _410 = _406 || _408;
        if (!_410)
        {
            float _412 = _150 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _386 = _412;
        }
        float _414 = _386;
        _388 = _414;
        if (!_410)
        {
            float _416 = _152 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _392 = _416;
        }
        float _418 = _392;
        _394 = _418;
        if (!_410)
        {
            float _420 = _154 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _398 = _420;
        }
        float _422 = _398;
        bool _424 = !_410;
        _400 = _422;
        if (!_424)
        {
            float _426 = _152 * 0.715200006961822509765625;
            float _428 = fma(_150, 0.2125999927520751953125, _426);
            float _430 = fma(_154, 0.072200000286102294921875, _428);
            float _432 = 1.0 / _430;
            float _434 = _432 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            float _436 = precise::clamp(_434, 0.0, 1.0);
            float _438 = fma(_436, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
            float _440 = _150 * _438;
            float _442 = _152 * _438;
            float _444 = _154 * _438;
            _388 = _440;
            _394 = _442;
            _400 = _444;
            _366 = _430;
        }
    }
    float _446 = _388;
    float _448 = _394;
    float _450 = _400;
    float _452 = _366;
    float _454 = _452;
    float _456 = _446;
    if (_358)
    {
        _368 = _446;
    }
    float _458 = _368;
    float _460 = _458;
    if (_358)
    {
        _370 = _448;
    }
    float _462 = _370;
    float _464 = _462;
    if (_358)
    {
        _372 = _450;
    }
    float _466 = _372;
    float _468 = _466;
    if (!_358)
    {
        float _470 = _336 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _472 = _344 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float2 _2435 = float2(_472, _470);
        float3 _476 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2435, float2(0.0), isnan(_2435))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2435, float2(0.0), isnan(_2435))).xyz;
        float _478 = _476.x;
        float _480 = _476.y;
        float _482 = _476.z;
        float _484 = _478 + _446;
        float _486 = _480 + _448;
        float _488 = _482 + _450;
        _468 = _488;
        _460 = _484;
        _464 = _486;
        _454 = _472;
    }
    float _490 = _468;
    float _492 = _460;
    float _494 = _464;
    float _496 = _454;
    float _498 = _496;
    float _500 = _492;
    float _502 = _494;
    if (_358)
    {
        _498 = _490;
    }
    float _504 = _498;
    float _506 = _504;
    if (!_358)
    {
        float _508 = _490 * 4.0;
        float _510 = _492 * 4.0;
        float _512 = _494 * 4.0;
        float _514 = -(*spvDescriptorSet0.fp_c4)._m0[0].z;
        float _516 = (*spvDescriptorSet0.fp_c4)._m0[0].w + _514;
        float _518 = (*spvDescriptorSet0.fp_c4)._m0[0].w + (*spvDescriptorSet0.fp_c4)._m0[0].z;
        uint _521 = as_type<uint>(half2(float2(_510, _512)));
        float _523 = -_518;
        float _525 = fma(_129, _516, _523);
        float _527 = (*spvDescriptorSet0.fp_c4)._m0[0].w * (-2.0);
        uint _529 = extract_bits(_521, 16u, 16u);
        float _531 = float(_529);
        float _533 = _527 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
        float _535 = 1.0 / _525;
        float _537 = -(*spvDescriptorSet0.fp_c4)._m0[9].y;
        float _539 = fma(_533, _535, _537);
        uint _541 = as_type<uint>(half2(float2(_508, 0.0)));
        float _543 = precise::max(0.0, _539);
        uint _545 = extract_bits(_541, 0u, 8u);
        int _547 = int(_545) & 255;
        uint _549 = extract_bits(_541, 8u, 8u);
        int _551 = int(_549) & 255;
        int _553 = _551 << 8;
        int _555 = _547 | _553;
        float _557 = _543 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
        float _559 = float(uint(_555));
        float _561 = _557 * (-1.44269502162933349609375);
        float _563 = exp2(_561);
        float _565 = _563 + (-0.5);
        int _567 = int(_521) & 32767;
        float _569 = fma(_565, (*spvDescriptorSet0.fp_c4)._m0[9].z, 0.5);
        float _571 = float(uint(_567));
        float _573 = precise::max(_569, (*spvDescriptorSet0.fp_c4)._m0[5].w);
        float _575 = fma(_531, 6.103515625e-05, -0.3125);
        float _577 = fma(_559, 6.103515625e-05, -0.3125);
        float _579 = fma(_571, 6.103515625e-05, -0.3125);
        bool _581 = _573 > 0.999000012874603271484375;
        float _583 = fma(_575, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        float _585 = fma(_577, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        float _587 = fma(_579, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        bool _589 = !_581;
        _456 = _583;
        _374 = _587;
        if (!_589)
        {
            float3 _2624 = float3(_587, _583, _585);
            float3 _591 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2624, float3(0.0), isnan(_2624))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2624, float3(0.0), isnan(_2624))).xyz;
            float _593 = _591.x;
            float _595 = _591.y;
            float _597 = _591.z;
            _500 = _593;
            _502 = _595;
            _506 = _597;
            _599 = true;
        }
        else
        {
            bool _601 = _573 >= 0.001000000047497451305389404296875;
            bool _603 = isnan(_573);
            bool _605 = _601 || _603;
            bool _607 = isnan(0.001000000047497451305389404296875);
            bool _609 = _605 || _607;
            if (!_609)
            {
                float3 _2661 = float3(_587, _583, _585);
                float3 _611 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2661, float3(0.0), isnan(_2661))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2661, float3(0.0), isnan(_2661))).xyz;
                float _613 = _611.x;
                float _615 = _611.y;
                float _617 = _611.z;
                _500 = _613;
                _502 = _615;
                _506 = _617;
                _599 = true;
            }
            else
            {
                float3 _2680 = float3(_587, _583, _585);
                float3 _619 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2680, float3(0.0), isnan(_2680))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2680, float3(0.0), isnan(_2680))).xyz;
                float _621 = _619.x;
                float _623 = _619.y;
                float _625 = _619.z;
                float3 _2695 = float3(_587, _583, _585);
                float3 _627 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2695, float3(0.0), isnan(_2695))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2695, float3(0.0), isnan(_2695))).xyz;
                float _629 = _627.x;
                float _631 = _627.y;
                float _633 = _627.z;
                float _635 = -_621;
                float _637 = _629 + _635;
                float _639 = -_623;
                float _641 = _631 + _639;
                float _643 = -_625;
                float _645 = _633 + _643;
                float _647 = fma(_637, _573, _621);
                float _649 = fma(_641, _573, _623);
                float _651 = fma(_645, _573, _625);
                _500 = _647;
                _502 = _649;
                _506 = _651;
            }
        }
    }
    _599 = false;
    float _653 = _500;
    float _655 = _502;
    float _657 = _506;
    float _659 = _456;
    float _661 = _374;
    bool _663 = _174 >= 1.0;
    bool _665 = isnan(_174);
    bool _667 = _663 || _665;
    bool _669 = isnan(1.0);
    bool _671 = _667 || _669;
    float _673 = _659;
    float _675 = _653;
    float _677 = _653;
    float _679 = _655;
    float _681 = _655;
    float _683 = _653;
    float _685 = _657;
    float _687 = _661;
    if (_671)
    {
        _673 = _232;
    }
    float _689 = _673;
    float _691 = _689;
    float _693 = _689;
    if (_671)
    {
        _675 = _234;
    }
    float _695 = _675;
    float _697 = _695;
    float _699 = _695;
    if (!_358)
    {
        bool _701 = _653 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _703 = isnan(_653);
        bool _705 = _701 || _703;
        bool _707 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _709 = _705 || _707;
        bool _711 = _655 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _713 = isnan(_655);
        bool _715 = _711 || _713;
        bool _717 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _719 = _715 || _717;
        float _721 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _653, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _723 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _655, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _725 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _657, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        bool _727 = _657 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _729 = isnan(_657);
        bool _731 = _727 || _729;
        bool _733 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _735 = _731 || _733;
        float _737 = exp2(_721);
        float _739 = exp2(_723);
        float _741 = exp2(_725);
        _687 = _737;
        if (_709)
        {
            float _743 = -_737;
            float _745 = _743 + 1.0;
            _677 = _745;
        }
        float _747 = _677;
        _683 = _747;
        if (_719)
        {
            float _749 = -_739;
            float _751 = _749 + 1.0;
            _679 = _751;
        }
        float _753 = _679;
        _681 = _753;
        if (_735)
        {
            float _755 = -_741;
            float _757 = _755 + 1.0;
            _685 = _757;
        }
    }
    float _759 = _681;
    float _761 = _683;
    float _763 = _685;
    float _765 = _687;
    float _767 = _765;
    float _769 = _761;
    float _771 = _761;
    float _773 = _759;
    float _775 = _763;
    if (_671)
    {
        _767 = _236;
    }
    float _777 = _767;
    float _779 = _777;
    float _781 = _777;
    if (!_671)
    {
        bool _783 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
        bool _785 = isnan(0.0);
        bool _787 = _783 || _785;
        bool _789 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
        bool _791 = _787 || _789;
        if (!_791)
        {
            float _793 = _232 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _691 = _793;
        }
        float _795 = _691;
        _693 = _795;
        if (!_791)
        {
            float _797 = _234 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _697 = _797;
        }
        float _799 = _697;
        _699 = _799;
        if (!_791)
        {
            float _801 = _236 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _779 = _801;
        }
        float _803 = _779;
        bool _805 = !_791;
        _781 = _803;
        if (!_805)
        {
            float _807 = _234 * 0.715200006961822509765625;
            float _809 = fma(_232, 0.2125999927520751953125, _807);
            float _811 = fma(_236, 0.072200000286102294921875, _809);
            float _813 = 1.0 / _811;
            float _815 = _813 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            float _817 = precise::clamp(_815, 0.0, 1.0);
            float _819 = fma(_817, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
            float _821 = _232 * _819;
            float _823 = _234 * _819;
            float _825 = _236 * _819;
            _693 = _821;
            _699 = _823;
            _769 = _817;
            _781 = _825;
        }
    }
    float _827 = _693;
    float _829 = _699;
    float _831 = _769;
    float _833 = _781;
    float _835 = _831;
    float _837 = _833;
    float _839 = _829;
    if (!_358)
    {
        float _841 = _761 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _771 = _841;
    }
    float _843 = _771;
    if (!_358)
    {
        float _845 = _759 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _773 = _845;
    }
    float _847 = _773;
    float _849 = _847;
    if (!_358)
    {
        float _851 = _763 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _775 = _851;
    }
    float _853 = _775;
    float _855 = _156 * _330;
    float _857 = _330 * _843;
    float _859 = _330 * _847;
    float _861 = _330 * _853;
    float _863 = _855;
    if (_671)
    {
        _835 = _827;
    }
    float _865 = _835;
    float _867 = _865;
    if (_671)
    {
        _376 = _829;
    }
    float _869 = _376;
    float _871 = _869;
    if (!_671)
    {
        float _873 = _344 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _875 = _340 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
        float2 _3063 = float2(_873, _875);
        float3 _877 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_3063, float2(0.0), isnan(_3063))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_3063, float2(0.0), isnan(_3063))).xyz;
        float _879 = _877.x;
        float _881 = _877.y;
        float _883 = _877.z;
        float _885 = _879 + _827;
        float _887 = _881 + _829;
        float _889 = _883 + _833;
        _837 = _889;
        _867 = _885;
        _871 = _887;
        _849 = _883;
    }
    float _891 = _837;
    float _893 = _867;
    float _895 = _871;
    float _897 = _849;
    float _899 = _893;
    float _901 = _895;
    float _903 = _897;
    if (_671)
    {
        _839 = _891;
    }
    float _905 = _839;
    float _907 = _905;
    if (!_671)
    {
        float _909 = _893 * 4.0;
        float _911 = _895 * 4.0;
        float _913 = _891 * 4.0;
        float _915 = -(*spvDescriptorSet0.fp_c4)._m0[0].z;
        float _917 = (*spvDescriptorSet0.fp_c4)._m0[0].w + _915;
        float _919 = (*spvDescriptorSet0.fp_c4)._m0[0].w + (*spvDescriptorSet0.fp_c4)._m0[0].z;
        float _921 = (*spvDescriptorSet0.fp_c4)._m0[0].w * (-2.0);
        uint _923 = as_type<uint>(half2(float2(_909, _911)));
        float _925 = -_919;
        float _927 = fma(_174, _917, _925);
        float _929 = _921 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
        uint _931 = extract_bits(_923, 16u, 16u);
        float _933 = float(_931);
        uint _935 = as_type<uint>(half2(float2(_913, 0.0)));
        uint _937 = extract_bits(_935, 0u, 8u);
        int _939 = int(_937) & 255;
        uint _941 = extract_bits(_935, 8u, 8u);
        int _943 = int(_941) & 255;
        int _945 = _943 << 8;
        int _947 = _939 | _945;
        float _949 = 1.0 / _927;
        float _951 = float(uint(_947));
        float _953 = -(*spvDescriptorSet0.fp_c4)._m0[9].y;
        float _955 = fma(_929, _949, _953);
        float _957 = precise::max(0.0, _955);
        float _959 = _957 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
        float _961 = _959 * (-1.44269502162933349609375);
        float _963 = exp2(_961);
        float _965 = _963 + (-0.5);
        int _967 = int(_923) & 32767;
        float _969 = fma(_965, (*spvDescriptorSet0.fp_c4)._m0[9].z, 0.5);
        float _971 = float(uint(_967));
        float _973 = precise::max(_969, (*spvDescriptorSet0.fp_c4)._m0[5].w);
        float _975 = fma(_951, 6.103515625e-05, -0.3125);
        float _977 = fma(_933, 6.103515625e-05, -0.3125);
        float _979 = fma(_971, 6.103515625e-05, -0.3125);
        bool _981 = _973 > 0.999000012874603271484375;
        float _983 = fma(_975, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        float _985 = fma(_977, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        float _987 = fma(_979, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        bool _989 = !_981;
        _903 = _919;
        if (!_989)
        {
            float3 _3235 = float3(_987, _985, _983);
            float3 _991 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_3235, float3(0.0), isnan(_3235))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_3235, float3(0.0), isnan(_3235))).xyz;
            float _993 = _991.x;
            float _995 = _991.y;
            float _997 = _991.z;
            _899 = _993;
            _901 = _995;
            _907 = _997;
            _999 = true;
        }
        else
        {
            bool _1001 = _973 >= 0.001000000047497451305389404296875;
            bool _1003 = isnan(_973);
            bool _1005 = _1001 || _1003;
            bool _1007 = isnan(0.001000000047497451305389404296875);
            bool _1009 = _1005 || _1007;
            if (!_1009)
            {
                float3 _3268 = float3(_987, _985, _983);
                float3 _1011 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_3268, float3(0.0), isnan(_3268))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_3268, float3(0.0), isnan(_3268))).xyz;
                float _1013 = _1011.x;
                float _1015 = _1011.y;
                float _1017 = _1011.z;
                _899 = _1013;
                _901 = _1015;
                _907 = _1017;
                _999 = true;
            }
            else
            {
                float3 _3287 = float3(_987, _985, _983);
                float3 _1019 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_3287, float3(0.0), isnan(_3287))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_3287, float3(0.0), isnan(_3287))).xyz;
                float _1021 = _1019.x;
                float _1023 = _1019.y;
                float _1025 = _1019.z;
                float3 _3302 = float3(_987, _985, _983);
                float3 _1027 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_3302, float3(0.0), isnan(_3302))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_3302, float3(0.0), isnan(_3302))).xyz;
                float _1029 = _1027.x;
                float _1031 = _1027.y;
                float _1033 = _1027.z;
                float _1035 = -_1021;
                float _1037 = _1029 + _1035;
                float _1039 = -_1023;
                float _1041 = _1031 + _1039;
                float _1043 = -_1025;
                float _1045 = _1033 + _1043;
                float _1047 = fma(_973, _1037, _1021);
                float _1049 = fma(_973, _1041, _1023);
                float _1051 = fma(_973, _1045, _1025);
                _899 = _1047;
                _901 = _1049;
                _907 = _1051;
                _903 = _1031;
            }
        }
    }
    _999 = false;
    float _1053 = _899;
    float _1055 = _901;
    float _1057 = _907;
    float _1059 = _903;
    float _1061 = fma(_238, _326, _855);
    bool _1063 = _194 >= 1.0;
    bool _1065 = isnan(_194);
    bool _1067 = _1063 || _1065;
    bool _1069 = isnan(1.0);
    bool _1071 = _1067 || _1069;
    float _1073 = _1055;
    float _1075 = _1053;
    float _1077 = _1055;
    float _1079 = _1057;
    float _1081 = _1053;
    float _1083 = _1057;
    float _1085 = _1059;
    if (_671)
    {
        _1073 = _1053;
    }
    float _1087 = _1073;
    float _1089 = _1087;
    if (_671)
    {
        _378 = _1055;
    }
    float _1091 = _378;
    float _1093 = _1091;
    if (_671)
    {
        _863 = _1057;
    }
    float _1095 = _863;
    float _1097 = _1095;
    if (!_671)
    {
        bool _1099 = _1053 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _1101 = isnan(_1053);
        bool _1103 = _1099 || _1101;
        bool _1105 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1107 = _1103 || _1105;
        bool _1109 = _1055 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _1111 = isnan(_1055);
        bool _1113 = _1109 || _1111;
        bool _1115 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1117 = _1113 || _1115;
        float _1119 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _1053, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _1121 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _1055, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _1123 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _1057, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        bool _1125 = _1057 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _1127 = isnan(_1057);
        bool _1129 = _1125 || _1127;
        bool _1131 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1133 = _1129 || _1131;
        float _1135 = exp2(_1119);
        float _1137 = exp2(_1121);
        float _1139 = exp2(_1123);
        if (_1107)
        {
            float _1141 = -_1135;
            float _1143 = _1141 + 1.0;
            _1075 = _1143;
        }
        float _1145 = _1075;
        _1089 = _1145;
        _1081 = _1145;
        if (_1117)
        {
            float _1147 = -_1137;
            float _1149 = _1147 + 1.0;
            _1077 = _1149;
        }
        float _1151 = _1077;
        _1093 = _1151;
        if (_1133)
        {
            float _1153 = -_1139;
            float _1155 = _1153 + 1.0;
            _1079 = _1155;
        }
        float _1157 = _1079;
        _1097 = _1157;
        _1083 = _1157;
    }
    float _1159 = _1089;
    float _1161 = _1093;
    float _1163 = _1097;
    float _1165 = _1081;
    float _1167 = _1083;
    float _1169 = _1159;
    float _1171 = _1165;
    float _1173 = _1161;
    float _1175 = _1167;
    float _1177 = _1163;
    float _1179 = _1161;
    float _1181 = _1163;
    if (!_671)
    {
        float _1183 = _1159 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1169 = _1183;
    }
    float _1185 = _1169;
    if (_1071)
    {
        _1171 = _258;
    }
    float _1187 = _1171;
    float _1189 = _1187;
    float _1191 = _1187;
    if (!_671)
    {
        float _1193 = _1161 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1173 = _1193;
    }
    float _1195 = _1173;
    if (_1071)
    {
        _1175 = _260;
    }
    float _1197 = _1175;
    float _1199 = _1197;
    float _1201 = _1197;
    if (!_671)
    {
        float _1203 = _1163 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1177 = _1203;
    }
    float _1205 = _1177;
    float _1207 = _1205;
    if (_1071)
    {
        _1085 = _262;
    }
    float _1209 = _1085;
    float _1211 = _1209;
    float _1213 = _1209;
    if (!_1071)
    {
        bool _1215 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
        bool _1217 = isnan(0.0);
        bool _1219 = _1215 || _1217;
        bool _1221 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
        bool _1223 = _1219 || _1221;
        if (!_1223)
        {
            float _1225 = _258 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _1189 = _1225;
        }
        float _1227 = _1189;
        _1191 = _1227;
        if (!_1223)
        {
            float _1229 = _260 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _1199 = _1229;
        }
        float _1231 = _1199;
        _1201 = _1231;
        if (!_1223)
        {
            float _1233 = _262 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _1211 = _1233;
        }
        float _1235 = _1211;
        bool _1237 = !_1223;
        _1213 = _1235;
        if (!_1237)
        {
            float _1239 = _260 * 0.715200006961822509765625;
            float _1241 = fma(_258, 0.2125999927520751953125, _1239);
            float _1243 = fma(_262, 0.072200000286102294921875, _1241);
            float _1245 = 1.0 / _1243;
            float _1247 = _1245 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            float _1249 = precise::clamp(_1247, 0.0, 1.0);
            float _1251 = fma(_1249, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
            float _1253 = _258 * _1251;
            float _1255 = _260 * _1251;
            float _1257 = _262 * _1251;
            _1191 = _1253;
            _1201 = _1255;
            _1179 = _1251;
            _1213 = _1257;
            _1181 = _1249;
        }
    }
    float _1259 = _1191;
    float _1261 = _1201;
    float _1263 = _1179;
    float _1265 = _1213;
    float _1267 = _1181;
    float _1269 = fma(_326, _1205, _861);
    float _1271 = fma(_326, _1185, _857);
    float _1273 = fma(_326, _1195, _859);
    float _1275 = _1263;
    float _1277 = _1265;
    float _1279 = _1267;
    if (_1071)
    {
        _1207 = _1259;
    }
    float _1281 = _1207;
    float _1283 = _1281;
    if (_1071)
    {
        _1275 = _1261;
    }
    float _1285 = _1275;
    float _1287 = _1285;
    if (!_1071)
    {
        float _1289 = _346 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _1291 = _340 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
        float2 _3698 = float2(_1289, _1291);
        float3 _1293 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_3698, float2(0.0), isnan(_3698))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_3698, float2(0.0), isnan(_3698))).xyz;
        float _1295 = _1293.x;
        float _1297 = _1293.y;
        float _1299 = _1293.z;
        float _1301 = _1295 + _1259;
        float _1303 = _1297 + _1261;
        float _1305 = _1299 + _1265;
        _1283 = _1301;
        _1287 = _1303;
        _1277 = _1305;
        _1279 = _1299;
    }
    float _1307 = _1283;
    float _1309 = _1287;
    float _1311 = _1277;
    float _1313 = _1279;
    float _1315 = _1307;
    float _1317 = _1309;
    float _1319 = _1311;
    float _1321 = _1313;
    if (!_1071)
    {
        float _1323 = _1307 * 4.0;
        float _1325 = _1309 * 4.0;
        float _1327 = -(*spvDescriptorSet0.fp_c4)._m0[0].z;
        float _1329 = (*spvDescriptorSet0.fp_c4)._m0[0].w + _1327;
        float _1331 = (*spvDescriptorSet0.fp_c4)._m0[0].w + (*spvDescriptorSet0.fp_c4)._m0[0].z;
        float _1333 = (*spvDescriptorSet0.fp_c4)._m0[0].w * (-2.0);
        uint _1335 = as_type<uint>(half2(float2(_1323, _1325)));
        float _1337 = _1311 * 4.0;
        float _1339 = -_1331;
        float _1341 = fma(_194, _1329, _1339);
        float _1343 = _1333 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
        uint _1345 = extract_bits(_1335, 16u, 16u);
        float _1347 = float(_1345);
        uint _1349 = as_type<uint>(half2(float2(_1337, 0.0)));
        uint _1351 = extract_bits(_1349, 0u, 8u);
        int _1353 = int(_1351) & 255;
        uint _1355 = extract_bits(_1349, 8u, 8u);
        int _1357 = int(_1355) & 255;
        int _1359 = _1357 << 8;
        int _1361 = _1353 | _1359;
        float _1363 = 1.0 / _1341;
        float _1365 = float(uint(_1361));
        float _1367 = fma(_1365, 6.103515625e-05, -0.3125);
        float _1369 = fma(_1347, 6.103515625e-05, -0.3125);
        float _1371 = -(*spvDescriptorSet0.fp_c4)._m0[9].y;
        float _1373 = fma(_1343, _1363, _1371);
        float _1375 = precise::max(0.0, _1373);
        float _1377 = _1375 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
        float _1379 = _1377 * (-1.44269502162933349609375);
        float _1381 = exp2(_1379);
        float _1383 = _1381 + (-0.5);
        int _1385 = int(_1335) & 32767;
        float _1387 = fma(_1383, (*spvDescriptorSet0.fp_c4)._m0[9].z, 0.5);
        float _1389 = float(uint(_1385));
        float _1391 = fma(_1369, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        float _1393 = precise::max(_1387, (*spvDescriptorSet0.fp_c4)._m0[5].w);
        float _1395 = fma(_1389, 6.103515625e-05, -0.3125);
        float _1397 = fma(_1367, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        bool _1399 = _1393 > 0.999000012874603271484375;
        float _1401 = fma(_1395, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        bool _1403 = !_1399;
        _1321 = _1395;
        if (!_1403)
        {
            float3 _3865 = float3(_1401, _1391, _1397);
            float3 _1405 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_3865, float3(0.0), isnan(_3865))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_3865, float3(0.0), isnan(_3865))).xyz;
            float _1407 = _1405.x;
            float _1409 = _1405.y;
            float _1411 = _1405.z;
            _1315 = _1407;
            _1317 = _1409;
            _1319 = _1411;
            _1413 = true;
        }
        else
        {
            bool _1415 = _1393 >= 0.001000000047497451305389404296875;
            bool _1417 = isnan(_1393);
            bool _1419 = _1415 || _1417;
            bool _1421 = isnan(0.001000000047497451305389404296875);
            bool _1423 = _1419 || _1421;
            if (!_1423)
            {
                float3 _3898 = float3(_1401, _1391, _1397);
                float3 _1425 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_3898, float3(0.0), isnan(_3898))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_3898, float3(0.0), isnan(_3898))).xyz;
                float _1427 = _1425.x;
                float _1429 = _1425.y;
                float _1431 = _1425.z;
                _1315 = _1427;
                _1317 = _1429;
                _1319 = _1431;
                _1413 = true;
            }
            else
            {
                float3 _3917 = float3(_1401, _1391, _1397);
                float3 _1433 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_3917, float3(0.0), isnan(_3917))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_3917, float3(0.0), isnan(_3917))).xyz;
                float _1435 = _1433.x;
                float _1437 = _1433.y;
                float _1439 = _1433.z;
                float3 _3932 = float3(_1401, _1391, _1397);
                float3 _1441 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_3932, float3(0.0), isnan(_3932))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_3932, float3(0.0), isnan(_3932))).xyz;
                float _1443 = _1441.x;
                float _1445 = _1441.y;
                float _1447 = _1441.z;
                float _1449 = -_1435;
                float _1451 = _1443 + _1449;
                float _1453 = -_1437;
                float _1455 = _1445 + _1453;
                float _1457 = -_1439;
                float _1459 = _1447 + _1457;
                float _1461 = fma(_1393, _1451, _1435);
                float _1463 = fma(_1393, _1455, _1437);
                float _1465 = fma(_1393, _1459, _1439);
                _1315 = _1461;
                _1317 = _1463;
                _1319 = _1465;
                _1321 = _1451;
            }
        }
    }
    _1413 = false;
    float _1467 = _1315;
    float _1469 = _1317;
    float _1471 = _1319;
    float _1473 = _1321;
    bool _1475 = _212 >= 1.0;
    bool _1477 = isnan(_212);
    bool _1479 = _1475 || _1477;
    bool _1481 = isnan(1.0);
    bool _1483 = _1479 || _1481;
    float _1485 = fma(_264, _338, _1061);
    float _1487 = _1473;
    float _1489 = _1467;
    float _1491 = _1467;
    float _1493 = _1471;
    float _1495 = _1469;
    float _1497 = _1469;
    float _1499 = _1469;
    float _1501 = _1467;
    if (_1071)
    {
        _1487 = _1467;
    }
    float _1503 = _1487;
    float _1505 = _1503;
    if (_1071)
    {
        _1489 = _1471;
    }
    float _1507 = _1489;
    float _1509 = _1507;
    if (!_1071)
    {
        bool _1511 = _1467 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _1513 = isnan(_1467);
        bool _1515 = _1511 || _1513;
        bool _1517 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1519 = _1515 || _1517;
        bool _1521 = _1471 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _1523 = isnan(_1471);
        bool _1525 = _1521 || _1523;
        bool _1527 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1529 = _1525 || _1527;
        float _1531 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _1467, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _1533 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _1471, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _1535 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _1469, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        bool _1537 = _1469 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _1539 = isnan(_1469);
        bool _1541 = _1537 || _1539;
        bool _1543 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1545 = _1541 || _1543;
        float _1547 = exp2(_1531);
        float _1549 = exp2(_1533);
        float _1551 = exp2(_1535);
        if (_1519)
        {
            float _1553 = -_1547;
            float _1555 = _1553 + 1.0;
            _1491 = _1555;
        }
        float _1557 = _1491;
        _1505 = _1557;
        _1499 = _1549;
        _1501 = _1557;
        if (_1529)
        {
            float _1559 = -_1549;
            float _1561 = _1559 + 1.0;
            _1493 = _1561;
        }
        float _1563 = _1493;
        if (_1545)
        {
            float _1565 = -_1551;
            float _1567 = _1565 + 1.0;
            _1495 = _1567;
        }
        float _1569 = _1495;
        _1497 = _1569;
        _1509 = _1563;
    }
    float _1571 = _1505;
    float _1573 = _1497;
    float _1575 = _1509;
    float _1577 = _1499;
    float _1579 = _1501;
    float _1581 = _1573;
    float _1583 = _1571;
    float _1585 = _1571;
    float _1587 = _1575;
    float _1589 = _1579;
    float _1591 = _1577;
    if (_1483)
    {
        _380 = _284;
    }
    float _1593 = _380;
    float _1595 = _1593;
    float _1597 = _1593;
    if (!_1071)
    {
        float _1599 = _1573 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1581 = _1599;
    }
    float _1601 = _1581;
    if (_1483)
    {
        _1583 = _286;
    }
    float _1603 = _1583;
    float _1605 = _1603;
    float _1607 = _1603;
    if (!_1071)
    {
        float _1609 = _1571 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1585 = _1609;
    }
    float _1611 = _1585;
    if (!_1071)
    {
        float _1613 = _1575 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1587 = _1613;
    }
    float _1615 = _1587;
    float _1617 = _1615;
    if (_1483)
    {
        _1589 = _288;
    }
    float _1619 = _1589;
    float _1621 = _1619;
    float _1623 = _1619;
    if (!_1483)
    {
        bool _1625 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
        bool _1627 = isnan(0.0);
        bool _1629 = _1625 || _1627;
        bool _1631 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
        bool _1633 = _1629 || _1631;
        if (!_1633)
        {
            float _1635 = _284 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _1595 = _1635;
        }
        float _1637 = _1595;
        _1597 = _1637;
        if (!_1633)
        {
            float _1639 = _286 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _1605 = _1639;
        }
        float _1641 = _1605;
        _1607 = _1641;
        if (!_1633)
        {
            float _1643 = _288 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _1621 = _1643;
        }
        float _1645 = _1621;
        bool _1647 = !_1633;
        _1623 = _1645;
        if (!_1647)
        {
            float _1649 = _286 * 0.715200006961822509765625;
            float _1651 = fma(_284, 0.2125999927520751953125, _1649);
            float _1653 = fma(_288, 0.072200000286102294921875, _1651);
            float _1655 = 1.0 / _1653;
            float _1657 = _1655 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            float _1659 = precise::clamp(_1657, 0.0, 1.0);
            float _1661 = fma(_1659, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
            float _1663 = _284 * _1661;
            float _1665 = _286 * _1661;
            float _1667 = _288 * _1661;
            _1607 = _1665;
            _1591 = _1655;
            _1597 = _1663;
            _1623 = _1667;
        }
    }
    float _1669 = _1607;
    float _1671 = _1591;
    float _1673 = _1597;
    float _1675 = _1623;
    float _1677 = fma(_338, _1601, _1273);
    float _1679 = fma(_338, _1611, _1271);
    float _1681 = fma(_338, _1615, _1269);
    float _1683 = _1671;
    float _1685 = _1673;
    float _1687 = _1675;
    float _1689 = _1669;
    if (_1483)
    {
        _1683 = _1669;
    }
    float _1691 = _1683;
    float _1693 = _1691;
    if (!_1483)
    {
        float _1695 = _346 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _1697 = _336 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
        float2 _4315 = float2(_1695, _1697);
        float3 _1699 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_4315, float2(0.0), isnan(_4315))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_4315, float2(0.0), isnan(_4315))).xyz;
        float _1701 = _1699.x;
        float _1703 = _1699.y;
        float _1705 = _1699.z;
        float _1707 = _1701 + _1673;
        float _1709 = _1703 + _1669;
        float _1711 = _1705 + _1675;
        _1685 = _1707;
        _1693 = _1709;
        _1617 = _1701;
        _1687 = _1711;
        _382 = _1705;
    }
    float _1713 = _1685;
    float _1715 = _1693;
    float _1717 = _1617;
    float _1719 = _1687;
    float _1721 = _382;
    float _1723 = _1717;
    float _1725 = _1715;
    float _1727 = _1719;
    float _1729 = _1721;
    if (_1483)
    {
        _1723 = _1713;
    }
    float _1731 = _1723;
    float _1733 = _1731;
    if (!_1483)
    {
        float _1735 = _1715 * 4.0;
        float _1737 = -(*spvDescriptorSet0.fp_c4)._m0[0].z;
        float _1739 = (*spvDescriptorSet0.fp_c4)._m0[0].w + _1737;
        float _1741 = (*spvDescriptorSet0.fp_c4)._m0[0].w + (*spvDescriptorSet0.fp_c4)._m0[0].z;
        float _1743 = (*spvDescriptorSet0.fp_c4)._m0[0].w * (-2.0);
        float _1745 = -_1741;
        float _1747 = fma(_212, _1739, _1745);
        float _1749 = _1743 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
        float _1751 = _1713 * 4.0;
        float _1753 = 1.0 / _1747;
        uint _1755 = as_type<uint>(half2(float2(_1751, _1735)));
        uint _1757 = extract_bits(_1755, 16u, 16u);
        float _1759 = float(_1757);
        float _1761 = -(*spvDescriptorSet0.fp_c4)._m0[9].y;
        float _1763 = fma(_1749, _1753, _1761);
        float _1765 = _1719 * 4.0;
        float _1767 = precise::max(0.0, _1763);
        uint _1769 = as_type<uint>(half2(float2(_1765, 0.0)));
        float _1771 = fma(_1759, 6.103515625e-05, -0.3125);
        float _1773 = _1767 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
        uint _1775 = extract_bits(_1769, 0u, 8u);
        int _1777 = int(_1775) & 255;
        uint _1779 = extract_bits(_1769, 8u, 8u);
        int _1781 = int(_1779) & 255;
        int _1783 = _1781 << 8;
        int _1785 = _1777 | _1783;
        float _1787 = fma(_1771, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        float _1789 = _1773 * (-1.44269502162933349609375);
        float _1791 = float(uint(_1785));
        float _1793 = exp2(_1789);
        float _1795 = fma(_1791, 6.103515625e-05, -0.3125);
        float _1797 = _1793 + (-0.5);
        int _1799 = int(_1755) & 32767;
        float _1801 = fma(_1797, (*spvDescriptorSet0.fp_c4)._m0[9].z, 0.5);
        float _1803 = float(uint(_1799));
        float _1805 = fma(_1795, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        float _1807 = precise::max(_1801, (*spvDescriptorSet0.fp_c4)._m0[5].w);
        float _1809 = fma(_1803, 6.103515625e-05, -0.3125);
        bool _1811 = _1807 > 0.999000012874603271484375;
        float _1813 = fma(_1809, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        bool _1815 = !_1811;
        _1689 = as_type<float>(_1755);
        _1729 = _1809;
        if (!_1815)
        {
            float3 _4492 = float3(_1813, _1787, _1805);
            float3 _1817 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_4492, float3(0.0), isnan(_4492))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_4492, float3(0.0), isnan(_4492))).xyz;
            float _1819 = _1817.x;
            float _1821 = _1817.y;
            float _1823 = _1817.z;
            _1733 = _1819;
            _1725 = _1821;
            _1727 = _1823;
            _1825 = true;
        }
        else
        {
            bool _1827 = _1807 >= 0.001000000047497451305389404296875;
            bool _1829 = isnan(_1807);
            bool _1831 = _1827 || _1829;
            bool _1833 = isnan(0.001000000047497451305389404296875);
            bool _1835 = _1831 || _1833;
            if (!_1835)
            {
                float3 _4525 = float3(_1813, _1787, _1805);
                float3 _1837 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_4525, float3(0.0), isnan(_4525))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_4525, float3(0.0), isnan(_4525))).xyz;
                float _1839 = _1837.x;
                float _1841 = _1837.y;
                float _1843 = _1837.z;
                _1733 = _1839;
                _1725 = _1841;
                _1727 = _1843;
                _1825 = true;
            }
            else
            {
                float3 _4544 = float3(_1813, _1787, _1805);
                float3 _1845 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_4544, float3(0.0), isnan(_4544))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_4544, float3(0.0), isnan(_4544))).xyz;
                float _1847 = _1845.x;
                float _1849 = _1845.y;
                float _1851 = _1845.z;
                float3 _4559 = float3(_1813, _1787, _1805);
                float3 _1853 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_4559, float3(0.0), isnan(_4559))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_4559, float3(0.0), isnan(_4559))).xyz;
                float _1855 = _1853.x;
                float _1857 = _1853.y;
                float _1859 = _1853.z;
                float _1861 = -_1847;
                float _1863 = _1855 + _1861;
                float _1865 = -_1849;
                float _1867 = _1857 + _1865;
                float _1869 = -_1851;
                float _1871 = _1859 + _1869;
                float _1873 = fma(_1807, _1863, _1847);
                float _1875 = fma(_1807, _1867, _1849);
                float _1877 = fma(_1807, _1871, _1851);
                _1733 = _1873;
                _1725 = _1875;
                _1727 = _1877;
                _1689 = _1867;
                _1729 = _1863;
            }
        }
    }
    _1825 = false;
    float _1879 = _1733;
    float _1881 = _1725;
    float _1883 = _1727;
    float _1885 = _1689;
    float _1887 = _1729;
    float _1889 = _1885;
    float _1891 = _1887;
    float _1893 = _1879;
    float _1895 = _1881;
    float _1897 = _1883;
    float _1899 = _1879;
    if (_1483)
    {
        _1889 = _1881;
    }
    float _1901 = _1889;
    float _1903 = _1901;
    if (_1483)
    {
        _1891 = _1883;
    }
    float _1905 = _1891;
    float _1907 = _1905;
    if (!_1483)
    {
        bool _1909 = _1881 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _1911 = isnan(_1881);
        bool _1913 = _1909 || _1911;
        bool _1915 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1917 = _1913 || _1915;
        bool _1919 = _1883 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _1921 = isnan(_1883);
        bool _1923 = _1919 || _1921;
        bool _1925 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1927 = _1923 || _1925;
        float _1929 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _1879, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _1931 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _1881, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _1933 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _1883, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        bool _1935 = _1879 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _1937 = isnan(_1879);
        bool _1939 = _1935 || _1937;
        bool _1941 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1943 = _1939 || _1941;
        float _1945 = exp2(_1929);
        float _1947 = exp2(_1931);
        float _1949 = exp2(_1933);
        if (_1943)
        {
            float _1951 = -_1945;
            float _1953 = _1951 + 1.0;
            _1893 = _1953;
        }
        float _1955 = _1893;
        _1899 = _1955;
        if (_1917)
        {
            float _1957 = -_1947;
            float _1959 = _1957 + 1.0;
            _1895 = _1959;
        }
        float _1961 = _1895;
        if (_1927)
        {
            float _1963 = -_1949;
            float _1965 = _1963 + 1.0;
            _1897 = _1965;
        }
        float _1967 = _1897;
        _1903 = _1961;
        _1907 = _1967;
    }
    float _1969 = _1899;
    float _1971 = _1903;
    float _1973 = _1907;
    float _1975 = _1969;
    float _1977 = _1971;
    float _1979 = _1973;
    if (!_1483)
    {
        float _1981 = _1969 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1975 = _1981;
    }
    float _1983 = _1975;
    if (!_1483)
    {
        float _1985 = _1971 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1977 = _1985;
    }
    float _1987 = _1977;
    if (!_1483)
    {
        float _1989 = _1973 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1979 = _1989;
    }
    float _1991 = _1979;
    float _1993 = fma(_290, _342, _1485);
    float _1995 = fma(_342, _1983, _1679);
    float _1997 = fma(_342, _1987, _1677);
    float _1999 = fma(_342, _1991, _1681);
    out.m_47.x = _1995;
    out.m_47.y = _1997;
    out.m_47.z = _1999;
    out.m_47.w = _1993;
    return out;
}

