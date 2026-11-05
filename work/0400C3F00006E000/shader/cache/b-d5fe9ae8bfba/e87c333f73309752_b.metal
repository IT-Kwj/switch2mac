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

template<typename T>
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
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
int _51(thread const int& _5434, thread const int& _5435, constant _10& support_buffer)
{
    int _5438 = 1 + _5435;
    float _5440 = support_buffer._m5[_5438].x;
    float _5442 = abs(_5440);
    bool _5444 = _5442 == 1.0;
    if (_5444)
    {
        return _5434;
    }
    float _5446 = float(_5434);
    float _5448 = _5446 / _5442;
    int _5450 = int(_5448);
    return _5450;
}

static inline __attribute__((always_inline))
int _53(thread const int& _5472, thread const int& _5473, thread const int& _5474, constant _10& support_buffer, thread float4& gl_FragCoord)
{
    int _5477 = 1 + _5473;
    float _5479 = support_buffer._m5[_5477].x;
    bool _5481 = _5479 == 1.0;
    if (_5481)
    {
        return _5472;
    }
    bool _5483 = _5479 < 0.0;
    if (_5483)
    {
        float _5485 = -_5479;
        float _5487 = float(_5472);
        float _5489 = _5487 * _5485;
        float _5491 = gl_FragCoord.x;
        float _5493 = gl_FragCoord.y;
        float _5495 = (_5474 != 0) ? _5493 : _5491;
        float _5497 = mod(_5495, _5485);
        float _5499 = _5489 + _5497;
        int _5501 = int(_5499);
        return _5501;
    }
    float _5503 = float(_5472);
    float _5505 = _5503 * _5479;
    int _5507 = int(_5505);
    return _5507;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _2343 = false;
    bool _1027 = false;
    bool _1905 = false;
    bool _1793 = false;
    bool _1675 = false;
    bool _695 = false;
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
    int _111 = _107 + 1;
    int _113 = _107;
    int _115 = 1;
    int _117 = 0;
    int _119 = _53(_113, _115, _117, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _121 = _103;
    int _123 = 1;
    int _125 = 1;
    int _127 = _53(_121, _123, _125, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float _129 = spvDescriptorSet0.fp_t_tcb_A.read(uint2(int2(_119, _127)), 0).x;
    int _131 = _107;
    int _133 = 1;
    int _135 = 0;
    int _137 = _53(_131, _133, _135, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _139 = _109;
    int _141 = 1;
    int _143 = 1;
    int _145 = _53(_139, _141, _143, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float _147 = spvDescriptorSet0.fp_t_tcb_A.read(uint2(int2(_137, _145)), 0).x;
    int _149 = _111;
    int _151 = 1;
    int _153 = 0;
    int _155 = _53(_149, _151, _153, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _157 = _109;
    int _159 = 1;
    int _161 = 1;
    int _163 = _53(_157, _159, _161, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float _165 = spvDescriptorSet0.fp_t_tcb_A.read(uint2(int2(_155, _163)), 0).x;
    int _167 = _111;
    int _169 = 1;
    int _171 = 0;
    int _173 = _53(_167, _169, _171, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _175 = _103;
    int _177 = 1;
    int _179 = 1;
    int _181 = _53(_175, _177, _179, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float _183 = spvDescriptorSet0.fp_t_tcb_A.read(uint2(int2(_173, _181)), 0).x;
    int _185 = _107;
    int _187 = 0;
    int _189 = 0;
    int _191 = _53(_185, _187, _189, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _193 = _103;
    int _195 = 0;
    int _197 = 1;
    int _199 = _53(_193, _195, _197, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float4 _202 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_191, _199)), 0).xyzw;
    float _204 = _202.x;
    float _206 = _202.y;
    float _208 = _202.z;
    float _210 = _202.w;
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
    int _238 = _111;
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
    int _264 = _111;
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
    float _292 = floor(_97);
    float _294 = -_290;
    float _296 = _99 + _294;
    float _298 = -_292;
    float _300 = _97 + _298;
    float _302 = -_296;
    float _304 = _302 + 1.0;
    float _306 = -_300;
    float _308 = _306 + 1.0;
    float _310 = _296 * _300;
    float _312 = _300 * _304;
    float _314 = _304 * _308;
    float _316 = _296 * _308;
    int _318 = 0;
    float _320 = _99;
    float _322 = _304;
    float _324 = as_type<float>(_103);
    float _326 = 0.0;
    float _328 = _97;
    float _330 = _296;
    float _332 = as_type<float>(_107);
    int _334 = 0;
    int _336 = 0;
    float _338 = 0.0;
    float _340 = 0.0;
    float _342 = 0.0;
    int _344 = 0;
    float _346 = 0.0;
    float _348 = 0.0;
    float _350 = 0.0;
    float _352 = 0.0;
    float _354 = 0.0;
    float _1015;
    float _1017;
    float _1019;
    float _1021;
    float _1023;
    float _1025;
    float _1671;
    float _1673;
    float _1789;
    float _1791;
    float _1901;
    float _1903;
    float _2323;
    float _2329;
    float _2339;
    float _2341;
    do
    {
        int _356 = _318;
        float _358 = _320;
        float _360 = _322;
        float _362 = _324;
        float _364 = _326;
        float _366 = _328;
        float _368 = _330;
        float _370 = _332;
        int _372 = _334;
        int _374 = _336;
        float _376 = _338;
        float _378 = _340;
        float _380 = _342;
        int _382 = _344;
        float _384 = _346;
        float _386 = _348;
        float _388 = _350;
        float _390 = _352;
        float _392 = _354;
        int _394 = _356 << 4;
        int _396 = _356 << 2;
        bool _400 = _394 == 0;
        bool _402 = _394 == 16;
        bool _404 = _396 == 0;
        bool _406 = _396 == 4;
        int _408 = _404 ? 8 : 0;
        bool _410 = _396 == 12;
        bool _412 = _396 == 8;
        bool _414 = _394 == 32;
        bool _416 = _394 == 48;
        float _418 = _360;
        float _420 = _362;
        float _422 = _358;
        float _424 = _364;
        float _426 = _366;
        float _428 = _368;
        float _430 = _370;
        float _432 = _376;
        int _434 = _372;
        float _436 = _378;
        float _438 = _384;
        float _440 = _380;
        float _442 = _380;
        float _444 = as_type<float>(_374);
        float _446 = _380;
        float _448 = as_type<float>(_382);
        if (_400)
        {
            _418 = _204;
        }
        float _450 = _418;
        float _452 = _450;
        if (_402)
        {
            _452 = _230;
        }
        float _454 = _452;
        float _456 = _454;
        if (_400)
        {
            _420 = _206;
        }
        float _458 = _420;
        float _460 = _458;
        if (_404)
        {
            _422 = _129;
        }
        float _462 = _422;
        float _464 = _462;
        if (_406)
        {
            _464 = _147;
        }
        float _466 = _464;
        float _468 = _466;
        if (_412)
        {
            _468 = _165;
        }
        float _470 = _468;
        float _472 = _470;
        if (_400)
        {
            _424 = _208;
        }
        float _474 = _424;
        float _476 = _474;
        if (_402)
        {
            _460 = _232;
        }
        float _478 = _460;
        float _480 = _478;
        if (_410)
        {
            _472 = _183;
        }
        float _482 = _472;
        float _484 = _482;
        if (_402)
        {
            _476 = _234;
        }
        float _486 = _476;
        bool _488 = _482 >= 1.0;
        bool _490 = isnan(_482);
        bool _492 = _488 || _490;
        bool _494 = isnan(1.0);
        bool _496 = _492 || _494;
        float _498 = _486;
        if (_414)
        {
            _456 = _256;
        }
        float _500 = _456;
        float _502 = _500;
        if (_414)
        {
            _480 = _258;
        }
        float _504 = _480;
        float _506 = _504;
        if (_414)
        {
            _498 = _260;
        }
        float _508 = _498;
        float _510 = _508;
        if (_416)
        {
            _502 = _282;
        }
        float _512 = _502;
        float _514 = _512;
        if (_416)
        {
            _506 = _284;
        }
        float _516 = _506;
        float _518 = _516;
        if (_416)
        {
            _510 = _286;
        }
        float _520 = _510;
        float _522 = _520;
        if (_496)
        {
            _426 = _512;
        }
        float _524 = _426;
        float _526 = _524;
        float _528 = _524;
        if (_496)
        {
            _428 = _516;
        }
        float _530 = _428;
        float _532 = _530;
        float _534 = _530;
        if (_496)
        {
            _430 = _520;
        }
        float _536 = _430;
        float _538 = _536;
        float _540 = _536;
        if (!_496)
        {
            bool _542 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
            bool _544 = isnan(0.0);
            bool _546 = _542 || _544;
            bool _548 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
            bool _550 = _546 || _548;
            if (!_550)
            {
                float _552 = _512 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
                _526 = _552;
            }
            float _554 = _526;
            _528 = _554;
            if (!_550)
            {
                float _556 = _516 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
                _532 = _556;
            }
            float _558 = _532;
            _534 = _558;
            if (!_550)
            {
                float _560 = _520 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
                _538 = _560;
            }
            float _562 = _538;
            bool _564 = !_550;
            _540 = _562;
            if (!_564)
            {
                float _566 = _516 * 0.715200006961822509765625;
                float _568 = fma(_512, 0.2125999927520751953125, _566);
                float _570 = fma(_520, 0.072200000286102294921875, _568);
                float _572 = 1.0 / _570;
                float _574 = _572 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
                float _576 = precise::clamp(_574, 0.0, 1.0);
                float _578 = fma(_576, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
                float _580 = _512 * _578;
                float _582 = _516 * _578;
                float _584 = _520 * _578;
                _528 = _580;
                _534 = _582;
                _540 = _584;
                _432 = _570;
            }
        }
        float _586 = _528;
        float _588 = _534;
        float _590 = _540;
        float _592 = _432;
        float _594 = _590;
        float _596 = _586;
        float _598 = _588;
        float _600 = _592;
        if (!_496)
        {
            float _602 = _586 * 4.0;
            float _604 = _588 * 4.0;
            float _606 = _590 * 4.0;
            float _608 = -(*spvDescriptorSet0.fp_c4)._m0[0].z;
            float _610 = (*spvDescriptorSet0.fp_c4)._m0[0].w + _608;
            float _612 = (*spvDescriptorSet0.fp_c4)._m0[0].w + (*spvDescriptorSet0.fp_c4)._m0[0].z;
            uint _615 = as_type<uint>(half2(float2(_606, 0.0)));
            float _617 = -_612;
            float _619 = fma(_482, _610, _617);
            float _621 = (*spvDescriptorSet0.fp_c4)._m0[0].w * (-2.0);
            uint _623 = as_type<uint>(half2(float2(_602, _604)));
            float _625 = _621 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
            float _627 = 1.0 / _619;
            uint _629 = extract_bits(_615, 0u, 8u);
            int _631 = int(_629) & 255;
            uint _633 = extract_bits(_615, 8u, 8u);
            int _635 = int(_633) & 255;
            int _637 = _635 << 8;
            int _639 = _631 | _637;
            float _641 = float(uint(_639));
            uint _643 = extract_bits(_623, 16u, 16u);
            float _645 = float(_643);
            float _647 = -(*spvDescriptorSet0.fp_c4)._m0[9].y;
            float _649 = fma(_625, _627, _647);
            float _651 = precise::max(0.0, _649);
            float _653 = fma(_641, 6.103515625e-05, -0.3125);
            float _655 = fma(_645, 6.103515625e-05, -0.3125);
            float _657 = _651 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
            float _659 = _657 * (-1.44269502162933349609375);
            float _661 = exp2(_659);
            float _663 = _661 + (-0.5);
            int _665 = int(_623) & 32767;
            float _667 = fma(_663, (*spvDescriptorSet0.fp_c4)._m0[9].z, 0.5);
            float _669 = float(uint(_665));
            float _671 = precise::max(_667, (*spvDescriptorSet0.fp_c4)._m0[5].w);
            float _673 = fma(_669, 6.103515625e-05, -0.3125);
            bool _675 = _671 > 0.999000012874603271484375;
            float _677 = fma(_655, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
            float _679 = fma(_653, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
            float _681 = fma(_673, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
            bool _683 = !_675;
            _518 = as_type<float>(_623);
            _522 = (*spvDescriptorSet0.fp_c4)._m0[9].z;
            _514 = _677;
            _484 = _681;
            _600 = _671;
            _436 = _679;
            if (!_683)
            {
                float3 _3030 = float3(_681, _677, _679);
                float3 _687 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_3030, float3(0.0), isnan(_3030))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_3030, float3(0.0), isnan(_3030))).xyz;
                float _689 = _687.x;
                float _691 = _687.y;
                float _693 = _687.z;
                _594 = _693;
                _596 = _689;
                _598 = _691;
                _695 = true;
            }
            else
            {
                bool _697 = _671 >= 0.001000000047497451305389404296875;
                bool _699 = isnan(_671);
                bool _701 = _697 || _699;
                bool _703 = isnan(0.001000000047497451305389404296875);
                bool _705 = _701 || _703;
                if (!_705)
                {
                    float3 _3067 = float3(_681, _677, _679);
                    float3 _707 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_3067, float3(0.0), isnan(_3067))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_3067, float3(0.0), isnan(_3067))).xyz;
                    float _709 = _707.x;
                    float _711 = _707.y;
                    float _713 = _707.z;
                    _594 = _713;
                    _596 = _709;
                    _598 = _711;
                    _695 = true;
                }
                else
                {
                    float3 _3086 = float3(_681, _677, _679);
                    float3 _715 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_3086, float3(0.0), isnan(_3086))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_3086, float3(0.0), isnan(_3086))).xyz;
                    float _717 = _715.x;
                    float _719 = _715.y;
                    float _721 = _715.z;
                    float3 _3101 = float3(_681, _677, _679);
                    float3 _723 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_3101, float3(0.0), isnan(_3101))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_3101, float3(0.0), isnan(_3101))).xyz;
                    float _725 = _723.x;
                    float _727 = _723.y;
                    float _729 = _723.z;
                    float _731 = -_717;
                    float _733 = _725 + _731;
                    float _735 = -_719;
                    float _737 = _727 + _735;
                    float _739 = -_721;
                    float _741 = _729 + _739;
                    float _743 = fma(_671, _733, _717);
                    float _745 = fma(_671, _737, _719);
                    float _747 = fma(_671, _741, _721);
                    _518 = _741;
                    _522 = _721;
                    _594 = _747;
                    _434 = as_type<int>(_729);
                    _596 = _743;
                    _598 = _745;
                    _438 = _737;
                }
            }
        }
        _695 = false;
        float _749 = _518;
        float _751 = _522;
        float _753 = _594;
        int _755 = _434;
        float _757 = _596;
        float _759 = _598;
        float _761 = _514;
        float _763 = _484;
        float _765 = _600;
        float _767 = _436;
        float _769 = _438;
        float _771 = _749;
        float _773 = _761;
        float _775 = _763;
        float _777 = _751;
        float _779 = _765;
        float _781 = _767;
        float _783 = _769;
        float _785 = _759;
        float _787 = _753;
        float _789 = _753;
        int _791 = _755;
        float _793 = _753;
        int _795 = _755;
        if (_496)
        {
            _771 = _757;
        }
        float _797 = _771;
        float _799 = _797;
        if (_496)
        {
            _773 = _759;
        }
        float _801 = _773;
        float _803 = _801;
        if (_496)
        {
            _775 = _753;
        }
        float _805 = _775;
        float _807 = _805;
        if (!_496)
        {
            bool _809 = _757 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
            bool _811 = isnan(_757);
            bool _813 = _809 || _811;
            bool _815 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
            bool _817 = _813 || _815;
            bool _819 = _759 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
            bool _821 = isnan(_759);
            bool _823 = _819 || _821;
            bool _825 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
            bool _827 = _823 || _825;
            float _829 = fma(_757, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
            float _831 = fma(_759, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
            float _833 = fma(_753, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
            bool _835 = _753 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
            bool _837 = isnan(_753);
            bool _839 = _835 || _837;
            bool _841 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
            bool _843 = _839 || _841;
            float _845 = exp2(_829);
            float _847 = exp2(_831);
            float _849 = exp2(_833);
            float _851 = -_845;
            float _853 = _851 + 1.0;
            bool _855 = !_817;
            float _857 = _855 ? _757 : _853;
            float _859 = -_847;
            float _861 = _859 + 1.0;
            bool _863 = !_827;
            float _865 = _863 ? _759 : _861;
            float _867 = -_849;
            float _869 = _867 + 1.0;
            bool _871 = !_843;
            float _873 = _871 ? _753 : _869;
            _799 = _857;
            _777 = _847;
            _803 = _865;
            _807 = _873;
            _779 = _849;
            _781 = _869;
            _783 = _861;
        }
        float _875 = _799;
        float _877 = _777;
        float _879 = _803;
        float _881 = _807;
        float _883 = _779;
        float _885 = _781;
        float _887 = _783;
        float _889 = _885;
        float _891 = _887;
        float _893 = _883;
        float _895 = _877;
        float _897 = _883;
        float _899 = _887;
        float _901 = _875;
        float _903 = _879;
        float _905 = _881;
        float _907 = _875;
        float _909 = _877;
        float _911 = _883;
        float _913 = _885;
        float _915 = _887;
        float _917 = _879;
        float _919 = _881;
        if (!_496)
        {
            bool _921 = (*spvDescriptorSet0.fp_c3)._m0[7].x != 6.0;
            bool _923 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
            bool _925 = _921 || _923;
            bool _927 = isnan(6.0);
            bool _929 = _925 || _927;
            if (!_929)
            {
                float _931 = -_875;
                float _933 = _931 + 1.0;
                float _935 = -_879;
                float _937 = _935 + 1.0;
                float _939 = -_881;
                float _941 = _939 + 1.0;
                float _943 = abs(_933);
                float _945 = log2(_943);
                float _947 = abs(_937);
                float _949 = log2(_947);
                float _951 = abs(_941);
                float _953 = log2(_951);
                float _955 = _945 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                float _957 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                float _959 = _949 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                float _961 = exp2(_955);
                float _963 = _953 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                float _965 = exp2(_959);
                float _967 = exp2(_963);
                float _969 = fma(_957, _961, 1.0);
                float _971 = fma(_957, _965, 1.0);
                float _973 = 1.0 / _969;
                float _975 = fma(_957, _967, 1.0);
                float _977 = 1.0 / _971;
                float _979 = 1.0 / _975;
                float _981 = _973 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                float _983 = _977 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                float _985 = precise::max(_981, _983);
                float _987 = _979 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                float _989 = precise::max(_987, _985);
                float _991 = -_981;
                float _993 = _991 + _989;
                float _995 = -_983;
                float _997 = _995 + _989;
                float _999 = -_987;
                float _1001 = _999 + _989;
                float _1003 = fma(_993, (*spvDescriptorSet0.fp_c3)._m0[6].w, _981);
                float _1005 = fma(_997, (*spvDescriptorSet0.fp_c3)._m0[6].w, _983);
                float _1007 = fma(_1001, (*spvDescriptorSet0.fp_c3)._m0[6].w, _987);
                float _1009 = _1003 * _875;
                float _1011 = _1005 * _879;
                float _1013 = _1007 * _881;
                _1015 = _1013;
                _789 = _1005;
                _791 = as_type<int>(_993);
                _1017 = _1011;
                _1019 = _1007;
                _1021 = _1009;
                _1023 = _1011;
                _1025 = _1013;
                _1027 = true;
            }
            else
            {
                bool _1029 = (*spvDescriptorSet0.fp_c3)._m0[7].x >= 1000.0;
                if (!_1029)
                {
                    _889 = (*spvDescriptorSet0.fp_c3)._m0[7].x;
                }
                float _1031 = _889;
                bool _1033 = !_1029;
                float _1035 = _1031;
                _1019 = _1031;
                if (!_1033)
                {
                    float _1037 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
                    float _1039 = _89 + _1037;
                    float _1041 = abs(_1039);
                    float _1043 = _1041 * 2560.0;
                    bool _1045 = _1043 >= 2.0;
                    bool _1047 = isnan(_1043);
                    bool _1049 = _1045 || _1047;
                    bool _1051 = isnan(2.0);
                    bool _1053 = _1049 || _1051;
                    float _1055 = _1043;
                    if (!_1053)
                    {
                        _891 = 0.0;
                    }
                    float _1057 = _891;
                    float _1059 = _1057;
                    _1021 = _1057;
                    if (!_1053)
                    {
                        _1055 = 0.0;
                        _893 = 0.0;
                    }
                    float _1061 = _1055;
                    float _1063 = _893;
                    bool _1065 = !_1053;
                    float _1067 = _1063;
                    float _1069 = _1061;
                    _1015 = _1061;
                    _1017 = _1063;
                    _1023 = _1063;
                    _1025 = _1061;
                    _1027 = _1065;
                    if (!_1027)
                    {
                        bool _1071 = _89 > (*spvDescriptorSet0.fp_c3)._m0[7].y;
                        if (_1071)
                        {
                            _1059 = _875;
                        }
                        float _1073 = _1059;
                        _899 = _1073;
                        _1021 = _1073;
                        if (_1071)
                        {
                            _1067 = _879;
                        }
                        float _1075 = _1067;
                        _897 = _1075;
                        _1017 = _1075;
                        _1023 = _1075;
                        if (_1071)
                        {
                            _1069 = _881;
                        }
                        float _1077 = _1069;
                        _895 = _1077;
                        _1015 = _1077;
                        _1025 = _1077;
                        _1027 = _1071;
                        if (!_1027)
                        {
                            float _1079 = (*spvDescriptorSet0.fp_c3)._m0[7].x + (-1000.0);
                            _1035 = _1079;
                        }
                    }
                }
                if (!_1027)
                {
                    float _1081 = _895;
                    float _1083 = _897;
                    float _1085 = _1035;
                    float _1087 = _899;
                    bool _1089 = _1085 != 0.0;
                    bool _1091 = isnan(_1085);
                    bool _1093 = _1089 || _1091;
                    bool _1095 = isnan(0.0);
                    bool _1097 = _1093 || _1095;
                    float _1099 = _1085;
                    float _1101 = _1085;
                    float _1103 = _1085;
                    float _1105 = _1085;
                    float _1107 = _1087;
                    float _1109 = _1083;
                    float _1111 = _1081;
                    _1019 = _1085;
                    if (!_1097)
                    {
                        float _1113 = _759 * 0.586600005626678466796875;
                        float _1115 = fma(_757, 0.29890000820159912109375, _1113);
                        float _1117 = fma(_753, 0.1143999993801116943359375, _1115);
                        float _1119 = _1117 * (-1.44269502162933349609375);
                        float _1121 = exp2(_1119);
                        float _1123 = -_1121;
                        float _1125 = _1123 + 1.0;
                        bool _1127 = _1125 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                        bool _1129 = isnan(_1125);
                        bool _1131 = _1127 || _1129;
                        bool _1133 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                        bool _1135 = _1131 || _1133;
                        float _1137 = _1117;
                        if (!_1135)
                        {
                            _1137 = _1125;
                        }
                        float _1139 = _1137;
                        bool _1141 = !_1135;
                        float _1143 = _1139;
                        if (!_1141)
                        {
                            float _1145 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _1147 = _1125 + _1145;
                            float _1149 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _1151 = spvFAdd(_1149, 1.00000095367431640625);
                            float _1153 = 1.0 / _1151;
                            float _1155 = _1147 * _1153;
                            float _1157 = -_1155;
                            float _1159 = _1157 + 1.0;
                            float _1161 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _1163 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1161;
                            float _1165 = abs(_1159);
                            float _1167 = log2(_1165);
                            float _1169 = _1163 * _1153;
                            float _1171 = _1169 + (-1.0);
                            float _1173 = _1169 * _1155;
                            float _1175 = _1167 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _1177 = exp2(_1175);
                            float _1179 = fma(_1171, _1177, 1.0);
                            float _1181 = 1.0 / _1179;
                            float _1183 = _1173 * _1181;
                            float _1185 = fma(_1151, _1183, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                            _1099 = _1153;
                            _1143 = _1185;
                        }
                        float _1187 = _1099;
                        float _1189 = _1143;
                        float _1191 = -_1125;
                        float _1193 = _1191 + _1189;
                        float _1195 = _879 * 0.586600005626678466796875;
                        float _1197 = _1193 + 1.0;
                        float _1199 = fma(_875, 0.29890000820159912109375, _1195);
                        float _1201 = fma(_881, 0.1143999993801116943359375, _1199);
                        float _1203 = abs(_1197);
                        float _1205 = log2(_1203);
                        float _1207 = spvFAdd(_1201, 9.9999999747524270787835121154785e-07);
                        float _1209 = 1.0 / _1207;
                        float _1211 = _1205 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
                        float _1213 = exp2(_1211);
                        float _1215 = fma(_1209, _875, -1.0);
                        float _1217 = fma(_1209, _879, -1.0);
                        float _1219 = fma(_1209, _881, -1.0);
                        float _1221 = fma(_1213, _1215, 1.0);
                        float _1223 = fma(_1213, _1217, 1.0);
                        float _1225 = fma(_1213, _1219, 1.0);
                        float _1227 = _1221 * _1189;
                        float _1229 = _1223 * _1189;
                        float _1231 = _1225 * _1189;
                        float _1233 = precise::max(0.0, _1227);
                        float _1235 = precise::max(0.0, _1229);
                        float _1237 = precise::max(0.0, _1231);
                        float _1239 = precise::min(_1233, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _1241 = precise::min(_1235, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _1243 = precise::min(_1237, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        _1015 = _1243;
                        _789 = _1213;
                        _1017 = _1241;
                        _1019 = _1187;
                        _1021 = _1239;
                        _1023 = _1241;
                        _1025 = _1243;
                        _1027 = true;
                    }
                    else
                    {
                        bool _1245 = _1085 != 1.0;
                        bool _1247 = isnan(_1085);
                        bool _1249 = _1245 || _1247;
                        bool _1251 = isnan(1.0);
                        bool _1253 = _1249 || _1251;
                        if (!_1253)
                        {
                            bool _1255 = _875 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                            bool _1257 = isnan(_875);
                            bool _1259 = _1255 || _1257;
                            bool _1261 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                            bool _1263 = _1259 || _1261;
                            float _1265 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _1267 = spvFAdd(_1265, 1.00000095367431640625);
                            bool _1269 = _879 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                            bool _1271 = isnan(_879);
                            bool _1273 = _1269 || _1271;
                            bool _1275 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                            bool _1277 = _1273 || _1275;
                            bool _1279 = _881 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                            bool _1281 = isnan(_881);
                            bool _1283 = _1279 || _1281;
                            bool _1285 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                            bool _1287 = _1283 || _1285;
                            float _1289 = 1.0 / _1267;
                            float _1291 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _1293 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1291;
                            float _1295 = _1293 * _1289;
                            bool _1297 = !_1263;
                            _789 = _1295;
                            if (!_1297)
                            {
                                float _1299 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                float _1301 = _875 + _1299;
                                float _1303 = _1295 + (-1.0);
                                float _1305 = _1301 * _1289;
                                float _1307 = -_1305;
                                float _1309 = _1307 + 1.0;
                                float _1311 = _1295 * _1305;
                                float _1313 = abs(_1309);
                                float _1315 = log2(_1313);
                                float _1317 = _1315 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                float _1319 = exp2(_1317);
                                float _1321 = fma(_1303, _1319, 1.0);
                                float _1323 = 1.0 / _1321;
                                float _1325 = _1311 * _1323;
                                float _1327 = fma(_1267, _1325, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                _901 = _1327;
                            }
                            float _1329 = _901;
                            bool _1331 = !_1277;
                            if (!_1331)
                            {
                                float _1333 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                float _1335 = _879 + _1333;
                                float _1337 = _1295 + (-1.0);
                                float _1339 = _1335 * _1289;
                                float _1341 = -_1339;
                                float _1343 = _1341 + 1.0;
                                float _1345 = _1295 * _1339;
                                float _1347 = abs(_1343);
                                float _1349 = log2(_1347);
                                float _1351 = _1349 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                float _1353 = exp2(_1351);
                                float _1355 = fma(_1337, _1353, 1.0);
                                float _1357 = 1.0 / _1355;
                                float _1359 = _1345 * _1357;
                                float _1361 = fma(_1267, _1359, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                _903 = _1361;
                            }
                            float _1363 = _903;
                            bool _1365 = !_1287;
                            if (!_1365)
                            {
                                float _1367 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                float _1369 = _881 + _1367;
                                float _1371 = _1295 + (-1.0);
                                float _1373 = _1369 * _1289;
                                float _1375 = -_1373;
                                float _1377 = _1375 + 1.0;
                                float _1379 = _1295 * _1373;
                                float _1381 = abs(_1377);
                                float _1383 = log2(_1381);
                                float _1385 = _1383 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                float _1387 = exp2(_1385);
                                float _1389 = fma(_1371, _1387, 1.0);
                                float _1391 = 1.0 / _1389;
                                float _1393 = _1379 * _1391;
                                float _1395 = fma(_1267, _1393, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                _905 = _1395;
                            }
                            float _1397 = _905;
                            float _1399 = precise::max(0.0, _1397);
                            float _1401 = precise::max(0.0, _1329);
                            float _1403 = precise::max(0.0, _1363);
                            float _1405 = precise::min(_1399, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                            float _1407 = precise::min(_1401, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                            float _1409 = precise::min(_1403, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                            _1015 = _1405;
                            _1017 = _1409;
                            _1021 = _1407;
                            _1023 = _1409;
                            _1025 = _1405;
                            _1027 = true;
                        }
                        else
                        {
                            bool _1411 = _1085 != 2.0;
                            bool _1413 = isnan(_1085);
                            bool _1415 = _1411 || _1413;
                            bool _1417 = isnan(2.0);
                            bool _1419 = _1415 || _1417;
                            if (!_1419)
                            {
                                float _1421 = _879 * 0.715200006961822509765625;
                                float _1423 = fma(_875, 0.2125999927520751953125, _1421);
                                float _1425 = fma(_881, 0.072200000286102294921875, _1423);
                                float _1427 = spvFAdd(_1425, 9.9999999747524270787835121154785e-07);
                                bool _1429 = _1425 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                bool _1431 = isnan(_1425);
                                bool _1433 = _1429 || _1431;
                                bool _1435 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                bool _1437 = _1433 || _1435;
                                float _1439 = 1.0 / _1427;
                                float _1441 = _1423;
                                float _1443 = _1425;
                                if (!_1437)
                                {
                                    _1441 = _1425;
                                }
                                float _1445 = _1441;
                                bool _1447 = !_1437;
                                float _1449 = _1445;
                                if (!_1447)
                                {
                                    float _1451 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    float _1453 = _1425 + _1451;
                                    float _1455 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    float _1457 = spvFAdd(_1455, 1.00000095367431640625);
                                    float _1459 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    float _1461 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1459;
                                    float _1463 = 1.0 / _1457;
                                    float _1465 = _1453 * _1463;
                                    float _1467 = _1461 * _1463;
                                    float _1469 = -_1465;
                                    float _1471 = _1469 + 1.0;
                                    float _1473 = _1467 + (-1.0);
                                    float _1475 = _1467 * _1465;
                                    float _1477 = abs(_1471);
                                    float _1479 = log2(_1477);
                                    float _1481 = _1479 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1483 = exp2(_1481);
                                    float _1485 = fma(_1473, _1483, 1.0);
                                    float _1487 = 1.0 / _1485;
                                    float _1489 = _1475 * _1487;
                                    float _1491 = fma(_1457, _1489, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                    _1443 = _1489;
                                    _1101 = _1467;
                                    _1449 = _1491;
                                }
                                float _1493 = _1443;
                                float _1495 = _1101;
                                float _1497 = _1449;
                                float _1499 = precise::max(0.0, _1497);
                                float _1501 = precise::min(_1499, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                float _1503 = _1439 * _1501;
                                float _1505 = _875 * _1503;
                                float _1507 = _879 * _1503;
                                float _1509 = _881 * _1503;
                                float _1511 = precise::max(0.0, _1505);
                                float _1513 = precise::max(0.0, _1507);
                                float _1515 = precise::max(0.0, _1509);
                                float _1517 = precise::min(_1511, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                float _1519 = precise::min(_1513, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                float _1521 = precise::min(_1515, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                _1015 = _1521;
                                _789 = _1493;
                                _1017 = _1519;
                                _1019 = _1495;
                                _1021 = _1517;
                                _1023 = _1519;
                                _1025 = _1521;
                                _1027 = true;
                            }
                            else
                            {
                                bool _1523 = _1085 != 3.0;
                                bool _1525 = isnan(_1085);
                                bool _1527 = _1523 || _1525;
                                bool _1529 = isnan(3.0);
                                bool _1531 = _1527 || _1529;
                                if (!_1531)
                                {
                                    float _1533 = -_875;
                                    float _1535 = _1533 + 1.0;
                                    float _1537 = -_879;
                                    float _1539 = _1537 + 1.0;
                                    float _1541 = -_881;
                                    float _1543 = _1541 + 1.0;
                                    float _1545 = abs(_1535);
                                    float _1547 = log2(_1545);
                                    float _1549 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                    float _1551 = abs(_1539);
                                    float _1553 = log2(_1551);
                                    float _1555 = abs(_1543);
                                    float _1557 = log2(_1555);
                                    float _1559 = _1547 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1561 = _1553 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1563 = exp2(_1559);
                                    float _1565 = _1557 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1567 = exp2(_1561);
                                    float _1569 = exp2(_1565);
                                    float _1571 = fma(_1549, _1563, 1.0);
                                    float _1573 = fma(_1549, _1567, 1.0);
                                    float _1575 = 1.0 / _1571;
                                    float _1577 = fma(_1549, _1569, 1.0);
                                    float _1579 = 1.0 / _1573;
                                    float _1581 = 1.0 / _1577;
                                    float _1583 = _1575 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    float _1585 = _1575 + _1579;
                                    float _1587 = _1579 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    float _1589 = _1581 + _1585;
                                    float _1591 = _1581 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    float _1593 = precise::max(_1583, _1587);
                                    float _1595 = _1589 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    float _1597 = precise::max(_1591, _1593);
                                    float _1599 = _1595 * 0.3333333432674407958984375;
                                    float _1601 = -_1599;
                                    float _1603 = _1597 + _1601;
                                    float _1605 = fma(_1603, (*spvDescriptorSet0.fp_c3)._m0[7].z, _1599);
                                    float _1607 = -_1583;
                                    float _1609 = _1607 + _1605;
                                    float _1611 = -_1587;
                                    float _1613 = _1611 + _1605;
                                    float _1615 = -_1591;
                                    float _1617 = _1615 + _1605;
                                    float _1619 = fma(_1609, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1583);
                                    float _1621 = fma(_1613, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1587);
                                    float _1623 = fma(_1617, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1591);
                                    float _1625 = _1619 * _875;
                                    float _1627 = _1621 * _879;
                                    float _1629 = _1623 * _881;
                                    _1015 = _1629;
                                    _789 = _1591;
                                    _1017 = _1627;
                                    _1019 = _1593;
                                    _1021 = _1625;
                                    _1023 = _1627;
                                    _1025 = _1629;
                                    _1027 = true;
                                }
                                else
                                {
                                    bool _1631 = _1085 != 4.0;
                                    bool _1633 = isnan(_1085);
                                    bool _1635 = _1631 || _1633;
                                    bool _1637 = isnan(4.0);
                                    bool _1639 = _1635 || _1637;
                                    if (!_1639)
                                    {
                                        bool _1641 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        bool _1643 = isnan(0.0);
                                        bool _1645 = _1641 || _1643;
                                        bool _1647 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                        bool _1649 = _1645 || _1647;
                                        if (!_1649)
                                        {
                                            float _1651 = -_875;
                                            float _1653 = _1651 + 1.0;
                                            float _1655 = abs(_1653);
                                            float _1657 = log2(_1655);
                                            float _1659 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                            float _1661 = _1657 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1663 = exp2(_1661);
                                            float _1665 = fma(_1659, _1663, 1.0);
                                            float _1667 = 1.0 / _1665;
                                            float _1669 = _1667 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            _1671 = _1661;
                                            _1673 = _1669;
                                            _1675 = true;
                                        }
                                        else
                                        {
                                            float _1677 = spvFAdd(_875, 9.9999999747524270787835121154785e-07);
                                            bool _1679 = _875 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                            bool _1681 = isnan(_875);
                                            bool _1683 = _1679 || _1681;
                                            bool _1685 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                            bool _1687 = _1683 || _1685;
                                            float _1689 = 1.0 / _1677;
                                            if (!_1687)
                                            {
                                                _785 = _875;
                                            }
                                            float _1691 = _785;
                                            bool _1693 = !_1687;
                                            float _1695 = _1691;
                                            if (!_1693)
                                            {
                                                float _1697 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1699 = _875 + _1697;
                                                float _1701 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1703 = spvFAdd(_1701, 1.00000095367431640625);
                                                float _1705 = 1.0 / _1703;
                                                float _1707 = _1699 * _1705;
                                                float _1709 = -_1707;
                                                float _1711 = _1709 + 1.0;
                                                float _1713 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1715 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1713;
                                                float _1717 = abs(_1711);
                                                float _1719 = log2(_1717);
                                                float _1721 = _1715 * _1705;
                                                float _1723 = _1721 + (-1.0);
                                                float _1725 = _1721 * _1707;
                                                float _1727 = _1719 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                float _1729 = exp2(_1727);
                                                float _1731 = fma(_1723, _1729, 1.0);
                                                float _1733 = 1.0 / _1731;
                                                float _1735 = _1725 * _1733;
                                                float _1737 = fma(_1703, _1735, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                                _1103 = _1729;
                                                _1695 = _1737;
                                                _787 = _1735;
                                                _440 = _1731;
                                            }
                                            float _1739 = _1103;
                                            float _1741 = _1695;
                                            float _1743 = _787;
                                            float _1745 = _440;
                                            float _1747 = precise::max(0.0, _1741);
                                            float _1749 = precise::min(_1747, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                            float _1751 = _1749 * _1689;
                                            _1105 = _1739;
                                            _1671 = _1743;
                                            _442 = _1745;
                                            _1673 = _1751;
                                        }
                                        _1675 = false;
                                        float _1753 = _1105;
                                        float _1755 = _1671;
                                        float _1757 = _442;
                                        float _1759 = _1673;
                                        float _1761 = _1755;
                                        float _1763 = _1753;
                                        float _1765 = _1757;
                                        float _1767 = _1753;
                                        if (!_1649)
                                        {
                                            float _1769 = -_879;
                                            float _1771 = _1769 + 1.0;
                                            float _1773 = abs(_1771);
                                            float _1775 = log2(_1773);
                                            float _1777 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                            float _1779 = _1775 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1781 = exp2(_1779);
                                            float _1783 = fma(_1777, _1781, 1.0);
                                            float _1785 = 1.0 / _1783;
                                            float _1787 = _1785 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            _1789 = _1781;
                                            _1791 = _1787;
                                            _1793 = true;
                                        }
                                        else
                                        {
                                            float _1795 = spvFAdd(_879, 9.9999999747524270787835121154785e-07);
                                            bool _1797 = _879 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                            bool _1799 = isnan(_879);
                                            bool _1801 = _1797 || _1799;
                                            bool _1803 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                            bool _1805 = _1801 || _1803;
                                            float _1807 = 1.0 / _1795;
                                            if (!_1805)
                                            {
                                                _1761 = _879;
                                            }
                                            float _1809 = _1761;
                                            bool _1811 = !_1805;
                                            float _1813 = _1809;
                                            if (!_1811)
                                            {
                                                float _1815 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1817 = _879 + _1815;
                                                float _1819 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1821 = spvFAdd(_1819, 1.00000095367431640625);
                                                float _1823 = 1.0 / _1821;
                                                float _1825 = _1817 * _1823;
                                                float _1827 = -_1825;
                                                float _1829 = _1827 + 1.0;
                                                float _1831 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1833 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1831;
                                                float _1835 = abs(_1829);
                                                float _1837 = log2(_1835);
                                                float _1839 = _1833 * _1823;
                                                float _1841 = _1839 + (-1.0);
                                                float _1843 = _1839 * _1825;
                                                float _1845 = _1837 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                float _1847 = exp2(_1845);
                                                float _1849 = fma(_1841, _1847, 1.0);
                                                float _1851 = 1.0 / _1849;
                                                float _1853 = _1843 * _1851;
                                                float _1855 = fma(_1821, _1853, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                                _1763 = _1853;
                                                _1813 = _1855;
                                                _1765 = _1843;
                                            }
                                            float _1857 = _1763;
                                            float _1859 = _1813;
                                            float _1861 = _1765;
                                            float _1863 = precise::max(0.0, _1859);
                                            float _1865 = precise::min(_1863, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                            float _1867 = _1865 * _1807;
                                            _1767 = _1857;
                                            _1789 = _1861;
                                            _1791 = _1867;
                                        }
                                        _1793 = false;
                                        float _1869 = _1767;
                                        float _1871 = _1789;
                                        float _1873 = _1791;
                                        float _1875 = _1871;
                                        float _1877 = _1869;
                                        float _1879 = _1869;
                                        if (!_1649)
                                        {
                                            float _1881 = -_881;
                                            float _1883 = _1881 + 1.0;
                                            float _1885 = abs(_1883);
                                            float _1887 = log2(_1885);
                                            float _1889 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                            float _1891 = _1887 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1893 = exp2(_1891);
                                            float _1895 = fma(_1889, _1893, 1.0);
                                            float _1897 = 1.0 / _1895;
                                            float _1899 = _1897 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            _1901 = _1899;
                                            _1903 = _1899;
                                            _1905 = true;
                                        }
                                        else
                                        {
                                            float _1907 = spvFAdd(_881, 9.9999999747524270787835121154785e-07);
                                            bool _1909 = _881 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                            bool _1911 = isnan(_881);
                                            bool _1913 = _1909 || _1911;
                                            bool _1915 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                            bool _1917 = _1913 || _1915;
                                            float _1919 = 1.0 / _1907;
                                            if (!_1917)
                                            {
                                                _1875 = _881;
                                            }
                                            float _1921 = _1875;
                                            bool _1923 = !_1917;
                                            float _1925 = _1921;
                                            if (!_1923)
                                            {
                                                float _1927 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1929 = _881 + _1927;
                                                float _1931 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1933 = spvFAdd(_1931, 1.00000095367431640625);
                                                float _1935 = 1.0 / _1933;
                                                float _1937 = _1929 * _1935;
                                                float _1939 = -_1937;
                                                float _1941 = _1939 + 1.0;
                                                float _1943 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1945 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1943;
                                                float _1947 = abs(_1941);
                                                float _1949 = log2(_1947);
                                                float _1951 = _1945 * _1935;
                                                float _1953 = _1951 + (-1.0);
                                                float _1955 = _1951 * _1937;
                                                float _1957 = _1949 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                float _1959 = exp2(_1957);
                                                float _1961 = fma(_1953, _1959, 1.0);
                                                float _1963 = 1.0 / _1961;
                                                float _1965 = _1955 * _1963;
                                                float _1967 = fma(_1933, _1965, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                                _1877 = _1959;
                                                _1925 = _1967;
                                            }
                                            float _1969 = _1877;
                                            float _1971 = _1925;
                                            float _1973 = precise::max(0.0, _1971);
                                            float _1975 = precise::min(_1973, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                            float _1977 = _1975 * _1919;
                                            _1901 = _1977;
                                            _1879 = _1969;
                                            _1903 = _1977;
                                        }
                                        _1905 = false;
                                        float _1979 = _1901;
                                        float _1981 = _1879;
                                        float _1983 = _1903;
                                        float _1985 = precise::max(_1759, _1873);
                                        float _1987 = precise::max(_1985, _1983);
                                        float _1989 = -_1759;
                                        float _1991 = _1987 + _1989;
                                        float _1993 = -_1873;
                                        float _1995 = _1987 + _1993;
                                        float _1997 = -_1983;
                                        float _1999 = _1987 + _1997;
                                        float _2001 = fma(_1991, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1759);
                                        float _2003 = fma(_1995, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1873);
                                        float _2005 = fma(_1999, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1983);
                                        float _2007 = _2001 * _875;
                                        float _2009 = _2003 * _879;
                                        float _2011 = _2005 * _881;
                                        _1015 = _2011;
                                        _789 = _1979;
                                        _1017 = _2009;
                                        _1019 = _1981;
                                        _1021 = _2007;
                                        _1023 = _2009;
                                        _1025 = _2011;
                                        _1027 = true;
                                    }
                                    else
                                    {
                                        bool _2013 = _1085 != 5.0;
                                        bool _2015 = isnan(_1085);
                                        bool _2017 = _2013 || _2015;
                                        bool _2019 = isnan(5.0);
                                        bool _2021 = _2017 || _2019;
                                        if (!_2021)
                                        {
                                            _1107 = _757;
                                        }
                                        float _2023 = _1107;
                                        float _2025 = _2023;
                                        _1021 = _2023;
                                        if (!_2021)
                                        {
                                            _1109 = _759;
                                        }
                                        float _2027 = _1109;
                                        float _2029 = _2027;
                                        _1017 = _2027;
                                        _1023 = _2027;
                                        if (!_2021)
                                        {
                                            _1111 = _753;
                                        }
                                        float _2031 = _1111;
                                        bool _2033 = !_2021;
                                        float _2035 = _2031;
                                        _1015 = _2031;
                                        _1025 = _2031;
                                        if (!_2033)
                                        {
                                            bool _2037 = _1085 != 6.0;
                                            bool _2039 = isnan(_1085);
                                            bool _2041 = _2037 || _2039;
                                            bool _2043 = isnan(6.0);
                                            bool _2045 = _2041 || _2043;
                                            if (!_2045)
                                            {
                                                float _2047 = -_875;
                                                float _2049 = _2047 + 1.0;
                                                float _2051 = -_879;
                                                float _2053 = _2051 + 1.0;
                                                float _2055 = -_881;
                                                float _2057 = _2055 + 1.0;
                                                float _2059 = abs(_2049);
                                                float _2061 = log2(_2059);
                                                float _2063 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                                float _2065 = abs(_2053);
                                                float _2067 = log2(_2065);
                                                float _2069 = abs(_2057);
                                                float _2071 = log2(_2069);
                                                float _2073 = _2061 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                float _2075 = _2067 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                float _2077 = exp2(_2073);
                                                float _2079 = _2071 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                float _2081 = exp2(_2075);
                                                float _2083 = exp2(_2079);
                                                float _2085 = fma(_2063, _2077, 1.0);
                                                float _2087 = fma(_2063, _2081, 1.0);
                                                float _2089 = 1.0 / _2085;
                                                float _2091 = fma(_2063, _2083, 1.0);
                                                float _2093 = 1.0 / _2087;
                                                float _2095 = 1.0 / _2091;
                                                float _2097 = _2089 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                                float _2099 = _2093 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                                float _2101 = precise::max(_2097, _2099);
                                                float _2103 = _2095 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                                float _2105 = precise::max(_2103, _2101);
                                                float _2107 = -_2097;
                                                float _2109 = _2107 + _2105;
                                                float _2111 = -_2099;
                                                float _2113 = _2111 + _2105;
                                                float _2115 = -_2103;
                                                float _2117 = _2115 + _2105;
                                                float _2119 = fma(_2109, (*spvDescriptorSet0.fp_c3)._m0[6].w, _2097);
                                                float _2121 = fma(_2113, (*spvDescriptorSet0.fp_c3)._m0[6].w, _2099);
                                                float _2123 = fma(_2117, (*spvDescriptorSet0.fp_c3)._m0[6].w, _2103);
                                                float _2125 = _2119 * _875;
                                                float _2127 = _2121 * _879;
                                                float _2129 = _2123 * _881;
                                                _1015 = _2129;
                                                _789 = _2095;
                                                _791 = as_type<int>(_2109);
                                                _1017 = _2127;
                                                _1019 = _2123;
                                                _1021 = _2125;
                                                _1023 = _2127;
                                                _1025 = _2129;
                                                _1027 = true;
                                            }
                                            else
                                            {
                                                bool _2131 = _1085 != 7.0;
                                                bool _2133 = isnan(_1085);
                                                bool _2135 = _2131 || _2133;
                                                bool _2137 = isnan(7.0);
                                                bool _2139 = _2135 || _2137;
                                                if (_2139)
                                                {
                                                    _2025 = as_type<float>(_382);
                                                }
                                                float _2141 = _2025;
                                                _1021 = _2141;
                                                if (_2139)
                                                {
                                                    _2029 = as_type<float>(_374);
                                                }
                                                float _2143 = _2029;
                                                _1017 = _2143;
                                                _1023 = _2143;
                                                if (_2139)
                                                {
                                                    _2035 = _380;
                                                }
                                                float _2145 = _2035;
                                                _1015 = _2145;
                                                _1025 = _2145;
                                                if (!_2139)
                                                {
                                                    float _2147 = -_875;
                                                    float _2149 = _2147 + 1.0;
                                                    float _2151 = -_879;
                                                    float _2153 = _2151 + 1.0;
                                                    float _2155 = -_881;
                                                    float _2157 = _2155 + 1.0;
                                                    float _2159 = abs(_2149);
                                                    float _2161 = log2(_2159);
                                                    float _2163 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                                    float _2165 = abs(_2153);
                                                    float _2167 = log2(_2165);
                                                    float _2169 = abs(_2157);
                                                    float _2171 = log2(_2169);
                                                    float _2173 = _2161 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                    float _2175 = _2167 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                    float _2177 = exp2(_2173);
                                                    float _2179 = _2171 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                    float _2181 = exp2(_2175);
                                                    float _2183 = exp2(_2179);
                                                    float _2185 = fma(_2163, _2177, 1.0);
                                                    float _2187 = fma(_2163, _2181, 1.0);
                                                    float _2189 = 1.0 / _2185;
                                                    float _2191 = fma(_2163, _2183, 1.0);
                                                    float _2193 = 1.0 / _2187;
                                                    float _2195 = 1.0 / _2191;
                                                    float _2197 = _2189 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                                    float _2199 = -_875;
                                                    float _2201 = fma(_2197, _875, _2199);
                                                    float _2203 = _2193 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                                    float _2205 = -_879;
                                                    float _2207 = fma(_2203, _879, _2205);
                                                    float _2209 = _2195 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                                    float _2211 = _2201 + _2207;
                                                    float _2213 = -_881;
                                                    float _2215 = fma(_2209, _881, _2213);
                                                    float _2217 = _2215 + _2211;
                                                    float _2219 = -_2201;
                                                    float _2221 = fma(_2217, 0.3333333432674407958984375, _2219);
                                                    float _2223 = -_2207;
                                                    float _2225 = fma(_2217, 0.3333333432674407958984375, _2223);
                                                    float _2227 = -_2215;
                                                    float _2229 = fma(_2217, 0.3333333432674407958984375, _2227);
                                                    float _2231 = fma(_2221, (*spvDescriptorSet0.fp_c3)._m0[6].w, _2201);
                                                    float _2233 = fma(_2225, (*spvDescriptorSet0.fp_c3)._m0[6].w, _2207);
                                                    float _2235 = fma(_2229, (*spvDescriptorSet0.fp_c3)._m0[6].w, _2215);
                                                    float _2237 = _2231 + _875;
                                                    float _2239 = _2233 + _879;
                                                    float _2241 = _2235 + _881;
                                                    _1015 = _2241;
                                                    _789 = _2215;
                                                    _1017 = _2239;
                                                    _1019 = _2209;
                                                    _1021 = _2237;
                                                    _1023 = _2239;
                                                    _1025 = _2241;
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            _1027 = false;
            float _2243 = _1015;
            float _2245 = _789;
            int _2247 = _791;
            float _2249 = _1017;
            float _2251 = _1019;
            float _2253 = _1021;
            float _2255 = _1023;
            float _2257 = _1025;
            float _2259 = _2253 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _2261 = _2255 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _2263 = _2257 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
            _907 = _2259;
            _909 = _2243;
            _793 = _2245;
            _795 = _2247;
            _444 = _2255;
            _911 = _2249;
            _913 = _2251;
            _446 = _2257;
            _448 = _2253;
            _915 = _2253;
            _917 = _2261;
            _919 = _2263;
        }
        float _2265 = _907;
        float _2267 = _909;
        float _2269 = _793;
        int _2271 = _795;
        int _2273 = as_type<int>(_444);
        float _2275 = _911;
        float _2277 = _913;
        float _2279 = _446;
        int _2281 = as_type<int>(_448);
        float _2283 = _915;
        float _2285 = _917;
        float _2287 = _919;
        int _2289 = _416 ? 64 : 0;
        bool _2291 = _408 != 0;
        int _2293 = _356 + 1;
        bool _2295 = _2293 >= 4;
        bool _2297 = _2289 != 0;
        _318 = _2293;
        _324 = _2265;
        _326 = _2267;
        _334 = _2271;
        _336 = _2273;
        _340 = _2277;
        _342 = _2279;
        _344 = _2281;
        _346 = _2283;
        float _2299 = _2269;
        float _2301 = _2275;
        if (_400)
        {
            _2299 = _210;
        }
        float _2303 = _2299;
        float _2305 = _2303;
        if (_2291)
        {
            _2301 = _314;
        }
        float _2307 = _2301;
        float _2309 = _2307;
        if (_406)
        {
            _2309 = _312;
        }
        float _2311 = _2309;
        float _2313 = _2311;
        if (_412)
        {
            _2313 = _310;
        }
        float _2315 = _2313;
        float _2317 = _2315;
        if (_410)
        {
            _2317 = _316;
        }
        float _2319 = _2317;
        _338 = _2319;
        if (_402)
        {
            _2305 = _236;
        }
        float _2321 = _2305;
        _2323 = fma(_2285, _2319, _386);
        _330 = _2323;
        float _2325 = _2321;
        if (_414)
        {
            _2325 = _262;
        }
        float _2327 = _2325;
        _2329 = fma(_2265, _2319, _388);
        _328 = _2329;
        float _2331 = _2327;
        float _2333 = _2327;
        if (_2297)
        {
            _2331 = _288;
            _2333 = _288;
        }
        float _2335 = _2331;
        float _2337 = _2333;
        _2339 = fma(_2287, _2319, _390);
        _2341 = fma(_2319, _2337, _392);
        _320 = _2339;
        _322 = _2341;
        _332 = _2335;
        _348 = _2323;
        _350 = _2329;
        _352 = _2339;
        _354 = _2341;
        if (_2295)
        {
            _2343 = true;
            if (_2343)
            {
                break;
            }
        }
    } while (true);
    _2343 = false;
    out.m_45.x = _2329;
    out.m_45.y = _2323;
    out.m_45.z = _2339;
    out.m_45.w = _2341;
    return out;
}

