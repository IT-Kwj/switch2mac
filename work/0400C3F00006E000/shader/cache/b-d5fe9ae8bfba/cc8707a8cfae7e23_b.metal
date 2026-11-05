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
    float2 _762 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_762, float2(0.0), isnan(_762))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_762, float2(0.0), isnan(_762))).x;
    float _70 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _72 = in.m_36.x;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_36.y;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = (*spvDescriptorSet0.fp_c3)._m0[7].z * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _86 = in.m_36.w;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = 1.0 / _84;
    float _94 = _92 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _96 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[9].x));
    float _98 = _94 * (*spvDescriptorSet0.fp_c3)._m0[19].x;
    float _100 = _62 * _76;
    float _102 = _62 * _82;
    float _104 = abs(_98);
    float _106 = log2(_104);
    float _108 = -_68;
    float _110 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[8].w, 1.0);
    float _112 = 1.0 / _110;
    float _114 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _116 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[8].y, _114);
    float _118 = _106 * _70;
    float _120 = in.m_36.z;
    float _122 = gl_FragCoord.w;
    float _124 = _120 * _122;
    float _126 = _116 * _94;
    float _128 = exp2(_118);
    float _130 = abs(_126);
    float _132 = log2(_130);
    float _134 = _62 * _90;
    float _136 = _96 * _128;
    float _138 = ceil(_136);
    int _141 = int(_138);
    float _143 = _132 * _70;
    float _145 = exp2(_143);
    float _147 = _62 * _124;
    float _149 = _96 * _145;
    float _151 = precise::min(_96, _149);
    float _153 = trunc(_151);
    int _155 = int(_153);
    int _157 = min(_141, _155);
    int _159 = ~_157;
    int _161 = _155 + _159;
    int _163 = _161 + 1;
    int _165 = 0;
    int _167 = as_type<int>(_90);
    int _169 = 0;
    int _171 = 0;
    float _173 = 0.0;
    int _175 = 0;
    int _177 = 0;
    int _179 = 0;
    int _181 = 0;
    int _183 = 0;
    int _185 = 0;
    int _187 = 0;
    int _189 = 0;
    int _191 = 0;
    bool _195;
    bool _460;
    float _700;
    int _724;
    do
    {
        int _197 = _165;
        int _199 = _167;
        int _201 = _169;
        int _203 = _171;
        float _205 = _173;
        int _207 = _175;
        int _209 = _177;
        int _211 = _179;
        int _213 = _181;
        int _215 = _183;
        int _217 = _185;
        int _219 = _187;
        int _221 = _189;
        int _223 = _191;
        int _225 = _197 << 2;
        bool _227 = _225 == 0;
        bool _229 = _225 == 4;
        int _231 = _199;
        int _233 = _225;
        float _235 = _205;
        float _237 = as_type<float>(_201);
        int _239 = _203;
        float _241 = _205;
        int _243 = _207;
        int _245 = _209;
        int _247 = _211;
        int _249 = _213;
        int _251 = _215;
        int _253 = _217;
        int _255 = _219;
        int _257 = _221;
        int _259 = _223;
        if (_227)
        {
            _231 = _157;
        }
        int _261 = _231;
        int _263 = _261;
        if (_229)
        {
            _263 = _163;
        }
        int _265 = _263;
        bool _267 = _265 > 0;
        _167 = _265;
        if (!_267)
        {
            _233 = _201;
        }
        int _269 = _233;
        bool _271 = !_267;
        int _273 = _269;
        if (!_271)
        {
            float _275 = float(as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[21].x));
            float _277 = in.m_38.x;
            float _279 = gl_FragCoord.w;
            float _281 = _277 * _279;
            int _283 = abs(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[21].y));
            float _285 = float(uint(_197));
            float _287 = float(uint(_283));
            float _289 = 1.0 / _275;
            int _291 = abs(_197);
            float _293 = float(uint(_291));
            float _295 = 1.0 / _287;
            int _297 = as_type<int>(_289) + (-2);
            float _299 = as_type<float>(_297) * _285;
            int _301 = as_type<int>(_295) + (-2);
            float _303 = _62 * _281;
            float _305 = trunc(_299);
            float _307 = precise::max(_305, 0.0);
            uint _310 = uint(_307);
            float _312 = as_type<float>(_301) * _293;
            float _314 = trunc(_312);
            float _316 = precise::max(_314, 0.0);
            uint _318 = uint(_316);
            int _320 = -int(_310);
            int _322 = _320 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[21].x);
            int _324 = _322 + _197;
            int _326 = ~int(_318);
            int _328 = _326 + 1;
            float _330 = float(uint(_324));
            int _332 = _328 * _283;
            int _334 = _332 + _291;
            float _336 = as_type<float>(_297) * _330;
            float _338 = float(uint(_334));
            float _340 = trunc(_336);
            float _342 = precise::max(_340, 0.0);
            uint _344 = uint(_342);
            float _346 = as_type<float>(_301) * _338;
            float _348 = trunc(_346);
            float _350 = precise::max(_348, 0.0);
            uint _352 = uint(_350);
            int _354 = int(_310) + int(_344);
            float _356 = in.m_38.z;
            float _358 = gl_FragCoord.w;
            float _360 = _356 * _358;
            int _362 = ~_354;
            int _364 = _362 + 1;
            int _366 = int(_318) + int(_352);
            int _368 = _364 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[21].x);
            int _370 = _368 + _197;
            int _372 = _197 << 6;
            int _374 = ~_366;
            int _376 = _374 + 1;
            bool _378 = uint(_370) >= as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[21].x);
            int _380 = _376 * _283;
            int _382 = _380 + _291;
            bool _384 = !_378;
            int _386 = _384 ? 0 : (-1);
            float _388 = in.m_38.y;
            float _390 = gl_FragCoord.w;
            float _392 = _388 * _390;
            bool _394 = uint(_382) >= uint(_283);
            int _396 = ~_354;
            int _398 = _396 + _386;
            int _400 = _398 + 1;
            int _402 = _197 ^ as_type<int>((*spvDescriptorSet0.fp_c3)._m0[21].y);
            bool _404 = !_394;
            int _406 = _404 ? 0 : (-1);
            uint _408 = uint(int(uint(_402) >> uint(31)));
            int _410 = _400 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[21].x);
            int _412 = _410 + _197;
            bool _414 = 0 == as_type<int>((*spvDescriptorSet0.fp_c3)._m0[21].x);
            float _416 = _62 * _360;
            int _418 = ~_406;
            int _420 = _366 + _418;
            int _422 = _420 + 1;
            int _424 = -int(_408);
            bool _426 = !_414;
            int _428 = _426 ? _412 : (-1);
            bool _430 = 0 == as_type<int>((*spvDescriptorSet0.fp_c3)._m0[21].y);
            float _432 = float(_428);
            int _434 = _422 ^ _424;
            float _436 = rint(_432);
            float _438 = precise::max(_436, 0.0);
            uint _440 = uint(_438);
            uint _442 = clamp(_440, 0u, 65535u);
            int _444 = ~_424;
            int _446 = _444 + _434;
            int _448 = _446 + 1;
            bool _450 = !_430;
            int _452 = _450 ? _448 : (-1);
            float _454 = _62 * _392;
            float _456 = float(_452);
            int _458 = 0;
            _239 = as_type<int>(_303);
            do
            {
                float _462 = _235;
                int _464 = _458;
                float _466 = _237;
                float _468 = _462 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
                int _470 = _372 + 208;
                uint _472 = uint(int(uint(_470) >> uint(2)));
                uint _474 = uint(int(uint(int(_472)) >> uint(2)));
                int _476 = int(_472) & 3;
                float _478 = (*spvDescriptorSet0.fp_c3)._m0[int(_474)][_476];
                int _480 = int(_472) + 1;
                uint _482 = uint(int(uint(_480) >> uint(2)));
                int _484 = _480 & 3;
                float _486 = (*spvDescriptorSet0.fp_c3)._m0[int(_482)][_484];
                float _488 = abs(_468);
                float _490 = log2(_488);
                int _492 = _372 + 160;
                uint _494 = uint(int(uint(_492) >> uint(2)));
                uint _496 = uint(int(uint(int(_494)) >> uint(2)));
                int _498 = int(_494) & 3;
                float _500 = (*spvDescriptorSet0.fp_c3)._m0[int(_496)][_498];
                int _502 = int(_494) + 1;
                uint _504 = uint(int(uint(_502) >> uint(2)));
                int _506 = _502 & 3;
                float _508 = (*spvDescriptorSet0.fp_c3)._m0[int(_504)][_506];
                int _510 = _372 + 216;
                uint _512 = uint(int(uint(_510) >> uint(2)));
                uint _514 = uint(int(uint(int(_512)) >> uint(2)));
                int _516 = int(_512) & 3;
                float _518 = (*spvDescriptorSet0.fp_c3)._m0[int(_514)][_516];
                int _520 = int(_512) + 1;
                uint _522 = uint(int(uint(_520) >> uint(2)));
                int _524 = _520 & 3;
                float _526 = (*spvDescriptorSet0.fp_c3)._m0[int(_522)][_524];
                float _528 = _490 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
                int _530 = _372 + 176;
                uint _532 = uint(int(uint(_530) >> uint(2)));
                uint _534 = uint(int(uint(int(_532)) >> uint(2)));
                int _536 = int(_532) & 3;
                float _538 = (*spvDescriptorSet0.fp_c3)._m0[int(_534)][_536];
                int _540 = int(_532) + 1;
                uint _542 = uint(int(uint(_540) >> uint(2)));
                int _544 = _540 & 3;
                float _546 = (*spvDescriptorSet0.fp_c3)._m0[int(_542)][_544];
                float _548 = exp2(_528);
                int _550 = _372 + 192;
                uint _552 = uint(int(uint(_550) >> uint(2)));
                uint _554 = uint(int(uint(int(_552)) >> uint(2)));
                int _556 = int(_552) & 3;
                float _558 = (*spvDescriptorSet0.fp_c3)._m0[int(_554)][_556];
                int _560 = int(_552) + 1;
                uint _562 = uint(int(uint(_560) >> uint(2)));
                int _564 = _560 & 3;
                float _566 = (*spvDescriptorSet0.fp_c3)._m0[int(_562)][_564];
                int _568 = _372 + 184;
                uint _570 = uint(int(uint(_568) >> uint(2)));
                uint _572 = uint(int(uint(int(_570)) >> uint(2)));
                int _574 = int(_570) & 3;
                float _576 = (*spvDescriptorSet0.fp_c3)._m0[int(_572)][_574];
                int _578 = int(_570) + 1;
                uint _580 = uint(int(uint(_578) >> uint(2)));
                int _582 = _578 & 3;
                float _584 = (*spvDescriptorSet0.fp_c3)._m0[int(_580)][_582];
                float _586 = fma(_548, _454, _102);
                float _588 = fma(_548, _303, _100);
                float _590 = _586 * _486;
                float _592 = _586 * _508;
                float _594 = fma(_548, _416, _147);
                int _596 = _372 + 200;
                uint _598 = uint(int(uint(_596) >> uint(2)));
                uint _600 = uint(int(uint(int(_598)) >> uint(2)));
                int _602 = int(_598) & 3;
                float _604 = (*spvDescriptorSet0.fp_c3)._m0[int(_600)][_602];
                int _606 = int(_598) + 1;
                uint _608 = uint(int(uint(_606) >> uint(2)));
                int _610 = _606 & 3;
                float _612 = (*spvDescriptorSet0.fp_c3)._m0[int(_608)][_610];
                float _614 = fma(_588, _478, _590);
                float _616 = _586 * _546;
                float _618 = fma(_588, _500, _592);
                float _620 = fma(_594, _518, _614);
                float _622 = _586 * _566;
                float _624 = fma(_588, _538, _616);
                int _626 = _372 + 168;
                uint _628 = uint(int(uint(_626) >> uint(2)));
                uint _630 = uint(int(uint(int(_628)) >> uint(2)));
                int _632 = int(_628) & 3;
                float _634 = (*spvDescriptorSet0.fp_c3)._m0[int(_630)][_632];
                int _636 = int(_628) + 1;
                uint _638 = uint(int(uint(_636) >> uint(2)));
                int _640 = _636 & 3;
                float _642 = (*spvDescriptorSet0.fp_c3)._m0[int(_638)][_640];
                float _644 = fma(_134, _526, _620);
                float _646 = fma(_588, _558, _622);
                float _648 = fma(_594, _576, _624);
                float _650 = 1.0 / _644;
                float _652 = fma(_134, _584, _648);
                float _654 = fma(_594, _604, _646);
                float _656 = fma(_134, _612, _654);
                float _658 = _652 * _650;
                float _660 = fma(_594, _634, _618);
                float _662 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[20].w, _658);
                float _664 = fma(_134, _642, _660);
                float _666 = _664 * _650;
                float _668 = _656 * _650;
                float _670 = fma(-0.5, (*spvDescriptorSet0.fp_c3)._m0[20].z, _666);
                float _672 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[20].z, _666);
                float _674 = fma(-0.5, (*spvDescriptorSet0.fp_c3)._m0[20].w, _658);
                float3 _1608 = float3(_670, _674, float(int(_442)));
                float3 _1612 = select(_1608, float3(0.0), isnan(_1608));
                float _676 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1612.xy, uint(rint(_1612.z)), _668, level(_456));
                float3 _1622 = float3(_672, _674, float(int(_442)));
                float3 _1624 = select(_1622, float3(0.0), isnan(_1622));
                float _678 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1624.xy, uint(rint(_1624.z)), _668, level(_456));
                float3 _1634 = float3(_670, _662, float(int(_442)));
                float3 _1636 = select(_1634, float3(0.0), isnan(_1634));
                float _680 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1636.xy, uint(rint(_1636.z)), _668, level(_456));
                float3 _1646 = float3(_672, _662, float(int(_442)));
                float3 _1648 = select(_1646, float3(0.0), isnan(_1646));
                float _682 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1648.xy, uint(rint(_1648.z)), _668, level(_456));
                int _684 = _464 + 1;
                float _686 = _462 + 1.0;
                bool _688 = _684 >= _265;
                float _690 = _676 + _678;
                float _692 = _690 + _680;
                float _694 = _692 + _682;
                float _696 = _694 * 0.25;
                float _698 = fma(_696, (*spvDescriptorSet0.fp_c3)._m0[20].x, (*spvDescriptorSet0.fp_c3)._m0[20].y);
                _700 = fma(_698, (*spvDescriptorSet0.fp_c3)._m0[8].x, _466);
                _460 = !_688;
                _235 = _686;
                _458 = _684;
                _237 = _700;
                _241 = _686;
                _243 = as_type<int>(_634);
                _245 = as_type<int>(_642);
                _247 = as_type<int>(_698);
                _249 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[20].x);
                _251 = int(_442);
                _253 = as_type<int>(_658);
                _255 = as_type<int>(_584);
                _257 = as_type<int>(_656);
                _259 = as_type<int>(_612);
            } while (_460);
            _273 = as_type<int>(_700);
        }
        int _702 = _239;
        float _704 = _241;
        int _706 = _243;
        int _708 = _245;
        int _710 = _247;
        int _712 = _249;
        int _714 = _251;
        int _716 = _253;
        int _718 = _255;
        int _720 = _257;
        int _722 = _259;
        _724 = _273;
        int _726 = _197 + 1;
        bool _728 = _726 >= 2;
        _195 = !_728;
        _165 = _726;
        _169 = _724;
        _171 = _702;
        _173 = _704;
        _175 = _706;
        _177 = _708;
        _179 = _710;
        _181 = _712;
        _183 = _714;
        _185 = _716;
        _187 = _718;
        _189 = _720;
        _191 = _722;
    } while (_195);
    out.m_41.x = as_type<float>(_724);
    out.m_41.y = as_type<float>(_724);
    out.m_41.z = as_type<float>(_724);
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
    float2 _762 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_762, float2(0.0), isnan(_762))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_762, float2(0.0), isnan(_762))).x;
    float _70 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _72 = in.m_36.x;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_36.y;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = (*spvDescriptorSet0.fp_c3)._m0[7].z * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _86 = in.m_36.w;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = 1.0 / _84;
    float _94 = _92 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _96 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[9].x));
    float _98 = _94 * (*spvDescriptorSet0.fp_c3)._m0[19].x;
    float _100 = _62 * _76;
    float _102 = _62 * _82;
    float _104 = abs(_98);
    float _106 = log2(_104);
    float _108 = -_68;
    float _110 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[8].w, 1.0);
    float _112 = 1.0 / _110;
    float _114 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _116 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[8].y, _114);
    float _118 = _106 * _70;
    float _120 = in.m_36.z;
    float _122 = gl_FragCoord.w;
    float _124 = _120 * _122;
    float _126 = _116 * _94;
    float _128 = exp2(_118);
    float _130 = abs(_126);
    float _132 = log2(_130);
    float _134 = _62 * _90;
    float _136 = _96 * _128;
    float _138 = ceil(_136);
    int _141 = int(_138);
    float _143 = _132 * _70;
    float _145 = exp2(_143);
    float _147 = _62 * _124;
    float _149 = _96 * _145;
    float _151 = precise::min(_96, _149);
    float _153 = trunc(_151);
    int _155 = int(_153);
    int _157 = min(_141, _155);
    int _159 = ~_157;
    int _161 = _155 + _159;
    int _163 = _161 + 1;
    int _165 = 0;
    int _167 = as_type<int>(_90);
    int _169 = 0;
    int _171 = 0;
    float _173 = 0.0;
    int _175 = 0;
    int _177 = 0;
    int _179 = 0;
    int _181 = 0;
    int _183 = 0;
    int _185 = 0;
    int _187 = 0;
    int _189 = 0;
    int _191 = 0;
    bool _195;
    bool _460;
    float _700;
    int _724;
    do
    {
        int _197 = _165;
        int _199 = _167;
        int _201 = _169;
        int _203 = _171;
        float _205 = _173;
        int _207 = _175;
        int _209 = _177;
        int _211 = _179;
        int _213 = _181;
        int _215 = _183;
        int _217 = _185;
        int _219 = _187;
        int _221 = _189;
        int _223 = _191;
        int _225 = _197 << 2;
        bool _227 = _225 == 0;
        bool _229 = _225 == 4;
        int _231 = _199;
        int _233 = _225;
        float _235 = _205;
        float _237 = as_type<float>(_201);
        int _239 = _203;
        float _241 = _205;
        int _243 = _207;
        int _245 = _209;
        int _247 = _211;
        int _249 = _213;
        int _251 = _215;
        int _253 = _217;
        int _255 = _219;
        int _257 = _221;
        int _259 = _223;
        if (_227)
        {
            _231 = _157;
        }
        int _261 = _231;
        int _263 = _261;
        if (_229)
        {
            _263 = _163;
        }
        int _265 = _263;
        bool _267 = _265 > 0;
        _167 = _265;
        if (!_267)
        {
            _233 = _201;
        }
        int _269 = _233;
        bool _271 = !_267;
        int _273 = _269;
        if (!_271)
        {
            float _275 = float(as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[21].x));
            float _277 = in.m_38.x;
            float _279 = gl_FragCoord.w;
            float _281 = _277 * _279;
            int _283 = abs(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[21].y));
            float _285 = float(uint(_197));
            float _287 = float(uint(_283));
            float _289 = 1.0 / _275;
            int _291 = abs(_197);
            float _293 = float(uint(_291));
            float _295 = 1.0 / _287;
            int _297 = as_type<int>(_289) + (-2);
            float _299 = as_type<float>(_297) * _285;
            int _301 = as_type<int>(_295) + (-2);
            float _303 = _62 * _281;
            float _305 = trunc(_299);
            float _307 = precise::max(_305, 0.0);
            uint _310 = uint(_307);
            float _312 = as_type<float>(_301) * _293;
            float _314 = trunc(_312);
            float _316 = precise::max(_314, 0.0);
            uint _318 = uint(_316);
            int _320 = -int(_310);
            int _322 = _320 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[21].x);
            int _324 = _322 + _197;
            int _326 = ~int(_318);
            int _328 = _326 + 1;
            float _330 = float(uint(_324));
            int _332 = _328 * _283;
            int _334 = _332 + _291;
            float _336 = as_type<float>(_297) * _330;
            float _338 = float(uint(_334));
            float _340 = trunc(_336);
            float _342 = precise::max(_340, 0.0);
            uint _344 = uint(_342);
            float _346 = as_type<float>(_301) * _338;
            float _348 = trunc(_346);
            float _350 = precise::max(_348, 0.0);
            uint _352 = uint(_350);
            int _354 = int(_310) + int(_344);
            float _356 = in.m_38.z;
            float _358 = gl_FragCoord.w;
            float _360 = _356 * _358;
            int _362 = ~_354;
            int _364 = _362 + 1;
            int _366 = int(_318) + int(_352);
            int _368 = _364 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[21].x);
            int _370 = _368 + _197;
            int _372 = _197 << 6;
            int _374 = ~_366;
            int _376 = _374 + 1;
            bool _378 = uint(_370) >= as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[21].x);
            int _380 = _376 * _283;
            int _382 = _380 + _291;
            bool _384 = !_378;
            int _386 = _384 ? 0 : (-1);
            float _388 = in.m_38.y;
            float _390 = gl_FragCoord.w;
            float _392 = _388 * _390;
            bool _394 = uint(_382) >= uint(_283);
            int _396 = ~_354;
            int _398 = _396 + _386;
            int _400 = _398 + 1;
            int _402 = _197 ^ as_type<int>((*spvDescriptorSet0.fp_c3)._m0[21].y);
            bool _404 = !_394;
            int _406 = _404 ? 0 : (-1);
            uint _408 = uint(int(uint(_402) >> uint(31)));
            int _410 = _400 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[21].x);
            int _412 = _410 + _197;
            bool _414 = 0 == as_type<int>((*spvDescriptorSet0.fp_c3)._m0[21].x);
            float _416 = _62 * _360;
            int _418 = ~_406;
            int _420 = _366 + _418;
            int _422 = _420 + 1;
            int _424 = -int(_408);
            bool _426 = !_414;
            int _428 = _426 ? _412 : (-1);
            bool _430 = 0 == as_type<int>((*spvDescriptorSet0.fp_c3)._m0[21].y);
            float _432 = float(_428);
            int _434 = _422 ^ _424;
            float _436 = rint(_432);
            float _438 = precise::max(_436, 0.0);
            uint _440 = uint(_438);
            uint _442 = clamp(_440, 0u, 65535u);
            int _444 = ~_424;
            int _446 = _444 + _434;
            int _448 = _446 + 1;
            bool _450 = !_430;
            int _452 = _450 ? _448 : (-1);
            float _454 = _62 * _392;
            float _456 = float(_452);
            int _458 = 0;
            _239 = as_type<int>(_303);
            do
            {
                float _462 = _235;
                int _464 = _458;
                float _466 = _237;
                float _468 = _462 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
                int _470 = _372 + 208;
                uint _472 = uint(int(uint(_470) >> uint(2)));
                uint _474 = uint(int(uint(int(_472)) >> uint(2)));
                int _476 = int(_472) & 3;
                float _478 = (*spvDescriptorSet0.fp_c3)._m0[int(_474)][_476];
                int _480 = int(_472) + 1;
                uint _482 = uint(int(uint(_480) >> uint(2)));
                int _484 = _480 & 3;
                float _486 = (*spvDescriptorSet0.fp_c3)._m0[int(_482)][_484];
                float _488 = abs(_468);
                float _490 = log2(_488);
                int _492 = _372 + 160;
                uint _494 = uint(int(uint(_492) >> uint(2)));
                uint _496 = uint(int(uint(int(_494)) >> uint(2)));
                int _498 = int(_494) & 3;
                float _500 = (*spvDescriptorSet0.fp_c3)._m0[int(_496)][_498];
                int _502 = int(_494) + 1;
                uint _504 = uint(int(uint(_502) >> uint(2)));
                int _506 = _502 & 3;
                float _508 = (*spvDescriptorSet0.fp_c3)._m0[int(_504)][_506];
                int _510 = _372 + 216;
                uint _512 = uint(int(uint(_510) >> uint(2)));
                uint _514 = uint(int(uint(int(_512)) >> uint(2)));
                int _516 = int(_512) & 3;
                float _518 = (*spvDescriptorSet0.fp_c3)._m0[int(_514)][_516];
                int _520 = int(_512) + 1;
                uint _522 = uint(int(uint(_520) >> uint(2)));
                int _524 = _520 & 3;
                float _526 = (*spvDescriptorSet0.fp_c3)._m0[int(_522)][_524];
                float _528 = _490 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
                int _530 = _372 + 176;
                uint _532 = uint(int(uint(_530) >> uint(2)));
                uint _534 = uint(int(uint(int(_532)) >> uint(2)));
                int _536 = int(_532) & 3;
                float _538 = (*spvDescriptorSet0.fp_c3)._m0[int(_534)][_536];
                int _540 = int(_532) + 1;
                uint _542 = uint(int(uint(_540) >> uint(2)));
                int _544 = _540 & 3;
                float _546 = (*spvDescriptorSet0.fp_c3)._m0[int(_542)][_544];
                float _548 = exp2(_528);
                int _550 = _372 + 192;
                uint _552 = uint(int(uint(_550) >> uint(2)));
                uint _554 = uint(int(uint(int(_552)) >> uint(2)));
                int _556 = int(_552) & 3;
                float _558 = (*spvDescriptorSet0.fp_c3)._m0[int(_554)][_556];
                int _560 = int(_552) + 1;
                uint _562 = uint(int(uint(_560) >> uint(2)));
                int _564 = _560 & 3;
                float _566 = (*spvDescriptorSet0.fp_c3)._m0[int(_562)][_564];
                int _568 = _372 + 184;
                uint _570 = uint(int(uint(_568) >> uint(2)));
                uint _572 = uint(int(uint(int(_570)) >> uint(2)));
                int _574 = int(_570) & 3;
                float _576 = (*spvDescriptorSet0.fp_c3)._m0[int(_572)][_574];
                int _578 = int(_570) + 1;
                uint _580 = uint(int(uint(_578) >> uint(2)));
                int _582 = _578 & 3;
                float _584 = (*spvDescriptorSet0.fp_c3)._m0[int(_580)][_582];
                float _586 = fma(_548, _454, _102);
                float _588 = fma(_548, _303, _100);
                float _590 = _586 * _486;
                float _592 = _586 * _508;
                float _594 = fma(_548, _416, _147);
                int _596 = _372 + 200;
                uint _598 = uint(int(uint(_596) >> uint(2)));
                uint _600 = uint(int(uint(int(_598)) >> uint(2)));
                int _602 = int(_598) & 3;
                float _604 = (*spvDescriptorSet0.fp_c3)._m0[int(_600)][_602];
                int _606 = int(_598) + 1;
                uint _608 = uint(int(uint(_606) >> uint(2)));
                int _610 = _606 & 3;
                float _612 = (*spvDescriptorSet0.fp_c3)._m0[int(_608)][_610];
                float _614 = fma(_588, _478, _590);
                float _616 = _586 * _546;
                float _618 = fma(_588, _500, _592);
                float _620 = fma(_594, _518, _614);
                float _622 = _586 * _566;
                float _624 = fma(_588, _538, _616);
                int _626 = _372 + 168;
                uint _628 = uint(int(uint(_626) >> uint(2)));
                uint _630 = uint(int(uint(int(_628)) >> uint(2)));
                int _632 = int(_628) & 3;
                float _634 = (*spvDescriptorSet0.fp_c3)._m0[int(_630)][_632];
                int _636 = int(_628) + 1;
                uint _638 = uint(int(uint(_636) >> uint(2)));
                int _640 = _636 & 3;
                float _642 = (*spvDescriptorSet0.fp_c3)._m0[int(_638)][_640];
                float _644 = fma(_134, _526, _620);
                float _646 = fma(_588, _558, _622);
                float _648 = fma(_594, _576, _624);
                float _650 = 1.0 / _644;
                float _652 = fma(_134, _584, _648);
                float _654 = fma(_594, _604, _646);
                float _656 = fma(_134, _612, _654);
                float _658 = _652 * _650;
                float _660 = fma(_594, _634, _618);
                float _662 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[20].w, _658);
                float _664 = fma(_134, _642, _660);
                float _666 = _664 * _650;
                float _668 = _656 * _650;
                float _670 = fma(-0.5, (*spvDescriptorSet0.fp_c3)._m0[20].z, _666);
                float _672 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[20].z, _666);
                float _674 = fma(-0.5, (*spvDescriptorSet0.fp_c3)._m0[20].w, _658);
                float3 _1608 = float3(_670, _674, float(int(_442)));
                float3 _1612 = select(_1608, float3(0.0), isnan(_1608));
                float _676 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1612.xy, uint(rint(_1612.z)), _668, level(_456));
                float3 _1622 = float3(_672, _674, float(int(_442)));
                float3 _1624 = select(_1622, float3(0.0), isnan(_1622));
                float _678 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1624.xy, uint(rint(_1624.z)), _668, level(_456));
                float3 _1634 = float3(_670, _662, float(int(_442)));
                float3 _1636 = select(_1634, float3(0.0), isnan(_1634));
                float _680 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1636.xy, uint(rint(_1636.z)), _668, level(_456));
                float3 _1646 = float3(_672, _662, float(int(_442)));
                float3 _1648 = select(_1646, float3(0.0), isnan(_1646));
                float _682 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1648.xy, uint(rint(_1648.z)), _668, level(_456));
                int _684 = _464 + 1;
                float _686 = _462 + 1.0;
                bool _688 = _684 >= _265;
                float _690 = _676 + _678;
                float _692 = _690 + _680;
                float _694 = _692 + _682;
                float _696 = _694 * 0.25;
                float _698 = fma(_696, (*spvDescriptorSet0.fp_c3)._m0[20].x, (*spvDescriptorSet0.fp_c3)._m0[20].y);
                _700 = fma(_698, (*spvDescriptorSet0.fp_c3)._m0[8].x, _466);
                _460 = !_688;
                _235 = _686;
                _458 = _684;
                _237 = _700;
                _241 = _686;
                _243 = as_type<int>(_634);
                _245 = as_type<int>(_642);
                _247 = as_type<int>(_698);
                _249 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[20].x);
                _251 = int(_442);
                _253 = as_type<int>(_658);
                _255 = as_type<int>(_584);
                _257 = as_type<int>(_656);
                _259 = as_type<int>(_612);
            } while (_460);
            _273 = as_type<int>(_700);
        }
        int _702 = _239;
        float _704 = _241;
        int _706 = _243;
        int _708 = _245;
        int _710 = _247;
        int _712 = _249;
        int _714 = _251;
        int _716 = _253;
        int _718 = _255;
        int _720 = _257;
        int _722 = _259;
        _724 = _273;
        int _726 = _197 + 1;
        bool _728 = _726 >= 2;
        _195 = !_728;
        _165 = _726;
        _169 = _724;
        _171 = _702;
        _173 = _704;
        _175 = _706;
        _177 = _708;
        _179 = _710;
        _181 = _712;
        _183 = _714;
        _185 = _716;
        _187 = _718;
        _189 = _720;
        _191 = _722;
    } while (_195);
    out.m_41.x = as_type<float>(_724);
    out.m_41.y = as_type<float>(_724);
    out.m_41.z = as_type<float>(_724);
    return main0_out_u{as_type<uint4>(out.m_41)};
}

