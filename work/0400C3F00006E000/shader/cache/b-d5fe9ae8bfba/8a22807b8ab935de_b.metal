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
    constant _16* fp_c1 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d_array<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_E [[id(6)]];
    sampler fp_t_tcb_ESmplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_10 [[id(8)]];
    sampler fp_t_tcb_10Smplr [[id(9)]];
    texture2d<float> fp_t_tcb_A [[id(10)]];
    sampler fp_t_tcb_ASmplr [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_49 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0), center_no_perspective]];
    float4 m_46 [[user(locn1), center_no_perspective]];
    float4 m_44 [[user(locn2), center_no_perspective]];
    float4 m_40 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _272 = false;
    bool _270 = false;
    float _56 = in.m_40.x;
    float _58 = in.m_40.y;
    float2 _1041 = float2(_56, _58);
    float3 _62 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1041, float2(0.0), isnan(_1041)), int2(0), component::x).xyw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float2 _1058 = float2(_56, _58);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1058, float2(0.0), isnan(_1058))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1058, float2(0.0), isnan(_1058))).x;
    float _72 = in.m_42.y;
    float _74 = in.m_42.x;
    float _76 = in.m_44.y;
    float _78 = in.m_46.y;
    float _80 = in.m_44.x;
    float _82 = in.m_46.x;
    float _84 = -_64;
    float _86 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _88 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[46].z, _86);
    float _90 = -_66;
    float _92 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _94 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[46].z, _92);
    float _96 = -_68;
    float _98 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _100 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[46].z, _98);
    float _102 = _72 * _88;
    float _104 = _74 * _88;
    float _106 = -_102;
    float _108 = fma(_94, _76, _106);
    float _110 = -_102;
    float _112 = fma(_100, _78, _110);
    float _114 = -_104;
    float _116 = fma(_94, _80, _114);
    float _118 = -_104;
    float _120 = fma(_100, _82, _118);
    float _122 = _108 * _108;
    float _124 = _112 * _112;
    float _126 = -_88;
    float _128 = _126 + _94;
    float _130 = -_88;
    float _132 = _130 + _100;
    float _134 = fma(_116, _116, _122);
    float _136 = fma(_120, _120, _124);
    float _138 = fma(_128, _128, _134);
    float _140 = fma(_132, _132, _136);
    float _142 = rsqrt(_138);
    float _144 = rsqrt(_140);
    float _146 = _116 * _142;
    float _148 = _128 * _142;
    float _150 = _108 * _142;
    float _152 = _132 * _144;
    float _154 = _112 * _144;
    float _156 = _120 * _144;
    float _158 = _146 * _152;
    float _160 = _148 * _154;
    float _162 = -_158;
    float _164 = fma(_148, _156, _162);
    float _166 = -_160;
    float _168 = fma(_150, _152, _166);
    float _170 = _150 * _156;
    float _172 = _164 * _164;
    float _174 = -_70;
    float _176 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _178 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[46].z, _176);
    float _180 = -_170;
    float _182 = fma(_146, _154, _180);
    float _184 = fma(_168, _168, _172);
    float _186 = _178 * _74;
    float _188 = -_178;
    bool _192 = _188 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _194 = fma(_182, _182, _184);
    float _196 = -_178;
    bool _198 = _196 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _200 = _178 * _72;
    bool _202 = !_192;
    uint _205 = uint(_202 ? 0 : 1);
    float _207 = rsqrt(_194);
    uint _209 = 2u;
    if (!_192)
    {
        _209 = 1u;
    }
    uint _211 = _209;
    uint _213 = _211;
    if (!_198)
    {
        _213 = _205;
    }
    uint _215 = _213;
    uint _217 = min(_215, 2u);
    float _219 = _164 * _207;
    float _221 = _168 * _207;
    int _224 = int(_217) << 2;
    float _226 = _182 * _207;
    float _228 = _219 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _230 = uint(int(uint(_224) >> uint(2)));
    uint _232 = uint(int(uint(int(_230)) >> uint(2)));
    int _234 = int(_230) & 3;
    float _236 = (*spvDescriptorSet0.fp_c1)._m0[int(_232)][_234];
    float _238 = fma(_221, (*spvDescriptorSet0.fp_c3)._m0[35].x, _228);
    float _240 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[35].z, _238);
    float _242 = abs(_240);
    float _244 = -_242;
    float _246 = _244 + 1.0;
    float _248 = precise::clamp(_246, 0.0, 1.0);
    float _250 = abs(_248);
    float _252 = log2(_250);
    float _254 = _252 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _256 = exp2(_254);
    float _258 = _256 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _260 = fma(_221, _258, _186);
    float _262 = fma(_219, _258, _200);
    float _264 = fma(_226, _258, _178);
    bool _266 = as_type<int>(_236) == 1216;
    if (!_266)
    {
        bool _268 = as_type<int>(_236) == 1488;
        _270 = _268;
        if (!_270)
        {
            _272 = true;
        }
    }
    float _306;
    float _308;
    float _310;
    float _312;
    if (!_270)
    {
        if (!_272)
        {
            float _274 = _262 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _276 = _262 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _278 = _262 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _280 = _262 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _282 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[0].x, _274);
            float _284 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[1].x, _276);
            float _286 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[2].x, _278);
            float _288 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[3].x, _280);
            float _290 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[0].z, _282);
            float _292 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[1].z, _284);
            float _294 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[2].z, _286);
            float _296 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[3].z, _288);
            float _298 = _290 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _300 = _292 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _302 = _294 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _304 = _296 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _306 = _304;
            _308 = _302;
            _310 = _298;
            _312 = _300;
        }
    }
    if ((false || _272) || _270)
    {
        if ((!_272) || _270)
        {
            _270 = false;
            float _314 = _262 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _316 = _262 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _318 = _262 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _320 = _262 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _322 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[4].x, _314);
            float _324 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[5].x, _316);
            float _326 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[6].x, _318);
            float _328 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[7].x, _320);
            float _330 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[4].z, _322);
            float _332 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[5].z, _324);
            float _334 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[6].z, _326);
            float _336 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[7].z, _328);
            float _338 = _330 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _340 = _332 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _342 = _334 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _344 = _336 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _306 = _344;
            _308 = _342;
            _310 = _338;
            _312 = _340;
        }
        if (false || _272)
        {
            _272 = false;
            float _346 = _262 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _348 = _262 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _350 = _262 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _352 = _262 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _354 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[8].x, _346);
            float _356 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[9].x, _348);
            float _358 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[10].x, _350);
            float _360 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[11].x, _352);
            float _362 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[8].z, _354);
            float _364 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[9].z, _356);
            float _366 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[10].z, _358);
            float _368 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[11].z, _360);
            float _370 = _362 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _372 = _364 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _374 = _366 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _376 = _368 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _306 = _376;
            _308 = _374;
            _310 = _370;
            _312 = _372;
        }
    }
    float _378 = _306;
    float _380 = _308;
    float _382 = _310;
    float _384 = _312;
    float _386 = 1.0 / _378;
    float _388 = float(int(_215));
    float _390 = rint(_388);
    float _392 = precise::max(_390, 0.0);
    uint _394 = uint(_392);
    uint _396 = clamp(_394, 0u, 65535u);
    float _398 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _400 = _386 * _380;
    float _402 = precise::clamp(_400, 0.0, 1.0);
    float _404 = _386 * _382;
    float _406 = _386 * _384;
    float _408 = _402 * _398;
    float _410 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _412 = fma(_408, 0.5, _404);
    float _414 = _402 * _410;
    float _416 = fma(_408, 1.5, _404);
    float _418 = fma(_408, -0.5, _404);
    float _420 = fma(_408, -1.5, _404);
    float _422 = fma(_414, 1.5, _406);
    float _424 = fma(_414, 0.5, _406);
    float3 _1717 = float3(_412, _422, float(int(_396)));
    float3 _1721 = select(_1717, float3(0.0), isnan(_1717));
    float _426 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1721.xy, uint(rint(_1721.z)), _402);
    float3 _1730 = float3(_416, _422, float(int(_396)));
    float3 _1732 = select(_1730, float3(0.0), isnan(_1730));
    float _428 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1732.xy, uint(rint(_1732.z)), _402);
    float3 _1741 = float3(_418, _422, float(int(_396)));
    float3 _1743 = select(_1741, float3(0.0), isnan(_1741));
    float _430 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1743.xy, uint(rint(_1743.z)), _402);
    float3 _1752 = float3(_420, _422, float(int(_396)));
    float3 _1754 = select(_1752, float3(0.0), isnan(_1752));
    float _432 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1754.xy, uint(rint(_1754.z)), _402);
    float3 _1763 = float3(_416, _424, float(int(_396)));
    float3 _1765 = select(_1763, float3(0.0), isnan(_1763));
    float _434 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1765.xy, uint(rint(_1765.z)), _402);
    float3 _1774 = float3(_412, _424, float(int(_396)));
    float3 _1776 = select(_1774, float3(0.0), isnan(_1774));
    float _436 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1776.xy, uint(rint(_1776.z)), _402);
    float _438 = _428 + _426;
    float _440 = _438 + _430;
    float _442 = _440 + _432;
    float _444 = _442 + _434;
    float _446 = _444 + _436;
    float _448 = fma(_414, -0.5, _406);
    float3 _1803 = float3(_418, _424, float(int(_396)));
    float3 _1805 = select(_1803, float3(0.0), isnan(_1803));
    float _450 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1805.xy, uint(rint(_1805.z)), _402);
    float3 _1814 = float3(_420, _424, float(int(_396)));
    float3 _1816 = select(_1814, float3(0.0), isnan(_1814));
    float _452 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1816.xy, uint(rint(_1816.z)), _402);
    float3 _1825 = float3(_416, _448, float(int(_396)));
    float3 _1827 = select(_1825, float3(0.0), isnan(_1825));
    float _454 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1827.xy, uint(rint(_1827.z)), _402);
    float3 _1836 = float3(_412, _448, float(int(_396)));
    float3 _1838 = select(_1836, float3(0.0), isnan(_1836));
    float _456 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1838.xy, uint(rint(_1838.z)), _402);
    float3 _1847 = float3(_418, _448, float(int(_396)));
    float3 _1849 = select(_1847, float3(0.0), isnan(_1847));
    float _458 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1849.xy, uint(rint(_1849.z)), _402);
    float3 _1858 = float3(_420, _448, float(int(_396)));
    float3 _1860 = select(_1858, float3(0.0), isnan(_1858));
    float _460 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1860.xy, uint(rint(_1860.z)), _402);
    float _462 = fma(_414, -1.5, _406);
    float _464 = -_200;
    float _466 = _464 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _468 = -_186;
    float _470 = _468 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _472 = _466 * _466;
    float _474 = fma(_470, _470, _472);
    float _476 = -_178;
    float _478 = _476 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _480 = fma(_478, _478, _474);
    float _482 = sqrt(_480);
    bool _484 = _482 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _486 = _482 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _488 = !_484;
    int _490 = _488 ? 0 : 1;
    int _492 = 2;
    if (!_484)
    {
        _492 = 1;
    }
    int _494 = _492;
    int _496 = _494;
    if (!_486)
    {
        _496 = _490;
    }
    int _498 = _496;
    float _500 = _200 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _502 = float(_498);
    float _504 = _200 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _506 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[19].x, _500);
    float _508 = _200 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _510 = precise::min(_502, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _512 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[22].x, _504);
    float _514 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[19].z, _506);
    float _516 = _200 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    bool _518 = _510 != 1.0;
    bool _520 = isnan(_510);
    bool _522 = _518 || _520;
    bool _524 = isnan(1.0);
    bool _526 = _522 || _524;
    float _528 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[22].z, _512);
    float _530 = _514 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _532 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[23].x, _516);
    float _534 = _200 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _536 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[23].z, _532);
    float _538 = _530;
    if (_526)
    {
        float _540 = _528 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _538 = _540;
    }
    float _542 = _538;
    float _544 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[20].x, _508);
    float _546 = _200 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _548 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[20].z, _544);
    float _550 = _548 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _552 = _550;
    float _554 = _542;
    if (_526)
    {
        float _556 = _536 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _552 = _556;
    }
    float _558 = _552;
    float _560 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[24].x, _534);
    float _562 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[21].x, _546);
    float3 _2056 = float3(_416, _462, float(int(_396)));
    float3 _2058 = select(_2056, float3(0.0), isnan(_2056));
    float _564 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2058.xy, uint(rint(_2058.z)), _402);
    float _566 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[24].z, _560);
    float _568 = _200 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _570 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[21].z, _562);
    float _572 = _570 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _574 = _572;
    float _576 = _558;
    if (_526)
    {
        float _578 = _566 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _574 = _578;
    }
    float _580 = _574;
    bool _582 = _510 != 0.0;
    bool _584 = isnan(_510);
    bool _586 = _582 || _584;
    bool _588 = isnan(0.0);
    bool _590 = _586 || _588;
    float _592 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[16].x, _568);
    float _594 = _200 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _596 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[16].z, _592);
    float _598 = _580;
    if (!_590)
    {
        float _600 = _596 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _554 = _600;
    }
    float _602 = _554;
    float _604 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[17].x, _594);
    float _606 = _200 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _608 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[17].z, _604);
    if (!_590)
    {
        float _610 = _608 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _576 = _610;
    }
    float _612 = _576;
    float _614 = _446 + _450;
    float _616 = _614 + _452;
    float _618 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[18].x, _606);
    float _620 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _622 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _624 = _616 + _454;
    float _626 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[18].z, _618);
    float _628 = rint(_510);
    float _630 = precise::max(_628, 0.0);
    uint _632 = uint(_630);
    uint _634 = clamp(_632, 0u, 65535u);
    float _636 = _624 + _456;
    if (!_590)
    {
        float _638 = _626 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _598 = _638;
    }
    float _640 = _598;
    float _642 = _636 + _458;
    float _644 = 0.0 + _640;
    float _646 = precise::clamp(_644, 0.0, 1.0);
    float _648 = _646 * _622;
    float3 _2219 = float3(_412, _462, float(int(_396)));
    float3 _2221 = select(_2219, float3(0.0), isnan(_2219));
    float _650 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2221.xy, uint(rint(_2221.z)), _402);
    float3 _2230 = float3(_418, _462, float(int(_396)));
    float3 _2232 = select(_2230, float3(0.0), isnan(_2230));
    float _652 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2232.xy, uint(rint(_2232.z)), _402);
    float3 _2241 = float3(_420, _462, float(int(_396)));
    float3 _2243 = select(_2241, float3(0.0), isnan(_2241));
    float _654 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2243.xy, uint(rint(_2243.z)), _402);
    float _656 = _646 * _620;
    float _658 = fma(_648, 1.5, _612);
    float _660 = fma(_656, 0.5, _602);
    float _662 = fma(_656, -0.5, _602);
    float3 _2264 = float3(_660, _658, float(int(_634)));
    float3 _2266 = select(_2264, float3(0.0), isnan(_2264));
    float _664 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2266.xy, uint(rint(_2266.z)), _646);
    float3 _2275 = float3(_662, _658, float(int(_634)));
    float3 _2277 = select(_2275, float3(0.0), isnan(_2275));
    float _666 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2277.xy, uint(rint(_2277.z)), _646);
    float _668 = _642 + _460;
    float _670 = fma(_648, 0.5, _612);
    float _672 = fma(_656, -1.5, _602);
    float _674 = _668 + _564;
    float _676 = _674 + _650;
    float _678 = fma(_656, 1.5, _602);
    float _680 = _676 + _652;
    float3 _2307 = float3(_672, _658, float(int(_634)));
    float3 _2309 = select(_2307, float3(0.0), isnan(_2307));
    float _682 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2309.xy, uint(rint(_2309.z)), _646);
    float3 _2318 = float3(_678, _658, float(int(_634)));
    float3 _2320 = select(_2318, float3(0.0), isnan(_2318));
    float _684 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2320.xy, uint(rint(_2320.z)), _646);
    float3 _2329 = float3(_678, _670, float(int(_634)));
    float3 _2331 = select(_2329, float3(0.0), isnan(_2329));
    float _686 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2331.xy, uint(rint(_2331.z)), _646);
    float3 _2340 = float3(_660, _670, float(int(_634)));
    float3 _2342 = select(_2340, float3(0.0), isnan(_2340));
    float _688 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2342.xy, uint(rint(_2342.z)), _646);
    float3 _2351 = float3(_662, _670, float(int(_634)));
    float3 _2353 = select(_2351, float3(0.0), isnan(_2351));
    float _690 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2353.xy, uint(rint(_2353.z)), _646);
    float3 _2362 = float3(_672, _670, float(int(_634)));
    float3 _2364 = select(_2362, float3(0.0), isnan(_2362));
    float _692 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2364.xy, uint(rint(_2364.z)), _646);
    float _694 = _680 + _654;
    float _696 = fma(_648, -0.5, _612);
    float _698 = fma(_648, -1.5, _612);
    float3 _2382 = float3(_678, _696, float(int(_634)));
    float3 _2384 = select(_2382, float3(0.0), isnan(_2382));
    float _700 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2384.xy, uint(rint(_2384.z)), _646);
    float _702 = _684 + _664;
    float _704 = _702 + _666;
    float _706 = _704 + _682;
    float _708 = _706 + _686;
    float _710 = _708 + _688;
    float _712 = _710 + _690;
    float3 _2411 = float3(_660, _696, float(int(_634)));
    float3 _2413 = select(_2411, float3(0.0), isnan(_2411));
    float _714 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2413.xy, uint(rint(_2413.z)), _646);
    float3 _2422 = float3(_662, _696, float(int(_634)));
    float3 _2424 = select(_2422, float3(0.0), isnan(_2422));
    float _716 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2424.xy, uint(rint(_2424.z)), _646);
    float3 _2433 = float3(_672, _696, float(int(_634)));
    float3 _2435 = select(_2433, float3(0.0), isnan(_2433));
    float _718 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2435.xy, uint(rint(_2435.z)), _646);
    float3 _2444 = float3(_678, _698, float(int(_634)));
    float3 _2446 = select(_2444, float3(0.0), isnan(_2444));
    float _720 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2446.xy, uint(rint(_2446.z)), _646);
    float3 _2455 = float3(_660, _698, float(int(_634)));
    float3 _2457 = select(_2455, float3(0.0), isnan(_2455));
    float _722 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2457.xy, uint(rint(_2457.z)), _646);
    float _724 = _200 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _726 = _712 + _692;
    float _728 = _200 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _730 = _200 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _732 = _200 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _734 = _200 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _736 = _726 + _700;
    float _738 = _200 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _740 = -_200;
    float _742 = _740 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _744 = _200 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _746 = _200 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _748 = _200 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _750 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[29].x, _724);
    float _752 = -_186;
    float _754 = _752 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _756 = _742 * _742;
    float _758 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[28].x, _728);
    float _760 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[25].x, _730);
    float _762 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[26].x, _732);
    float _764 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[27].x, _734);
    float _766 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[30].x, _748);
    float _768 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[31].x, _744);
    float _770 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[32].x, _738);
    float _772 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[33].x, _746);
    float _774 = fma(_754, _754, _756);
    float _776 = -_178;
    float _778 = _776 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _780 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[28].z, _758);
    float _782 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[29].z, _750);
    float _784 = fma(_778, _778, _774);
    float _786 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[30].z, _766);
    float _788 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[31].z, _768);
    float _790 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[32].z, _770);
    float _792 = _782 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _794 = _786 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _796 = sqrt(_784);
    float _798 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[25].z, _760);
    float _800 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[27].z, _764);
    float _802 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[26].z, _762);
    bool _804 = _796 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _806 = _796 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _808 = !_804;
    int _810 = _808 ? 0 : 1;
    int _812 = 2;
    float _814 = _792;
    float _816 = _794;
    if (!_804)
    {
        _812 = 1;
    }
    int _818 = _812;
    int _820 = _818;
    if (!_806)
    {
        _820 = _810;
    }
    int _822 = _820;
    float _824 = float(_822);
    float _826 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[33].z, _772);
    float _828 = _780 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _830 = precise::min(_824, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _832 = _830 != 1.0;
    bool _834 = isnan(_830);
    bool _836 = _832 || _834;
    bool _838 = isnan(1.0);
    bool _840 = _836 || _838;
    float _842 = _828;
    if (_840)
    {
        float _844 = _788 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _842 = _844;
    }
    float _846 = _842;
    float _848 = _846;
    if (_840)
    {
        float _850 = _790 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _814 = _850;
    }
    float _852 = _814;
    float _854 = _852;
    if (_840)
    {
        float _856 = _826 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _816 = _856;
    }
    float _858 = _816;
    bool _860 = _830 != 0.0;
    bool _862 = isnan(_830);
    bool _864 = _860 || _862;
    bool _866 = isnan(0.0);
    bool _868 = _864 || _866;
    float _870 = _858;
    if (!_868)
    {
        float _872 = _798 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _848 = _872;
    }
    float _874 = _848;
    if (!_868)
    {
        float _876 = _800 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _870 = _876;
    }
    float _878 = _870;
    float _880 = rint(_830);
    float _882 = precise::max(_880, 0.0);
    uint _884 = uint(_882);
    uint _886 = clamp(_884, 0u, 65535u);
    if (!_868)
    {
        float _888 = _802 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _854 = _888;
    }
    float _890 = _854;
    float _892 = 0.0 + _878;
    float _894 = precise::clamp(_892, 0.0, 1.0);
    float _896 = _620 * _894;
    float _898 = _622 * _894;
    float _900 = fma(_896, 0.5, _874);
    float _902 = fma(_898, 1.5, _890);
    float _904 = fma(_896, 1.5, _874);
    float _906 = fma(_898, 0.5, _890);
    float _908 = _736 + _714;
    float _910 = _908 + _716;
    float _912 = _910 + _718;
    float3 _2805 = float3(_662, _698, float(int(_634)));
    float3 _2807 = select(_2805, float3(0.0), isnan(_2805));
    float _914 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2807.xy, uint(rint(_2807.z)), _646);
    float3 _2816 = float3(_672, _698, float(int(_634)));
    float3 _2818 = select(_2816, float3(0.0), isnan(_2816));
    float _916 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2818.xy, uint(rint(_2818.z)), _646);
    float3 _2827 = float3(_900, _902, float(int(_886)));
    float3 _2829 = select(_2827, float3(0.0), isnan(_2827));
    float _918 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2829.xy, uint(rint(_2829.z)), _894);
    float3 _2838 = float3(_904, _902, float(int(_886)));
    float3 _2840 = select(_2838, float3(0.0), isnan(_2838));
    float _920 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2840.xy, uint(rint(_2840.z)), _894);
    float3 _2849 = float3(_900, _906, float(int(_886)));
    float3 _2851 = select(_2849, float3(0.0), isnan(_2849));
    float _922 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2851.xy, uint(rint(_2851.z)), _894);
    float _924 = fma(_896, -0.5, _874);
    float _926 = fma(_896, -1.5, _874);
    float3 _2866 = float3(_924, _902, float(int(_886)));
    float3 _2868 = select(_2866, float3(0.0), isnan(_2866));
    float _928 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2868.xy, uint(rint(_2868.z)), _894);
    float3 _2877 = float3(_926, _902, float(int(_886)));
    float3 _2879 = select(_2877, float3(0.0), isnan(_2877));
    float _930 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2879.xy, uint(rint(_2879.z)), _894);
    float3 _2888 = float3(_904, _906, float(int(_886)));
    float3 _2890 = select(_2888, float3(0.0), isnan(_2888));
    float _932 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2890.xy, uint(rint(_2890.z)), _894);
    float3 _2899 = float3(_924, _906, float(int(_886)));
    float3 _2901 = select(_2899, float3(0.0), isnan(_2899));
    float _934 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2901.xy, uint(rint(_2901.z)), _894);
    float3 _2910 = float3(_926, _906, float(int(_886)));
    float3 _2912 = select(_2910, float3(0.0), isnan(_2910));
    float _936 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2912.xy, uint(rint(_2912.z)), _894);
    float _938 = fma(_898, -1.5, _890);
    float _940 = fma(_898, -0.5, _890);
    float3 _2927 = float3(_900, _940, float(int(_886)));
    float3 _2929 = select(_2927, float3(0.0), isnan(_2927));
    float _942 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2929.xy, uint(rint(_2929.z)), _894);
    float3 _2938 = float3(_924, _940, float(int(_886)));
    float3 _2940 = select(_2938, float3(0.0), isnan(_2938));
    float _944 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2940.xy, uint(rint(_2940.z)), _894);
    float3 _2949 = float3(_904, _940, float(int(_886)));
    float3 _2951 = select(_2949, float3(0.0), isnan(_2949));
    float _946 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2951.xy, uint(rint(_2951.z)), _894);
    float3 _2960 = float3(_926, _940, float(int(_886)));
    float3 _2962 = select(_2960, float3(0.0), isnan(_2960));
    float _948 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2962.xy, uint(rint(_2962.z)), _894);
    float3 _2971 = float3(_904, _938, float(int(_886)));
    float3 _2973 = select(_2971, float3(0.0), isnan(_2971));
    float _950 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2973.xy, uint(rint(_2973.z)), _894);
    float3 _2982 = float3(_900, _938, float(int(_886)));
    float3 _2984 = select(_2982, float3(0.0), isnan(_2982));
    float _952 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2984.xy, uint(rint(_2984.z)), _894);
    float3 _2993 = float3(_924, _938, float(int(_886)));
    float3 _2995 = select(_2993, float3(0.0), isnan(_2993));
    float _954 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2995.xy, uint(rint(_2995.z)), _894);
    float3 _3004 = float3(_926, _938, float(int(_886)));
    float3 _3006 = select(_3004, float3(0.0), isnan(_3004));
    float _956 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _3006.xy, uint(rint(_3006.z)), _894);
    float2 _3012 = float2(_56, _58);
    float _958 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_3012, float2(0.0), isnan(_3012))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_3012, float2(0.0), isnan(_3012))).x;
    float _960 = _912 + _720;
    float _962 = -_178;
    float _964 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _966 = _962 + _964;
    float _968 = -_178;
    float _970 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _972 = _968 + _970;
    float _974 = _960 + _722;
    float _976 = _966 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _978 = precise::clamp(_976, 0.0, 1.0);
    float _980 = fma(_694, 0.0625, _978);
    float _982 = _974 + _914;
    float _984 = _920 + _918;
    float _986 = _982 + _916;
    float _988 = _984 + _928;
    float _990 = _988 + _930;
    float _992 = _990 + _932;
    float _994 = _992 + _922;
    float _996 = _994 + _934;
    float _998 = _996 + _936;
    float _1000 = _998 + _946;
    float _1002 = _1000 + _942;
    float _1004 = _1002 + _944;
    float _1006 = _1004 + _948;
    float _1008 = _1006 + _950;
    float _1010 = _1008 + _952;
    float _1012 = _1010 + _954;
    float _1014 = _1012 + _956;
    float _1016 = _1014 * 0.0625;
    float _1018 = _986 * 0.0625;
    float _1020 = _1016 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _1022 = fma(_1018, (*spvDescriptorSet0.fp_c3)._m0[49].z, _1020);
    float _1024 = _972 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _1026 = precise::clamp(_1024, 0.0, 1.0);
    float _1028 = _1022 + _1026;
    out.m_49.x = _958;
    out.m_49.y = _980;
    out.m_49.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_49.w = _1028;
    return out;
}

