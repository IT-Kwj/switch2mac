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
    texture2d_array<float> fp_t_tcb_E [[id(4)]];
    sampler fp_t_tcb_ESmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_10 [[id(6)]];
    sampler fp_t_tcb_10Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_C [[id(8)]];
    sampler fp_t_tcb_CSmplr [[id(9)]];
    texture2d_array<float> fp_t_tcb_12 [[id(10)]];
    sampler fp_t_tcb_12Smplr [[id(11)]];
    texture2d<float> fp_t_tcb_A [[id(12)]];
    sampler fp_t_tcb_ASmplr [[id(13)]];
    sampler fp_t_tcb_8Smplr_w [[id(14)]];
    sampler fp_t_tcb_CSmplr_w [[id(15)]];
    sampler fp_t_tcb_ASmplr_w [[id(16)]];
    constant dm_border_t* dm_border [[id(17)]];
};

struct main0_out
{
    float4 m_47 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0), center_no_perspective]];
    float4 m_42 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _120 = false;
    bool _118 = false;
    float _54 = in.m_42.x;
    float _56 = in.m_42.y;
    float2 _800 = float2(_54, _56);
    float _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_800, float2(0.0), isnan(_800))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_800, float2(0.0), isnan(_800))).x;
    float _60 = in.m_44.x;
    float _62 = in.m_44.y;
    float _64 = -_58;
    float _66 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _68 = 1.0 / _66;
    float _70 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _72 = _68 * _70;
    float _74 = _72 * _60;
    float _76 = -_72;
    bool _80 = _76 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _82 = _72 * _62;
    float _84 = -_72;
    bool _86 = _84 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _88 = !_80;
    uint _91 = uint(_88 ? 0 : 1);
    uint _93 = 2u;
    if (!_80)
    {
        _93 = 1u;
    }
    uint _95 = _93;
    uint _97 = _95;
    if (!_86)
    {
        _97 = _91;
    }
    uint _99 = _97;
    uint _101 = min(_99, 2u);
    int _104 = int(_101) << 2;
    uint _106 = uint(int(uint(_104) >> uint(2)));
    uint _108 = uint(int(uint(int(_106)) >> uint(2)));
    int _110 = int(_106) & 3;
    float _112 = (*spvDescriptorSet0.fp_c1)._m0[int(_108)][_110];
    bool _114 = as_type<int>(_112) == 368;
    if (!_114)
    {
        bool _116 = as_type<int>(_112) == 640;
        _118 = _116;
        if (!_118)
        {
            _120 = true;
        }
    }
    float _154;
    float _156;
    float _158;
    float _160;
    if (!_118)
    {
        if (!_120)
        {
            float _122 = _82 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _124 = _82 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _126 = _82 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _128 = _82 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _130 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[0].x, _122);
            float _132 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[1].x, _124);
            float _134 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[2].x, _126);
            float _136 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[3].x, _128);
            float _138 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[0].z, _130);
            float _140 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[1].z, _132);
            float _142 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[2].z, _134);
            float _144 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[3].z, _136);
            float _146 = _138 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _148 = _140 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _150 = _142 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _152 = _144 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _154 = _152;
            _156 = _148;
            _158 = _150;
            _160 = _146;
        }
    }
    if ((false || _120) || _118)
    {
        if ((!_120) || _118)
        {
            _118 = false;
            float _162 = _82 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _164 = _82 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _166 = _82 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _168 = _82 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _170 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[4].x, _162);
            float _172 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[5].x, _164);
            float _174 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[6].x, _166);
            float _176 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[7].x, _168);
            float _178 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[4].z, _170);
            float _180 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[5].z, _172);
            float _182 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[6].z, _174);
            float _184 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[7].z, _176);
            float _186 = _178 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _188 = _180 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _190 = _182 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _192 = _184 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _154 = _192;
            _156 = _188;
            _158 = _190;
            _160 = _186;
        }
        if (false || _120)
        {
            _120 = false;
            float _194 = _82 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _196 = _82 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _198 = _82 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _200 = _82 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _202 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[8].x, _194);
            float _204 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[9].x, _196);
            float _206 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[10].x, _198);
            float _208 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[11].x, _200);
            float _210 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[8].z, _202);
            float _212 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[9].z, _204);
            float _214 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[10].z, _206);
            float _216 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[11].z, _208);
            float _218 = _210 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _220 = _212 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _222 = _214 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _224 = _216 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _154 = _224;
            _156 = _220;
            _158 = _222;
            _160 = _218;
        }
    }
    float _226 = _154;
    float _228 = _156;
    float _230 = _158;
    float _232 = _160;
    float _234 = float(int(_99));
    float _236 = 1.0 / _226;
    float _238 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _240 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _242 = rint(_234);
    float _244 = precise::max(_242, 0.0);
    uint _246 = uint(_244);
    uint _248 = clamp(_246, 0u, 65535u);
    float _250 = _236 * _228;
    float _252 = _236 * _230;
    float _254 = precise::clamp(_252, 0.0, 1.0);
    float _256 = _236 * _232;
    float _258 = fma(_254, _238, _250);
    float _260 = fma(_254, _240, _256);
    float _262 = -_240;
    float _264 = fma(_254, _262, _256);
    float3 _1232 = float3(_256, _258, float(int(_248)));
    float3 _1236 = select(_1232, float3(0.0), isnan(_1232));
    float _266 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1236.xy, uint(rint(_1236.z)), _254);
    float3 _1245 = float3(_260, _258, float(int(_248)));
    float3 _1247 = select(_1245, float3(0.0), isnan(_1245));
    float _268 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1247.xy, uint(rint(_1247.z)), _254);
    float3 _1256 = float3(_264, _258, float(int(_248)));
    float3 _1258 = select(_1256, float3(0.0), isnan(_1256));
    float _270 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1258.xy, uint(rint(_1258.z)), _254);
    float3 _1267 = float3(_260, _250, float(int(_248)));
    float3 _1269 = select(_1267, float3(0.0), isnan(_1267));
    float _272 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1269.xy, uint(rint(_1269.z)), _254);
    float _274 = -_238;
    float _276 = fma(_254, _274, _250);
    float3 _1284 = float3(_256, _250, float(int(_248)));
    float3 _1286 = select(_1284, float3(0.0), isnan(_1284));
    float _278 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1286.xy, uint(rint(_1286.z)), _254);
    float3 _1295 = float3(_264, _250, float(int(_248)));
    float3 _1297 = select(_1295, float3(0.0), isnan(_1295));
    float _280 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1297.xy, uint(rint(_1297.z)), _254);
    float3 _1306 = float3(_260, _276, float(int(_248)));
    float3 _1308 = select(_1306, float3(0.0), isnan(_1306));
    float _282 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1308.xy, uint(rint(_1308.z)), _254);
    float3 _1317 = float3(_256, _276, float(int(_248)));
    float3 _1319 = select(_1317, float3(0.0), isnan(_1317));
    float _284 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1319.xy, uint(rint(_1319.z)), _254);
    float3 _1328 = float3(_264, _276, float(int(_248)));
    float3 _1330 = select(_1328, float3(0.0), isnan(_1328));
    float _286 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1330.xy, uint(rint(_1330.z)), _254);
    float _288 = -_82;
    float _290 = _288 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _292 = -_74;
    float _294 = _292 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _296 = _290 * _290;
    float _298 = fma(_294, _294, _296);
    float _300 = -_72;
    float _302 = _300 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _304 = fma(_302, _302, _298);
    float _306 = sqrt(_304);
    float _308 = _82 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _310 = _82 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _312 = _82 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _314 = _82 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _316 = _82 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _318 = _82 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _320 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[21].x, _308);
    float _322 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[19].x, _310);
    float _324 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[20].x, _312);
    float _326 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[22].x, _314);
    float _328 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[23].x, _316);
    float _330 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[24].x, _318);
    float _332 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[21].z, _320);
    float _334 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[19].z, _322);
    bool _336 = _306 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _338 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[20].z, _324);
    bool _340 = _306 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _342 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[22].z, _326);
    bool _344 = !_336;
    int _346 = _344 ? 0 : 1;
    float _348 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[23].z, _328);
    float _350 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[24].z, _330);
    float _352 = _338 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _354 = _82 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _356 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _358 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[17].x, _354);
    int _360 = 2;
    float _362 = _352;
    if (!_336)
    {
        _360 = 1;
    }
    int _364 = _360;
    int _366 = _364;
    if (!_340)
    {
        _366 = _346;
    }
    int _368 = _366;
    float _370 = _332 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _372 = _334 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _374 = _82 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _376 = float(_368);
    float _378 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[17].z, _358);
    float _380 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[16].x, _374);
    float _382 = precise::min(_376, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _384 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[16].z, _380);
    bool _386 = _382 != 1.0;
    bool _388 = isnan(_382);
    bool _390 = _386 || _388;
    bool _392 = isnan(1.0);
    bool _394 = _390 || _392;
    float _396 = _370;
    float _398 = _372;
    if (_394)
    {
        float _400 = _350 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _396 = _400;
    }
    float _402 = _396;
    float _404 = _402;
    if (_394)
    {
        float _406 = _342 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _398 = _406;
    }
    float _408 = _398;
    float _410 = _408;
    if (_394)
    {
        float _412 = _348 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _362 = _412;
    }
    float _414 = _362;
    bool _416 = _382 != 0.0;
    bool _418 = isnan(_382);
    bool _420 = _416 || _418;
    bool _422 = isnan(0.0);
    bool _424 = _420 || _422;
    float _426 = _82 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _428 = rint(_382);
    float _430 = precise::max(_428, 0.0);
    uint _432 = uint(_430);
    uint _434 = clamp(_432, 0u, 65535u);
    float _436 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _438 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[18].x, _426);
    float _440 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[18].z, _438);
    float _442 = _414;
    if (!_424)
    {
        float _444 = _440 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _404 = _444;
    }
    float _446 = _404;
    if (!_424)
    {
        float _448 = _384 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _410 = _448;
    }
    float _450 = _410;
    if (!_424)
    {
        float _452 = _378 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _442 = _452;
    }
    float _454 = _442;
    float _456 = 0.0 + _446;
    float _458 = precise::clamp(_456, 0.0, 1.0);
    float _460 = fma(_458, _436, _454);
    float _462 = fma(_458, _356, _450);
    float _464 = -_356;
    float _466 = fma(_458, _464, _450);
    float _468 = _268 + _266;
    float _470 = _468 + _270;
    float _472 = _470 + _272;
    float3 _1680 = float3(_450, _460, float(int(_434)));
    float3 _1682 = select(_1680, float3(0.0), isnan(_1680));
    float _474 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1682.xy, uint(rint(_1682.z)), _458);
    float3 _1691 = float3(_462, _460, float(int(_434)));
    float3 _1693 = select(_1691, float3(0.0), isnan(_1691));
    float _476 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1693.xy, uint(rint(_1693.z)), _458);
    float3 _1702 = float3(_466, _460, float(int(_434)));
    float3 _1704 = select(_1702, float3(0.0), isnan(_1702));
    float _478 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1704.xy, uint(rint(_1704.z)), _458);
    float3 _1713 = float3(_462, _454, float(int(_434)));
    float3 _1715 = select(_1713, float3(0.0), isnan(_1713));
    float _480 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1715.xy, uint(rint(_1715.z)), _458);
    float _482 = _472 + _278;
    float3 _1727 = float3(_450, _454, float(int(_434)));
    float3 _1729 = select(_1727, float3(0.0), isnan(_1727));
    float _484 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1729.xy, uint(rint(_1729.z)), _458);
    float _486 = _482 + _280;
    float _488 = _486 + _282;
    float _490 = -_436;
    float _492 = fma(_458, _490, _454);
    float3 _1750 = float3(_466, _454, float(int(_434)));
    float3 _1752 = select(_1750, float3(0.0), isnan(_1750));
    float _494 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1752.xy, uint(rint(_1752.z)), _458);
    float _496 = _488 + _284;
    float3 _1764 = float3(_462, _492, float(int(_434)));
    float3 _1766 = select(_1764, float3(0.0), isnan(_1764));
    float _498 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1766.xy, uint(rint(_1766.z)), _458);
    float2 _1772 = float2(_54, _56);
    float2 _502 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1772, float2(0.0), isnan(_1772))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1772, float2(0.0), isnan(_1772))).xy;
    float _504 = _502.x;
    float _506 = _502.y;
    float3 _1787 = float3(_450, _492, float(int(_434)));
    float3 _1789 = select(_1787, float3(0.0), isnan(_1787));
    float _508 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1789.xy, uint(rint(_1789.z)), _458);
    float _510 = _82 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _512 = _82 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _514 = _82 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _516 = _82 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _518 = _82 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _520 = _82 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _522 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[27].x, _512);
    float _524 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[28].x, _514);
    float _526 = _82 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _528 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[32].x, _520);
    float _530 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[27].z, _522);
    float _532 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[28].z, _524);
    float _534 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[33].x, _526);
    float _536 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[32].z, _528);
    float _538 = -_74;
    float _540 = _538 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _542 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[26].x, _510);
    float _544 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[31].x, _516);
    float _546 = _496 + _286;
    float _548 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[26].z, _542);
    float _550 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[31].z, _544);
    float _552 = _476 + _474;
    float _554 = _552 + _478;
    float _556 = _82 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _558 = _82 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _560 = -_82;
    float _562 = _560 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _564 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[25].x, _556);
    float _566 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[29].x, _518);
    float _568 = _562 * _562;
    float _570 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[30].x, _558);
    float _572 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[29].z, _566);
    float _574 = fma(_540, _540, _568);
    float _576 = -_72;
    float _578 = _576 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _580 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[30].z, _570);
    float _582 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[25].z, _564);
    float _584 = fma(_578, _578, _574);
    float _586 = _580 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _588 = sqrt(_584);
    bool _590 = _588 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _592 = _588 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _594 = !_590;
    int _596 = _594 ? 0 : 1;
    int _598 = 2;
    float _600 = _586;
    if (!_590)
    {
        _598 = 1;
    }
    int _602 = _598;
    int _604 = _602;
    if (!_592)
    {
        _604 = _596;
    }
    int _606 = _604;
    float _608 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[33].z, _534);
    float _610 = _532 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _612 = float(_606);
    float _614 = precise::min(_612, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _616 = _572 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _618 = _554 + _480;
    bool _620 = _614 != 1.0;
    bool _622 = isnan(_614);
    bool _624 = _620 || _622;
    bool _626 = isnan(1.0);
    bool _628 = _624 || _626;
    float _630 = _610;
    float _632 = _616;
    if (_628)
    {
        float _634 = _550 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _630 = _634;
    }
    float _636 = _630;
    float _638 = _636;
    if (_628)
    {
        float _640 = _536 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _632 = _640;
    }
    float _642 = _632;
    float _644 = _642;
    if (_628)
    {
        float _646 = _608 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _600 = _646;
    }
    float _648 = _600;
    bool _650 = _614 != 0.0;
    bool _652 = isnan(_614);
    bool _654 = _650 || _652;
    bool _656 = isnan(0.0);
    bool _658 = _654 || _656;
    float _660 = rint(_614);
    float _662 = precise::max(_660, 0.0);
    uint _664 = uint(_662);
    uint _666 = clamp(_664, 0u, 65535u);
    float _668 = _648;
    if (!_658)
    {
        float _670 = _530 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _668 = _670;
    }
    float _672 = _668;
    if (!_658)
    {
        float _674 = _582 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _638 = _674;
    }
    float _676 = _638;
    if (!_658)
    {
        float _678 = _548 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _644 = _678;
    }
    float _680 = _644;
    float _682 = 0.0 + _672;
    float _684 = precise::clamp(_682, 0.0, 1.0);
    float _686 = fma(_436, _684, _680);
    float _688 = fma(_356, _684, _676);
    float _690 = -_356;
    float _692 = fma(_690, _684, _676);
    float3 _2130 = float3(_466, _492, float(int(_434)));
    float3 _2132 = select(_2130, float3(0.0), isnan(_2130));
    float _694 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2132.xy, uint(rint(_2132.z)), _458);
    float3 _2141 = float3(_676, _686, float(int(_666)));
    float3 _2143 = select(_2141, float3(0.0), isnan(_2141));
    float _696 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2143.xy, uint(rint(_2143.z)), _684);
    float3 _2152 = float3(_688, _686, float(int(_666)));
    float3 _2154 = select(_2152, float3(0.0), isnan(_2152));
    float _698 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2154.xy, uint(rint(_2154.z)), _684);
    float3 _2163 = float3(_692, _686, float(int(_666)));
    float3 _2165 = select(_2163, float3(0.0), isnan(_2163));
    float _700 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2165.xy, uint(rint(_2165.z)), _684);
    float3 _2174 = float3(_688, _680, float(int(_666)));
    float3 _2176 = select(_2174, float3(0.0), isnan(_2174));
    float _702 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2176.xy, uint(rint(_2176.z)), _684);
    float _704 = _618 + _484;
    float _706 = fma(_506, 2.0, -1.0);
    float _708 = _704 + _494;
    float _710 = fma(_504, 2.0, -1.0);
    float _712 = _708 + _498;
    float _714 = _706 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _716 = -_436;
    float _718 = fma(_716, _684, _680);
    float _720 = fma(_714, 2.0, _56);
    float _722 = _710 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float3 _2218 = float3(_676, _680, float(int(_666)));
    float3 _2220 = select(_2218, float3(0.0), isnan(_2218));
    float _724 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2220.xy, uint(rint(_2220.z)), _684);
    float3 _2229 = float3(_692, _680, float(int(_666)));
    float3 _2231 = select(_2229, float3(0.0), isnan(_2229));
    float _726 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2231.xy, uint(rint(_2231.z)), _684);
    float3 _2240 = float3(_688, _718, float(int(_666)));
    float3 _2242 = select(_2240, float3(0.0), isnan(_2240));
    float _728 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2242.xy, uint(rint(_2242.z)), _684);
    float _730 = fma(_722, 2.0, _54);
    float3 _2254 = float3(_676, _718, float(int(_666)));
    float3 _2256 = select(_2254, float3(0.0), isnan(_2254));
    float _732 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2256.xy, uint(rint(_2256.z)), _684);
    float3 _2265 = float3(_692, _718, float(int(_666)));
    float3 _2267 = select(_2265, float3(0.0), isnan(_2265));
    float _734 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2267.xy, uint(rint(_2267.z)), _684);
    float2 _2273 = float2(_730, _720);
    float _736 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2273, float2(0.0), isnan(_2273))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2273, float2(0.0), isnan(_2273))).x;
    float _738 = _712 + _508;
    float _740 = _738 + _694;
    float _742 = _698 + _696;
    float _744 = _742 + _700;
    float _746 = _744 + _702;
    float _748 = _746 + _724;
    float _750 = _748 + _726;
    float _752 = _750 + _728;
    float _754 = _740 * 0.111111111938953399658203125;
    float _756 = _752 + _732;
    float _758 = -_72;
    float _760 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _762 = _758 + _760;
    float _764 = -_72;
    float _766 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _768 = _764 + _766;
    float _770 = _756 + _734;
    float _772 = _762 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _774 = precise::clamp(_772, 0.0, 1.0);
    float _776 = _770 * 0.111111111938953399658203125;
    float _778 = fma(_546, 0.111111111938953399658203125, _774);
    float _780 = _776 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _782 = fma(_754, (*spvDescriptorSet0.fp_c3)._m0[49].z, _780);
    float _784 = _768 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _786 = precise::clamp(_784, 0.0, 1.0);
    float _788 = _782 + _786;
    out.m_47.x = _736;
    out.m_47.y = _778;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _788;
    return out;
}

