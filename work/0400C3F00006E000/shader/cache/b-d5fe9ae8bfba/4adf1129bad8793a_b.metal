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
int _53(thread const int& _4649, thread const int& _4650, constant _10& support_buffer)
{
    int _4653 = 1 + _4650;
    float _4655 = support_buffer._m5[_4653].x;
    float _4657 = abs(_4655);
    bool _4659 = _4657 == 1.0;
    if (_4659)
    {
        return _4649;
    }
    float _4661 = float(_4649);
    float _4663 = _4661 / _4657;
    int _4665 = int(_4663);
    return _4665;
}

static inline __attribute__((always_inline))
int _55(thread const int& _4687, thread const int& _4688, thread const int& _4689, constant _10& support_buffer, thread float4& gl_FragCoord)
{
    int _4692 = 1 + _4688;
    float _4694 = support_buffer._m5[_4692].x;
    bool _4696 = _4694 == 1.0;
    if (_4696)
    {
        return _4687;
    }
    bool _4698 = _4694 < 0.0;
    if (_4698)
    {
        float _4700 = -_4694;
        float _4702 = float(_4687);
        float _4704 = _4702 * _4700;
        float _4706 = gl_FragCoord.x;
        float _4708 = gl_FragCoord.y;
        float _4710 = (_4689 != 0) ? _4708 : _4706;
        float _4712 = mod(_4710, _4700);
        float _4714 = _4704 + _4712;
        int _4716 = int(_4714);
        return _4716;
    }
    float _4718 = float(_4687);
    float _4720 = _4718 * _4694;
    int _4722 = int(_4720);
    return _4722;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _1769 = false;
    bool _1359 = false;
    bool _955 = false;
    bool _577 = false;
    int _58 = int2(spvDescriptorSet0.fp_t_tcb_8.get_width(), spvDescriptorSet0.fp_t_tcb_8.get_height()).x;
    int _60 = _58;
    int _62 = 0;
    int _64 = _53(_60, _62, (*spvDescriptorSet0.support_buffer));
    int _66 = int2(spvDescriptorSet0.fp_t_tcb_8.get_width(), spvDescriptorSet0.fp_t_tcb_8.get_height()).y;
    int _68 = _66;
    int _70 = 0;
    int _72 = _53(_68, _70, (*spvDescriptorSet0.support_buffer));
    float _75 = gl_FragCoord.w;
    float _77 = in.m_44.y;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_44.x;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = 1.0 / _75;
    float _91 = _89 * _81;
    float _93 = _89 * _87;
    float _95 = float(_72);
    float _97 = float(_64);
    float _99 = fma(_91, _95, -0.4999000132083892822265625);
    float _101 = fma(_93, _97, -0.4999000132083892822265625);
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
    float _294 = float(_109);
    float _296 = float(_105);
    float _298 = float(_111);
    float _300 = float(_176);
    float _302 = floor(_99);
    float _304 = _296 + 0.5;
    float _306 = 1.0 / _97;
    float _308 = -_292;
    float _310 = _101 + _308;
    float _312 = 1.0 / _95;
    float _314 = -_302;
    float _316 = _99 + _314;
    float _318 = _294 + 0.5;
    float _320 = -_310;
    float _322 = _320 + 1.0;
    float _324 = _298 + 0.5;
    float _326 = -_316;
    float _328 = _326 + 1.0;
    float _330 = _300 + 0.5;
    float _332 = _316 * _322;
    float _334 = _318 * _306;
    float _336 = _310 * _316;
    float _338 = _322 * _328;
    float _340 = _310 * _328;
    float _342 = _330 * _306;
    float _344 = _304 * _312;
    float _346 = _324 * _312;
    bool _350 = _129 >= 1.0;
    bool _352 = isnan(_129);
    bool _354 = _350 || _352;
    bool _356 = isnan(1.0);
    bool _358 = _354 || _356;
    float _360 = _328;
    float _362 = _310;
    float _364 = _129;
    float _366 = _316;
    float _368 = _324;
    float _370 = _150;
    float _372 = _152;
    float _374 = _154;
    float _376 = _234;
    float _378 = _232;
    float _380 = _238;
    float _382 = _194;
    float _384 = _262;
    float _386 = _258;
    float _388 = _264;
    float _390 = _344;
    float _392 = _284;
    if (_358)
    {
        _360 = _150;
    }
    float _394 = _360;
    float _396 = _394;
    float _398 = _394;
    if (_358)
    {
        _362 = _152;
    }
    float _400 = _362;
    float _402 = _400;
    float _404 = _400;
    if (_358)
    {
        _364 = _154;
    }
    float _406 = _364;
    float _408 = _406;
    float _410 = _406;
    if (!_358)
    {
        bool _412 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
        bool _414 = isnan(0.0);
        bool _416 = _412 || _414;
        bool _418 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
        bool _420 = _416 || _418;
        if (!_420)
        {
            float _422 = _150 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _396 = _422;
        }
        float _424 = _396;
        _398 = _424;
        if (!_420)
        {
            float _426 = _152 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _402 = _426;
        }
        float _428 = _402;
        _404 = _428;
        if (!_420)
        {
            float _430 = _154 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _408 = _430;
        }
        float _432 = _408;
        bool _434 = !_420;
        _410 = _432;
        if (!_434)
        {
            float _436 = _152 * 0.715200006961822509765625;
            float _438 = fma(_150, 0.2125999927520751953125, _436);
            float _440 = fma(_154, 0.072200000286102294921875, _438);
            float _442 = 1.0 / _440;
            float _444 = _442 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            float _446 = precise::clamp(_444, 0.0, 1.0);
            float _448 = fma(_446, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
            float _450 = _150 * _448;
            float _452 = _152 * _448;
            float _454 = _154 * _448;
            _398 = _450;
            _404 = _452;
            _410 = _454;
            _366 = _440;
            _368 = _448;
        }
    }
    float _456 = _398;
    float _458 = _404;
    float _460 = _410;
    float _462 = _366;
    float _464 = _368;
    float _466 = _462;
    float _468 = _464;
    if (_358)
    {
        _370 = _456;
    }
    float _470 = _370;
    float _472 = _470;
    if (_358)
    {
        _372 = _458;
    }
    float _474 = _372;
    float _476 = _474;
    if (_358)
    {
        _374 = _460;
    }
    float _478 = _374;
    float _480 = _478;
    if (!_358)
    {
        float _482 = _334 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _484 = _344 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
        float2 _2402 = float2(_482, _484);
        float3 _488 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2402, float2(0.0), isnan(_2402))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2402, float2(0.0), isnan(_2402))).xyz;
        float _490 = _488.x;
        float _492 = _488.y;
        float _494 = _488.z;
        float _496 = _490 + _456;
        float _498 = _492 + _458;
        float _500 = _494 + _460;
        _472 = _496;
        _476 = _498;
        _480 = _500;
        _466 = _494;
    }
    float _502 = _472;
    float _504 = _476;
    float _506 = _480;
    float _508 = _466;
    float _510 = _504;
    float _512 = _506;
    float _514 = _502;
    float _516 = _508;
    if (!_358)
    {
        float _518 = _502 * 4.0;
        float _520 = _504 * 4.0;
        float _522 = _506 * 4.0;
        uint _525 = as_type<uint>(half2(float2(_518, _520)));
        uint _527 = as_type<uint>(half2(float2(_522, 0.0)));
        uint _529 = extract_bits(_525, 16u, 16u);
        float _531 = float(_529);
        bool _533 = (*spvDescriptorSet0.fp_c4)._m0[5].z > 0.999000012874603271484375;
        uint _535 = extract_bits(_527, 0u, 8u);
        int _537 = int(_535) & 255;
        uint _539 = extract_bits(_527, 8u, 8u);
        int _541 = int(_539) & 255;
        int _543 = _541 << 8;
        int _545 = _537 | _543;
        int _547 = int(_525) & 32767;
        float _549 = float(uint(_545));
        float _551 = float(uint(_547));
        float _553 = fma(_549, 6.103515625e-05, -0.3125);
        float _555 = fma(_551, 6.103515625e-05, -0.3125);
        float _557 = fma(_531, 6.103515625e-05, -0.3125);
        float _559 = fma(_553, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        float _561 = fma(_555, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        float _563 = fma(_557, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        bool _565 = !_533;
        float _567 = (*spvDescriptorSet0.fp_c5)._m0[0].z;
        _516 = _563;
        _468 = (*spvDescriptorSet0.fp_c5)._m0[0].z;
        if (!_565)
        {
            float3 _2532 = float3(_561, _563, _559);
            float3 _569 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2532, float3(0.0), isnan(_2532))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2532, float3(0.0), isnan(_2532))).xyz;
            float _571 = _569.x;
            float _573 = _569.y;
            float _575 = _569.z;
            _510 = _573;
            _512 = _575;
            _514 = _571;
            _577 = true;
        }
        else
        {
            bool _579 = (*spvDescriptorSet0.fp_c4)._m0[5].z >= 0.001000000047497451305389404296875;
            bool _581 = isnan((*spvDescriptorSet0.fp_c4)._m0[5].z);
            bool _583 = _579 || _581;
            bool _585 = isnan(0.001000000047497451305389404296875);
            bool _587 = _583 || _585;
            float3 _2568 = float3(_561, _563, _559);
            float3 _589 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2568, float3(0.0), isnan(_2568))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2568, float3(0.0), isnan(_2568))).xyz;
            float _591 = _589.x;
            float _593 = _589.y;
            float _595 = _589.z;
            float _597 = _557;
            float _599 = 6.103515625e-05;
            float _601 = _330;
            float _603 = _591;
            float _605 = _593;
            _512 = _595;
            if (_587)
            {
                float3 _2590 = float3(_561, _563, _559);
                float3 _607 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2590, float3(0.0), isnan(_2590))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2590, float3(0.0), isnan(_2590))).xyz;
                float _609 = _607.x;
                float _611 = _607.y;
                float _613 = _607.z;
                _597 = _609;
                _599 = _611;
                _601 = _613;
            }
            float _615 = _597;
            float _617 = _599;
            float _619 = _601;
            float _621 = _615;
            float _623 = _617;
            if (_587)
            {
                float _625 = -_591;
                float _627 = _625 + _615;
                _567 = _627;
            }
            float _629 = _567;
            _468 = _629;
            if (_587)
            {
                float _631 = -_593;
                float _633 = _631 + _617;
                _621 = _633;
            }
            float _635 = _621;
            if (_587)
            {
                float _637 = -_595;
                float _639 = _637 + _619;
                _623 = _639;
            }
            float _641 = _623;
            if (_587)
            {
                float _643 = fma(_629, (*spvDescriptorSet0.fp_c4)._m0[5].z, _591);
                _603 = _643;
            }
            float _645 = _603;
            _514 = _645;
            if (_587)
            {
                float _647 = fma(_635, (*spvDescriptorSet0.fp_c4)._m0[5].z, _593);
                _605 = _647;
            }
            float _649 = _605;
            _510 = _649;
            if (_587)
            {
                float _651 = fma(_641, (*spvDescriptorSet0.fp_c4)._m0[5].z, _595);
                _512 = _651;
            }
        }
    }
    _577 = false;
    float _653 = _510;
    float _655 = _512;
    float _657 = _514;
    float _659 = _516;
    float _661 = _468;
    bool _663 = _174 >= 1.0;
    bool _665 = isnan(_174);
    bool _667 = _663 || _665;
    bool _669 = isnan(1.0);
    bool _671 = _667 || _669;
    float _673 = _659;
    float _675 = _655;
    float _677 = _653;
    float _679 = _657;
    float _681 = _657;
    float _683 = _655;
    float _685 = _661;
    float _687 = _653;
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
        bool _711 = _657 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _713 = isnan(_657);
        bool _715 = _711 || _713;
        bool _717 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _719 = _715 || _717;
        float _721 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _653, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _723 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _657, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _725 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _655, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        bool _727 = _655 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _729 = isnan(_655);
        bool _731 = _727 || _729;
        bool _733 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _735 = _731 || _733;
        float _737 = exp2(_721);
        float _739 = exp2(_723);
        float _741 = exp2(_725);
        if (_709)
        {
            float _743 = -_737;
            float _745 = _743 + 1.0;
            _677 = _745;
        }
        float _747 = _677;
        if (_719)
        {
            float _749 = -_739;
            float _751 = _749 + 1.0;
            _679 = _751;
        }
        float _753 = _679;
        _681 = _753;
        _687 = _747;
        if (_735)
        {
            float _755 = -_741;
            float _757 = _755 + 1.0;
            _683 = _757;
        }
    }
    float _759 = _681;
    float _761 = _687;
    float _763 = _683;
    float _765 = _759;
    float _767 = _759;
    float _769 = _761;
    float _771 = _763;
    if (_671)
    {
        _765 = _236;
    }
    float _773 = _765;
    float _775 = _773;
    float _777 = _773;
    if (!_671)
    {
        bool _779 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
        bool _781 = isnan(0.0);
        bool _783 = _779 || _781;
        bool _785 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
        bool _787 = _783 || _785;
        if (!_787)
        {
            float _789 = _232 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _691 = _789;
        }
        float _791 = _691;
        _693 = _791;
        if (!_787)
        {
            float _793 = _234 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _697 = _793;
        }
        float _795 = _697;
        _699 = _795;
        if (!_787)
        {
            float _797 = _236 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _775 = _797;
        }
        float _799 = _775;
        bool _801 = !_787;
        _777 = _799;
        if (!_801)
        {
            float _803 = _234 * 0.715200006961822509765625;
            float _805 = fma(_232, 0.2125999927520751953125, _803);
            float _807 = fma(_236, 0.072200000286102294921875, _805);
            float _809 = 1.0 / _807;
            float _811 = _809 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            float _813 = precise::clamp(_811, 0.0, 1.0);
            float _815 = fma(_813, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
            float _817 = _232 * _815;
            float _819 = _234 * _815;
            float _821 = _236 * _815;
            _699 = _819;
            _693 = _817;
            _777 = _821;
            _685 = _815;
        }
    }
    float _823 = _699;
    float _825 = _693;
    float _827 = _777;
    float _829 = _685;
    float _831 = _825;
    float _833 = _827;
    if (!_358)
    {
        float _835 = _759 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _767 = _835;
    }
    float _837 = _767;
    if (!_358)
    {
        float _839 = _761 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _769 = _839;
    }
    float _841 = _769;
    if (!_358)
    {
        float _843 = _763 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _771 = _843;
    }
    float _845 = _771;
    float _847 = _156 * _338;
    float _849 = _338 * _837;
    float _851 = _338 * _841;
    float _853 = _338 * _845;
    if (_671)
    {
        _376 = _823;
    }
    float _855 = _376;
    float _857 = _855;
    if (!_671)
    {
        float _859 = _334 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _861 = _346 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
        float2 _2986 = float2(_859, _861);
        float3 _863 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2986, float2(0.0), isnan(_2986))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2986, float2(0.0), isnan(_2986))).xyz;
        float _865 = _863.x;
        float _867 = _863.y;
        float _869 = _863.z;
        float _871 = _865 + _825;
        float _873 = _867 + _823;
        float _875 = _869 + _827;
        _831 = _871;
        _857 = _873;
        _833 = _875;
        _378 = _865;
    }
    float _877 = _831;
    float _879 = _857;
    float _881 = _833;
    float _883 = _378;
    float _885 = _883;
    float _887 = _879;
    float _889 = _881;
    float _891 = _877;
    if (_671)
    {
        _885 = _877;
    }
    float _893 = _885;
    float _895 = _893;
    if (!_671)
    {
        float _897 = _877 * 4.0;
        float _899 = _879 * 4.0;
        uint _901 = as_type<uint>(half2(float2(_897, _899)));
        float _903 = _881 * 4.0;
        bool _905 = (*spvDescriptorSet0.fp_c4)._m0[5].z > 0.999000012874603271484375;
        uint _907 = extract_bits(_901, 16u, 16u);
        float _909 = float(_907);
        int _911 = int(_901) & 32767;
        uint _913 = as_type<uint>(half2(float2(_903, 0.0)));
        uint _915 = extract_bits(_913, 0u, 8u);
        int _917 = int(_915) & 255;
        uint _919 = extract_bits(_913, 8u, 8u);
        int _921 = int(_919) & 255;
        int _923 = _921 << 8;
        int _925 = _917 | _923;
        float _927 = float(uint(_911));
        float _929 = float(uint(_925));
        float _931 = fma(_927, 6.103515625e-05, -0.3125);
        float _933 = fma(_909, 6.103515625e-05, -0.3125);
        float _935 = fma(_929, 6.103515625e-05, -0.3125);
        float _937 = fma(_933, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        float _939 = fma(_935, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        float _941 = fma(_931, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        bool _943 = !_905;
        float _945 = (*spvDescriptorSet0.fp_c4)._m0[5].z;
        _891 = _937;
        if (!_943)
        {
            float3 _3108 = float3(_941, _937, _939);
            float3 _947 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_3108, float3(0.0), isnan(_3108))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_3108, float3(0.0), isnan(_3108))).xyz;
            float _949 = _947.x;
            float _951 = _947.y;
            float _953 = _947.z;
            _895 = _949;
            _887 = _951;
            _889 = _953;
            _955 = true;
        }
        else
        {
            bool _957 = (*spvDescriptorSet0.fp_c4)._m0[5].z >= 0.001000000047497451305389404296875;
            bool _959 = isnan((*spvDescriptorSet0.fp_c4)._m0[5].z);
            bool _961 = _957 || _959;
            bool _963 = isnan(0.001000000047497451305389404296875);
            bool _965 = _961 || _963;
            float3 _3140 = float3(_941, _937, _939);
            float3 _967 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_3140, float3(0.0), isnan(_3140))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_3140, float3(0.0), isnan(_3140))).xyz;
            float _969 = _967.x;
            float _971 = _967.y;
            float _973 = _967.z;
            float _975 = _931;
            float _977 = _933;
            float _979 = _829;
            float _981 = _969;
            float _983 = _971;
            _889 = _973;
            if (_965)
            {
                float3 _3163 = float3(_941, _937, _939);
                float3 _985 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_3163, float3(0.0), isnan(_3163))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_3163, float3(0.0), isnan(_3163))).xyz;
                float _987 = _985.x;
                float _989 = _985.y;
                float _991 = _985.z;
                _975 = _987;
                _977 = _989;
                _979 = _991;
            }
            float _993 = _975;
            float _995 = _977;
            float _997 = _979;
            float _999 = _993;
            float _1001 = _995;
            if (_965)
            {
                float _1003 = -_969;
                float _1005 = _1003 + _993;
                _945 = _1005;
            }
            float _1007 = _945;
            if (_965)
            {
                float _1009 = -_971;
                float _1011 = _1009 + _995;
                _999 = _1011;
            }
            float _1013 = _999;
            if (_965)
            {
                float _1015 = -_973;
                float _1017 = _1015 + _997;
                _1001 = _1017;
            }
            float _1019 = _1001;
            if (_965)
            {
                float _1021 = fma(_1007, (*spvDescriptorSet0.fp_c4)._m0[5].z, _969);
                _981 = _1021;
            }
            float _1023 = _981;
            _895 = _1023;
            if (_965)
            {
                float _1025 = fma(_1013, (*spvDescriptorSet0.fp_c4)._m0[5].z, _971);
                _983 = _1025;
            }
            float _1027 = _983;
            _887 = _1027;
            if (_965)
            {
                float _1029 = fma(_1019, (*spvDescriptorSet0.fp_c4)._m0[5].z, _973);
                _889 = _1029;
            }
        }
    }
    _955 = false;
    float _1031 = _895;
    float _1033 = _887;
    float _1035 = _889;
    float _1037 = _891;
    float _1039 = fma(_238, _332, _847);
    bool _1041 = _194 >= 1.0;
    bool _1043 = isnan(_194);
    bool _1045 = _1041 || _1043;
    bool _1047 = isnan(1.0);
    bool _1049 = _1045 || _1047;
    float _1051 = _1031;
    float _1053 = _1031;
    float _1055 = _1035;
    float _1057 = _1033;
    float _1059 = _1033;
    float _1061 = _1031;
    float _1063 = _1033;
    if (_671)
    {
        _380 = _1031;
    }
    float _1065 = _380;
    float _1067 = _1065;
    if (_671)
    {
        _1051 = _1035;
    }
    float _1069 = _1051;
    float _1071 = _1069;
    if (!_671)
    {
        bool _1073 = _1031 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _1075 = isnan(_1031);
        bool _1077 = _1073 || _1075;
        bool _1079 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1081 = _1077 || _1079;
        bool _1083 = _1035 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _1085 = isnan(_1035);
        bool _1087 = _1083 || _1085;
        bool _1089 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1091 = _1087 || _1089;
        float _1093 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _1031, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _1095 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _1033, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _1097 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _1035, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        bool _1099 = _1033 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _1101 = isnan(_1033);
        bool _1103 = _1099 || _1101;
        bool _1105 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1107 = _1103 || _1105;
        float _1109 = exp2(_1093);
        float _1111 = exp2(_1097);
        float _1113 = exp2(_1095);
        if (_1081)
        {
            float _1115 = -_1109;
            float _1117 = _1115 + 1.0;
            _1053 = _1117;
        }
        float _1119 = _1053;
        _1067 = _1119;
        _1061 = _1119;
        _1063 = _1111;
        if (_1091)
        {
            float _1121 = -_1111;
            float _1123 = _1121 + 1.0;
            _1055 = _1123;
        }
        float _1125 = _1055;
        if (_1107)
        {
            float _1127 = -_1113;
            float _1129 = _1127 + 1.0;
            _1057 = _1129;
        }
        float _1131 = _1057;
        _1059 = _1131;
        _1071 = _1125;
    }
    float _1133 = _1067;
    float _1135 = _1059;
    float _1137 = _1071;
    float _1139 = _1061;
    float _1141 = _1063;
    float _1143 = _1133;
    float _1145 = _1139;
    float _1147 = _1135;
    float _1149 = _1135;
    float _1151 = _1137;
    float _1153 = _1137;
    float _1155 = _1141;
    if (!_671)
    {
        float _1157 = _1133 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1143 = _1157;
    }
    float _1159 = _1143;
    if (_1049)
    {
        _1145 = _258;
    }
    float _1161 = _1145;
    float _1163 = _1161;
    float _1165 = _1161;
    if (!_671)
    {
        float _1167 = _1135 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1147 = _1167;
    }
    float _1169 = _1147;
    if (_1049)
    {
        _1149 = _260;
    }
    float _1171 = _1149;
    float _1173 = _1171;
    float _1175 = _1171;
    if (!_671)
    {
        float _1177 = _1137 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1151 = _1177;
    }
    float _1179 = _1151;
    float _1181 = _1179;
    if (_1049)
    {
        _382 = _262;
    }
    float _1183 = _382;
    float _1185 = _1183;
    float _1187 = _1183;
    if (!_1049)
    {
        bool _1189 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
        bool _1191 = isnan(0.0);
        bool _1193 = _1189 || _1191;
        bool _1195 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
        bool _1197 = _1193 || _1195;
        if (!_1197)
        {
            float _1199 = _258 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _1163 = _1199;
        }
        float _1201 = _1163;
        _1165 = _1201;
        if (!_1197)
        {
            float _1203 = _260 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _1173 = _1203;
        }
        float _1205 = _1173;
        _1175 = _1205;
        if (!_1197)
        {
            float _1207 = _262 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _1185 = _1207;
        }
        float _1209 = _1185;
        bool _1211 = !_1197;
        _1187 = _1209;
        if (!_1211)
        {
            float _1213 = _260 * 0.715200006961822509765625;
            float _1215 = fma(_258, 0.2125999927520751953125, _1213);
            float _1217 = fma(_262, 0.072200000286102294921875, _1215);
            float _1219 = 1.0 / _1217;
            float _1221 = _1219 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            float _1223 = precise::clamp(_1221, 0.0, 1.0);
            float _1225 = fma(_1223, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
            float _1227 = _258 * _1225;
            float _1229 = _260 * _1225;
            float _1231 = _262 * _1225;
            _1165 = _1227;
            _1175 = _1229;
            _1153 = _1223;
            _1155 = _1225;
            _1187 = _1231;
        }
    }
    float _1233 = _1165;
    float _1235 = _1175;
    float _1237 = _1153;
    float _1239 = _1155;
    float _1241 = _1187;
    float _1243 = fma(_332, _1159, _849);
    float _1245 = fma(_332, _1169, _851);
    float _1247 = fma(_332, _1179, _853);
    float _1249 = _1237;
    float _1251 = _1239;
    float _1253 = _1241;
    if (_1049)
    {
        _1249 = _1233;
    }
    float _1255 = _1249;
    float _1257 = _1255;
    if (_1049)
    {
        _1251 = _1235;
    }
    float _1259 = _1251;
    float _1261 = _1259;
    if (!_1049)
    {
        float _1263 = _342 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _1265 = _346 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
        float2 _3591 = float2(_1263, _1265);
        float3 _1267 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_3591, float2(0.0), isnan(_3591))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_3591, float2(0.0), isnan(_3591))).xyz;
        float _1269 = _1267.x;
        float _1271 = _1267.y;
        float _1273 = _1267.z;
        float _1275 = _1269 + _1233;
        float _1277 = _1271 + _1235;
        float _1279 = _1273 + _1241;
        _1253 = _1279;
        _1257 = _1275;
        _1261 = _1277;
        _384 = _1273;
    }
    float _1281 = _1253;
    float _1283 = _1257;
    float _1285 = _1261;
    float _1287 = _384;
    float _1289 = _1287;
    float _1291 = _1283;
    float _1293 = _1285;
    if (_1049)
    {
        _1289 = _1281;
    }
    float _1295 = _1289;
    float _1297 = _1295;
    if (!_1049)
    {
        float _1299 = _1283 * 4.0;
        float _1301 = _1285 * 4.0;
        float _1303 = _1281 * 4.0;
        uint _1305 = as_type<uint>(half2(float2(_1299, _1301)));
        uint _1307 = as_type<uint>(half2(float2(_1303, 0.0)));
        uint _1309 = extract_bits(_1305, 16u, 16u);
        float _1311 = float(_1309);
        bool _1313 = (*spvDescriptorSet0.fp_c4)._m0[5].z > 0.999000012874603271484375;
        uint _1315 = extract_bits(_1307, 0u, 8u);
        int _1317 = int(_1315) & 255;
        uint _1319 = extract_bits(_1307, 8u, 8u);
        int _1321 = int(_1319) & 255;
        int _1323 = _1321 << 8;
        int _1325 = _1317 | _1323;
        int _1327 = int(_1305) & 32767;
        float _1329 = float(uint(_1325));
        float _1331 = float(uint(_1327));
        float _1333 = fma(_1329, 6.103515625e-05, -0.3125);
        float _1335 = fma(_1331, 6.103515625e-05, -0.3125);
        float _1337 = fma(_1311, 6.103515625e-05, -0.3125);
        float _1339 = fma(_1333, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        float _1341 = fma(_1335, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        float _1343 = fma(_1337, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        bool _1345 = !_1313;
        float _1347 = _1335;
        float _1349 = _1333;
        _386 = _1333;
        _1181 = _1339;
        if (!_1345)
        {
            float3 _3713 = float3(_1341, _1343, _1339);
            float3 _1351 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_3713, float3(0.0), isnan(_3713))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_3713, float3(0.0), isnan(_3713))).xyz;
            float _1353 = _1351.x;
            float _1355 = _1351.y;
            float _1357 = _1351.z;
            _1291 = _1353;
            _1297 = _1357;
            _1293 = _1355;
            _1359 = true;
        }
        else
        {
            bool _1361 = (*spvDescriptorSet0.fp_c4)._m0[5].z >= 0.001000000047497451305389404296875;
            bool _1363 = isnan((*spvDescriptorSet0.fp_c4)._m0[5].z);
            bool _1365 = _1361 || _1363;
            bool _1367 = isnan(0.001000000047497451305389404296875);
            bool _1369 = _1365 || _1367;
            float3 _3745 = float3(_1341, _1343, _1339);
            float3 _1371 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_3745, float3(0.0), isnan(_3745))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_3745, float3(0.0), isnan(_3745))).xyz;
            float _1373 = _1371.x;
            float _1375 = _1371.y;
            float _1377 = _1371.z;
            float _1379 = _1159;
            float _1381 = _1037;
            float _1383 = (*spvDescriptorSet0.fp_c5)._m0[0].z;
            float _1385 = _1373;
            float _1387 = _1375;
            _1297 = _1377;
            if (_1369)
            {
                float3 _3769 = float3(_1341, _1343, _1339);
                float3 _1389 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_3769, float3(0.0), isnan(_3769))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_3769, float3(0.0), isnan(_3769))).xyz;
                float _1391 = _1389.x;
                float _1393 = _1389.y;
                float _1395 = _1389.z;
                _1379 = _1391;
                _1381 = _1393;
                _1383 = _1395;
            }
            float _1397 = _1379;
            float _1399 = _1381;
            float _1401 = _1383;
            float _1403 = _1401;
            if (_1369)
            {
                float _1405 = -_1373;
                float _1407 = _1405 + _1397;
                _1347 = _1407;
            }
            float _1409 = _1347;
            if (_1369)
            {
                float _1411 = -_1375;
                float _1413 = _1411 + _1399;
                _1349 = _1413;
            }
            float _1415 = _1349;
            _386 = _1415;
            if (_1369)
            {
                float _1417 = -_1377;
                float _1419 = _1417 + _1401;
                _1403 = _1419;
            }
            float _1421 = _1403;
            if (_1369)
            {
                float _1423 = fma(_1409, (*spvDescriptorSet0.fp_c4)._m0[5].z, _1373);
                _1385 = _1423;
            }
            float _1425 = _1385;
            _1291 = _1425;
            if (_1369)
            {
                float _1427 = fma(_1415, (*spvDescriptorSet0.fp_c4)._m0[5].z, _1375);
                _1387 = _1427;
            }
            float _1429 = _1387;
            _1293 = _1429;
            if (_1369)
            {
                float _1431 = fma(_1421, (*spvDescriptorSet0.fp_c4)._m0[5].z, _1377);
                _1297 = _1431;
            }
        }
    }
    _1359 = false;
    float _1433 = _1291;
    float _1435 = _1297;
    float _1437 = _1293;
    float _1439 = _386;
    float _1441 = _1181;
    float _1443 = fma(_264, _336, _1039);
    bool _1445 = _212 >= 1.0;
    bool _1447 = isnan(_212);
    bool _1449 = _1445 || _1447;
    bool _1451 = isnan(1.0);
    bool _1453 = _1449 || _1451;
    float _1455 = _1439;
    float _1457 = _1433;
    float _1459 = _1435;
    float _1461 = _1437;
    float _1463 = _1437;
    float _1465 = _1437;
    float _1467 = _1435;
    if (_1049)
    {
        _388 = _1433;
    }
    float _1469 = _388;
    float _1471 = _1469;
    if (_1049)
    {
        _1455 = _1435;
    }
    float _1473 = _1455;
    float _1475 = _1473;
    if (!_1049)
    {
        bool _1477 = _1433 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _1479 = isnan(_1433);
        bool _1481 = _1477 || _1479;
        bool _1483 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1485 = _1481 || _1483;
        bool _1487 = _1435 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _1489 = isnan(_1435);
        bool _1491 = _1487 || _1489;
        bool _1493 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1495 = _1491 || _1493;
        float _1497 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _1433, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _1499 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _1435, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _1501 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _1437, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        bool _1503 = _1437 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _1505 = isnan(_1437);
        bool _1507 = _1503 || _1505;
        bool _1509 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1511 = _1507 || _1509;
        float _1513 = exp2(_1497);
        float _1515 = exp2(_1499);
        float _1517 = exp2(_1501);
        _1465 = (*spvDescriptorSet0.fp_c3)._m0[1].y;
        if (_1485)
        {
            float _1519 = -_1513;
            float _1521 = _1519 + 1.0;
            _1457 = _1521;
        }
        float _1523 = _1457;
        _1471 = _1523;
        if (_1495)
        {
            float _1525 = -_1515;
            float _1527 = _1525 + 1.0;
            _1459 = _1527;
        }
        float _1529 = _1459;
        _1467 = _1529;
        if (_1511)
        {
            float _1531 = -_1517;
            float _1533 = _1531 + 1.0;
            _1461 = _1533;
        }
        float _1535 = _1461;
        _1463 = _1535;
        _1475 = _1529;
    }
    float _1537 = _1471;
    float _1539 = _1463;
    float _1541 = _1475;
    float _1543 = _1465;
    float _1545 = _1467;
    float _1547 = _1537;
    float _1549 = _1543;
    float _1551 = _1539;
    float _1553 = _1541;
    float _1555 = _1541;
    float _1557 = _1545;
    float _1559 = _1539;
    if (!_1049)
    {
        float _1561 = _1537 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1547 = _1561;
    }
    float _1563 = _1547;
    if (_1453)
    {
        _1549 = _284;
    }
    float _1565 = _1549;
    float _1567 = _1565;
    float _1569 = _1565;
    if (!_1049)
    {
        float _1571 = _1539 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1551 = _1571;
    }
    float _1573 = _1551;
    if (_1453)
    {
        _1553 = _286;
    }
    float _1575 = _1553;
    float _1577 = _1575;
    float _1579 = _1575;
    if (!_1049)
    {
        float _1581 = _1541 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1555 = _1581;
    }
    float _1583 = _1555;
    float _1585 = _1583;
    if (_1453)
    {
        _1557 = _288;
    }
    float _1587 = _1557;
    float _1589 = _1587;
    float _1591 = _1587;
    if (!_1453)
    {
        bool _1593 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
        bool _1595 = isnan(0.0);
        bool _1597 = _1593 || _1595;
        bool _1599 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
        bool _1601 = _1597 || _1599;
        if (!_1601)
        {
            float _1603 = _284 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _1567 = _1603;
        }
        float _1605 = _1567;
        _1569 = _1605;
        if (!_1601)
        {
            float _1607 = _286 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _1577 = _1607;
        }
        float _1609 = _1577;
        _1579 = _1609;
        if (!_1601)
        {
            float _1611 = _288 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _1589 = _1611;
        }
        float _1613 = _1589;
        bool _1615 = !_1601;
        _1591 = _1613;
        if (!_1615)
        {
            float _1617 = _286 * 0.715200006961822509765625;
            float _1619 = fma(_284, 0.2125999927520751953125, _1617);
            float _1621 = fma(_288, 0.072200000286102294921875, _1619);
            float _1623 = 1.0 / _1621;
            float _1625 = _1623 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            float _1627 = precise::clamp(_1625, 0.0, 1.0);
            float _1629 = fma(_1627, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
            float _1631 = _284 * _1629;
            float _1633 = _286 * _1629;
            float _1635 = _288 * _1629;
            _1559 = _1629;
            _1569 = _1631;
            _1579 = _1633;
            _1591 = _1635;
        }
    }
    float _1637 = _1559;
    float _1639 = _1569;
    float _1641 = _1579;
    float _1643 = _1591;
    float _1645 = fma(_336, _1563, _1243);
    float _1647 = fma(_336, _1573, _1245);
    float _1649 = fma(_336, _1583, _1247);
    float _1651 = _1643;
    float _1653 = _1639;
    float _1655 = _1641;
    float _1657 = _1637;
    if (!_1453)
    {
        float _1659 = _342 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _1661 = _344 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
        float2 _4186 = float2(_1659, _1661);
        float3 _1663 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_4186, float2(0.0), isnan(_4186))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_4186, float2(0.0), isnan(_4186))).xyz;
        float _1665 = _1663.x;
        float _1667 = _1663.y;
        float _1669 = _1663.z;
        float _1671 = _1665 + _1639;
        float _1673 = _1667 + _1641;
        float _1675 = _1669 + _1643;
        _1651 = _1675;
        _1653 = _1671;
        _1655 = _1673;
        _1585 = _1665;
        _390 = _1669;
        _1657 = _1667;
    }
    float _1677 = _1651;
    float _1679 = _1653;
    float _1681 = _1655;
    float _1683 = _1585;
    float _1685 = _390;
    float _1687 = _1657;
    float _1689 = _1685;
    float _1691 = _1683;
    float _1693 = _1687;
    float _1695 = _1681;
    if (_1453)
    {
        _1689 = _1677;
    }
    float _1697 = _1689;
    float _1699 = _1697;
    if (_1453)
    {
        _1691 = _1679;
    }
    float _1701 = _1691;
    float _1703 = _1701;
    if (_1453)
    {
        _1693 = _1681;
    }
    float _1705 = _1693;
    float _1707 = _1705;
    if (!_1453)
    {
        float _1709 = _1679 * 4.0;
        float _1711 = _1681 * 4.0;
        uint _1713 = as_type<uint>(half2(float2(_1709, _1711)));
        float _1715 = _1677 * 4.0;
        bool _1717 = (*spvDescriptorSet0.fp_c4)._m0[5].z > 0.999000012874603271484375;
        uint _1719 = extract_bits(_1713, 16u, 16u);
        float _1721 = float(_1719);
        int _1723 = int(_1713) & 32767;
        uint _1725 = as_type<uint>(half2(float2(_1715, 0.0)));
        float _1727 = float(uint(_1723));
        uint _1729 = extract_bits(_1725, 0u, 8u);
        int _1731 = int(_1729) & 255;
        uint _1733 = extract_bits(_1725, 8u, 8u);
        int _1735 = int(_1733) & 255;
        int _1737 = _1735 << 8;
        int _1739 = _1731 | _1737;
        float _1741 = fma(_1727, 6.103515625e-05, -0.3125);
        float _1743 = float(uint(_1739));
        float _1745 = fma(_1741, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        float _1747 = fma(_1721, 6.103515625e-05, -0.3125);
        float _1749 = fma(_1743, 6.103515625e-05, -0.3125);
        float _1751 = fma(_1747, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        float _1753 = fma(_1749, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        bool _1755 = !_1717;
        float _1757 = (*spvDescriptorSet0.fp_c5)._m0[0].z;
        float _1759 = _1749;
        _1695 = _1741;
        _392 = _1749;
        if (!_1755)
        {
            float3 _4326 = float3(_1745, _1751, _1753);
            float3 _1761 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_4326, float3(0.0), isnan(_4326))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_4326, float3(0.0), isnan(_4326))).xyz;
            float _1763 = _1761.x;
            float _1765 = _1761.y;
            float _1767 = _1761.z;
            _1703 = _1763;
            _1699 = _1767;
            _1707 = _1765;
            _1769 = true;
        }
        else
        {
            bool _1771 = (*spvDescriptorSet0.fp_c4)._m0[5].z >= 0.001000000047497451305389404296875;
            bool _1773 = isnan((*spvDescriptorSet0.fp_c4)._m0[5].z);
            bool _1775 = _1771 || _1773;
            bool _1777 = isnan(0.001000000047497451305389404296875);
            bool _1779 = _1775 || _1777;
            float3 _4358 = float3(_1745, _1751, _1753);
            float3 _1781 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_4358, float3(0.0), isnan(_4358))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_4358, float3(0.0), isnan(_4358))).xyz;
            float _1783 = _1781.x;
            float _1785 = _1781.y;
            float _1787 = _1781.z;
            float _1789 = _1441;
            float _1791 = _1245;
            float _1793 = _1741;
            float _1795 = _1783;
            float _1797 = _1785;
            _1699 = _1787;
            if (_1779)
            {
                float3 _4381 = float3(_1745, _1751, _1753);
                float3 _1799 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_4381, float3(0.0), isnan(_4381))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_4381, float3(0.0), isnan(_4381))).xyz;
                float _1801 = _1799.x;
                float _1803 = _1799.y;
                float _1805 = _1799.z;
                _1789 = _1801;
                _1791 = _1803;
                _1793 = _1805;
            }
            float _1807 = _1789;
            float _1809 = _1791;
            float _1811 = _1793;
            float _1813 = _1811;
            if (_1779)
            {
                float _1815 = -_1783;
                float _1817 = _1815 + _1807;
                _1757 = _1817;
            }
            float _1819 = _1757;
            if (_1779)
            {
                float _1821 = -_1785;
                float _1823 = _1821 + _1809;
                _1759 = _1823;
            }
            float _1825 = _1759;
            _392 = _1825;
            if (_1779)
            {
                float _1827 = -_1787;
                float _1829 = _1827 + _1811;
                _1813 = _1829;
            }
            float _1831 = _1813;
            _1695 = _1831;
            if (_1779)
            {
                float _1833 = fma(_1819, (*spvDescriptorSet0.fp_c4)._m0[5].z, _1783);
                _1795 = _1833;
            }
            float _1835 = _1795;
            _1703 = _1835;
            if (_1779)
            {
                float _1837 = fma(_1825, (*spvDescriptorSet0.fp_c4)._m0[5].z, _1785);
                _1797 = _1837;
            }
            float _1839 = _1797;
            _1707 = _1839;
            if (_1779)
            {
                float _1841 = fma(_1831, (*spvDescriptorSet0.fp_c4)._m0[5].z, _1787);
                _1699 = _1841;
            }
        }
    }
    _1769 = false;
    float _1843 = _1703;
    float _1845 = _1699;
    float _1847 = _1707;
    float _1849 = _1695;
    float _1851 = _392;
    float _1853 = _1849;
    float _1855 = _1851;
    float _1857 = _1847;
    float _1859 = _1845;
    float _1861 = _1843;
    if (_1453)
    {
        _1853 = _1847;
    }
    float _1863 = _1853;
    float _1865 = _1863;
    if (_1453)
    {
        _1855 = _1845;
    }
    float _1867 = _1855;
    float _1869 = _1867;
    if (!_1453)
    {
        bool _1871 = _1847 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _1873 = isnan(_1847);
        bool _1875 = _1871 || _1873;
        bool _1877 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1879 = _1875 || _1877;
        bool _1881 = _1845 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _1883 = isnan(_1845);
        bool _1885 = _1881 || _1883;
        bool _1887 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1889 = _1885 || _1887;
        float _1891 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _1847, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _1893 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _1845, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _1895 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _1843, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        bool _1897 = _1843 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _1899 = isnan(_1843);
        bool _1901 = _1897 || _1899;
        bool _1903 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1905 = _1901 || _1903;
        float _1907 = exp2(_1891);
        float _1909 = exp2(_1893);
        float _1911 = exp2(_1895);
        if (_1879)
        {
            float _1913 = -_1907;
            float _1915 = _1913 + 1.0;
            _1857 = _1915;
        }
        float _1917 = _1857;
        if (_1889)
        {
            float _1919 = -_1909;
            float _1921 = _1919 + 1.0;
            _1859 = _1921;
        }
        float _1923 = _1859;
        _1865 = _1917;
        _1869 = _1923;
        if (_1905)
        {
            float _1925 = -_1911;
            float _1927 = _1925 + 1.0;
            _1861 = _1927;
        }
    }
    float _1929 = _1861;
    float _1931 = _1865;
    float _1933 = _1869;
    float _1935 = _1929;
    float _1937 = _1931;
    float _1939 = _1933;
    if (!_1453)
    {
        float _1941 = _1929 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1935 = _1941;
    }
    float _1943 = _1935;
    if (!_1453)
    {
        float _1945 = _1931 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1937 = _1945;
    }
    float _1947 = _1937;
    if (!_1453)
    {
        float _1949 = _1933 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1939 = _1949;
    }
    float _1951 = _1939;
    float _1953 = fma(_290, _340, _1443);
    float _1955 = fma(_340, _1943, _1645);
    float _1957 = fma(_340, _1947, _1647);
    float _1959 = fma(_340, _1951, _1649);
    out.m_47.x = _1955;
    out.m_47.y = _1957;
    out.m_47.z = _1959;
    out.m_47.w = _1953;
    return out;
}

