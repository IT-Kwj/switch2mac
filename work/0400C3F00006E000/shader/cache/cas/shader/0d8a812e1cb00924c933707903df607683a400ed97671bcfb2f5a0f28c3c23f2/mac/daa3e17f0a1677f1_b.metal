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

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_A [[id(1)]];
    sampler fp_t_tcb_ASmplr [[id(2)]];
    texture2d_array<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_ASmplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_41 [[color(0)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0)]];
    float4 m_36 [[user(locn1)]];
    float4 m_34 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _48 = gl_FragCoord.w;
    float _50 = in.m_34.x;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = in.m_34.y;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = 1.0 / _48;
    float _64 = _62 * _54;
    float _66 = _62 * _60;
    float2 _790 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_790, float2(0.0), isnan(_790))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_790, float2(0.0), isnan(_790))).x;
    float _70 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _72 = in.m_36.x;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = (*spvDescriptorSet0.fp_c3)._m0[7].z * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _80 = in.m_36.w;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = 1.0 / _78;
    float _88 = _86 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _90 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[9].x));
    float _92 = _88 * (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _94 = _88 * (*spvDescriptorSet0.fp_c3)._m0[24].x;
    float _96 = _62 * _76;
    float _98 = abs(_92);
    float _100 = log2(_98);
    float _102 = _62 * _84;
    float _104 = abs(_94);
    float _106 = log2(_104);
    float _108 = _106 * _70;
    float _110 = exp2(_108);
    float _112 = -_68;
    float _114 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[8].w, 1.0);
    float _116 = 1.0 / _114;
    float _118 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _120 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[8].y, _118);
    float _122 = _100 * _70;
    float _124 = in.m_36.y;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = _120 * _88;
    float _132 = exp2(_122);
    float _134 = abs(_130);
    float _136 = log2(_134);
    float _138 = _90 * _132;
    float _140 = ceil(_138);
    int _143 = int(_140);
    float _145 = _136 * _70;
    float _147 = _90 * _110;
    float _149 = exp2(_145);
    float _151 = _62 * _128;
    float _153 = ceil(_147);
    float _155 = in.m_36.z;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = _90 * _149;
    float _163 = precise::min(_90, _161);
    float _165 = trunc(_163);
    int _167 = int(_165);
    int _169 = min(_143, _167);
    float _171 = float(_169);
    int _173 = ~_169;
    int _175 = _167 + _173;
    int _177 = _175 + 1;
    float _179 = -_171;
    float _181 = _153 + _179;
    float _183 = trunc(_181);
    int _185 = int(_183);
    int _187 = min(_185, _177);
    float _189 = _62 * _159;
    int _191 = ~_169;
    int _193 = ~_187;
    int _195 = _167 + _191;
    int _197 = _195 + _193;
    int _199 = _197 + 2;
    int _201 = 0;
    int _203 = 0;
    int _205 = 0;
    int _207 = 0;
    float _209 = 0.0;
    int _211 = 0;
    int _213 = 0;
    int _215 = 0;
    int _217 = 0;
    int _219 = 0;
    int _221 = 0;
    int _223 = 0;
    bool _227;
    bool _492;
    float _732;
    int _752;
    do
    {
        int _229 = _201;
        int _231 = _203;
        int _233 = _205;
        int _235 = _207;
        float _237 = _209;
        int _239 = _211;
        int _241 = _213;
        int _243 = _215;
        int _245 = _217;
        int _247 = _219;
        int _249 = _221;
        int _251 = _223;
        int _253 = _229 << 2;
        bool _255 = _253 == 0;
        bool _257 = _253 == 4;
        bool _259 = _253 == 8;
        int _261 = _231;
        int _263 = _253;
        float _265 = _237;
        float _267 = as_type<float>(_233);
        int _269 = _235;
        float _271 = _237;
        int _273 = _239;
        int _275 = _241;
        int _277 = _243;
        int _279 = _245;
        int _281 = _247;
        int _283 = _249;
        int _285 = _251;
        if (_255)
        {
            _261 = _169;
        }
        int _287 = _261;
        int _289 = _287;
        if (_257)
        {
            _289 = _187;
        }
        int _291 = _289;
        int _293 = _291;
        if (_259)
        {
            _293 = _199;
        }
        int _295 = _293;
        bool _297 = _295 > 0;
        _203 = _295;
        if (!_297)
        {
            _263 = _233;
        }
        int _299 = _263;
        bool _301 = !_297;
        int _303 = _299;
        if (!_301)
        {
            float _305 = float(as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[26].x));
            float _307 = in.m_38.z;
            float _309 = gl_FragCoord.w;
            float _311 = _307 * _309;
            int _313 = abs(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[26].y));
            float _315 = float(uint(_229));
            float _317 = 1.0 / _305;
            float _319 = float(uint(_313));
            int _321 = abs(_229);
            float _323 = float(uint(_321));
            float _325 = 1.0 / _319;
            int _327 = _229 << 6;
            int _329 = as_type<int>(_317) + (-2);
            float _331 = as_type<float>(_329) * _315;
            int _333 = as_type<int>(_325) + (-2);
            float _335 = trunc(_331);
            float _337 = precise::max(_335, 0.0);
            uint _340 = uint(_337);
            float _342 = _62 * _311;
            float _344 = as_type<float>(_333) * _323;
            float _346 = trunc(_344);
            float _348 = precise::max(_346, 0.0);
            uint _350 = uint(_348);
            int _352 = ~int(_340);
            int _354 = _352 + 1;
            int _356 = _354 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[26].x);
            int _358 = _356 + _229;
            int _360 = ~int(_350);
            int _362 = _360 + 1;
            float _364 = float(uint(_358));
            int _366 = _362 * _313;
            int _368 = _366 + _321;
            float _370 = as_type<float>(_329) * _364;
            float _372 = float(uint(_368));
            float _374 = trunc(_370);
            float _376 = precise::max(_374, 0.0);
            uint _378 = uint(_376);
            float _380 = as_type<float>(_333) * _372;
            float _382 = trunc(_380);
            float _384 = precise::max(_382, 0.0);
            uint _386 = uint(_384);
            int _388 = int(_340) + int(_378);
            float _390 = in.m_38.x;
            float _392 = gl_FragCoord.w;
            float _394 = _390 * _392;
            int _396 = ~_388;
            int _398 = _396 + 1;
            int _400 = int(_350) + int(_386);
            int _402 = _398 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[26].x);
            int _404 = _402 + _229;
            int _406 = ~_400;
            int _408 = _406 + 1;
            bool _410 = uint(_404) >= as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[26].x);
            float _412 = in.m_38.y;
            float _414 = gl_FragCoord.w;
            float _416 = _412 * _414;
            int _418 = _408 * _313;
            int _420 = _418 + _321;
            bool _422 = !_410;
            int _424 = _422 ? 0 : (-1);
            bool _426 = uint(_420) >= uint(_313);
            int _428 = ~_388;
            int _430 = _428 + _424;
            int _432 = _430 + 1;
            int _434 = _229 ^ as_type<int>((*spvDescriptorSet0.fp_c3)._m0[26].y);
            bool _436 = !_426;
            int _438 = _436 ? 0 : (-1);
            uint _440 = uint(int(uint(_434) >> uint(31)));
            int _442 = _432 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[26].x);
            int _444 = _442 + _229;
            bool _446 = 0 == as_type<int>((*spvDescriptorSet0.fp_c3)._m0[26].x);
            int _448 = -_438;
            int _450 = _400 + _448;
            int _452 = ~int(_440);
            int _454 = _452 + 1;
            float _456 = _62 * _394;
            bool _458 = !_446;
            int _460 = _458 ? _444 : (-1);
            int _462 = _450 ^ _454;
            float _464 = float(_460);
            int _466 = ~_454;
            int _468 = _466 + _462;
            int _470 = _468 + 1;
            bool _472 = 0 == as_type<int>((*spvDescriptorSet0.fp_c3)._m0[26].y);
            float _474 = rint(_464);
            float _476 = precise::max(_474, 0.0);
            uint _478 = uint(_476);
            uint _480 = clamp(_478, 0u, 65535u);
            bool _482 = !_472;
            int _484 = _482 ? _470 : (-1);
            float _486 = _62 * _416;
            float _488 = float(_484);
            int _490 = 0;
            _269 = as_type<int>(_342);
            do
            {
                float _494 = _265;
                int _496 = _490;
                float _498 = _267;
                float _500 = _494 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
                int _502 = _327 + 160;
                uint _504 = uint(int(uint(_502) >> uint(2)));
                uint _506 = uint(int(uint(int(_504)) >> uint(2)));
                int _508 = int(_504) & 3;
                float _510 = (*spvDescriptorSet0.fp_c3)._m0[int(_506)][_508];
                int _512 = int(_504) + 1;
                uint _514 = uint(int(uint(_512) >> uint(2)));
                int _516 = _512 & 3;
                float _518 = (*spvDescriptorSet0.fp_c3)._m0[int(_514)][_516];
                float _520 = abs(_500);
                float _522 = log2(_520);
                int _524 = _327 + 208;
                uint _526 = uint(int(uint(_524) >> uint(2)));
                uint _528 = uint(int(uint(int(_526)) >> uint(2)));
                int _530 = int(_526) & 3;
                float _532 = (*spvDescriptorSet0.fp_c3)._m0[int(_528)][_530];
                int _534 = int(_526) + 1;
                uint _536 = uint(int(uint(_534) >> uint(2)));
                int _538 = _534 & 3;
                float _540 = (*spvDescriptorSet0.fp_c3)._m0[int(_536)][_538];
                int _542 = _327 + 176;
                uint _544 = uint(int(uint(_542) >> uint(2)));
                uint _546 = uint(int(uint(int(_544)) >> uint(2)));
                int _548 = int(_544) & 3;
                float _550 = (*spvDescriptorSet0.fp_c3)._m0[int(_546)][_548];
                int _552 = int(_544) + 1;
                uint _554 = uint(int(uint(_552) >> uint(2)));
                int _556 = _552 & 3;
                float _558 = (*spvDescriptorSet0.fp_c3)._m0[int(_554)][_556];
                float _560 = _522 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
                int _562 = _327 + 192;
                uint _564 = uint(int(uint(_562) >> uint(2)));
                uint _566 = uint(int(uint(int(_564)) >> uint(2)));
                int _568 = int(_564) & 3;
                float _570 = (*spvDescriptorSet0.fp_c3)._m0[int(_566)][_568];
                int _572 = int(_564) + 1;
                uint _574 = uint(int(uint(_572) >> uint(2)));
                int _576 = _572 & 3;
                float _578 = (*spvDescriptorSet0.fp_c3)._m0[int(_574)][_576];
                float _580 = exp2(_560);
                int _582 = _327 + 216;
                uint _584 = uint(int(uint(_582) >> uint(2)));
                uint _586 = uint(int(uint(int(_584)) >> uint(2)));
                int _588 = int(_584) & 3;
                float _590 = (*spvDescriptorSet0.fp_c3)._m0[int(_586)][_588];
                int _592 = int(_584) + 1;
                uint _594 = uint(int(uint(_592) >> uint(2)));
                int _596 = _592 & 3;
                float _598 = (*spvDescriptorSet0.fp_c3)._m0[int(_594)][_596];
                int _600 = _327 + 200;
                uint _602 = uint(int(uint(_600) >> uint(2)));
                uint _604 = uint(int(uint(int(_602)) >> uint(2)));
                int _606 = int(_602) & 3;
                float _608 = (*spvDescriptorSet0.fp_c3)._m0[int(_604)][_606];
                int _610 = int(_602) + 1;
                uint _612 = uint(int(uint(_610) >> uint(2)));
                int _614 = _610 & 3;
                float _616 = (*spvDescriptorSet0.fp_c3)._m0[int(_612)][_614];
                float _618 = fma(_580, _486, _151);
                float _620 = fma(_580, _456, _96);
                float _622 = _618 * _518;
                float _624 = _618 * _540;
                float _626 = _618 * _558;
                float _628 = _618 * _578;
                float _630 = fma(_620, _510, _622);
                float _632 = fma(_620, _532, _624);
                int _634 = _327 + 168;
                uint _636 = uint(int(uint(_634) >> uint(2)));
                uint _638 = uint(int(uint(int(_636)) >> uint(2)));
                int _640 = int(_636) & 3;
                float _642 = (*spvDescriptorSet0.fp_c3)._m0[int(_638)][_640];
                int _644 = int(_636) + 1;
                uint _646 = uint(int(uint(_644) >> uint(2)));
                int _648 = _644 & 3;
                float _650 = (*spvDescriptorSet0.fp_c3)._m0[int(_646)][_648];
                float _652 = fma(_580, _342, _189);
                float _654 = fma(_620, _570, _628);
                float _656 = fma(_652, _590, _632);
                int _658 = _327 + 184;
                uint _660 = uint(int(uint(_658) >> uint(2)));
                uint _662 = uint(int(uint(int(_660)) >> uint(2)));
                int _664 = int(_660) & 3;
                float _666 = (*spvDescriptorSet0.fp_c3)._m0[int(_662)][_664];
                int _668 = int(_660) + 1;
                uint _670 = uint(int(uint(_668) >> uint(2)));
                int _672 = _668 & 3;
                float _674 = (*spvDescriptorSet0.fp_c3)._m0[int(_670)][_672];
                float _676 = fma(_102, _598, _656);
                float _678 = fma(_620, _550, _626);
                float _680 = fma(_652, _608, _654);
                float _682 = 1.0 / _676;
                float _684 = fma(_102, _616, _680);
                float _686 = fma(_652, _642, _630);
                float _688 = fma(_102, _650, _686);
                float _690 = fma(_652, _666, _678);
                float _692 = _688 * _682;
                float _694 = fma(_102, _674, _690);
                float _696 = fma(-0.5, (*spvDescriptorSet0.fp_c3)._m0[25].z, _692);
                float _698 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[25].z, _692);
                float _700 = _694 * _682;
                float _702 = _684 * _682;
                float _704 = fma(-0.5, (*spvDescriptorSet0.fp_c3)._m0[25].w, _700);
                float _706 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[25].w, _700);
                float3 _1685 = float3(_696, _704, float(int(_480)));
                float3 _1689 = select(_1685, float3(0.0), isnan(_1685));
                float _708 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1689.xy, uint(rint(_1689.z)), _702, level(_488));
                float3 _1699 = float3(_698, _704, float(int(_480)));
                float3 _1701 = select(_1699, float3(0.0), isnan(_1699));
                float _710 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1701.xy, uint(rint(_1701.z)), _702, level(_488));
                float3 _1711 = float3(_696, _706, float(int(_480)));
                float3 _1713 = select(_1711, float3(0.0), isnan(_1711));
                float _712 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1713.xy, uint(rint(_1713.z)), _702, level(_488));
                float3 _1723 = float3(_698, _706, float(int(_480)));
                float3 _1725 = select(_1723, float3(0.0), isnan(_1723));
                float _714 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1725.xy, uint(rint(_1725.z)), _702, level(_488));
                int _716 = _496 + 1;
                float _718 = _494 + 1.0;
                bool _720 = _716 >= _295;
                float _722 = _708 + _710;
                float _724 = _722 + _712;
                float _726 = _724 + _714;
                float _728 = _726 * 0.25;
                float _730 = fma(_728, (*spvDescriptorSet0.fp_c3)._m0[25].x, (*spvDescriptorSet0.fp_c3)._m0[25].y);
                _732 = fma(_730, (*spvDescriptorSet0.fp_c3)._m0[8].x, _498);
                _492 = !_720;
                _265 = _718;
                _490 = _716;
                _267 = _732;
                _271 = _718;
                _273 = as_type<int>(_728);
                _275 = as_type<int>(_730);
                _277 = as_type<int>(_700);
                _279 = as_type<int>(_674);
                _281 = int(_480);
                _283 = as_type<int>(_684);
                _285 = as_type<int>(_616);
            } while (_492);
            _303 = as_type<int>(_732);
        }
        int _734 = _269;
        float _736 = _271;
        int _738 = _273;
        int _740 = _275;
        int _742 = _277;
        int _744 = _279;
        int _746 = _281;
        int _748 = _283;
        int _750 = _285;
        _752 = _303;
        int _754 = _229 + 1;
        bool _756 = _754 >= 3;
        _227 = !_756;
        _201 = _754;
        _205 = _752;
        _207 = _734;
        _209 = _736;
        _211 = _738;
        _213 = _740;
        _215 = _742;
        _217 = _744;
        _219 = _746;
        _221 = _748;
        _223 = _750;
    } while (_227);
    out.m_41.x = as_type<float>(_752);
    out.m_41.y = as_type<float>(_752);
    out.m_41.z = as_type<float>(_752);
    return out;
}


struct main0_out_u
{
    uint4 m_41 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _48 = gl_FragCoord.w;
    float _50 = in.m_34.x;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = in.m_34.y;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = 1.0 / _48;
    float _64 = _62 * _54;
    float _66 = _62 * _60;
    float2 _790 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_790, float2(0.0), isnan(_790))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_790, float2(0.0), isnan(_790))).x;
    float _70 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _72 = in.m_36.x;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = (*spvDescriptorSet0.fp_c3)._m0[7].z * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _80 = in.m_36.w;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = 1.0 / _78;
    float _88 = _86 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _90 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[9].x));
    float _92 = _88 * (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _94 = _88 * (*spvDescriptorSet0.fp_c3)._m0[24].x;
    float _96 = _62 * _76;
    float _98 = abs(_92);
    float _100 = log2(_98);
    float _102 = _62 * _84;
    float _104 = abs(_94);
    float _106 = log2(_104);
    float _108 = _106 * _70;
    float _110 = exp2(_108);
    float _112 = -_68;
    float _114 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[8].w, 1.0);
    float _116 = 1.0 / _114;
    float _118 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _120 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[8].y, _118);
    float _122 = _100 * _70;
    float _124 = in.m_36.y;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = _120 * _88;
    float _132 = exp2(_122);
    float _134 = abs(_130);
    float _136 = log2(_134);
    float _138 = _90 * _132;
    float _140 = ceil(_138);
    int _143 = int(_140);
    float _145 = _136 * _70;
    float _147 = _90 * _110;
    float _149 = exp2(_145);
    float _151 = _62 * _128;
    float _153 = ceil(_147);
    float _155 = in.m_36.z;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = _90 * _149;
    float _163 = precise::min(_90, _161);
    float _165 = trunc(_163);
    int _167 = int(_165);
    int _169 = min(_143, _167);
    float _171 = float(_169);
    int _173 = ~_169;
    int _175 = _167 + _173;
    int _177 = _175 + 1;
    float _179 = -_171;
    float _181 = _153 + _179;
    float _183 = trunc(_181);
    int _185 = int(_183);
    int _187 = min(_185, _177);
    float _189 = _62 * _159;
    int _191 = ~_169;
    int _193 = ~_187;
    int _195 = _167 + _191;
    int _197 = _195 + _193;
    int _199 = _197 + 2;
    int _201 = 0;
    int _203 = 0;
    int _205 = 0;
    int _207 = 0;
    float _209 = 0.0;
    int _211 = 0;
    int _213 = 0;
    int _215 = 0;
    int _217 = 0;
    int _219 = 0;
    int _221 = 0;
    int _223 = 0;
    bool _227;
    bool _492;
    float _732;
    int _752;
    do
    {
        int _229 = _201;
        int _231 = _203;
        int _233 = _205;
        int _235 = _207;
        float _237 = _209;
        int _239 = _211;
        int _241 = _213;
        int _243 = _215;
        int _245 = _217;
        int _247 = _219;
        int _249 = _221;
        int _251 = _223;
        int _253 = _229 << 2;
        bool _255 = _253 == 0;
        bool _257 = _253 == 4;
        bool _259 = _253 == 8;
        int _261 = _231;
        int _263 = _253;
        float _265 = _237;
        float _267 = as_type<float>(_233);
        int _269 = _235;
        float _271 = _237;
        int _273 = _239;
        int _275 = _241;
        int _277 = _243;
        int _279 = _245;
        int _281 = _247;
        int _283 = _249;
        int _285 = _251;
        if (_255)
        {
            _261 = _169;
        }
        int _287 = _261;
        int _289 = _287;
        if (_257)
        {
            _289 = _187;
        }
        int _291 = _289;
        int _293 = _291;
        if (_259)
        {
            _293 = _199;
        }
        int _295 = _293;
        bool _297 = _295 > 0;
        _203 = _295;
        if (!_297)
        {
            _263 = _233;
        }
        int _299 = _263;
        bool _301 = !_297;
        int _303 = _299;
        if (!_301)
        {
            float _305 = float(as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[26].x));
            float _307 = in.m_38.z;
            float _309 = gl_FragCoord.w;
            float _311 = _307 * _309;
            int _313 = abs(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[26].y));
            float _315 = float(uint(_229));
            float _317 = 1.0 / _305;
            float _319 = float(uint(_313));
            int _321 = abs(_229);
            float _323 = float(uint(_321));
            float _325 = 1.0 / _319;
            int _327 = _229 << 6;
            int _329 = as_type<int>(_317) + (-2);
            float _331 = as_type<float>(_329) * _315;
            int _333 = as_type<int>(_325) + (-2);
            float _335 = trunc(_331);
            float _337 = precise::max(_335, 0.0);
            uint _340 = uint(_337);
            float _342 = _62 * _311;
            float _344 = as_type<float>(_333) * _323;
            float _346 = trunc(_344);
            float _348 = precise::max(_346, 0.0);
            uint _350 = uint(_348);
            int _352 = ~int(_340);
            int _354 = _352 + 1;
            int _356 = _354 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[26].x);
            int _358 = _356 + _229;
            int _360 = ~int(_350);
            int _362 = _360 + 1;
            float _364 = float(uint(_358));
            int _366 = _362 * _313;
            int _368 = _366 + _321;
            float _370 = as_type<float>(_329) * _364;
            float _372 = float(uint(_368));
            float _374 = trunc(_370);
            float _376 = precise::max(_374, 0.0);
            uint _378 = uint(_376);
            float _380 = as_type<float>(_333) * _372;
            float _382 = trunc(_380);
            float _384 = precise::max(_382, 0.0);
            uint _386 = uint(_384);
            int _388 = int(_340) + int(_378);
            float _390 = in.m_38.x;
            float _392 = gl_FragCoord.w;
            float _394 = _390 * _392;
            int _396 = ~_388;
            int _398 = _396 + 1;
            int _400 = int(_350) + int(_386);
            int _402 = _398 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[26].x);
            int _404 = _402 + _229;
            int _406 = ~_400;
            int _408 = _406 + 1;
            bool _410 = uint(_404) >= as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[26].x);
            float _412 = in.m_38.y;
            float _414 = gl_FragCoord.w;
            float _416 = _412 * _414;
            int _418 = _408 * _313;
            int _420 = _418 + _321;
            bool _422 = !_410;
            int _424 = _422 ? 0 : (-1);
            bool _426 = uint(_420) >= uint(_313);
            int _428 = ~_388;
            int _430 = _428 + _424;
            int _432 = _430 + 1;
            int _434 = _229 ^ as_type<int>((*spvDescriptorSet0.fp_c3)._m0[26].y);
            bool _436 = !_426;
            int _438 = _436 ? 0 : (-1);
            uint _440 = uint(int(uint(_434) >> uint(31)));
            int _442 = _432 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[26].x);
            int _444 = _442 + _229;
            bool _446 = 0 == as_type<int>((*spvDescriptorSet0.fp_c3)._m0[26].x);
            int _448 = -_438;
            int _450 = _400 + _448;
            int _452 = ~int(_440);
            int _454 = _452 + 1;
            float _456 = _62 * _394;
            bool _458 = !_446;
            int _460 = _458 ? _444 : (-1);
            int _462 = _450 ^ _454;
            float _464 = float(_460);
            int _466 = ~_454;
            int _468 = _466 + _462;
            int _470 = _468 + 1;
            bool _472 = 0 == as_type<int>((*spvDescriptorSet0.fp_c3)._m0[26].y);
            float _474 = rint(_464);
            float _476 = precise::max(_474, 0.0);
            uint _478 = uint(_476);
            uint _480 = clamp(_478, 0u, 65535u);
            bool _482 = !_472;
            int _484 = _482 ? _470 : (-1);
            float _486 = _62 * _416;
            float _488 = float(_484);
            int _490 = 0;
            _269 = as_type<int>(_342);
            do
            {
                float _494 = _265;
                int _496 = _490;
                float _498 = _267;
                float _500 = _494 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
                int _502 = _327 + 160;
                uint _504 = uint(int(uint(_502) >> uint(2)));
                uint _506 = uint(int(uint(int(_504)) >> uint(2)));
                int _508 = int(_504) & 3;
                float _510 = (*spvDescriptorSet0.fp_c3)._m0[int(_506)][_508];
                int _512 = int(_504) + 1;
                uint _514 = uint(int(uint(_512) >> uint(2)));
                int _516 = _512 & 3;
                float _518 = (*spvDescriptorSet0.fp_c3)._m0[int(_514)][_516];
                float _520 = abs(_500);
                float _522 = log2(_520);
                int _524 = _327 + 208;
                uint _526 = uint(int(uint(_524) >> uint(2)));
                uint _528 = uint(int(uint(int(_526)) >> uint(2)));
                int _530 = int(_526) & 3;
                float _532 = (*spvDescriptorSet0.fp_c3)._m0[int(_528)][_530];
                int _534 = int(_526) + 1;
                uint _536 = uint(int(uint(_534) >> uint(2)));
                int _538 = _534 & 3;
                float _540 = (*spvDescriptorSet0.fp_c3)._m0[int(_536)][_538];
                int _542 = _327 + 176;
                uint _544 = uint(int(uint(_542) >> uint(2)));
                uint _546 = uint(int(uint(int(_544)) >> uint(2)));
                int _548 = int(_544) & 3;
                float _550 = (*spvDescriptorSet0.fp_c3)._m0[int(_546)][_548];
                int _552 = int(_544) + 1;
                uint _554 = uint(int(uint(_552) >> uint(2)));
                int _556 = _552 & 3;
                float _558 = (*spvDescriptorSet0.fp_c3)._m0[int(_554)][_556];
                float _560 = _522 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
                int _562 = _327 + 192;
                uint _564 = uint(int(uint(_562) >> uint(2)));
                uint _566 = uint(int(uint(int(_564)) >> uint(2)));
                int _568 = int(_564) & 3;
                float _570 = (*spvDescriptorSet0.fp_c3)._m0[int(_566)][_568];
                int _572 = int(_564) + 1;
                uint _574 = uint(int(uint(_572) >> uint(2)));
                int _576 = _572 & 3;
                float _578 = (*spvDescriptorSet0.fp_c3)._m0[int(_574)][_576];
                float _580 = exp2(_560);
                int _582 = _327 + 216;
                uint _584 = uint(int(uint(_582) >> uint(2)));
                uint _586 = uint(int(uint(int(_584)) >> uint(2)));
                int _588 = int(_584) & 3;
                float _590 = (*spvDescriptorSet0.fp_c3)._m0[int(_586)][_588];
                int _592 = int(_584) + 1;
                uint _594 = uint(int(uint(_592) >> uint(2)));
                int _596 = _592 & 3;
                float _598 = (*spvDescriptorSet0.fp_c3)._m0[int(_594)][_596];
                int _600 = _327 + 200;
                uint _602 = uint(int(uint(_600) >> uint(2)));
                uint _604 = uint(int(uint(int(_602)) >> uint(2)));
                int _606 = int(_602) & 3;
                float _608 = (*spvDescriptorSet0.fp_c3)._m0[int(_604)][_606];
                int _610 = int(_602) + 1;
                uint _612 = uint(int(uint(_610) >> uint(2)));
                int _614 = _610 & 3;
                float _616 = (*spvDescriptorSet0.fp_c3)._m0[int(_612)][_614];
                float _618 = fma(_580, _486, _151);
                float _620 = fma(_580, _456, _96);
                float _622 = _618 * _518;
                float _624 = _618 * _540;
                float _626 = _618 * _558;
                float _628 = _618 * _578;
                float _630 = fma(_620, _510, _622);
                float _632 = fma(_620, _532, _624);
                int _634 = _327 + 168;
                uint _636 = uint(int(uint(_634) >> uint(2)));
                uint _638 = uint(int(uint(int(_636)) >> uint(2)));
                int _640 = int(_636) & 3;
                float _642 = (*spvDescriptorSet0.fp_c3)._m0[int(_638)][_640];
                int _644 = int(_636) + 1;
                uint _646 = uint(int(uint(_644) >> uint(2)));
                int _648 = _644 & 3;
                float _650 = (*spvDescriptorSet0.fp_c3)._m0[int(_646)][_648];
                float _652 = fma(_580, _342, _189);
                float _654 = fma(_620, _570, _628);
                float _656 = fma(_652, _590, _632);
                int _658 = _327 + 184;
                uint _660 = uint(int(uint(_658) >> uint(2)));
                uint _662 = uint(int(uint(int(_660)) >> uint(2)));
                int _664 = int(_660) & 3;
                float _666 = (*spvDescriptorSet0.fp_c3)._m0[int(_662)][_664];
                int _668 = int(_660) + 1;
                uint _670 = uint(int(uint(_668) >> uint(2)));
                int _672 = _668 & 3;
                float _674 = (*spvDescriptorSet0.fp_c3)._m0[int(_670)][_672];
                float _676 = fma(_102, _598, _656);
                float _678 = fma(_620, _550, _626);
                float _680 = fma(_652, _608, _654);
                float _682 = 1.0 / _676;
                float _684 = fma(_102, _616, _680);
                float _686 = fma(_652, _642, _630);
                float _688 = fma(_102, _650, _686);
                float _690 = fma(_652, _666, _678);
                float _692 = _688 * _682;
                float _694 = fma(_102, _674, _690);
                float _696 = fma(-0.5, (*spvDescriptorSet0.fp_c3)._m0[25].z, _692);
                float _698 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[25].z, _692);
                float _700 = _694 * _682;
                float _702 = _684 * _682;
                float _704 = fma(-0.5, (*spvDescriptorSet0.fp_c3)._m0[25].w, _700);
                float _706 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[25].w, _700);
                float3 _1685 = float3(_696, _704, float(int(_480)));
                float3 _1689 = select(_1685, float3(0.0), isnan(_1685));
                float _708 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1689.xy, uint(rint(_1689.z)), _702, level(_488));
                float3 _1699 = float3(_698, _704, float(int(_480)));
                float3 _1701 = select(_1699, float3(0.0), isnan(_1699));
                float _710 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1701.xy, uint(rint(_1701.z)), _702, level(_488));
                float3 _1711 = float3(_696, _706, float(int(_480)));
                float3 _1713 = select(_1711, float3(0.0), isnan(_1711));
                float _712 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1713.xy, uint(rint(_1713.z)), _702, level(_488));
                float3 _1723 = float3(_698, _706, float(int(_480)));
                float3 _1725 = select(_1723, float3(0.0), isnan(_1723));
                float _714 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1725.xy, uint(rint(_1725.z)), _702, level(_488));
                int _716 = _496 + 1;
                float _718 = _494 + 1.0;
                bool _720 = _716 >= _295;
                float _722 = _708 + _710;
                float _724 = _722 + _712;
                float _726 = _724 + _714;
                float _728 = _726 * 0.25;
                float _730 = fma(_728, (*spvDescriptorSet0.fp_c3)._m0[25].x, (*spvDescriptorSet0.fp_c3)._m0[25].y);
                _732 = fma(_730, (*spvDescriptorSet0.fp_c3)._m0[8].x, _498);
                _492 = !_720;
                _265 = _718;
                _490 = _716;
                _267 = _732;
                _271 = _718;
                _273 = as_type<int>(_728);
                _275 = as_type<int>(_730);
                _277 = as_type<int>(_700);
                _279 = as_type<int>(_674);
                _281 = int(_480);
                _283 = as_type<int>(_684);
                _285 = as_type<int>(_616);
            } while (_492);
            _303 = as_type<int>(_732);
        }
        int _734 = _269;
        float _736 = _271;
        int _738 = _273;
        int _740 = _275;
        int _742 = _277;
        int _744 = _279;
        int _746 = _281;
        int _748 = _283;
        int _750 = _285;
        _752 = _303;
        int _754 = _229 + 1;
        bool _756 = _754 >= 3;
        _227 = !_756;
        _201 = _754;
        _205 = _752;
        _207 = _734;
        _209 = _736;
        _211 = _738;
        _213 = _740;
        _215 = _742;
        _217 = _744;
        _219 = _746;
        _221 = _748;
        _223 = _750;
    } while (_227);
    out.m_41.x = as_type<float>(_752);
    out.m_41.y = as_type<float>(_752);
    out.m_41.z = as_type<float>(_752);
    return main0_out_u{as_type<uint4>(out.m_41)};
}

