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
int _53(thread const int& _5123, thread const int& _5124, constant _10& support_buffer)
{
    int _5127 = 1 + _5124;
    float _5129 = support_buffer._m5[_5127].x;
    float _5131 = abs(_5129);
    bool _5133 = _5131 == 1.0;
    if (_5133)
    {
        return _5123;
    }
    float _5135 = float(_5123);
    float _5137 = _5135 / _5131;
    int _5139 = int(_5137);
    return _5139;
}

static inline __attribute__((always_inline))
int _55(thread const int& _5161, thread const int& _5162, thread const int& _5163, constant _10& support_buffer, thread float4& gl_FragCoord)
{
    int _5166 = 1 + _5162;
    float _5168 = support_buffer._m5[_5166].x;
    bool _5170 = _5168 == 1.0;
    if (_5170)
    {
        return _5161;
    }
    bool _5172 = _5168 < 0.0;
    if (_5172)
    {
        float _5174 = -_5168;
        float _5176 = float(_5161);
        float _5178 = _5176 * _5174;
        float _5180 = gl_FragCoord.x;
        float _5182 = gl_FragCoord.y;
        float _5184 = (_5163 != 0) ? _5182 : _5180;
        float _5186 = mod(_5184, _5174);
        float _5188 = _5178 + _5186;
        int _5190 = int(_5188);
        return _5190;
    }
    float _5192 = float(_5161);
    float _5194 = _5192 * _5168;
    int _5196 = int(_5194);
    return _5196;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _1979 = false;
    bool _1527 = false;
    bool _1069 = false;
    bool _637 = false;
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
    float _298 = float(_111);
    float _300 = _294 + 0.5;
    float _302 = float(_176);
    float _304 = floor(_99);
    float _306 = 1.0 / _95;
    float _308 = -_292;
    float _310 = _101 + _308;
    float _312 = 1.0 / _97;
    float _314 = -_304;
    float _316 = _99 + _314;
    float _318 = -_310;
    float _320 = _318 + 1.0;
    float _322 = _296 + 0.5;
    float _324 = _298 + 0.5;
    float _326 = -_316;
    float _328 = _326 + 1.0;
    float _330 = _302 + 0.5;
    float _332 = _316 * _320;
    float _334 = _300 * _306;
    float _336 = _320 * _328;
    float _338 = _324 * _306;
    float _340 = _322 * _312;
    float _342 = _330 * _312;
    bool _346 = _129 >= 1.0;
    bool _348 = isnan(_129);
    bool _350 = _346 || _348;
    bool _352 = isnan(1.0);
    bool _354 = _350 || _352;
    float _356 = _310 * _316;
    float _358 = _310 * _328;
    float _360 = _320;
    float _362 = as_type<float>(_109);
    float _364 = _328;
    float _366 = _150;
    float _368 = _152;
    float _370 = _154;
    float _372 = _232;
    float _374 = _234;
    float _376 = _156;
    float _378 = _238;
    float _380 = _262;
    float _382 = _258;
    float _384 = _264;
    float _386 = _284;
    if (_354)
    {
        _360 = _150;
    }
    float _388 = _360;
    float _390 = _388;
    float _392 = _388;
    if (_354)
    {
        _362 = _152;
    }
    float _394 = _362;
    float _396 = _394;
    float _398 = _394;
    if (_354)
    {
        _364 = _154;
    }
    float _400 = _364;
    float _402 = _400;
    float _404 = _400;
    if (!_354)
    {
        bool _406 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
        bool _408 = isnan(0.0);
        bool _410 = _406 || _408;
        bool _412 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
        bool _414 = _410 || _412;
        if (!_414)
        {
            float _416 = _150 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _390 = _416;
        }
        float _418 = _390;
        _392 = _418;
        if (!_414)
        {
            float _420 = _152 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _396 = _420;
        }
        float _422 = _396;
        _398 = _422;
        if (!_414)
        {
            float _424 = _154 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _402 = _424;
        }
        float _426 = _402;
        bool _428 = !_414;
        _404 = _426;
        if (!_428)
        {
            float _430 = _152 * 0.715200006961822509765625;
            float _432 = fma(_150, 0.2125999927520751953125, _430);
            float _434 = fma(_154, 0.072200000286102294921875, _432);
            float _436 = 1.0 / _434;
            float _438 = _436 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            float _440 = precise::clamp(_438, 0.0, 1.0);
            float _442 = fma(_440, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
            float _444 = _150 * _442;
            float _446 = _152 * _442;
            float _448 = _154 * _442;
            _392 = _444;
            _398 = _446;
            _404 = _448;
        }
    }
    float _450 = _392;
    float _452 = _398;
    float _454 = _404;
    float _456 = _452;
    if (_354)
    {
        _366 = _450;
    }
    float _458 = _366;
    float _460 = _458;
    if (_354)
    {
        _368 = _452;
    }
    float _462 = _368;
    float _464 = _462;
    if (_354)
    {
        _370 = _454;
    }
    float _466 = _370;
    float _468 = _466;
    if (!_354)
    {
        float _470 = _340 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _472 = _334 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
        float2 _2579 = float2(_470, _472);
        float3 _476 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2579, float2(0.0), isnan(_2579))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2579, float2(0.0), isnan(_2579))).xyz;
        float _478 = _476.x;
        float _480 = _476.y;
        float _482 = _476.z;
        float _484 = _478 + _450;
        float _486 = _480 + _452;
        float _488 = _482 + _454;
        _464 = _486;
        _460 = _484;
        _468 = _488;
    }
    float _490 = _464;
    float _492 = _460;
    float _494 = _468;
    float _496 = _490;
    float _498 = _494;
    float _500 = _492;
    if (!_354)
    {
        float _502 = _334 + (-0.5);
        float _504 = _340 + (-0.5);
        float _506 = _490 * 4.0;
        float _508 = fma(_502, (*spvDescriptorSet0.fp_c4)._m0[7].x, (*spvDescriptorSet0.fp_c4)._m0[6].y);
        float _510 = _504 + (*spvDescriptorSet0.fp_c4)._m0[6].x;
        bool _512 = (*spvDescriptorSet0.fp_c4)._m0[6].w > (-1.0999999631167156621813774108887e-06);
        float _514 = _508 * _508;
        bool _516 = (*spvDescriptorSet0.fp_c4)._m0[6].w >= (-1.0999999631167156621813774108887e-06);
        bool _518 = isnan((*spvDescriptorSet0.fp_c4)._m0[6].w);
        bool _520 = _516 || _518;
        bool _522 = isnan(-1.0999999631167156621813774108887e-06);
        bool _524 = _520 || _522;
        float _526 = abs((*spvDescriptorSet0.fp_c4)._m0[6].w);
        float _528 = -_526;
        float _530 = fma(_528, 2.0, (*spvDescriptorSet0.fp_c4)._m0[6].z);
        float _532 = _492 * 4.0;
        float _534 = fma(_510, _510, _514);
        float _536 = precise::max(0.0, (*spvDescriptorSet0.fp_c4)._m0[6].z);
        float _538 = precise::max(0.0, _530);
        int _540 = _524 ? 0 : 1;
        float _542 = sqrt(_534);
        uint _545 = as_type<uint>(half2(float2(_532, _506)));
        float _547 = -_538;
        float _549 = _536 + _547;
        int _551 = ~_540;
        int _553 = _551 + 1;
        int _555 = _553 + 1;
        int _557 = _555;
        if (!_512)
        {
            int _559 = ~_540;
            int _561 = _559 + 1;
            _557 = _561;
        }
        int _563 = _557;
        float _565 = _494 * 4.0;
        float _567 = 1.0 / _549;
        float _569 = float(_563);
        uint _571 = as_type<uint>(half2(float2(_565, 0.0)));
        uint _573 = extract_bits(_571, 0u, 8u);
        int _575 = int(_573) & 255;
        uint _577 = extract_bits(_571, 8u, 8u);
        int _579 = int(_577) & 255;
        int _581 = _579 << 8;
        int _583 = _575 | _581;
        float _585 = -_538;
        float _587 = _542 + _585;
        uint _589 = extract_bits(_545, 16u, 16u);
        float _591 = float(_589);
        float _593 = float(uint(_583));
        float _595 = _587 * _567;
        float _597 = precise::clamp(_595, 0.0, 1.0);
        float _599 = fma(_597, -2.0, 3.0);
        float _601 = _597 * _597;
        float _603 = fma(_601, _599, -0.5);
        float _605 = fma(_591, 6.103515625e-05, -0.3125);
        float _607 = fma(_603, _569, 0.5);
        int _609 = int(_545) & 32767;
        float _611 = fma(_593, 6.103515625e-05, -0.3125);
        float _613 = precise::max(_607, (*spvDescriptorSet0.fp_c4)._m0[5].w);
        float _615 = float(uint(_609));
        bool _617 = _613 > 0.999000012874603271484375;
        float _619 = fma(_615, 6.103515625e-05, -0.3125);
        float _621 = fma(_605, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        float _623 = fma(_611, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        float _625 = fma(_619, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        bool _627 = !_617;
        _456 = _567;
        if (!_627)
        {
            float3 _2814 = float3(_625, _621, _623);
            float3 _629 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2814, float3(0.0), isnan(_2814))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2814, float3(0.0), isnan(_2814))).xyz;
            float _631 = _629.x;
            float _633 = _629.y;
            float _635 = _629.z;
            _496 = _633;
            _498 = _635;
            _500 = _631;
            _637 = true;
        }
        else
        {
            bool _639 = _613 >= 0.001000000047497451305389404296875;
            bool _641 = isnan(_613);
            bool _643 = _639 || _641;
            bool _645 = isnan(0.001000000047497451305389404296875);
            bool _647 = _643 || _645;
            if (!_647)
            {
                float3 _2851 = float3(_625, _621, _623);
                float3 _649 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2851, float3(0.0), isnan(_2851))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2851, float3(0.0), isnan(_2851))).xyz;
                float _651 = _649.x;
                float _653 = _649.y;
                float _655 = _649.z;
                _496 = _653;
                _498 = _655;
                _500 = _651;
                _637 = true;
            }
            else
            {
                float3 _2870 = float3(_625, _621, _623);
                float3 _657 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2870, float3(0.0), isnan(_2870))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2870, float3(0.0), isnan(_2870))).xyz;
                float _659 = _657.x;
                float _661 = _657.y;
                float _663 = _657.z;
                float3 _2885 = float3(_625, _621, _623);
                float3 _665 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2885, float3(0.0), isnan(_2885))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2885, float3(0.0), isnan(_2885))).xyz;
                float _667 = _665.x;
                float _669 = _665.y;
                float _671 = _665.z;
                float _673 = -_659;
                float _675 = _667 + _673;
                float _677 = -_661;
                float _679 = _669 + _677;
                float _681 = -_663;
                float _683 = _671 + _681;
                float _685 = fma(_675, _613, _659);
                float _687 = fma(_679, _613, _661);
                float _689 = fma(_683, _613, _663);
                _496 = _687;
                _498 = _689;
                _500 = _685;
                _456 = _679;
            }
        }
    }
    _637 = false;
    float _691 = _496;
    float _693 = _498;
    float _695 = _500;
    float _697 = _456;
    bool _699 = _174 >= 1.0;
    bool _701 = isnan(_174);
    bool _703 = _699 || _701;
    bool _705 = isnan(1.0);
    bool _707 = _703 || _705;
    float _709 = _691;
    float _711 = _693;
    float _713 = _695;
    float _715 = _691;
    float _717 = _695;
    float _719 = _691;
    float _721 = _693;
    float _723 = _697;
    if (_707)
    {
        _709 = _232;
    }
    float _725 = _709;
    float _727 = _725;
    float _729 = _725;
    if (_707)
    {
        _711 = _234;
    }
    float _731 = _711;
    float _733 = _731;
    float _735 = _731;
    if (!_354)
    {
        bool _737 = _695 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _739 = isnan(_695);
        bool _741 = _737 || _739;
        bool _743 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _745 = _741 || _743;
        bool _747 = _691 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _749 = isnan(_691);
        bool _751 = _747 || _749;
        bool _753 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _755 = _751 || _753;
        float _757 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _695, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _759 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _691, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _761 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _693, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        bool _763 = _693 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _765 = isnan(_693);
        bool _767 = _763 || _765;
        bool _769 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _771 = _767 || _769;
        float _773 = exp2(_757);
        float _775 = exp2(_759);
        float _777 = exp2(_761);
        if (_745)
        {
            float _779 = -_773;
            float _781 = _779 + 1.0;
            _713 = _781;
        }
        float _783 = _713;
        _717 = _783;
        _723 = _775;
        if (_755)
        {
            float _785 = -_775;
            float _787 = _785 + 1.0;
            _715 = _787;
        }
        float _789 = _715;
        _719 = _789;
        if (_771)
        {
            float _791 = -_777;
            float _793 = _791 + 1.0;
            _721 = _793;
        }
    }
    float _795 = _717;
    float _797 = _719;
    float _799 = _721;
    float _801 = _723;
    float _803 = _795;
    float _805 = _795;
    float _807 = _797;
    float _809 = _799;
    float _811 = _801;
    if (_707)
    {
        _803 = _236;
    }
    float _813 = _803;
    float _815 = _813;
    float _817 = _813;
    if (!_707)
    {
        bool _819 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
        bool _821 = isnan(0.0);
        bool _823 = _819 || _821;
        bool _825 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
        bool _827 = _823 || _825;
        if (!_827)
        {
            float _829 = _232 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _727 = _829;
        }
        float _831 = _727;
        _729 = _831;
        if (!_827)
        {
            float _833 = _234 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _733 = _833;
        }
        float _835 = _733;
        _735 = _835;
        if (!_827)
        {
            float _837 = _236 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _815 = _837;
        }
        float _839 = _815;
        bool _841 = !_827;
        _817 = _839;
        if (!_841)
        {
            float _843 = _234 * 0.715200006961822509765625;
            float _845 = fma(_232, 0.2125999927520751953125, _843);
            float _847 = fma(_236, 0.072200000286102294921875, _845);
            float _849 = 1.0 / _847;
            float _851 = _849 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            float _853 = precise::clamp(_851, 0.0, 1.0);
            float _855 = fma(_853, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
            float _857 = _232 * _855;
            float _859 = _234 * _855;
            float _861 = _236 * _855;
            _729 = _857;
            _735 = _859;
            _817 = _861;
        }
    }
    float _863 = _729;
    float _865 = _735;
    float _867 = _817;
    float _869 = _863;
    if (!_354)
    {
        float _871 = _795 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _805 = _871;
    }
    float _873 = _805;
    if (!_354)
    {
        float _875 = _797 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _807 = _875;
    }
    float _877 = _807;
    if (!_354)
    {
        float _879 = _799 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _809 = _879;
    }
    float _881 = _809;
    float _883 = _156 * _336;
    float _885 = _336 * _873;
    float _887 = _336 * _877;
    float _889 = _336 * _881;
    if (_707)
    {
        _372 = _863;
    }
    float _891 = _372;
    float _893 = _891;
    if (_707)
    {
        _374 = _865;
    }
    float _895 = _374;
    float _897 = _895;
    if (_707)
    {
        _376 = _867;
    }
    float _899 = _376;
    float _901 = _899;
    if (!_707)
    {
        float _903 = _340 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _905 = _338 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
        float2 _3253 = float2(_903, _905);
        float3 _907 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_3253, float2(0.0), isnan(_3253))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_3253, float2(0.0), isnan(_3253))).xyz;
        float _909 = _907.x;
        float _911 = _907.y;
        float _913 = _907.z;
        float _915 = _909 + _863;
        float _917 = _911 + _865;
        float _919 = _913 + _867;
        _901 = _919;
        _897 = _917;
        _893 = _915;
    }
    float _921 = _901;
    float _923 = _897;
    float _925 = _893;
    float _927 = _925;
    float _929 = _923;
    if (_707)
    {
        _811 = _921;
    }
    float _931 = _811;
    float _933 = _931;
    if (!_707)
    {
        float _935 = _338 + (-0.5);
        float _937 = _340 + (-0.5);
        float _939 = fma(_935, (*spvDescriptorSet0.fp_c4)._m0[7].x, (*spvDescriptorSet0.fp_c4)._m0[6].y);
        float _941 = precise::max(0.0, (*spvDescriptorSet0.fp_c4)._m0[6].z);
        float _943 = _937 + (*spvDescriptorSet0.fp_c4)._m0[6].x;
        bool _945 = (*spvDescriptorSet0.fp_c4)._m0[6].w > (-1.0999999631167156621813774108887e-06);
        float _947 = abs((*spvDescriptorSet0.fp_c4)._m0[6].w);
        float _949 = -_947;
        float _951 = fma(_949, 2.0, (*spvDescriptorSet0.fp_c4)._m0[6].z);
        float _953 = _939 * _939;
        bool _955 = (*spvDescriptorSet0.fp_c4)._m0[6].w >= (-1.0999999631167156621813774108887e-06);
        bool _957 = isnan((*spvDescriptorSet0.fp_c4)._m0[6].w);
        bool _959 = _955 || _957;
        bool _961 = isnan(-1.0999999631167156621813774108887e-06);
        bool _963 = _959 || _961;
        float _965 = _923 * 4.0;
        float _967 = _921 * 4.0;
        float _969 = fma(_943, _943, _953);
        float _971 = precise::max(0.0, _951);
        int _973 = _963 ? 0 : 1;
        uint _975 = as_type<uint>(half2(float2(_967, 0.0)));
        float _977 = -_971;
        float _979 = _941 + _977;
        float _981 = sqrt(_969);
        float _983 = _925 * 4.0;
        int _985 = ~_973;
        int _987 = _985 + 1;
        int _989 = _987 + 1;
        int _991 = _989;
        if (!_945)
        {
            int _993 = ~_973;
            int _995 = _993 + 1;
            _991 = _995;
        }
        int _997 = _991;
        uint _999 = as_type<uint>(half2(float2(_983, _965)));
        float _1001 = 1.0 / _979;
        float _1003 = float(_997);
        uint _1005 = extract_bits(_975, 0u, 8u);
        int _1007 = int(_1005) & 255;
        uint _1009 = extract_bits(_975, 8u, 8u);
        int _1011 = int(_1009) & 255;
        int _1013 = _1011 << 8;
        int _1015 = _1007 | _1013;
        int _1017 = int(_999) & 32767;
        float _1019 = float(uint(_1015));
        float _1021 = -_971;
        float _1023 = _1021 + _981;
        float _1025 = float(uint(_1017));
        uint _1027 = extract_bits(_999, 16u, 16u);
        float _1029 = float(_1027);
        float _1031 = _1001 * _1023;
        float _1033 = precise::clamp(_1031, 0.0, 1.0);
        float _1035 = fma(_1033, -2.0, 3.0);
        float _1037 = _1033 * _1033;
        float _1039 = fma(_1037, _1035, -0.5);
        float _1041 = fma(_1039, _1003, 0.5);
        float _1043 = fma(_1029, 6.103515625e-05, -0.3125);
        float _1045 = fma(_1025, 6.103515625e-05, -0.3125);
        float _1047 = precise::max(_1041, (*spvDescriptorSet0.fp_c4)._m0[5].w);
        float _1049 = fma(_1019, 6.103515625e-05, -0.3125);
        float _1051 = fma(_1043, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        float _1053 = fma(_1045, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        bool _1055 = _1047 > 0.999000012874603271484375;
        float _1057 = fma(_1049, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        bool _1059 = !_1055;
        _869 = 6.103515625e-05;
        if (!_1059)
        {
            float3 _3473 = float3(_1053, _1051, _1057);
            float3 _1061 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_3473, float3(0.0), isnan(_3473))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_3473, float3(0.0), isnan(_3473))).xyz;
            float _1063 = _1061.x;
            float _1065 = _1061.y;
            float _1067 = _1061.z;
            _927 = _1063;
            _929 = _1065;
            _933 = _1067;
            _1069 = true;
        }
        else
        {
            bool _1071 = _1047 >= 0.001000000047497451305389404296875;
            bool _1073 = isnan(_1047);
            bool _1075 = _1071 || _1073;
            bool _1077 = isnan(0.001000000047497451305389404296875);
            bool _1079 = _1075 || _1077;
            if (!_1079)
            {
                float3 _3506 = float3(_1053, _1051, _1057);
                float3 _1081 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_3506, float3(0.0), isnan(_3506))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_3506, float3(0.0), isnan(_3506))).xyz;
                float _1083 = _1081.x;
                float _1085 = _1081.y;
                float _1087 = _1081.z;
                _927 = _1083;
                _929 = _1085;
                _933 = _1087;
                _1069 = true;
            }
            else
            {
                float3 _3525 = float3(_1053, _1051, _1057);
                float3 _1089 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_3525, float3(0.0), isnan(_3525))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_3525, float3(0.0), isnan(_3525))).xyz;
                float _1091 = _1089.x;
                float _1093 = _1089.y;
                float _1095 = _1089.z;
                float3 _3540 = float3(_1053, _1051, _1057);
                float3 _1097 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_3540, float3(0.0), isnan(_3540))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_3540, float3(0.0), isnan(_3540))).xyz;
                float _1099 = _1097.x;
                float _1101 = _1097.y;
                float _1103 = _1097.z;
                float _1105 = -_1091;
                float _1107 = _1099 + _1105;
                float _1109 = -_1093;
                float _1111 = _1101 + _1109;
                float _1113 = -_1095;
                float _1115 = _1103 + _1113;
                float _1117 = fma(_1047, _1107, _1091);
                float _1119 = fma(_1047, _1111, _1093);
                float _1121 = fma(_1047, _1115, _1095);
                _927 = _1117;
                _929 = _1119;
                _933 = _1121;
                _869 = _1101;
            }
        }
    }
    _1069 = false;
    float _1123 = _927;
    float _1125 = _929;
    float _1127 = _933;
    float _1129 = _869;
    float _1131 = fma(_238, _332, _883);
    bool _1133 = _194 >= 1.0;
    bool _1135 = isnan(_194);
    bool _1137 = _1133 || _1135;
    bool _1139 = isnan(1.0);
    bool _1141 = _1137 || _1139;
    float _1143 = _1123;
    float _1145 = _1123;
    float _1147 = _1127;
    float _1149 = _1125;
    float _1151 = _1125;
    float _1153 = _1123;
    float _1155 = _1125;
    float _1157 = _1129;
    if (_707)
    {
        _378 = _1123;
    }
    float _1159 = _378;
    float _1161 = _1159;
    if (_707)
    {
        _1143 = _1127;
    }
    float _1163 = _1143;
    float _1165 = _1163;
    if (!_707)
    {
        bool _1167 = _1123 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _1169 = isnan(_1123);
        bool _1171 = _1167 || _1169;
        bool _1173 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1175 = _1171 || _1173;
        bool _1177 = _1127 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _1179 = isnan(_1127);
        bool _1181 = _1177 || _1179;
        bool _1183 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1185 = _1181 || _1183;
        float _1187 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _1123, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _1189 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _1125, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _1191 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _1127, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        bool _1193 = _1125 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _1195 = isnan(_1125);
        bool _1197 = _1193 || _1195;
        bool _1199 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1201 = _1197 || _1199;
        float _1203 = exp2(_1187);
        float _1205 = exp2(_1191);
        float _1207 = exp2(_1189);
        if (_1175)
        {
            float _1209 = -_1203;
            float _1211 = _1209 + 1.0;
            _1145 = _1211;
        }
        float _1213 = _1145;
        _1161 = _1213;
        _1153 = _1213;
        _1155 = _1205;
        if (_1185)
        {
            float _1215 = -_1205;
            float _1217 = _1215 + 1.0;
            _1147 = _1217;
        }
        float _1219 = _1147;
        if (_1201)
        {
            float _1221 = -_1207;
            float _1223 = _1221 + 1.0;
            _1149 = _1223;
        }
        float _1225 = _1149;
        _1151 = _1225;
        _1165 = _1219;
    }
    float _1227 = _1161;
    float _1229 = _1151;
    float _1231 = _1165;
    float _1233 = _1153;
    float _1235 = _1155;
    float _1237 = _1227;
    float _1239 = _1233;
    float _1241 = _1229;
    float _1243 = _1229;
    float _1245 = _1231;
    float _1247 = _1231;
    float _1249 = _1235;
    if (!_707)
    {
        float _1251 = _1227 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1237 = _1251;
    }
    float _1253 = _1237;
    if (_1141)
    {
        _1239 = _258;
    }
    float _1255 = _1239;
    float _1257 = _1255;
    float _1259 = _1255;
    if (!_707)
    {
        float _1261 = _1229 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1241 = _1261;
    }
    float _1263 = _1241;
    if (_1141)
    {
        _1243 = _260;
    }
    float _1265 = _1243;
    float _1267 = _1265;
    float _1269 = _1265;
    if (!_707)
    {
        float _1271 = _1231 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1245 = _1271;
    }
    float _1273 = _1245;
    if (_1141)
    {
        _1157 = _262;
    }
    float _1275 = _1157;
    float _1277 = _1275;
    float _1279 = _1275;
    if (!_1141)
    {
        bool _1281 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
        bool _1283 = isnan(0.0);
        bool _1285 = _1281 || _1283;
        bool _1287 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
        bool _1289 = _1285 || _1287;
        if (!_1289)
        {
            float _1291 = _258 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _1257 = _1291;
        }
        float _1293 = _1257;
        _1259 = _1293;
        if (!_1289)
        {
            float _1295 = _260 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _1267 = _1295;
        }
        float _1297 = _1267;
        _1269 = _1297;
        if (!_1289)
        {
            float _1299 = _262 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _1277 = _1299;
        }
        float _1301 = _1277;
        bool _1303 = !_1289;
        _1279 = _1301;
        if (!_1303)
        {
            float _1305 = _260 * 0.715200006961822509765625;
            float _1307 = fma(_258, 0.2125999927520751953125, _1305);
            float _1309 = fma(_262, 0.072200000286102294921875, _1307);
            float _1311 = 1.0 / _1309;
            float _1313 = _1311 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            float _1315 = precise::clamp(_1313, 0.0, 1.0);
            float _1317 = fma(_1315, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
            float _1319 = _258 * _1317;
            float _1321 = _260 * _1317;
            float _1323 = _262 * _1317;
            _1259 = _1319;
            _1269 = _1321;
            _1279 = _1323;
            _1247 = _1315;
            _1249 = _1317;
        }
    }
    float _1325 = _1259;
    float _1327 = _1269;
    float _1329 = _1279;
    float _1331 = _1247;
    float _1333 = _1249;
    float _1335 = fma(_332, _1253, _885);
    float _1337 = fma(_332, _1263, _887);
    float _1339 = fma(_332, _1273, _889);
    float _1341 = _1331;
    float _1343 = _1333;
    float _1345 = _1325;
    if (_1141)
    {
        _1341 = _1325;
    }
    float _1347 = _1341;
    float _1349 = _1347;
    if (_1141)
    {
        _1343 = _1327;
    }
    float _1351 = _1343;
    float _1353 = _1351;
    if (_1141)
    {
        _380 = _1329;
    }
    float _1355 = _380;
    float _1357 = _1355;
    if (!_1141)
    {
        float _1359 = _342 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _1361 = _338 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
        float2 _3936 = float2(_1359, _1361);
        float3 _1363 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_3936, float2(0.0), isnan(_3936))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_3936, float2(0.0), isnan(_3936))).xyz;
        float _1365 = _1363.x;
        float _1367 = _1363.y;
        float _1369 = _1363.z;
        float _1371 = _1365 + _1325;
        float _1373 = _1367 + _1327;
        float _1375 = _1369 + _1329;
        _1357 = _1375;
        _1349 = _1371;
        _1353 = _1373;
        _382 = _1369;
    }
    float _1377 = _1357;
    float _1379 = _1349;
    float _1381 = _1353;
    float _1383 = _382;
    float _1385 = _1379;
    float _1387 = _1377;
    float _1389 = _1381;
    float _1391 = _1383;
    if (!_1141)
    {
        float _1393 = _338 + (-0.5);
        float _1395 = _342 + (-0.5);
        float _1397 = fma(_1393, (*spvDescriptorSet0.fp_c4)._m0[7].x, (*spvDescriptorSet0.fp_c4)._m0[6].y);
        float _1399 = precise::max(0.0, (*spvDescriptorSet0.fp_c4)._m0[6].z);
        float _1401 = _1395 + (*spvDescriptorSet0.fp_c4)._m0[6].x;
        bool _1403 = (*spvDescriptorSet0.fp_c4)._m0[6].w > (-1.0999999631167156621813774108887e-06);
        float _1405 = abs((*spvDescriptorSet0.fp_c4)._m0[6].w);
        float _1407 = -_1405;
        float _1409 = fma(_1407, 2.0, (*spvDescriptorSet0.fp_c4)._m0[6].z);
        float _1411 = _1397 * _1397;
        bool _1413 = (*spvDescriptorSet0.fp_c4)._m0[6].w >= (-1.0999999631167156621813774108887e-06);
        bool _1415 = isnan((*spvDescriptorSet0.fp_c4)._m0[6].w);
        bool _1417 = _1413 || _1415;
        bool _1419 = isnan(-1.0999999631167156621813774108887e-06);
        bool _1421 = _1417 || _1419;
        float _1423 = _1377 * 4.0;
        float _1425 = precise::max(0.0, _1409);
        float _1427 = fma(_1401, _1401, _1411);
        int _1429 = _1421 ? 0 : 1;
        uint _1431 = as_type<uint>(half2(float2(_1423, 0.0)));
        float _1433 = -_1425;
        float _1435 = _1399 + _1433;
        float _1437 = _1379 * 4.0;
        float _1439 = sqrt(_1427);
        int _1441 = ~_1429;
        int _1443 = _1441 + 1;
        int _1445 = _1443 + 1;
        int _1447 = _1445;
        if (!_1403)
        {
            int _1449 = ~_1429;
            int _1451 = _1449 + 1;
            _1447 = _1451;
        }
        int _1453 = _1447;
        uint _1455 = extract_bits(_1431, 0u, 8u);
        int _1457 = int(_1455) & 255;
        uint _1459 = extract_bits(_1431, 8u, 8u);
        int _1461 = int(_1459) & 255;
        int _1463 = _1461 << 8;
        int _1465 = _1457 | _1463;
        float _1467 = 1.0 / _1435;
        float _1469 = float(uint(_1465));
        float _1471 = -_1425;
        float _1473 = _1471 + _1439;
        float _1475 = _1381 * 4.0;
        float _1477 = float(_1453);
        uint _1479 = as_type<uint>(half2(float2(_1437, _1475)));
        float _1481 = _1467 * _1473;
        float _1483 = precise::clamp(_1481, 0.0, 1.0);
        uint _1485 = extract_bits(_1479, 16u, 16u);
        float _1487 = float(_1485);
        float _1489 = fma(_1483, -2.0, 3.0);
        float _1491 = _1483 * _1483;
        float _1493 = fma(_1491, _1489, -0.5);
        float _1495 = fma(_1493, _1477, 0.5);
        int _1497 = int(_1479) & 32767;
        float _1499 = fma(_1469, 6.103515625e-05, -0.3125);
        float _1501 = precise::max(_1495, (*spvDescriptorSet0.fp_c4)._m0[5].w);
        float _1503 = fma(_1487, 6.103515625e-05, -0.3125);
        float _1505 = float(uint(_1497));
        float _1507 = fma(_1499, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        bool _1509 = _1501 > 0.999000012874603271484375;
        float _1511 = fma(_1503, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        float _1513 = fma(_1505, 6.103515625e-05, -0.3125);
        float _1515 = fma(_1513, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        bool _1517 = !_1509;
        _1391 = _1495;
        _1345 = _1511;
        if (!_1517)
        {
            float3 _4156 = float3(_1515, _1511, _1507);
            float3 _1519 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_4156, float3(0.0), isnan(_4156))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_4156, float3(0.0), isnan(_4156))).xyz;
            float _1521 = _1519.x;
            float _1523 = _1519.y;
            float _1525 = _1519.z;
            _1385 = _1521;
            _1387 = _1525;
            _1389 = _1523;
            _1527 = true;
        }
        else
        {
            bool _1529 = _1501 >= 0.001000000047497451305389404296875;
            bool _1531 = isnan(_1501);
            bool _1533 = _1529 || _1531;
            bool _1535 = isnan(0.001000000047497451305389404296875);
            bool _1537 = _1533 || _1535;
            if (!_1537)
            {
                float3 _4189 = float3(_1515, _1511, _1507);
                float3 _1539 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_4189, float3(0.0), isnan(_4189))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_4189, float3(0.0), isnan(_4189))).xyz;
                float _1541 = _1539.x;
                float _1543 = _1539.y;
                float _1545 = _1539.z;
                _1385 = _1541;
                _1387 = _1545;
                _1389 = _1543;
                _1527 = true;
            }
            else
            {
                float3 _4208 = float3(_1515, _1511, _1507);
                float3 _1547 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_4208, float3(0.0), isnan(_4208))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_4208, float3(0.0), isnan(_4208))).xyz;
                float _1549 = _1547.x;
                float _1551 = _1547.y;
                float _1553 = _1547.z;
                float3 _4223 = float3(_1515, _1511, _1507);
                float3 _1555 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_4223, float3(0.0), isnan(_4223))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_4223, float3(0.0), isnan(_4223))).xyz;
                float _1557 = _1555.x;
                float _1559 = _1555.y;
                float _1561 = _1555.z;
                float _1563 = -_1551;
                float _1565 = _1559 + _1563;
                float _1567 = -_1549;
                float _1569 = _1557 + _1567;
                float _1571 = -_1553;
                float _1573 = _1561 + _1571;
                float _1575 = fma(_1501, _1565, _1551);
                float _1577 = fma(_1501, _1569, _1549);
                float _1579 = fma(_1501, _1573, _1553);
                _1385 = _1577;
                _1387 = _1579;
                _1389 = _1575;
                _1391 = _1573;
            }
        }
    }
    _1527 = false;
    float _1581 = _1385;
    float _1583 = _1387;
    float _1585 = _1389;
    float _1587 = _1391;
    float _1589 = _1345;
    float _1591 = fma(_264, _356, _1131);
    bool _1593 = _212 >= 1.0;
    bool _1595 = isnan(_212);
    bool _1597 = _1593 || _1595;
    bool _1599 = isnan(1.0);
    bool _1601 = _1597 || _1599;
    float _1603 = _1587;
    float _1605 = _1581;
    float _1607 = _1583;
    float _1609 = _1585;
    float _1611 = _1585;
    float _1613 = _1585;
    float _1615 = _1589;
    if (_1141)
    {
        _384 = _1581;
    }
    float _1617 = _384;
    float _1619 = _1617;
    if (_1141)
    {
        _1603 = _1583;
    }
    float _1621 = _1603;
    float _1623 = _1621;
    if (!_1141)
    {
        bool _1625 = _1581 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _1627 = isnan(_1581);
        bool _1629 = _1625 || _1627;
        bool _1631 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1633 = _1629 || _1631;
        bool _1635 = _1583 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _1637 = isnan(_1583);
        bool _1639 = _1635 || _1637;
        bool _1641 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1643 = _1639 || _1641;
        float _1645 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _1581, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _1647 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _1583, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _1649 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _1585, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        bool _1651 = _1585 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _1653 = isnan(_1585);
        bool _1655 = _1651 || _1653;
        bool _1657 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1659 = _1655 || _1657;
        float _1661 = exp2(_1645);
        float _1663 = exp2(_1647);
        float _1665 = exp2(_1649);
        _1613 = (*spvDescriptorSet0.fp_c3)._m0[1].y;
        if (_1633)
        {
            float _1667 = -_1661;
            float _1669 = _1667 + 1.0;
            _1605 = _1669;
        }
        float _1671 = _1605;
        _1619 = _1671;
        if (_1643)
        {
            float _1673 = -_1663;
            float _1675 = _1673 + 1.0;
            _1607 = _1675;
        }
        float _1677 = _1607;
        if (_1659)
        {
            float _1679 = -_1665;
            float _1681 = _1679 + 1.0;
            _1609 = _1681;
        }
        float _1683 = _1609;
        _1611 = _1683;
        _1623 = _1677;
    }
    float _1685 = _1619;
    float _1687 = _1611;
    float _1689 = _1623;
    float _1691 = _1613;
    float _1693 = _1685;
    float _1695 = _1691;
    float _1697 = _1687;
    float _1699 = _1689;
    float _1701 = _1689;
    float _1703 = _1687;
    if (!_1141)
    {
        float _1705 = _1685 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1693 = _1705;
    }
    float _1707 = _1693;
    if (_1601)
    {
        _1695 = _284;
    }
    float _1709 = _1695;
    float _1711 = _1709;
    float _1713 = _1709;
    if (!_1141)
    {
        float _1715 = _1687 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1697 = _1715;
    }
    float _1717 = _1697;
    if (_1601)
    {
        _1699 = _286;
    }
    float _1719 = _1699;
    float _1721 = _1719;
    float _1723 = _1719;
    if (!_1141)
    {
        float _1725 = _1689 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1701 = _1725;
    }
    float _1727 = _1701;
    float _1729 = _1727;
    if (_1601)
    {
        _1615 = _288;
    }
    float _1731 = _1615;
    float _1733 = _1731;
    float _1735 = _1731;
    if (!_1601)
    {
        bool _1737 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
        bool _1739 = isnan(0.0);
        bool _1741 = _1737 || _1739;
        bool _1743 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
        bool _1745 = _1741 || _1743;
        if (!_1745)
        {
            float _1747 = _284 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _1711 = _1747;
        }
        float _1749 = _1711;
        _1713 = _1749;
        if (!_1745)
        {
            float _1751 = _286 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _1721 = _1751;
        }
        float _1753 = _1721;
        _1723 = _1753;
        if (!_1745)
        {
            float _1755 = _288 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _1733 = _1755;
        }
        float _1757 = _1733;
        bool _1759 = !_1745;
        _1735 = _1757;
        if (!_1759)
        {
            float _1761 = _286 * 0.715200006961822509765625;
            float _1763 = fma(_284, 0.2125999927520751953125, _1761);
            float _1765 = fma(_288, 0.072200000286102294921875, _1763);
            float _1767 = 1.0 / _1765;
            float _1769 = _1767 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            float _1771 = precise::clamp(_1769, 0.0, 1.0);
            float _1773 = fma(_1771, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
            float _1775 = _284 * _1773;
            float _1777 = _286 * _1773;
            float _1779 = _288 * _1773;
            _1723 = _1777;
            _1735 = _1779;
            _1703 = _1773;
            _1713 = _1775;
        }
    }
    float _1781 = _1723;
    float _1783 = _1735;
    float _1785 = _1703;
    float _1787 = _1713;
    float _1789 = fma(_356, _1707, _1335);
    float _1791 = fma(_356, _1717, _1337);
    float _1793 = fma(_356, _1727, _1339);
    float _1795 = _1785;
    float _1797 = _1787;
    float _1799 = _1781;
    if (_1601)
    {
        _1795 = _1781;
    }
    float _1801 = _1795;
    float _1803 = _1801;
    if (_1601)
    {
        _386 = _1783;
    }
    float _1805 = _386;
    float _1807 = _1805;
    if (!_1601)
    {
        float _1809 = _342 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _1811 = _334 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
        float2 _4610 = float2(_1809, _1811);
        float3 _1813 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_4610, float2(0.0), isnan(_4610))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_4610, float2(0.0), isnan(_4610))).xyz;
        float _1815 = _1813.x;
        float _1817 = _1813.y;
        float _1819 = _1813.z;
        float _1821 = _1815 + _1787;
        float _1823 = _1817 + _1781;
        float _1825 = _1819 + _1783;
        _1797 = _1821;
        _1803 = _1823;
        _1807 = _1825;
        _1729 = _1815;
    }
    float _1827 = _1797;
    float _1829 = _1803;
    float _1831 = _1807;
    float _1833 = _1729;
    float _1835 = _1833;
    float _1837 = _1831;
    float _1839 = _1829;
    if (_1601)
    {
        _1835 = _1827;
    }
    float _1841 = _1835;
    float _1843 = _1841;
    if (!_1601)
    {
        float _1845 = _334 + (-0.5);
        float _1847 = _342 + (-0.5);
        float _1849 = fma(_1845, (*spvDescriptorSet0.fp_c4)._m0[7].x, (*spvDescriptorSet0.fp_c4)._m0[6].y);
        float _1851 = precise::max(0.0, (*spvDescriptorSet0.fp_c4)._m0[6].z);
        float _1853 = _1847 + (*spvDescriptorSet0.fp_c4)._m0[6].x;
        bool _1855 = (*spvDescriptorSet0.fp_c4)._m0[6].w > (-1.0999999631167156621813774108887e-06);
        float _1857 = abs((*spvDescriptorSet0.fp_c4)._m0[6].w);
        float _1859 = -_1857;
        float _1861 = fma(_1859, 2.0, (*spvDescriptorSet0.fp_c4)._m0[6].z);
        float _1863 = _1849 * _1849;
        bool _1865 = (*spvDescriptorSet0.fp_c4)._m0[6].w >= (-1.0999999631167156621813774108887e-06);
        bool _1867 = isnan((*spvDescriptorSet0.fp_c4)._m0[6].w);
        bool _1869 = _1865 || _1867;
        bool _1871 = isnan(-1.0999999631167156621813774108887e-06);
        bool _1873 = _1869 || _1871;
        float _1875 = _1829 * 4.0;
        float _1877 = _1831 * 4.0;
        float _1879 = fma(_1853, _1853, _1863);
        float _1881 = precise::max(0.0, _1861);
        int _1883 = _1873 ? 0 : 1;
        uint _1885 = as_type<uint>(half2(float2(_1877, 0.0)));
        float _1887 = sqrt(_1879);
        float _1889 = -_1881;
        float _1891 = _1851 + _1889;
        int _1893 = ~_1883;
        int _1895 = _1893 + 1;
        int _1897 = _1895 + 1;
        int _1899 = _1897;
        if (!_1855)
        {
            int _1901 = ~_1883;
            int _1903 = _1901 + 1;
            _1899 = _1903;
        }
        int _1905 = _1899;
        uint _1907 = extract_bits(_1885, 0u, 8u);
        int _1909 = int(_1907) & 255;
        uint _1911 = extract_bits(_1885, 8u, 8u);
        int _1913 = int(_1911) & 255;
        int _1915 = _1913 << 8;
        int _1917 = _1909 | _1915;
        float _1919 = 1.0 / _1891;
        float _1921 = float(_1905);
        float _1923 = float(uint(_1917));
        float _1925 = -_1881;
        float _1927 = _1925 + _1887;
        float _1929 = _1827 * 4.0;
        uint _1931 = as_type<uint>(half2(float2(_1929, _1875)));
        float _1933 = _1919 * _1927;
        float _1935 = precise::clamp(_1933, 0.0, 1.0);
        uint _1937 = extract_bits(_1931, 16u, 16u);
        float _1939 = float(_1937);
        float _1941 = fma(_1935, -2.0, 3.0);
        float _1943 = _1935 * _1935;
        float _1945 = fma(_1943, _1941, -0.5);
        int _1947 = int(_1931) & 32767;
        float _1949 = fma(_1923, 6.103515625e-05, -0.3125);
        float _1951 = fma(_1945, _1921, 0.5);
        float _1953 = float(uint(_1947));
        float _1955 = precise::max(_1951, (*spvDescriptorSet0.fp_c4)._m0[5].w);
        float _1957 = fma(_1939, 6.103515625e-05, -0.3125);
        float _1959 = fma(_1953, 6.103515625e-05, -0.3125);
        bool _1961 = _1955 > 0.999000012874603271484375;
        float _1963 = fma(_1957, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        float _1965 = fma(_1949, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        float _1967 = fma(_1959, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        bool _1969 = !_1961;
        _1799 = _1959;
        if (!_1969)
        {
            float3 _4834 = float3(_1967, _1963, _1965);
            float3 _1971 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_4834, float3(0.0), isnan(_4834))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_4834, float3(0.0), isnan(_4834))).xyz;
            float _1973 = _1971.x;
            float _1975 = _1971.y;
            float _1977 = _1971.z;
            _1843 = _1973;
            _1837 = _1977;
            _1839 = _1975;
            _1979 = true;
        }
        else
        {
            bool _1981 = _1955 >= 0.001000000047497451305389404296875;
            bool _1983 = isnan(_1955);
            bool _1985 = _1981 || _1983;
            bool _1987 = isnan(0.001000000047497451305389404296875);
            bool _1989 = _1985 || _1987;
            if (!_1989)
            {
                float3 _4867 = float3(_1967, _1963, _1965);
                float3 _1991 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_4867, float3(0.0), isnan(_4867))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_4867, float3(0.0), isnan(_4867))).xyz;
                float _1993 = _1991.x;
                float _1995 = _1991.y;
                float _1997 = _1991.z;
                _1843 = _1993;
                _1837 = _1997;
                _1839 = _1995;
                _1979 = true;
            }
            else
            {
                float3 _4886 = float3(_1967, _1963, _1965);
                float3 _1999 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_4886, float3(0.0), isnan(_4886))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_4886, float3(0.0), isnan(_4886))).xyz;
                float _2001 = _1999.x;
                float _2003 = _1999.y;
                float _2005 = _1999.z;
                float3 _4901 = float3(_1967, _1963, _1965);
                float3 _2007 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_4901, float3(0.0), isnan(_4901))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_4901, float3(0.0), isnan(_4901))).xyz;
                float _2009 = _2007.x;
                float _2011 = _2007.y;
                float _2013 = _2007.z;
                float _2015 = -_2003;
                float _2017 = _2011 + _2015;
                float _2019 = -_2001;
                float _2021 = _2009 + _2019;
                float _2023 = -_2005;
                float _2025 = _2013 + _2023;
                float _2027 = fma(_1955, _2017, _2003);
                float _2029 = fma(_1955, _2021, _2001);
                float _2031 = fma(_1955, _2025, _2005);
                _1843 = _2029;
                _1837 = _2031;
                _1839 = _2027;
                _1799 = _2025;
            }
        }
    }
    _1979 = false;
    float _2033 = _1843;
    float _2035 = _1837;
    float _2037 = _1839;
    float _2039 = _1799;
    float _2041 = _2039;
    float _2043 = _2037;
    float _2045 = _2035;
    float _2047 = _2033;
    if (_1601)
    {
        _2041 = _2037;
    }
    float _2049 = _2041;
    float _2051 = _2049;
    float _2053 = _2035;
    if (!_1601)
    {
        bool _2055 = _2037 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _2057 = isnan(_2037);
        bool _2059 = _2055 || _2057;
        bool _2061 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _2063 = _2059 || _2061;
        bool _2065 = _2035 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _2067 = isnan(_2035);
        bool _2069 = _2065 || _2067;
        bool _2071 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _2073 = _2069 || _2071;
        float _2075 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _2037, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _2077 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _2035, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _2079 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _2033, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        bool _2081 = _2033 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _2083 = isnan(_2033);
        bool _2085 = _2081 || _2083;
        bool _2087 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _2089 = _2085 || _2087;
        float _2091 = exp2(_2075);
        float _2093 = exp2(_2077);
        float _2095 = exp2(_2079);
        if (_2063)
        {
            float _2097 = -_2091;
            float _2099 = _2097 + 1.0;
            _2043 = _2099;
        }
        float _2101 = _2043;
        if (_2073)
        {
            float _2103 = -_2093;
            float _2105 = _2103 + 1.0;
            _2045 = _2105;
        }
        float _2107 = _2045;
        _2051 = _2101;
        _2053 = _2107;
        if (_2089)
        {
            float _2109 = -_2095;
            float _2111 = _2109 + 1.0;
            _2047 = _2111;
        }
    }
    float _2113 = _2047;
    float _2115 = _2051;
    float _2117 = _2053;
    float _2119 = _2113;
    float _2121 = _2115;
    float _2123 = _2117;
    if (!_1601)
    {
        float _2125 = _2113 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _2119 = _2125;
    }
    float _2127 = _2119;
    if (!_1601)
    {
        float _2129 = _2115 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _2121 = _2129;
    }
    float _2131 = _2121;
    if (!_1601)
    {
        float _2133 = _2117 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _2123 = _2133;
    }
    float _2135 = _2123;
    float _2137 = fma(_290, _358, _1591);
    float _2139 = fma(_358, _2127, _1789);
    float _2141 = fma(_358, _2131, _1791);
    float _2143 = fma(_358, _2135, _1793);
    out.m_47.x = _2139;
    out.m_47.y = _2141;
    out.m_47.z = _2143;
    out.m_47.w = _2137;
    return out;
}

