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
    bool _270 = false;
    bool _268 = false;
    float _54 = in.m_38.x;
    float _56 = in.m_38.y;
    float2 _1037 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1037, float2(0.0), isnan(_1037)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _1054 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1054, float2(0.0), isnan(_1054))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1054, float2(0.0), isnan(_1054))).x;
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
    float _104 = -_68;
    float _106 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _108 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[46].z, _106);
    float _110 = -_100;
    float _112 = fma(_92, _74, _110);
    float _114 = -_100;
    float _116 = fma(_98, _76, _114);
    float _118 = -_102;
    float _120 = fma(_92, _78, _118);
    float _122 = -_102;
    float _124 = fma(_98, _80, _122);
    float _126 = _112 * _112;
    float _128 = _116 * _116;
    float _130 = -_86;
    float _132 = _130 + _92;
    float _134 = -_86;
    float _136 = _134 + _98;
    float _138 = fma(_120, _120, _126);
    float _140 = fma(_124, _124, _128);
    float _142 = -_108;
    bool _146 = _142 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _148 = _108 * _70;
    float _150 = fma(_132, _132, _138);
    float _152 = fma(_136, _136, _140);
    float _154 = -_108;
    bool _156 = _154 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _158 = rsqrt(_150);
    float _160 = rsqrt(_152);
    float _162 = _120 * _158;
    float _164 = _132 * _158;
    float _166 = _112 * _158;
    float _168 = _136 * _160;
    float _170 = _116 * _160;
    float _172 = _124 * _160;
    bool _174 = !_146;
    uint _177 = uint(_174 ? 0 : 1);
    float _179 = _162 * _168;
    float _181 = _164 * _170;
    float _183 = -_179;
    float _185 = fma(_164, _172, _183);
    float _187 = _166 * _172;
    float _189 = -_181;
    float _191 = fma(_166, _168, _189);
    float _193 = _185 * _185;
    float _195 = -_187;
    float _197 = fma(_162, _170, _195);
    float _199 = fma(_191, _191, _193);
    uint _201 = 2u;
    if (!_146)
    {
        _201 = 1u;
    }
    uint _203 = _201;
    float _205 = fma(_197, _197, _199);
    uint _207 = _203;
    if (!_156)
    {
        _207 = _177;
    }
    uint _209 = _207;
    float _211 = rsqrt(_205);
    uint _213 = min(_209, 2u);
    int _216 = int(_213) << 2;
    float _218 = _185 * _211;
    float _220 = _191 * _211;
    float _222 = _197 * _211;
    float _224 = _108 * _72;
    float _226 = _218 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _228 = uint(int(uint(_216) >> uint(2)));
    uint _230 = uint(int(uint(int(_228)) >> uint(2)));
    int _232 = int(_228) & 3;
    float _234 = (*spvDescriptorSet0.fp_c1)._m0[int(_230)][_232];
    float _236 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[35].x, _226);
    float _238 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[35].z, _236);
    float _240 = abs(_238);
    float _242 = -_240;
    float _244 = _242 + 1.0;
    float _246 = precise::clamp(_244, 0.0, 1.0);
    float _248 = abs(_246);
    float _250 = log2(_248);
    float _252 = _250 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _254 = exp2(_252);
    float _256 = _254 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _258 = fma(_220, _256, _224);
    float _260 = fma(_218, _256, _148);
    float _262 = fma(_222, _256, _108);
    bool _264 = as_type<int>(_234) == 1200;
    if (!_264)
    {
        bool _266 = as_type<int>(_234) == 1472;
        _268 = _266;
        if (!_268)
        {
            _270 = true;
        }
    }
    float _304;
    float _306;
    float _308;
    float _310;
    if (!_268)
    {
        if (!_270)
        {
            float _272 = _260 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _274 = _260 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _276 = _260 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _278 = _260 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _280 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[0].x, _272);
            float _282 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[1].x, _274);
            float _284 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[2].x, _276);
            float _286 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[3].x, _278);
            float _288 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[0].z, _280);
            float _290 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[1].z, _282);
            float _292 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[2].z, _284);
            float _294 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[3].z, _286);
            float _296 = _288 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _298 = _290 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _300 = _292 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _302 = _294 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _304 = _302;
            _306 = _300;
            _308 = _296;
            _310 = _298;
        }
    }
    if ((false || _270) || _268)
    {
        if ((!_270) || _268)
        {
            _268 = false;
            float _312 = _260 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _314 = _260 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _316 = _260 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _318 = _260 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _320 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[4].x, _312);
            float _322 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[5].x, _314);
            float _324 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[6].x, _316);
            float _326 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[7].x, _318);
            float _328 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[4].z, _320);
            float _330 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[5].z, _322);
            float _332 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[6].z, _324);
            float _334 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[7].z, _326);
            float _336 = _328 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _338 = _330 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _340 = _332 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _342 = _334 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _304 = _342;
            _306 = _340;
            _308 = _336;
            _310 = _338;
        }
        if (false || _270)
        {
            _270 = false;
            float _344 = _260 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _346 = _260 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _348 = _260 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _350 = _260 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _352 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[8].x, _344);
            float _354 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[9].x, _346);
            float _356 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[10].x, _348);
            float _358 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[11].x, _350);
            float _360 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[8].z, _352);
            float _362 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[9].z, _354);
            float _364 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[10].z, _356);
            float _366 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[11].z, _358);
            float _368 = _360 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _370 = _362 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _372 = _364 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _374 = _366 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _304 = _374;
            _306 = _372;
            _308 = _368;
            _310 = _370;
        }
    }
    float _376 = _304;
    float _378 = _306;
    float _380 = _308;
    float _382 = _310;
    float _384 = 1.0 / _376;
    float _386 = float(int(_209));
    float _388 = rint(_386);
    float _390 = precise::max(_388, 0.0);
    uint _392 = uint(_390);
    uint _394 = clamp(_392, 0u, 65535u);
    float _396 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _398 = _384 * _378;
    float _400 = precise::clamp(_398, 0.0, 1.0);
    float _402 = _384 * _380;
    float _404 = _400 * _396;
    float _406 = _384 * _382;
    float _408 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _410 = fma(_404, 0.5, _402);
    float _412 = _400 * _408;
    float _414 = fma(_404, 1.5, _402);
    float _416 = fma(_404, -0.5, _402);
    float _418 = fma(_404, -1.5, _402);
    float _420 = fma(_412, 1.5, _406);
    float _422 = fma(_412, 0.5, _406);
    float3 _1713 = float3(_410, _420, float(int(_394)));
    float3 _1717 = select(_1713, float3(0.0), isnan(_1713));
    float _424 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1717.xy, uint(rint(_1717.z)), _400);
    float3 _1726 = float3(_414, _420, float(int(_394)));
    float3 _1728 = select(_1726, float3(0.0), isnan(_1726));
    float _426 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1728.xy, uint(rint(_1728.z)), _400);
    float3 _1737 = float3(_416, _420, float(int(_394)));
    float3 _1739 = select(_1737, float3(0.0), isnan(_1737));
    float _428 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1739.xy, uint(rint(_1739.z)), _400);
    float3 _1748 = float3(_418, _420, float(int(_394)));
    float3 _1750 = select(_1748, float3(0.0), isnan(_1748));
    float _430 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1750.xy, uint(rint(_1750.z)), _400);
    float3 _1759 = float3(_414, _422, float(int(_394)));
    float3 _1761 = select(_1759, float3(0.0), isnan(_1759));
    float _432 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1761.xy, uint(rint(_1761.z)), _400);
    float3 _1770 = float3(_410, _422, float(int(_394)));
    float3 _1772 = select(_1770, float3(0.0), isnan(_1770));
    float _434 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1772.xy, uint(rint(_1772.z)), _400);
    float _436 = fma(_412, -0.5, _406);
    float _438 = _426 + _424;
    float _440 = _438 + _428;
    float _442 = _440 + _430;
    float _444 = _442 + _432;
    float3 _1796 = float3(_416, _422, float(int(_394)));
    float3 _1798 = select(_1796, float3(0.0), isnan(_1796));
    float _446 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1798.xy, uint(rint(_1798.z)), _400);
    float3 _1807 = float3(_418, _422, float(int(_394)));
    float3 _1809 = select(_1807, float3(0.0), isnan(_1807));
    float _448 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1809.xy, uint(rint(_1809.z)), _400);
    float3 _1818 = float3(_414, _436, float(int(_394)));
    float3 _1820 = select(_1818, float3(0.0), isnan(_1818));
    float _450 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1820.xy, uint(rint(_1820.z)), _400);
    float3 _1829 = float3(_410, _436, float(int(_394)));
    float3 _1831 = select(_1829, float3(0.0), isnan(_1829));
    float _452 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1831.xy, uint(rint(_1831.z)), _400);
    float3 _1840 = float3(_416, _436, float(int(_394)));
    float3 _1842 = select(_1840, float3(0.0), isnan(_1840));
    float _454 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1842.xy, uint(rint(_1842.z)), _400);
    float3 _1851 = float3(_418, _436, float(int(_394)));
    float3 _1853 = select(_1851, float3(0.0), isnan(_1851));
    float _456 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1853.xy, uint(rint(_1853.z)), _400);
    float _458 = -_148;
    float _460 = _458 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _462 = -_224;
    float _464 = _462 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _466 = _444 + _434;
    float _468 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _470 = _460 * _460;
    float _472 = fma(_464, _464, _470);
    float _474 = -_108;
    float _476 = _474 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _478 = fma(_476, _476, _472);
    float _480 = _148 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _482 = _148 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _484 = _148 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _486 = fma(_412, -1.5, _406);
    float _488 = sqrt(_478);
    float _490 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[22].x, _480);
    float _492 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[20].x, _482);
    float _494 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[23].x, _484);
    float _496 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[22].z, _490);
    float _498 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[20].z, _492);
    float _500 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[23].z, _494);
    bool _502 = _488 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _504 = _488 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _506 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    bool _508 = !_502;
    int _510 = _508 ? 0 : 1;
    int _512 = 2;
    if (!_502)
    {
        _512 = 1;
    }
    int _514 = _512;
    int _516 = _514;
    if (!_504)
    {
        _516 = _510;
    }
    int _518 = _516;
    float _520 = _498 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _522 = _148 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _524 = float(_518);
    float _526 = _148 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _528 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[17].x, _522);
    float _530 = precise::min(_524, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _532 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[19].x, _526);
    float _534 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[17].z, _528);
    bool _536 = _530 != 1.0;
    bool _538 = isnan(_530);
    bool _540 = _536 || _538;
    bool _542 = isnan(1.0);
    bool _544 = _540 || _542;
    float _546 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[19].z, _532);
    bool _548 = _530 != 0.0;
    bool _550 = isnan(_530);
    bool _552 = _548 || _550;
    bool _554 = isnan(0.0);
    bool _556 = _552 || _554;
    float _558 = _546 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _560 = _148 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _562 = _558;
    float _564 = _520;
    if (_544)
    {
        float _566 = _496 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _562 = _566;
    }
    float _568 = _562;
    float _570 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[21].x, _560);
    float _572 = _568;
    if (_544)
    {
        float _574 = _500 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _564 = _574;
    }
    float _576 = _564;
    float _578 = _148 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _580 = _148 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _582 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[21].z, _570);
    float _584 = _576;
    if (!_556)
    {
        float _586 = _534 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _584 = _586;
    }
    float _588 = _584;
    float _590 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[24].x, _578);
    float _592 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[16].x, _580);
    float _594 = _582 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _596 = _148 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _598 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[24].z, _590);
    float _600 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[16].z, _592);
    float _602 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[18].x, _596);
    float _604 = _594;
    if (_544)
    {
        float _606 = _598 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _604 = _606;
    }
    float _608 = _604;
    float _610 = _608;
    if (!_556)
    {
        float _612 = _600 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _572 = _612;
    }
    float _614 = _572;
    float _616 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[18].z, _602);
    if (!_556)
    {
        float _618 = _616 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _610 = _618;
    }
    float _620 = _610;
    float _622 = 0.0 + _620;
    float _624 = precise::clamp(_622, 0.0, 1.0);
    float _626 = _624 * _468;
    float _628 = _624 * _506;
    float _630 = fma(_626, 0.5, _614);
    float _632 = fma(_626, 1.5, _614);
    float _634 = fma(_626, -0.5, _614);
    float _636 = fma(_626, -1.5, _614);
    float _638 = fma(_628, 0.5, _588);
    float _640 = _466 + _446;
    float _642 = _640 + _448;
    float _644 = _642 + _450;
    float _646 = _644 + _452;
    float3 _2211 = float3(_414, _486, float(int(_394)));
    float3 _2213 = select(_2211, float3(0.0), isnan(_2211));
    float _648 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2213.xy, uint(rint(_2213.z)), _400);
    float _650 = fma(_628, 1.5, _588);
    float _652 = _646 + _454;
    float _654 = rint(_530);
    float _656 = precise::max(_654, 0.0);
    uint _658 = uint(_656);
    uint _660 = clamp(_658, 0u, 65535u);
    float _662 = _652 + _456;
    float3 _2239 = float3(_410, _486, float(int(_394)));
    float3 _2241 = select(_2239, float3(0.0), isnan(_2239));
    float _664 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2241.xy, uint(rint(_2241.z)), _400);
    float3 _2250 = float3(_416, _486, float(int(_394)));
    float3 _2252 = select(_2250, float3(0.0), isnan(_2250));
    float _666 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2252.xy, uint(rint(_2252.z)), _400);
    float3 _2261 = float3(_418, _486, float(int(_394)));
    float3 _2263 = select(_2261, float3(0.0), isnan(_2261));
    float _668 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2263.xy, uint(rint(_2263.z)), _400);
    float3 _2272 = float3(_630, _650, float(int(_660)));
    float3 _2274 = select(_2272, float3(0.0), isnan(_2272));
    float _670 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2274.xy, uint(rint(_2274.z)), _624);
    float3 _2283 = float3(_632, _650, float(int(_660)));
    float3 _2285 = select(_2283, float3(0.0), isnan(_2283));
    float _672 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2285.xy, uint(rint(_2285.z)), _624);
    float3 _2294 = float3(_634, _650, float(int(_660)));
    float3 _2296 = select(_2294, float3(0.0), isnan(_2294));
    float _674 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2296.xy, uint(rint(_2296.z)), _624);
    float3 _2305 = float3(_636, _650, float(int(_660)));
    float3 _2307 = select(_2305, float3(0.0), isnan(_2305));
    float _676 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2307.xy, uint(rint(_2307.z)), _624);
    float3 _2316 = float3(_632, _638, float(int(_660)));
    float3 _2318 = select(_2316, float3(0.0), isnan(_2316));
    float _678 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2318.xy, uint(rint(_2318.z)), _624);
    float _680 = _662 + _648;
    float _682 = fma(_628, -0.5, _588);
    float _684 = _680 + _664;
    float _686 = _684 + _666;
    float _688 = _686 + _668;
    float _690 = _672 + _670;
    float3 _2345 = float3(_630, _638, float(int(_660)));
    float3 _2347 = select(_2345, float3(0.0), isnan(_2345));
    float _692 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2347.xy, uint(rint(_2347.z)), _624);
    float _694 = _690 + _674;
    float3 _2359 = float3(_634, _638, float(int(_660)));
    float3 _2361 = select(_2359, float3(0.0), isnan(_2359));
    float _696 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2361.xy, uint(rint(_2361.z)), _624);
    float3 _2370 = float3(_636, _638, float(int(_660)));
    float3 _2372 = select(_2370, float3(0.0), isnan(_2370));
    float _698 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2372.xy, uint(rint(_2372.z)), _624);
    float3 _2381 = float3(_632, _682, float(int(_660)));
    float3 _2383 = select(_2381, float3(0.0), isnan(_2381));
    float _700 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2383.xy, uint(rint(_2383.z)), _624);
    float3 _2392 = float3(_630, _682, float(int(_660)));
    float3 _2394 = select(_2392, float3(0.0), isnan(_2392));
    float _702 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2394.xy, uint(rint(_2394.z)), _624);
    float _704 = _694 + _676;
    float _706 = _704 + _678;
    float _708 = _706 + _692;
    float _710 = fma(_628, -1.5, _588);
    float _712 = _708 + _696;
    float3 _2418 = float3(_634, _682, float(int(_660)));
    float3 _2420 = select(_2418, float3(0.0), isnan(_2418));
    float _714 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2420.xy, uint(rint(_2420.z)), _624);
    float3 _2429 = float3(_636, _682, float(int(_660)));
    float3 _2431 = select(_2429, float3(0.0), isnan(_2429));
    float _716 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2431.xy, uint(rint(_2431.z)), _624);
    float3 _2440 = float3(_632, _710, float(int(_660)));
    float3 _2442 = select(_2440, float3(0.0), isnan(_2440));
    float _718 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2442.xy, uint(rint(_2442.z)), _624);
    float3 _2451 = float3(_630, _710, float(int(_660)));
    float3 _2453 = select(_2451, float3(0.0), isnan(_2451));
    float _720 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2453.xy, uint(rint(_2453.z)), _624);
    float3 _2462 = float3(_634, _710, float(int(_660)));
    float3 _2464 = select(_2462, float3(0.0), isnan(_2462));
    float _722 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2464.xy, uint(rint(_2464.z)), _624);
    float _724 = _712 + _698;
    float _726 = _148 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _728 = _148 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _730 = _148 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _732 = _724 + _700;
    float _734 = _148 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _736 = _148 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _738 = _148 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _740 = _148 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _742 = _148 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _744 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[27].x, _728);
    float _746 = _148 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _748 = -_148;
    float _750 = _748 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _752 = -_224;
    float _754 = _752 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _756 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[30].x, _736);
    float _758 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[31].x, _738);
    float _760 = _750 * _750;
    float _762 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[25].x, _734);
    float _764 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[32].x, _740);
    float _766 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[26].x, _726);
    float _768 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[28].x, _730);
    float _770 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[29].x, _742);
    float _772 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[33].x, _746);
    float _774 = fma(_754, _754, _760);
    float _776 = -_108;
    float _778 = _776 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _780 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[28].z, _768);
    float _782 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[29].z, _770);
    float _784 = fma(_778, _778, _774);
    float _786 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[30].z, _756);
    float _788 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[31].z, _758);
    float _790 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[32].z, _764);
    float _792 = _782 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _794 = _786 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _796 = sqrt(_784);
    float _798 = _732 + _702;
    float _800 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[27].z, _744);
    float _802 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[25].z, _762);
    float _804 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[26].z, _766);
    bool _806 = _796 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _808 = _796 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _810 = !_806;
    int _812 = _810 ? 0 : 1;
    int _814 = 2;
    float _816 = _792;
    float _818 = _794;
    if (!_806)
    {
        _814 = 1;
    }
    int _820 = _814;
    int _822 = _820;
    if (!_808)
    {
        _822 = _812;
    }
    int _824 = _822;
    float _826 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[33].z, _772);
    float _828 = _780 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _830 = float(_824);
    float _832 = precise::min(_830, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _834 = _832 != 1.0;
    bool _836 = isnan(_832);
    bool _838 = _834 || _836;
    bool _840 = isnan(1.0);
    bool _842 = _838 || _840;
    float _844 = _828;
    if (_842)
    {
        float _846 = _788 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _844 = _846;
    }
    float _848 = _844;
    float _850 = _848;
    if (_842)
    {
        float _852 = _790 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _816 = _852;
    }
    float _854 = _816;
    float _856 = _854;
    if (_842)
    {
        float _858 = _826 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _818 = _858;
    }
    float _860 = _818;
    bool _862 = _832 != 0.0;
    bool _864 = isnan(_832);
    bool _866 = _862 || _864;
    bool _868 = isnan(0.0);
    bool _870 = _866 || _868;
    float _872 = rint(_832);
    float _874 = precise::max(_872, 0.0);
    uint _876 = uint(_874);
    uint _878 = clamp(_876, 0u, 65535u);
    float _880 = _860;
    if (!_870)
    {
        float _882 = _800 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _880 = _882;
    }
    float _884 = _880;
    if (!_870)
    {
        float _886 = _802 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _850 = _886;
    }
    float _888 = _850;
    if (!_870)
    {
        float _890 = _804 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _856 = _890;
    }
    float _892 = _856;
    float _894 = 0.0 + _884;
    float _896 = precise::clamp(_894, 0.0, 1.0);
    float _898 = _506 * _896;
    float _900 = _468 * _896;
    float _902 = fma(_898, 0.5, _892);
    float _904 = fma(_900, 0.5, _888);
    float _906 = fma(_900, 1.5, _888);
    float _908 = fma(_900, -0.5, _888);
    float _910 = _798 + _714;
    float _912 = fma(_898, 1.5, _892);
    float _914 = _910 + _716;
    float3 _2815 = float3(_636, _710, float(int(_660)));
    float3 _2817 = select(_2815, float3(0.0), isnan(_2815));
    float _916 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2817.xy, uint(rint(_2817.z)), _624);
    float3 _2826 = float3(_904, _912, float(int(_878)));
    float3 _2828 = select(_2826, float3(0.0), isnan(_2826));
    float _918 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2828.xy, uint(rint(_2828.z)), _896);
    float3 _2837 = float3(_906, _912, float(int(_878)));
    float3 _2839 = select(_2837, float3(0.0), isnan(_2837));
    float _920 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2839.xy, uint(rint(_2839.z)), _896);
    float3 _2848 = float3(_908, _912, float(int(_878)));
    float3 _2850 = select(_2848, float3(0.0), isnan(_2848));
    float _922 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2850.xy, uint(rint(_2850.z)), _896);
    float3 _2859 = float3(_904, _902, float(int(_878)));
    float3 _2861 = select(_2859, float3(0.0), isnan(_2859));
    float _924 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2861.xy, uint(rint(_2861.z)), _896);
    float _926 = _914 + _718;
    float _928 = fma(_900, -1.5, _888);
    float _930 = _926 + _720;
    float3 _2879 = float3(_928, _912, float(int(_878)));
    float3 _2881 = select(_2879, float3(0.0), isnan(_2879));
    float _932 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2881.xy, uint(rint(_2881.z)), _896);
    float _934 = _930 + _722;
    float3 _2893 = float3(_906, _902, float(int(_878)));
    float3 _2895 = select(_2893, float3(0.0), isnan(_2893));
    float _936 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2895.xy, uint(rint(_2895.z)), _896);
    float _938 = fma(_898, -0.5, _892);
    float3 _2907 = float3(_908, _902, float(int(_878)));
    float3 _2909 = select(_2907, float3(0.0), isnan(_2907));
    float _940 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2909.xy, uint(rint(_2909.z)), _896);
    float3 _2918 = float3(_928, _902, float(int(_878)));
    float3 _2920 = select(_2918, float3(0.0), isnan(_2918));
    float _942 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2920.xy, uint(rint(_2920.z)), _896);
    float3 _2929 = float3(_906, _938, float(int(_878)));
    float3 _2931 = select(_2929, float3(0.0), isnan(_2929));
    float _944 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2931.xy, uint(rint(_2931.z)), _896);
    float3 _2940 = float3(_904, _938, float(int(_878)));
    float3 _2942 = select(_2940, float3(0.0), isnan(_2940));
    float _946 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2942.xy, uint(rint(_2942.z)), _896);
    float _948 = fma(_898, -1.5, _892);
    float3 _2954 = float3(_908, _938, float(int(_878)));
    float3 _2956 = select(_2954, float3(0.0), isnan(_2954));
    float _950 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2956.xy, uint(rint(_2956.z)), _896);
    float3 _2965 = float3(_928, _938, float(int(_878)));
    float3 _2967 = select(_2965, float3(0.0), isnan(_2965));
    float _952 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2967.xy, uint(rint(_2967.z)), _896);
    float3 _2976 = float3(_906, _948, float(int(_878)));
    float3 _2978 = select(_2976, float3(0.0), isnan(_2976));
    float _954 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2978.xy, uint(rint(_2978.z)), _896);
    float3 _2987 = float3(_904, _948, float(int(_878)));
    float3 _2989 = select(_2987, float3(0.0), isnan(_2987));
    float _956 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2989.xy, uint(rint(_2989.z)), _896);
    float3 _2998 = float3(_908, _948, float(int(_878)));
    float3 _3000 = select(_2998, float3(0.0), isnan(_2998));
    float _958 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _3000.xy, uint(rint(_3000.z)), _896);
    float _960 = _934 + _916;
    float3 _3012 = float3(_928, _948, float(int(_878)));
    float3 _3014 = select(_3012, float3(0.0), isnan(_3012));
    float _962 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _3014.xy, uint(rint(_3014.z)), _896);
    float _964 = _920 + _918;
    float _966 = _964 + _922;
    float _968 = _966 + _932;
    float _970 = _960 * 0.0625;
    float _972 = _968 + _936;
    float _974 = _972 + _924;
    float _976 = -_108;
    float _978 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _980 = _976 + _978;
    float _982 = _974 + _940;
    float _984 = -_108;
    float _986 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _988 = _984 + _986;
    float _990 = _980 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _992 = precise::clamp(_990, 0.0, 1.0);
    float _994 = _982 + _942;
    float _996 = _988 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _998 = precise::clamp(_996, 0.0, 1.0);
    float _1000 = _994 + _944;
    float _1002 = fma(_688, 0.0625, _998);
    float _1004 = _1000 + _946;
    float _1006 = _1004 + _950;
    float _1008 = _1006 + _952;
    float _1010 = _1008 + _954;
    float _1012 = _1010 + _956;
    float _1014 = _1012 + _958;
    float _1016 = _1014 + _962;
    float _1018 = _1016 * 0.0625;
    float _1020 = _1018 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _1022 = fma(_970, (*spvDescriptorSet0.fp_c3)._m0[49].z, _1020);
    float _1024 = _1022 + _992;
    out.m_47.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_47.y = _1002;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _1024;
    return out;
}

