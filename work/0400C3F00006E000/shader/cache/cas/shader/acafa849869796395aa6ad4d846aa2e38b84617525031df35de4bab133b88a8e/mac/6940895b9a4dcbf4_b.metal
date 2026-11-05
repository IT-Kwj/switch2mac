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
    bool _116 = false;
    bool _114 = false;
    float _54 = in.m_42.x;
    float _56 = in.m_42.y;
    float2 _796 = float2(_54, _56);
    float _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_796, float2(0.0), isnan(_796))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_796, float2(0.0), isnan(_796))).x;
    float _60 = in.m_44.x;
    float _62 = in.m_44.y;
    float _64 = -_58;
    float _66 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _68 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[46].z, _66);
    float _70 = _68 * _60;
    float _72 = -_68;
    bool _76 = _72 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _78 = _68 * _62;
    float _80 = -_68;
    bool _82 = _80 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _84 = !_76;
    uint _87 = uint(_84 ? 0 : 1);
    uint _89 = 2u;
    if (!_76)
    {
        _89 = 1u;
    }
    uint _91 = _89;
    uint _93 = _91;
    if (!_82)
    {
        _93 = _87;
    }
    uint _95 = _93;
    uint _97 = min(_95, 2u);
    int _100 = int(_97) << 2;
    uint _102 = uint(int(uint(_100) >> uint(2)));
    uint _104 = uint(int(uint(int(_102)) >> uint(2)));
    int _106 = int(_102) & 3;
    float _108 = (*spvDescriptorSet0.fp_c1)._m0[int(_104)][_106];
    bool _110 = as_type<int>(_108) == 336;
    if (!_110)
    {
        bool _112 = as_type<int>(_108) == 608;
        _114 = _112;
        if (!_114)
        {
            _116 = true;
        }
    }
    float _150;
    float _152;
    float _154;
    float _156;
    if (!_114)
    {
        if (!_116)
        {
            float _118 = _78 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _120 = _78 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _122 = _78 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _124 = _78 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _126 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].x, _118);
            float _128 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].x, _120);
            float _130 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].x, _122);
            float _132 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].x, _124);
            float _134 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].z, _126);
            float _136 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].z, _128);
            float _138 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].z, _130);
            float _140 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].z, _132);
            float _142 = _134 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _144 = _136 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _146 = _138 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _148 = _140 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _150 = _148;
            _152 = _144;
            _154 = _146;
            _156 = _142;
        }
    }
    if ((false || _116) || _114)
    {
        if ((!_116) || _114)
        {
            _114 = false;
            float _158 = _78 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _160 = _78 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _162 = _78 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _164 = _78 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _166 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].x, _158);
            float _168 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[5].x, _160);
            float _170 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[6].x, _162);
            float _172 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[7].x, _164);
            float _174 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[4].z, _166);
            float _176 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[5].z, _168);
            float _178 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[6].z, _170);
            float _180 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[7].z, _172);
            float _182 = _174 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _184 = _176 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _186 = _178 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _188 = _180 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _150 = _188;
            _152 = _184;
            _154 = _186;
            _156 = _182;
        }
        if (false || _116)
        {
            _116 = false;
            float _190 = _78 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _192 = _78 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _194 = _78 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _196 = _78 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _198 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[8].x, _190);
            float _200 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[9].x, _192);
            float _202 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[10].x, _194);
            float _204 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[11].x, _196);
            float _206 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[8].z, _198);
            float _208 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[9].z, _200);
            float _210 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[10].z, _202);
            float _212 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[11].z, _204);
            float _214 = _206 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _216 = _208 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _218 = _210 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _220 = _212 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _150 = _220;
            _152 = _216;
            _154 = _218;
            _156 = _214;
        }
    }
    float _222 = _150;
    float _224 = _152;
    float _226 = _154;
    float _228 = _156;
    float _230 = float(int(_95));
    float _232 = 1.0 / _222;
    float _234 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _236 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _238 = rint(_230);
    float _240 = precise::max(_238, 0.0);
    uint _242 = uint(_240);
    uint _244 = clamp(_242, 0u, 65535u);
    float _246 = _232 * _224;
    float _248 = _232 * _226;
    float _250 = precise::clamp(_248, 0.0, 1.0);
    float _252 = _232 * _228;
    float _254 = fma(_250, _234, _246);
    float _256 = fma(_250, _236, _252);
    float _258 = -_236;
    float _260 = fma(_250, _258, _252);
    float3 _1224 = float3(_252, _254, float(int(_244)));
    float3 _1228 = select(_1224, float3(0.0), isnan(_1224));
    float _262 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1228.xy, uint(rint(_1228.z)), _250);
    float3 _1237 = float3(_256, _254, float(int(_244)));
    float3 _1239 = select(_1237, float3(0.0), isnan(_1237));
    float _264 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1239.xy, uint(rint(_1239.z)), _250);
    float3 _1248 = float3(_260, _254, float(int(_244)));
    float3 _1250 = select(_1248, float3(0.0), isnan(_1248));
    float _266 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1250.xy, uint(rint(_1250.z)), _250);
    float3 _1259 = float3(_256, _246, float(int(_244)));
    float3 _1261 = select(_1259, float3(0.0), isnan(_1259));
    float _268 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1261.xy, uint(rint(_1261.z)), _250);
    float _270 = -_234;
    float _272 = fma(_250, _270, _246);
    float3 _1276 = float3(_252, _246, float(int(_244)));
    float3 _1278 = select(_1276, float3(0.0), isnan(_1276));
    float _274 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1278.xy, uint(rint(_1278.z)), _250);
    float3 _1287 = float3(_260, _246, float(int(_244)));
    float3 _1289 = select(_1287, float3(0.0), isnan(_1287));
    float _276 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1289.xy, uint(rint(_1289.z)), _250);
    float3 _1298 = float3(_256, _272, float(int(_244)));
    float3 _1300 = select(_1298, float3(0.0), isnan(_1298));
    float _278 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1300.xy, uint(rint(_1300.z)), _250);
    float3 _1309 = float3(_252, _272, float(int(_244)));
    float3 _1311 = select(_1309, float3(0.0), isnan(_1309));
    float _280 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1311.xy, uint(rint(_1311.z)), _250);
    float3 _1320 = float3(_260, _272, float(int(_244)));
    float3 _1322 = select(_1320, float3(0.0), isnan(_1320));
    float _282 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1322.xy, uint(rint(_1322.z)), _250);
    float _284 = -_78;
    float _286 = _284 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _288 = -_70;
    float _290 = _288 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _292 = _286 * _286;
    float _294 = fma(_290, _290, _292);
    float _296 = -_68;
    float _298 = _296 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _300 = fma(_298, _298, _294);
    float _302 = sqrt(_300);
    float _304 = _78 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _306 = _78 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _308 = _78 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _310 = _78 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _312 = _78 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _314 = _78 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _316 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[21].x, _304);
    float _318 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[19].x, _306);
    float _320 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[20].x, _308);
    float _322 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[22].x, _310);
    float _324 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[23].x, _312);
    float _326 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[24].x, _314);
    float _328 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[21].z, _316);
    float _330 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[19].z, _318);
    bool _332 = _302 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _334 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[20].z, _320);
    bool _336 = _302 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _338 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[22].z, _322);
    bool _340 = !_332;
    int _342 = _340 ? 0 : 1;
    float _344 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[23].z, _324);
    float _346 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[24].z, _326);
    float _348 = _334 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _350 = _78 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _352 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _354 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[17].x, _350);
    int _356 = 2;
    float _358 = _348;
    if (!_332)
    {
        _356 = 1;
    }
    int _360 = _356;
    int _362 = _360;
    if (!_336)
    {
        _362 = _342;
    }
    int _364 = _362;
    float _366 = _328 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _368 = _330 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _370 = _78 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _372 = float(_364);
    float _374 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[17].z, _354);
    float _376 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[16].x, _370);
    float _378 = precise::min(_372, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _380 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[16].z, _376);
    bool _382 = _378 != 1.0;
    bool _384 = isnan(_378);
    bool _386 = _382 || _384;
    bool _388 = isnan(1.0);
    bool _390 = _386 || _388;
    float _392 = _366;
    float _394 = _368;
    if (_390)
    {
        float _396 = _346 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _392 = _396;
    }
    float _398 = _392;
    float _400 = _398;
    if (_390)
    {
        float _402 = _338 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _394 = _402;
    }
    float _404 = _394;
    float _406 = _404;
    if (_390)
    {
        float _408 = _344 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _358 = _408;
    }
    float _410 = _358;
    bool _412 = _378 != 0.0;
    bool _414 = isnan(_378);
    bool _416 = _412 || _414;
    bool _418 = isnan(0.0);
    bool _420 = _416 || _418;
    float _422 = _78 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _424 = rint(_378);
    float _426 = precise::max(_424, 0.0);
    uint _428 = uint(_426);
    uint _430 = clamp(_428, 0u, 65535u);
    float _432 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _434 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[18].x, _422);
    float _436 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[18].z, _434);
    float _438 = _410;
    if (!_420)
    {
        float _440 = _436 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _400 = _440;
    }
    float _442 = _400;
    if (!_420)
    {
        float _444 = _380 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _406 = _444;
    }
    float _446 = _406;
    if (!_420)
    {
        float _448 = _374 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _438 = _448;
    }
    float _450 = _438;
    float _452 = 0.0 + _442;
    float _454 = precise::clamp(_452, 0.0, 1.0);
    float _456 = fma(_454, _432, _450);
    float _458 = fma(_454, _352, _446);
    float _460 = -_352;
    float _462 = fma(_454, _460, _446);
    float _464 = _264 + _262;
    float _466 = _464 + _266;
    float _468 = _466 + _268;
    float3 _1672 = float3(_446, _456, float(int(_430)));
    float3 _1674 = select(_1672, float3(0.0), isnan(_1672));
    float _470 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1674.xy, uint(rint(_1674.z)), _454);
    float3 _1683 = float3(_458, _456, float(int(_430)));
    float3 _1685 = select(_1683, float3(0.0), isnan(_1683));
    float _472 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1685.xy, uint(rint(_1685.z)), _454);
    float3 _1694 = float3(_462, _456, float(int(_430)));
    float3 _1696 = select(_1694, float3(0.0), isnan(_1694));
    float _474 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1696.xy, uint(rint(_1696.z)), _454);
    float3 _1705 = float3(_458, _450, float(int(_430)));
    float3 _1707 = select(_1705, float3(0.0), isnan(_1705));
    float _476 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1707.xy, uint(rint(_1707.z)), _454);
    float _478 = _468 + _274;
    float3 _1719 = float3(_446, _450, float(int(_430)));
    float3 _1721 = select(_1719, float3(0.0), isnan(_1719));
    float _480 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1721.xy, uint(rint(_1721.z)), _454);
    float _482 = _478 + _276;
    float _484 = _482 + _278;
    float _486 = -_432;
    float _488 = fma(_454, _486, _450);
    float3 _1742 = float3(_462, _450, float(int(_430)));
    float3 _1744 = select(_1742, float3(0.0), isnan(_1742));
    float _490 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1744.xy, uint(rint(_1744.z)), _454);
    float _492 = _484 + _280;
    float3 _1756 = float3(_458, _488, float(int(_430)));
    float3 _1758 = select(_1756, float3(0.0), isnan(_1756));
    float _494 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1758.xy, uint(rint(_1758.z)), _454);
    float2 _1764 = float2(_54, _56);
    float2 _498 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1764, float2(0.0), isnan(_1764))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1764, float2(0.0), isnan(_1764))).xy;
    float _500 = _498.x;
    float _502 = _498.y;
    float3 _1779 = float3(_446, _488, float(int(_430)));
    float3 _1781 = select(_1779, float3(0.0), isnan(_1779));
    float _504 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1781.xy, uint(rint(_1781.z)), _454);
    float _506 = _78 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _508 = _78 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _510 = _78 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _512 = _78 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _514 = _78 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _516 = _78 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _518 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[27].x, _508);
    float _520 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[28].x, _510);
    float _522 = _78 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _524 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[32].x, _516);
    float _526 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[27].z, _518);
    float _528 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[28].z, _520);
    float _530 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[33].x, _522);
    float _532 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[32].z, _524);
    float _534 = -_70;
    float _536 = _534 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _538 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[26].x, _506);
    float _540 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[31].x, _512);
    float _542 = _492 + _282;
    float _544 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[26].z, _538);
    float _546 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[31].z, _540);
    float _548 = _472 + _470;
    float _550 = _548 + _474;
    float _552 = _78 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _554 = _78 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _556 = -_78;
    float _558 = _556 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _560 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[25].x, _552);
    float _562 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[29].x, _514);
    float _564 = _558 * _558;
    float _566 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[30].x, _554);
    float _568 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[29].z, _562);
    float _570 = fma(_536, _536, _564);
    float _572 = -_68;
    float _574 = _572 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _576 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[30].z, _566);
    float _578 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[25].z, _560);
    float _580 = fma(_574, _574, _570);
    float _582 = _576 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _584 = sqrt(_580);
    bool _586 = _584 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _588 = _584 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _590 = !_586;
    int _592 = _590 ? 0 : 1;
    int _594 = 2;
    float _596 = _582;
    if (!_586)
    {
        _594 = 1;
    }
    int _598 = _594;
    int _600 = _598;
    if (!_588)
    {
        _600 = _592;
    }
    int _602 = _600;
    float _604 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[33].z, _530);
    float _606 = _528 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _608 = float(_602);
    float _610 = precise::min(_608, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _612 = _568 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _614 = _550 + _476;
    bool _616 = _610 != 1.0;
    bool _618 = isnan(_610);
    bool _620 = _616 || _618;
    bool _622 = isnan(1.0);
    bool _624 = _620 || _622;
    float _626 = _606;
    float _628 = _612;
    if (_624)
    {
        float _630 = _546 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _626 = _630;
    }
    float _632 = _626;
    float _634 = _632;
    if (_624)
    {
        float _636 = _532 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _628 = _636;
    }
    float _638 = _628;
    float _640 = _638;
    if (_624)
    {
        float _642 = _604 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _596 = _642;
    }
    float _644 = _596;
    bool _646 = _610 != 0.0;
    bool _648 = isnan(_610);
    bool _650 = _646 || _648;
    bool _652 = isnan(0.0);
    bool _654 = _650 || _652;
    float _656 = rint(_610);
    float _658 = precise::max(_656, 0.0);
    uint _660 = uint(_658);
    uint _662 = clamp(_660, 0u, 65535u);
    float _664 = _644;
    if (!_654)
    {
        float _666 = _526 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _664 = _666;
    }
    float _668 = _664;
    if (!_654)
    {
        float _670 = _578 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _634 = _670;
    }
    float _672 = _634;
    if (!_654)
    {
        float _674 = _544 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _640 = _674;
    }
    float _676 = _640;
    float _678 = 0.0 + _668;
    float _680 = precise::clamp(_678, 0.0, 1.0);
    float _682 = fma(_432, _680, _676);
    float _684 = fma(_352, _680, _672);
    float _686 = -_352;
    float _688 = fma(_686, _680, _672);
    float3 _2122 = float3(_462, _488, float(int(_430)));
    float3 _2124 = select(_2122, float3(0.0), isnan(_2122));
    float _690 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2124.xy, uint(rint(_2124.z)), _454);
    float3 _2133 = float3(_672, _682, float(int(_662)));
    float3 _2135 = select(_2133, float3(0.0), isnan(_2133));
    float _692 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2135.xy, uint(rint(_2135.z)), _680);
    float3 _2144 = float3(_684, _682, float(int(_662)));
    float3 _2146 = select(_2144, float3(0.0), isnan(_2144));
    float _694 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2146.xy, uint(rint(_2146.z)), _680);
    float3 _2155 = float3(_688, _682, float(int(_662)));
    float3 _2157 = select(_2155, float3(0.0), isnan(_2155));
    float _696 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2157.xy, uint(rint(_2157.z)), _680);
    float3 _2166 = float3(_684, _676, float(int(_662)));
    float3 _2168 = select(_2166, float3(0.0), isnan(_2166));
    float _698 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2168.xy, uint(rint(_2168.z)), _680);
    float _700 = _614 + _480;
    float _702 = fma(_502, 2.0, -1.0);
    float _704 = _700 + _490;
    float _706 = fma(_500, 2.0, -1.0);
    float _708 = _704 + _494;
    float _710 = _702 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _712 = -_432;
    float _714 = fma(_712, _680, _676);
    float _716 = fma(_710, 2.0, _56);
    float _718 = _706 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float3 _2210 = float3(_672, _676, float(int(_662)));
    float3 _2212 = select(_2210, float3(0.0), isnan(_2210));
    float _720 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2212.xy, uint(rint(_2212.z)), _680);
    float3 _2221 = float3(_688, _676, float(int(_662)));
    float3 _2223 = select(_2221, float3(0.0), isnan(_2221));
    float _722 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2223.xy, uint(rint(_2223.z)), _680);
    float3 _2232 = float3(_684, _714, float(int(_662)));
    float3 _2234 = select(_2232, float3(0.0), isnan(_2232));
    float _724 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2234.xy, uint(rint(_2234.z)), _680);
    float _726 = fma(_718, 2.0, _54);
    float3 _2246 = float3(_672, _714, float(int(_662)));
    float3 _2248 = select(_2246, float3(0.0), isnan(_2246));
    float _728 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2248.xy, uint(rint(_2248.z)), _680);
    float3 _2257 = float3(_688, _714, float(int(_662)));
    float3 _2259 = select(_2257, float3(0.0), isnan(_2257));
    float _730 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2259.xy, uint(rint(_2259.z)), _680);
    float2 _2265 = float2(_726, _716);
    float _732 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2265, float2(0.0), isnan(_2265))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2265, float2(0.0), isnan(_2265))).x;
    float _734 = _708 + _504;
    float _736 = _734 + _690;
    float _738 = _694 + _692;
    float _740 = _738 + _696;
    float _742 = _740 + _698;
    float _744 = _742 + _720;
    float _746 = _744 + _722;
    float _748 = _746 + _724;
    float _750 = _736 * 0.111111111938953399658203125;
    float _752 = _748 + _728;
    float _754 = -_68;
    float _756 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _758 = _754 + _756;
    float _760 = -_68;
    float _762 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _764 = _760 + _762;
    float _766 = _752 + _730;
    float _768 = _758 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _770 = precise::clamp(_768, 0.0, 1.0);
    float _772 = _766 * 0.111111111938953399658203125;
    float _774 = fma(_542, 0.111111111938953399658203125, _770);
    float _776 = _772 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _778 = fma(_750, (*spvDescriptorSet0.fp_c3)._m0[49].z, _776);
    float _780 = _764 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _782 = precise::clamp(_780, 0.0, 1.0);
    float _784 = _778 + _782;
    out.m_47.x = _732;
    out.m_47.y = _774;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _784;
    return out;
}

