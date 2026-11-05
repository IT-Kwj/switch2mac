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
    texture2d_array<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_E [[id(8)]];
    sampler fp_t_tcb_ESmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 m_47 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_44 [[user(locn1), center_no_perspective]];
    float4 m_42 [[user(locn2), center_no_perspective]];
    float4 m_38 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _280 = false;
    bool _278 = false;
    float _54 = in.m_38.x;
    float _56 = in.m_38.y;
    float2 _1047 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1047, float2(0.0), isnan(_1047)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _1064 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1064, float2(0.0), isnan(_1064))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1064, float2(0.0), isnan(_1064))).x;
    float _70 = in.m_40.y;
    float _72 = in.m_40.x;
    float _74 = in.m_42.y;
    float _76 = in.m_44.y;
    float _78 = in.m_42.x;
    float _80 = in.m_44.x;
    float _82 = -_62;
    float _84 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _86 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[46].z, _84);
    float _88 = -_64;
    float _90 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _92 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[46].z, _90);
    float _94 = -_66;
    float _96 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _98 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[46].z, _96);
    float _100 = _70 * _86;
    float _102 = _72 * _86;
    float _104 = -_100;
    float _106 = fma(_92, _74, _104);
    float _108 = -_100;
    float _110 = fma(_98, _76, _108);
    float _112 = -_102;
    float _114 = fma(_92, _78, _112);
    float _116 = -_102;
    float _118 = fma(_98, _80, _116);
    float _120 = _106 * _106;
    float _122 = _110 * _110;
    float _124 = -_86;
    float _126 = _124 + _92;
    float _128 = -_86;
    float _130 = _128 + _98;
    float _132 = fma(_114, _114, _120);
    float _134 = fma(_118, _118, _122);
    float _136 = fma(_126, _126, _132);
    float _138 = fma(_130, _130, _134);
    float _140 = -_68;
    float _142 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _144 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[46].z, _142);
    float _146 = rsqrt(_136);
    float _148 = -_144;
    bool _152 = _148 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _154 = _144 * _70;
    float _156 = -_144;
    bool _158 = _156 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _160 = -_144;
    bool _162 = _160 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    float _164 = rsqrt(_138);
    int _167 = 2;
    if (!_152)
    {
        _167 = 1;
    }
    int _169 = _167;
    float _171 = _114 * _146;
    float _173 = _126 * _146;
    float _175 = _106 * _146;
    float _177 = _130 * _164;
    float _179 = _110 * _164;
    float _181 = _118 * _164;
    float _183 = _171 * _177;
    float _185 = _173 * _179;
    float _187 = _175 * _181;
    float _189 = -_183;
    float _191 = fma(_173, _181, _189);
    float _193 = -_185;
    float _195 = fma(_175, _177, _193);
    float _197 = -_187;
    float _199 = fma(_171, _179, _197);
    float _201 = _191 * _191;
    float _203 = fma(_195, _195, _201);
    bool _205 = !_152;
    int _207 = _205 ? 0 : 1;
    float _209 = fma(_199, _199, _203);
    int _211 = _169;
    if (!_158)
    {
        _211 = _207;
    }
    int _213 = _211;
    float _215 = rsqrt(_209);
    int _217 = _213 + 1;
    uint _220 = uint(_217);
    if (!_162)
    {
        _220 = uint(_213);
    }
    uint _222 = _220;
    float _224 = _191 * _215;
    uint _226 = min(_222, 2u);
    float _228 = _195 * _215;
    float _230 = _199 * _215;
    float _232 = _224 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    int _234 = int(_226) << 2;
    float _236 = _144 * _72;
    float _238 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[35].x, _232);
    uint _240 = uint(int(uint(_234) >> uint(2)));
    uint _242 = uint(int(uint(int(_240)) >> uint(2)));
    int _244 = int(_240) & 3;
    float _246 = (*spvDescriptorSet0.fp_c1)._m0[int(_242)][_244];
    float _248 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[35].z, _238);
    float _250 = abs(_248);
    float _252 = -_250;
    float _254 = _252 + 1.0;
    float _256 = precise::clamp(_254, 0.0, 1.0);
    float _258 = abs(_256);
    float _260 = log2(_258);
    float _262 = _260 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _264 = exp2(_262);
    float _266 = _264 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _268 = fma(_228, _266, _236);
    float _270 = fma(_224, _266, _154);
    float _272 = fma(_230, _266, _144);
    bool _274 = as_type<int>(_246) == 1264;
    if (!_274)
    {
        bool _276 = as_type<int>(_246) == 1536;
        _278 = _276;
        if (!_278)
        {
            _280 = true;
        }
    }
    float _314;
    float _316;
    float _318;
    float _320;
    if (!_278)
    {
        if (!_280)
        {
            float _282 = _270 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _284 = _270 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _286 = _270 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _288 = _270 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _290 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[0].x, _282);
            float _292 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[1].x, _284);
            float _294 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[2].x, _286);
            float _296 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[3].x, _288);
            float _298 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[0].z, _290);
            float _300 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[1].z, _292);
            float _302 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[2].z, _294);
            float _304 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[3].z, _296);
            float _306 = _298 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _308 = _300 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _310 = _302 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _312 = _304 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _314 = _312;
            _316 = _310;
            _318 = _306;
            _320 = _308;
        }
    }
    if ((false || _280) || _278)
    {
        if ((!_280) || _278)
        {
            _278 = false;
            float _322 = _270 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _324 = _270 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _326 = _270 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _328 = _270 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _330 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[4].x, _322);
            float _332 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[5].x, _324);
            float _334 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[6].x, _326);
            float _336 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[7].x, _328);
            float _338 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[4].z, _330);
            float _340 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[5].z, _332);
            float _342 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[6].z, _334);
            float _344 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[7].z, _336);
            float _346 = _338 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _348 = _340 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _350 = _342 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _352 = _344 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _314 = _352;
            _316 = _350;
            _318 = _346;
            _320 = _348;
        }
        if (false || _280)
        {
            _280 = false;
            float _354 = _270 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _356 = _270 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _358 = _270 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _360 = _270 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _362 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[8].x, _354);
            float _364 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[9].x, _356);
            float _366 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[10].x, _358);
            float _368 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[11].x, _360);
            float _370 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[8].z, _362);
            float _372 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[9].z, _364);
            float _374 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[10].z, _366);
            float _376 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[11].z, _368);
            float _378 = _370 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _380 = _372 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _382 = _374 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _384 = _376 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _314 = _384;
            _316 = _382;
            _318 = _378;
            _320 = _380;
        }
    }
    float _386 = _314;
    float _388 = _316;
    float _390 = _318;
    float _392 = _320;
    float _394 = 1.0 / _386;
    float _396 = float(int(_222));
    float _398 = rint(_396);
    float _400 = precise::max(_398, 0.0);
    uint _402 = uint(_400);
    uint _404 = clamp(_402, 0u, 65535u);
    float _406 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _408 = _394 * _388;
    float _410 = precise::clamp(_408, 0.0, 1.0);
    float _412 = _394 * _390;
    float _414 = _410 * _406;
    float _416 = _394 * _392;
    float _418 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _420 = fma(_414, 0.5, _412);
    float _422 = _410 * _418;
    float _424 = fma(_414, 1.5, _412);
    float _426 = fma(_414, -0.5, _412);
    float _428 = fma(_414, -1.5, _412);
    float _430 = fma(_422, 1.5, _416);
    float _432 = fma(_422, 0.5, _416);
    float3 _1739 = float3(_420, _430, float(int(_404)));
    float3 _1743 = select(_1739, float3(0.0), isnan(_1739));
    float _434 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1743.xy, uint(rint(_1743.z)), _410);
    float3 _1752 = float3(_424, _430, float(int(_404)));
    float3 _1754 = select(_1752, float3(0.0), isnan(_1752));
    float _436 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1754.xy, uint(rint(_1754.z)), _410);
    float3 _1763 = float3(_426, _430, float(int(_404)));
    float3 _1765 = select(_1763, float3(0.0), isnan(_1763));
    float _438 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1765.xy, uint(rint(_1765.z)), _410);
    float3 _1774 = float3(_428, _430, float(int(_404)));
    float3 _1776 = select(_1774, float3(0.0), isnan(_1774));
    float _440 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1776.xy, uint(rint(_1776.z)), _410);
    float3 _1785 = float3(_424, _432, float(int(_404)));
    float3 _1787 = select(_1785, float3(0.0), isnan(_1785));
    float _442 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1787.xy, uint(rint(_1787.z)), _410);
    float3 _1796 = float3(_420, _432, float(int(_404)));
    float3 _1798 = select(_1796, float3(0.0), isnan(_1796));
    float _444 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1798.xy, uint(rint(_1798.z)), _410);
    float _446 = fma(_422, -0.5, _416);
    float _448 = _436 + _434;
    float _450 = _448 + _438;
    float _452 = _450 + _440;
    float _454 = _452 + _442;
    float3 _1822 = float3(_426, _432, float(int(_404)));
    float3 _1824 = select(_1822, float3(0.0), isnan(_1822));
    float _456 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1824.xy, uint(rint(_1824.z)), _410);
    float3 _1833 = float3(_428, _432, float(int(_404)));
    float3 _1835 = select(_1833, float3(0.0), isnan(_1833));
    float _458 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1835.xy, uint(rint(_1835.z)), _410);
    float3 _1844 = float3(_424, _446, float(int(_404)));
    float3 _1846 = select(_1844, float3(0.0), isnan(_1844));
    float _460 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1846.xy, uint(rint(_1846.z)), _410);
    float3 _1855 = float3(_420, _446, float(int(_404)));
    float3 _1857 = select(_1855, float3(0.0), isnan(_1855));
    float _462 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1857.xy, uint(rint(_1857.z)), _410);
    float3 _1866 = float3(_426, _446, float(int(_404)));
    float3 _1868 = select(_1866, float3(0.0), isnan(_1866));
    float _464 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1868.xy, uint(rint(_1868.z)), _410);
    float3 _1877 = float3(_428, _446, float(int(_404)));
    float3 _1879 = select(_1877, float3(0.0), isnan(_1877));
    float _466 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1879.xy, uint(rint(_1879.z)), _410);
    float _468 = -_154;
    float _470 = _468 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _472 = -_236;
    float _474 = _472 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _476 = _454 + _444;
    float _478 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _480 = _470 * _470;
    float _482 = fma(_474, _474, _480);
    float _484 = -_144;
    float _486 = _484 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _488 = fma(_486, _486, _482);
    float _490 = _154 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _492 = _154 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _494 = _154 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _496 = fma(_422, -1.5, _416);
    float _498 = sqrt(_488);
    float _500 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[22].x, _490);
    float _502 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[20].x, _492);
    float _504 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[23].x, _494);
    float _506 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[22].z, _500);
    float _508 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[20].z, _502);
    float _510 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[23].z, _504);
    bool _512 = _498 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _514 = _498 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _516 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    bool _518 = !_512;
    int _520 = _518 ? 0 : 1;
    int _522 = 2;
    if (!_512)
    {
        _522 = 1;
    }
    int _524 = _522;
    int _526 = _524;
    if (!_514)
    {
        _526 = _520;
    }
    int _528 = _526;
    float _530 = _508 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _532 = _154 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _534 = float(_528);
    float _536 = _154 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _538 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[17].x, _532);
    float _540 = precise::min(_534, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _542 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[19].x, _536);
    float _544 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[17].z, _538);
    bool _546 = _540 != 1.0;
    bool _548 = isnan(_540);
    bool _550 = _546 || _548;
    bool _552 = isnan(1.0);
    bool _554 = _550 || _552;
    float _556 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[19].z, _542);
    bool _558 = _540 != 0.0;
    bool _560 = isnan(_540);
    bool _562 = _558 || _560;
    bool _564 = isnan(0.0);
    bool _566 = _562 || _564;
    float _568 = _556 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _570 = _154 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _572 = _568;
    float _574 = _530;
    if (_554)
    {
        float _576 = _506 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _572 = _576;
    }
    float _578 = _572;
    float _580 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[21].x, _570);
    float _582 = _578;
    if (_554)
    {
        float _584 = _510 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _574 = _584;
    }
    float _586 = _574;
    float _588 = _154 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _590 = _154 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _592 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[21].z, _580);
    float _594 = _586;
    if (!_566)
    {
        float _596 = _544 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _594 = _596;
    }
    float _598 = _594;
    float _600 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[24].x, _588);
    float _602 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[16].x, _590);
    float _604 = _592 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _606 = _154 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _608 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[24].z, _600);
    float _610 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[16].z, _602);
    float _612 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[18].x, _606);
    float _614 = _604;
    if (_554)
    {
        float _616 = _608 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _614 = _616;
    }
    float _618 = _614;
    float _620 = _618;
    if (!_566)
    {
        float _622 = _610 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _582 = _622;
    }
    float _624 = _582;
    float _626 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[18].z, _612);
    if (!_566)
    {
        float _628 = _626 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _620 = _628;
    }
    float _630 = _620;
    float _632 = 0.0 + _630;
    float _634 = precise::clamp(_632, 0.0, 1.0);
    float _636 = _634 * _478;
    float _638 = _634 * _516;
    float _640 = fma(_636, 0.5, _624);
    float _642 = fma(_636, 1.5, _624);
    float _644 = fma(_636, -0.5, _624);
    float _646 = fma(_636, -1.5, _624);
    float _648 = fma(_638, 0.5, _598);
    float _650 = _476 + _456;
    float _652 = _650 + _458;
    float _654 = _652 + _460;
    float _656 = _654 + _462;
    float3 _2237 = float3(_424, _496, float(int(_404)));
    float3 _2239 = select(_2237, float3(0.0), isnan(_2237));
    float _658 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2239.xy, uint(rint(_2239.z)), _410);
    float _660 = fma(_638, 1.5, _598);
    float _662 = _656 + _464;
    float _664 = rint(_540);
    float _666 = precise::max(_664, 0.0);
    uint _668 = uint(_666);
    uint _670 = clamp(_668, 0u, 65535u);
    float _672 = _662 + _466;
    float3 _2265 = float3(_420, _496, float(int(_404)));
    float3 _2267 = select(_2265, float3(0.0), isnan(_2265));
    float _674 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2267.xy, uint(rint(_2267.z)), _410);
    float3 _2276 = float3(_426, _496, float(int(_404)));
    float3 _2278 = select(_2276, float3(0.0), isnan(_2276));
    float _676 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2278.xy, uint(rint(_2278.z)), _410);
    float3 _2287 = float3(_428, _496, float(int(_404)));
    float3 _2289 = select(_2287, float3(0.0), isnan(_2287));
    float _678 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2289.xy, uint(rint(_2289.z)), _410);
    float3 _2298 = float3(_640, _660, float(int(_670)));
    float3 _2300 = select(_2298, float3(0.0), isnan(_2298));
    float _680 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2300.xy, uint(rint(_2300.z)), _634);
    float3 _2309 = float3(_642, _660, float(int(_670)));
    float3 _2311 = select(_2309, float3(0.0), isnan(_2309));
    float _682 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2311.xy, uint(rint(_2311.z)), _634);
    float3 _2320 = float3(_644, _660, float(int(_670)));
    float3 _2322 = select(_2320, float3(0.0), isnan(_2320));
    float _684 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2322.xy, uint(rint(_2322.z)), _634);
    float3 _2331 = float3(_646, _660, float(int(_670)));
    float3 _2333 = select(_2331, float3(0.0), isnan(_2331));
    float _686 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2333.xy, uint(rint(_2333.z)), _634);
    float3 _2342 = float3(_642, _648, float(int(_670)));
    float3 _2344 = select(_2342, float3(0.0), isnan(_2342));
    float _688 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2344.xy, uint(rint(_2344.z)), _634);
    float _690 = _672 + _658;
    float _692 = fma(_638, -0.5, _598);
    float _694 = _690 + _674;
    float _696 = _694 + _676;
    float _698 = _696 + _678;
    float _700 = _682 + _680;
    float3 _2371 = float3(_640, _648, float(int(_670)));
    float3 _2373 = select(_2371, float3(0.0), isnan(_2371));
    float _702 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2373.xy, uint(rint(_2373.z)), _634);
    float _704 = _700 + _684;
    float3 _2385 = float3(_644, _648, float(int(_670)));
    float3 _2387 = select(_2385, float3(0.0), isnan(_2385));
    float _706 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2387.xy, uint(rint(_2387.z)), _634);
    float3 _2396 = float3(_646, _648, float(int(_670)));
    float3 _2398 = select(_2396, float3(0.0), isnan(_2396));
    float _708 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2398.xy, uint(rint(_2398.z)), _634);
    float3 _2407 = float3(_642, _692, float(int(_670)));
    float3 _2409 = select(_2407, float3(0.0), isnan(_2407));
    float _710 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2409.xy, uint(rint(_2409.z)), _634);
    float3 _2418 = float3(_640, _692, float(int(_670)));
    float3 _2420 = select(_2418, float3(0.0), isnan(_2418));
    float _712 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2420.xy, uint(rint(_2420.z)), _634);
    float _714 = _704 + _686;
    float _716 = _714 + _688;
    float _718 = _716 + _702;
    float _720 = fma(_638, -1.5, _598);
    float _722 = _718 + _706;
    float3 _2444 = float3(_644, _692, float(int(_670)));
    float3 _2446 = select(_2444, float3(0.0), isnan(_2444));
    float _724 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2446.xy, uint(rint(_2446.z)), _634);
    float3 _2455 = float3(_646, _692, float(int(_670)));
    float3 _2457 = select(_2455, float3(0.0), isnan(_2455));
    float _726 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2457.xy, uint(rint(_2457.z)), _634);
    float3 _2466 = float3(_642, _720, float(int(_670)));
    float3 _2468 = select(_2466, float3(0.0), isnan(_2466));
    float _728 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2468.xy, uint(rint(_2468.z)), _634);
    float3 _2477 = float3(_640, _720, float(int(_670)));
    float3 _2479 = select(_2477, float3(0.0), isnan(_2477));
    float _730 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2479.xy, uint(rint(_2479.z)), _634);
    float3 _2488 = float3(_644, _720, float(int(_670)));
    float3 _2490 = select(_2488, float3(0.0), isnan(_2488));
    float _732 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2490.xy, uint(rint(_2490.z)), _634);
    float _734 = _722 + _708;
    float _736 = _154 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _738 = _154 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _740 = _154 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _742 = _734 + _710;
    float _744 = _154 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _746 = _154 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _748 = _154 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _750 = _154 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _752 = _154 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _754 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[27].x, _738);
    float _756 = _154 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _758 = -_154;
    float _760 = _758 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _762 = -_236;
    float _764 = _762 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _766 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[30].x, _746);
    float _768 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[31].x, _748);
    float _770 = _760 * _760;
    float _772 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[25].x, _744);
    float _774 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[32].x, _750);
    float _776 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[26].x, _736);
    float _778 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[28].x, _740);
    float _780 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[29].x, _752);
    float _782 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[33].x, _756);
    float _784 = fma(_764, _764, _770);
    float _786 = -_144;
    float _788 = _786 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _790 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[28].z, _778);
    float _792 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[29].z, _780);
    float _794 = fma(_788, _788, _784);
    float _796 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[30].z, _766);
    float _798 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[31].z, _768);
    float _800 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[32].z, _774);
    float _802 = _792 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _804 = _796 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _806 = sqrt(_794);
    float _808 = _742 + _712;
    float _810 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[27].z, _754);
    float _812 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[25].z, _772);
    float _814 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[26].z, _776);
    bool _816 = _806 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _818 = _806 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _820 = !_816;
    int _822 = _820 ? 0 : 1;
    int _824 = 2;
    float _826 = _802;
    float _828 = _804;
    if (!_816)
    {
        _824 = 1;
    }
    int _830 = _824;
    int _832 = _830;
    if (!_818)
    {
        _832 = _822;
    }
    int _834 = _832;
    float _836 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[33].z, _782);
    float _838 = _790 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _840 = float(_834);
    float _842 = precise::min(_840, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _844 = _842 != 1.0;
    bool _846 = isnan(_842);
    bool _848 = _844 || _846;
    bool _850 = isnan(1.0);
    bool _852 = _848 || _850;
    float _854 = _838;
    if (_852)
    {
        float _856 = _798 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _854 = _856;
    }
    float _858 = _854;
    float _860 = _858;
    if (_852)
    {
        float _862 = _800 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _826 = _862;
    }
    float _864 = _826;
    float _866 = _864;
    if (_852)
    {
        float _868 = _836 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _828 = _868;
    }
    float _870 = _828;
    bool _872 = _842 != 0.0;
    bool _874 = isnan(_842);
    bool _876 = _872 || _874;
    bool _878 = isnan(0.0);
    bool _880 = _876 || _878;
    float _882 = rint(_842);
    float _884 = precise::max(_882, 0.0);
    uint _886 = uint(_884);
    uint _888 = clamp(_886, 0u, 65535u);
    float _890 = _870;
    if (!_880)
    {
        float _892 = _810 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _890 = _892;
    }
    float _894 = _890;
    if (!_880)
    {
        float _896 = _812 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _860 = _896;
    }
    float _898 = _860;
    if (!_880)
    {
        float _900 = _814 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _866 = _900;
    }
    float _902 = _866;
    float _904 = 0.0 + _894;
    float _906 = precise::clamp(_904, 0.0, 1.0);
    float _908 = _516 * _906;
    float _910 = _478 * _906;
    float _912 = fma(_908, 0.5, _902);
    float _914 = fma(_910, 0.5, _898);
    float _916 = fma(_910, 1.5, _898);
    float _918 = fma(_910, -0.5, _898);
    float _920 = _808 + _724;
    float _922 = fma(_908, 1.5, _902);
    float _924 = _920 + _726;
    float3 _2841 = float3(_646, _720, float(int(_670)));
    float3 _2843 = select(_2841, float3(0.0), isnan(_2841));
    float _926 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2843.xy, uint(rint(_2843.z)), _634);
    float3 _2852 = float3(_914, _922, float(int(_888)));
    float3 _2854 = select(_2852, float3(0.0), isnan(_2852));
    float _928 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2854.xy, uint(rint(_2854.z)), _906);
    float3 _2863 = float3(_916, _922, float(int(_888)));
    float3 _2865 = select(_2863, float3(0.0), isnan(_2863));
    float _930 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2865.xy, uint(rint(_2865.z)), _906);
    float3 _2874 = float3(_918, _922, float(int(_888)));
    float3 _2876 = select(_2874, float3(0.0), isnan(_2874));
    float _932 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2876.xy, uint(rint(_2876.z)), _906);
    float3 _2885 = float3(_914, _912, float(int(_888)));
    float3 _2887 = select(_2885, float3(0.0), isnan(_2885));
    float _934 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2887.xy, uint(rint(_2887.z)), _906);
    float _936 = _924 + _728;
    float _938 = fma(_910, -1.5, _898);
    float _940 = _936 + _730;
    float3 _2905 = float3(_938, _922, float(int(_888)));
    float3 _2907 = select(_2905, float3(0.0), isnan(_2905));
    float _942 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2907.xy, uint(rint(_2907.z)), _906);
    float _944 = _940 + _732;
    float3 _2919 = float3(_916, _912, float(int(_888)));
    float3 _2921 = select(_2919, float3(0.0), isnan(_2919));
    float _946 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2921.xy, uint(rint(_2921.z)), _906);
    float _948 = fma(_908, -0.5, _902);
    float3 _2933 = float3(_918, _912, float(int(_888)));
    float3 _2935 = select(_2933, float3(0.0), isnan(_2933));
    float _950 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2935.xy, uint(rint(_2935.z)), _906);
    float3 _2944 = float3(_938, _912, float(int(_888)));
    float3 _2946 = select(_2944, float3(0.0), isnan(_2944));
    float _952 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2946.xy, uint(rint(_2946.z)), _906);
    float3 _2955 = float3(_916, _948, float(int(_888)));
    float3 _2957 = select(_2955, float3(0.0), isnan(_2955));
    float _954 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2957.xy, uint(rint(_2957.z)), _906);
    float3 _2966 = float3(_914, _948, float(int(_888)));
    float3 _2968 = select(_2966, float3(0.0), isnan(_2966));
    float _956 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2968.xy, uint(rint(_2968.z)), _906);
    float _958 = fma(_908, -1.5, _902);
    float3 _2980 = float3(_918, _948, float(int(_888)));
    float3 _2982 = select(_2980, float3(0.0), isnan(_2980));
    float _960 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2982.xy, uint(rint(_2982.z)), _906);
    float3 _2991 = float3(_938, _948, float(int(_888)));
    float3 _2993 = select(_2991, float3(0.0), isnan(_2991));
    float _962 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2993.xy, uint(rint(_2993.z)), _906);
    float3 _3002 = float3(_916, _958, float(int(_888)));
    float3 _3004 = select(_3002, float3(0.0), isnan(_3002));
    float _964 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _3004.xy, uint(rint(_3004.z)), _906);
    float3 _3013 = float3(_914, _958, float(int(_888)));
    float3 _3015 = select(_3013, float3(0.0), isnan(_3013));
    float _966 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _3015.xy, uint(rint(_3015.z)), _906);
    float3 _3024 = float3(_918, _958, float(int(_888)));
    float3 _3026 = select(_3024, float3(0.0), isnan(_3024));
    float _968 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _3026.xy, uint(rint(_3026.z)), _906);
    float _970 = _944 + _926;
    float3 _3038 = float3(_938, _958, float(int(_888)));
    float3 _3040 = select(_3038, float3(0.0), isnan(_3038));
    float _972 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _3040.xy, uint(rint(_3040.z)), _906);
    float _974 = _930 + _928;
    float _976 = _974 + _932;
    float _978 = _976 + _942;
    float _980 = _970 * 0.0625;
    float _982 = _978 + _946;
    float _984 = _982 + _934;
    float _986 = -_144;
    float _988 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _990 = _986 + _988;
    float _992 = _984 + _950;
    float _994 = -_144;
    float _996 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _998 = _994 + _996;
    float _1000 = _990 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _1002 = precise::clamp(_1000, 0.0, 1.0);
    float _1004 = _992 + _952;
    float _1006 = _998 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _1008 = precise::clamp(_1006, 0.0, 1.0);
    float _1010 = _1004 + _954;
    float _1012 = fma(_698, 0.0625, _1008);
    float _1014 = _1010 + _956;
    float _1016 = _1014 + _960;
    float _1018 = _1016 + _962;
    float _1020 = _1018 + _964;
    float _1022 = _1020 + _966;
    float _1024 = _1022 + _968;
    float _1026 = _1024 + _972;
    float _1028 = _1026 * 0.0625;
    float _1030 = _1028 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _1032 = fma(_980, (*spvDescriptorSet0.fp_c3)._m0[49].z, _1030);
    float _1034 = _1032 + _1002;
    out.m_47.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_47.y = _1012;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _1034;
    return out;
}

