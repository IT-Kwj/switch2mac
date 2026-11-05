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
    texture2d_array<float> fp_t_tcb_12 [[id(8)]];
    sampler fp_t_tcb_12Smplr [[id(9)]];
    texture2d<float> fp_t_tcb_C [[id(10)]];
    sampler fp_t_tcb_CSmplr [[id(11)]];
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
    float2 _904 = float2(_54, _56);
    float _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_904, float2(0.0), isnan(_904))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_904, float2(0.0), isnan(_904))).x;
    float _60 = in.m_44.y;
    float _62 = -_58;
    float _64 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _66 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[46].z, _64);
    float _68 = in.m_44.x;
    float _70 = -_66;
    bool _74 = _70 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _76 = -_66;
    bool _78 = _76 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _80 = !_74;
    uint _83 = uint(_80 ? 0 : 1);
    uint _85 = 2u;
    if (!_74)
    {
        _85 = 1u;
    }
    uint _87 = _85;
    uint _89 = _87;
    if (!_78)
    {
        _89 = _83;
    }
    uint _91 = _89;
    uint _93 = min(_91, 2u);
    int _96 = int(_93) << 2;
    float _98 = _66 * _60;
    uint _100 = uint(int(uint(_96) >> uint(2)));
    uint _102 = uint(int(uint(int(_100)) >> uint(2)));
    int _104 = int(_100) & 3;
    float _106 = (*spvDescriptorSet0.fp_c1)._m0[int(_102)][_104];
    float _108 = _66 * _68;
    bool _110 = as_type<int>(_106) == 336;
    if (!_110)
    {
        bool _112 = as_type<int>(_106) == 608;
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
            float _118 = _98 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _120 = _98 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _122 = _98 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _124 = _98 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _126 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[0].x, _118);
            float _128 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[1].x, _120);
            float _130 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[2].x, _122);
            float _132 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[3].x, _124);
            float _134 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].z, _126);
            float _136 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].z, _128);
            float _138 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].z, _130);
            float _140 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].z, _132);
            float _142 = _134 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _144 = _136 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _146 = _138 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _148 = _140 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _150 = _148;
            _152 = _146;
            _154 = _142;
            _156 = _144;
        }
    }
    if ((false || _116) || _114)
    {
        if ((!_116) || _114)
        {
            _114 = false;
            float _158 = _98 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _160 = _98 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _162 = _98 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _164 = _98 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _166 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[4].x, _158);
            float _168 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[5].x, _160);
            float _170 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[6].x, _162);
            float _172 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[7].x, _164);
            float _174 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].z, _166);
            float _176 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[5].z, _168);
            float _178 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[6].z, _170);
            float _180 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[7].z, _172);
            float _182 = _174 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _184 = _176 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _186 = _178 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _188 = _180 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _150 = _188;
            _152 = _186;
            _154 = _182;
            _156 = _184;
        }
        if (false || _116)
        {
            _116 = false;
            float _190 = _98 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _192 = _98 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _194 = _98 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _196 = _98 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _198 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[8].x, _190);
            float _200 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[9].x, _192);
            float _202 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[10].x, _194);
            float _204 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[11].x, _196);
            float _206 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[8].z, _198);
            float _208 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[9].z, _200);
            float _210 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[10].z, _202);
            float _212 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[11].z, _204);
            float _214 = _206 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _216 = _208 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _218 = _210 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _220 = _212 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _150 = _220;
            _152 = _218;
            _154 = _214;
            _156 = _216;
        }
    }
    float _222 = _150;
    float _224 = _152;
    float _226 = _154;
    float _228 = _156;
    float _230 = 1.0 / _222;
    float _232 = float(int(_91));
    float _234 = rint(_232);
    float _236 = precise::max(_234, 0.0);
    uint _238 = uint(_236);
    uint _240 = clamp(_238, 0u, 65535u);
    float _242 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _244 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _246 = _230 * _224;
    float _248 = precise::clamp(_246, 0.0, 1.0);
    float _250 = _230 * _226;
    float _252 = _230 * _228;
    float _254 = _248 * _242;
    float _256 = _248 * _244;
    float _258 = fma(_254, 0.5, _250);
    float _260 = fma(_256, 1.5, _252);
    float _262 = fma(_254, 1.5, _250);
    float _264 = fma(_254, -0.5, _250);
    float _266 = fma(_254, -1.5, _250);
    float3 _1343 = float3(_258, _260, float(int(_240)));
    float3 _1347 = select(_1343, float3(0.0), isnan(_1343));
    float _268 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1347.xy, uint(rint(_1347.z)), _248);
    float3 _1356 = float3(_262, _260, float(int(_240)));
    float3 _1358 = select(_1356, float3(0.0), isnan(_1356));
    float _270 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1358.xy, uint(rint(_1358.z)), _248);
    float3 _1367 = float3(_264, _260, float(int(_240)));
    float3 _1369 = select(_1367, float3(0.0), isnan(_1367));
    float _272 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1369.xy, uint(rint(_1369.z)), _248);
    float _274 = fma(_256, 0.5, _252);
    float3 _1381 = float3(_266, _260, float(int(_240)));
    float3 _1383 = select(_1381, float3(0.0), isnan(_1381));
    float _276 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1383.xy, uint(rint(_1383.z)), _248);
    float3 _1392 = float3(_262, _274, float(int(_240)));
    float3 _1394 = select(_1392, float3(0.0), isnan(_1392));
    float _278 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1394.xy, uint(rint(_1394.z)), _248);
    float3 _1403 = float3(_258, _274, float(int(_240)));
    float3 _1405 = select(_1403, float3(0.0), isnan(_1403));
    float _280 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1405.xy, uint(rint(_1405.z)), _248);
    float _282 = _270 + _268;
    float _284 = _282 + _272;
    float _286 = _284 + _276;
    float _288 = _286 + _278;
    float _290 = _288 + _280;
    float _292 = fma(_256, -0.5, _252);
    float3 _1432 = float3(_264, _274, float(int(_240)));
    float3 _1434 = select(_1432, float3(0.0), isnan(_1432));
    float _294 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1434.xy, uint(rint(_1434.z)), _248);
    float3 _1443 = float3(_266, _274, float(int(_240)));
    float3 _1445 = select(_1443, float3(0.0), isnan(_1443));
    float _296 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1445.xy, uint(rint(_1445.z)), _248);
    float3 _1454 = float3(_262, _292, float(int(_240)));
    float3 _1456 = select(_1454, float3(0.0), isnan(_1454));
    float _298 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1456.xy, uint(rint(_1456.z)), _248);
    float3 _1465 = float3(_258, _292, float(int(_240)));
    float3 _1467 = select(_1465, float3(0.0), isnan(_1465));
    float _300 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1467.xy, uint(rint(_1467.z)), _248);
    float3 _1476 = float3(_264, _292, float(int(_240)));
    float3 _1478 = select(_1476, float3(0.0), isnan(_1476));
    float _302 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1478.xy, uint(rint(_1478.z)), _248);
    float3 _1487 = float3(_266, _292, float(int(_240)));
    float3 _1489 = select(_1487, float3(0.0), isnan(_1487));
    float _304 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1489.xy, uint(rint(_1489.z)), _248);
    float _306 = -_98;
    float _308 = _306 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _310 = fma(_256, -1.5, _252);
    float _312 = -_108;
    float _314 = _312 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _316 = _308 * _308;
    float _318 = -_66;
    float _320 = _318 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _322 = fma(_314, _314, _316);
    float _324 = fma(_320, _320, _322);
    float _326 = sqrt(_324);
    bool _328 = _326 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _330 = _326 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _332 = !_328;
    int _334 = _332 ? 0 : 1;
    float _336 = _98 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _338 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[22].x, _336);
    float _340 = _98 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    int _342 = 2;
    if (!_328)
    {
        _342 = 1;
    }
    int _344 = _342;
    float _346 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[22].z, _338);
    int _348 = _344;
    if (!_330)
    {
        _348 = _334;
    }
    int _350 = _348;
    float _352 = float(_350);
    float _354 = _98 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _356 = precise::min(_352, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _358 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[19].x, _354);
    float _360 = _98 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    bool _362 = _356 != 1.0;
    bool _364 = isnan(_356);
    bool _366 = _362 || _364;
    bool _368 = isnan(1.0);
    bool _370 = _366 || _368;
    float _372 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[19].z, _358);
    float _374 = _372 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _376 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[20].x, _360);
    float3 _1625 = float3(_262, _310, float(int(_240)));
    float3 _1627 = select(_1625, float3(0.0), isnan(_1625));
    float _378 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1627.xy, uint(rint(_1627.z)), _248);
    float _380 = _98 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _382 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[20].z, _376);
    float _384 = _374;
    if (_370)
    {
        float _386 = _346 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _384 = _386;
    }
    float _388 = _384;
    float _390 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[23].x, _340);
    float _392 = _98 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _394 = _382 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _396 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[21].x, _380);
    float _398 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[23].z, _390);
    float _400 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[21].z, _396);
    float _402 = _394;
    float _404 = _388;
    if (_370)
    {
        float _406 = _398 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _402 = _406;
    }
    float _408 = _402;
    float _410 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[24].x, _392);
    float _412 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[24].z, _410);
    float3 _1706 = float3(_258, _310, float(int(_240)));
    float3 _1708 = select(_1706, float3(0.0), isnan(_1706));
    float _414 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1708.xy, uint(rint(_1708.z)), _248);
    float3 _1717 = float3(_264, _310, float(int(_240)));
    float3 _1719 = select(_1717, float3(0.0), isnan(_1717));
    float _416 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1719.xy, uint(rint(_1719.z)), _248);
    float _418 = _400 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _420 = _418;
    float _422 = _408;
    if (_370)
    {
        float _424 = _412 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _420 = _424;
    }
    float _426 = _420;
    bool _428 = _356 != 0.0;
    bool _430 = isnan(_356);
    bool _432 = _428 || _430;
    bool _434 = isnan(0.0);
    bool _436 = _432 || _434;
    float _438 = _98 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _440 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[16].x, _438);
    float _442 = _98 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _444 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[16].z, _440);
    float _446 = _426;
    if (!_436)
    {
        float _448 = _444 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _404 = _448;
    }
    float _450 = _404;
    float _452 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[17].x, _442);
    float _454 = _98 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _456 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[17].z, _452);
    if (!_436)
    {
        float _458 = _456 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _422 = _458;
    }
    float _460 = _422;
    float _462 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[18].x, _454);
    float _464 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _466 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[18].z, _462);
    if (!_436)
    {
        float _468 = _466 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _446 = _468;
    }
    float _470 = _446;
    float _472 = 0.0 + _470;
    float _474 = precise::clamp(_472, 0.0, 1.0);
    float _476 = _290 + _294;
    float _478 = _476 + _296;
    float _480 = rint(_356);
    float _482 = precise::max(_480, 0.0);
    uint _484 = uint(_482);
    uint _486 = clamp(_484, 0u, 65535u);
    float _488 = _478 + _298;
    float _490 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _492 = _474 * _464;
    float _494 = _488 + _300;
    float _496 = fma(_492, 1.5, _460);
    float _498 = _494 + _302;
    float _500 = _474 * _490;
    float _502 = fma(_500, 0.5, _450);
    float _504 = fma(_500, -0.5, _450);
    float3 _1882 = float3(_266, _310, float(int(_240)));
    float3 _1884 = select(_1882, float3(0.0), isnan(_1882));
    float _506 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1884.xy, uint(rint(_1884.z)), _248);
    float3 _1893 = float3(_502, _496, float(int(_486)));
    float3 _1895 = select(_1893, float3(0.0), isnan(_1893));
    float _508 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1895.xy, uint(rint(_1895.z)), _474);
    float3 _1904 = float3(_504, _496, float(int(_486)));
    float3 _1906 = select(_1904, float3(0.0), isnan(_1904));
    float _510 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1906.xy, uint(rint(_1906.z)), _474);
    float _512 = _498 + _304;
    float _514 = fma(_500, 1.5, _450);
    float _516 = fma(_500, -1.5, _450);
    float _518 = fma(_492, 0.5, _460);
    float _520 = _512 + _378;
    float _522 = _520 + _414;
    float _524 = _522 + _416;
    float3 _1936 = float3(_516, _496, float(int(_486)));
    float3 _1938 = select(_1936, float3(0.0), isnan(_1936));
    float _526 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1938.xy, uint(rint(_1938.z)), _474);
    float3 _1947 = float3(_514, _496, float(int(_486)));
    float3 _1949 = select(_1947, float3(0.0), isnan(_1947));
    float _528 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1949.xy, uint(rint(_1949.z)), _474);
    float3 _1958 = float3(_514, _518, float(int(_486)));
    float3 _1960 = select(_1958, float3(0.0), isnan(_1958));
    float _530 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1960.xy, uint(rint(_1960.z)), _474);
    float3 _1969 = float3(_502, _518, float(int(_486)));
    float3 _1971 = select(_1969, float3(0.0), isnan(_1969));
    float _532 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1971.xy, uint(rint(_1971.z)), _474);
    float3 _1980 = float3(_504, _518, float(int(_486)));
    float3 _1982 = select(_1980, float3(0.0), isnan(_1980));
    float _534 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1982.xy, uint(rint(_1982.z)), _474);
    float3 _1991 = float3(_516, _518, float(int(_486)));
    float3 _1993 = select(_1991, float3(0.0), isnan(_1991));
    float _536 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1993.xy, uint(rint(_1993.z)), _474);
    float _538 = fma(_492, -1.5, _460);
    float _540 = _524 + _506;
    float _542 = _528 + _508;
    float _544 = _542 + _510;
    float _546 = _544 + _526;
    float _548 = fma(_492, -0.5, _460);
    float _550 = _546 + _530;
    float3 _2023 = float3(_514, _548, float(int(_486)));
    float3 _2025 = select(_2023, float3(0.0), isnan(_2023));
    float _552 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2025.xy, uint(rint(_2025.z)), _474);
    float _554 = _550 + _532;
    float3 _2037 = float3(_502, _548, float(int(_486)));
    float3 _2039 = select(_2037, float3(0.0), isnan(_2037));
    float _556 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2039.xy, uint(rint(_2039.z)), _474);
    float _558 = _554 + _534;
    float3 _2051 = float3(_504, _548, float(int(_486)));
    float3 _2053 = select(_2051, float3(0.0), isnan(_2051));
    float _560 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2053.xy, uint(rint(_2053.z)), _474);
    float3 _2062 = float3(_516, _548, float(int(_486)));
    float3 _2064 = select(_2062, float3(0.0), isnan(_2062));
    float _562 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2064.xy, uint(rint(_2064.z)), _474);
    float3 _2073 = float3(_514, _538, float(int(_486)));
    float3 _2075 = select(_2073, float3(0.0), isnan(_2073));
    float _564 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2075.xy, uint(rint(_2075.z)), _474);
    float3 _2084 = float3(_502, _538, float(int(_486)));
    float3 _2086 = select(_2084, float3(0.0), isnan(_2084));
    float _566 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2086.xy, uint(rint(_2086.z)), _474);
    float3 _2095 = float3(_504, _538, float(int(_486)));
    float3 _2097 = select(_2095, float3(0.0), isnan(_2095));
    float _568 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2097.xy, uint(rint(_2097.z)), _474);
    float _570 = _98 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _572 = _98 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _574 = _98 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _576 = _98 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _578 = _98 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _580 = _98 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _582 = _98 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _584 = _98 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _586 = _98 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _588 = _558 + _536;
    float _590 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[25].x, _572);
    float _592 = -_98;
    float _594 = _592 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _596 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[29].x, _570);
    float _598 = -_108;
    float _600 = _598 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _602 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[27].x, _576);
    float _604 = _594 * _594;
    float _606 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[28].x, _578);
    float _608 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[26].x, _574);
    float _610 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[30].x, _580);
    float _612 = fma(_600, _600, _604);
    float _614 = -_66;
    float _616 = _614 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _618 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[31].x, _582);
    float _620 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[32].x, _584);
    float _622 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[33].x, _586);
    float _624 = fma(_616, _616, _612);
    float _626 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[28].z, _606);
    float _628 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[29].z, _596);
    float _630 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[30].z, _610);
    float _632 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[31].z, _618);
    float _634 = sqrt(_624);
    float _636 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[32].z, _620);
    float _638 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[33].z, _622);
    float _640 = _626 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _642 = _628 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _644 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[27].z, _602);
    float _646 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[25].z, _590);
    float _648 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[26].z, _608);
    bool _650 = _634 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _652 = _634 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _654 = !_650;
    int _656 = _654 ? 0 : 1;
    int _658 = 2;
    float _660 = _640;
    float _662 = _642;
    if (!_650)
    {
        _658 = 1;
    }
    int _664 = _658;
    int _666 = _664;
    if (!_652)
    {
        _666 = _656;
    }
    int _668 = _666;
    float _670 = _630 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _672 = float(_668);
    float _674 = precise::min(_672, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _676 = _674 != 1.0;
    bool _678 = isnan(_674);
    bool _680 = _676 || _678;
    bool _682 = isnan(1.0);
    bool _684 = _680 || _682;
    float _686 = _670;
    if (_684)
    {
        float _688 = _632 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _660 = _688;
    }
    float _690 = _660;
    float _692 = _690;
    if (_684)
    {
        float _694 = _636 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _662 = _694;
    }
    float _696 = _662;
    float _698 = _696;
    if (_684)
    {
        float _700 = _638 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _686 = _700;
    }
    float _702 = _686;
    bool _704 = _674 != 0.0;
    bool _706 = isnan(_674);
    bool _708 = _704 || _706;
    bool _710 = isnan(0.0);
    bool _712 = _708 || _710;
    float _714 = rint(_674);
    float _716 = precise::max(_714, 0.0);
    uint _718 = uint(_716);
    uint _720 = clamp(_718, 0u, 65535u);
    float _722 = _702;
    if (!_712)
    {
        float _724 = _644 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _722 = _724;
    }
    float _726 = _722;
    if (!_712)
    {
        float _728 = _646 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _692 = _728;
    }
    float _730 = _692;
    if (!_712)
    {
        float _732 = _648 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _698 = _732;
    }
    float _734 = _698;
    float _736 = 0.0 + _726;
    float _738 = precise::clamp(_736, 0.0, 1.0);
    float _740 = _588 + _552;
    float _742 = _490 * _738;
    float _744 = _740 + _556;
    float _746 = fma(_742, 0.5, _730);
    float _748 = fma(_742, -0.5, _730);
    float _750 = fma(_742, -1.5, _730);
    float _752 = _744 + _560;
    float _754 = _464 * _738;
    float3 _2439 = float3(_516, _538, float(int(_486)));
    float3 _2441 = select(_2439, float3(0.0), isnan(_2439));
    float _756 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2441.xy, uint(rint(_2441.z)), _474);
    float _758 = fma(_754, 1.5, _734);
    float3 _2453 = float3(_746, _758, float(int(_720)));
    float3 _2455 = select(_2453, float3(0.0), isnan(_2453));
    float _760 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2455.xy, uint(rint(_2455.z)), _738);
    float3 _2464 = float3(_748, _758, float(int(_720)));
    float3 _2466 = select(_2464, float3(0.0), isnan(_2464));
    float _762 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2466.xy, uint(rint(_2466.z)), _738);
    float3 _2475 = float3(_750, _758, float(int(_720)));
    float3 _2477 = select(_2475, float3(0.0), isnan(_2475));
    float _764 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2477.xy, uint(rint(_2477.z)), _738);
    float _766 = fma(_742, 1.5, _730);
    float _768 = fma(_754, 0.5, _734);
    float3 _2492 = float3(_766, _758, float(int(_720)));
    float3 _2494 = select(_2492, float3(0.0), isnan(_2492));
    float _770 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2494.xy, uint(rint(_2494.z)), _738);
    float3 _2503 = float3(_766, _768, float(int(_720)));
    float3 _2505 = select(_2503, float3(0.0), isnan(_2503));
    float _772 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2505.xy, uint(rint(_2505.z)), _738);
    float3 _2514 = float3(_746, _768, float(int(_720)));
    float3 _2516 = select(_2514, float3(0.0), isnan(_2514));
    float _774 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2516.xy, uint(rint(_2516.z)), _738);
    float3 _2525 = float3(_748, _768, float(int(_720)));
    float3 _2527 = select(_2525, float3(0.0), isnan(_2525));
    float _776 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2527.xy, uint(rint(_2527.z)), _738);
    float2 _2533 = float2(_54, _56);
    float2 _780 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2533, float2(0.0), isnan(_2533))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2533, float2(0.0), isnan(_2533))).xy;
    float _782 = _780.x;
    float _784 = _780.y;
    float _786 = _752 + _562;
    float _788 = _786 + _564;
    float _790 = _788 + _566;
    float _792 = _790 + _568;
    float _794 = fma(_754, -0.5, _734);
    float _796 = _792 + _756;
    float _798 = _770 + _760;
    float _800 = _798 + _762;
    float _802 = _800 + _764;
    float _804 = _802 + _772;
    float3 _2578 = float3(_750, _768, float(int(_720)));
    float3 _2580 = select(_2578, float3(0.0), isnan(_2578));
    float _806 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2580.xy, uint(rint(_2580.z)), _738);
    float3 _2589 = float3(_766, _794, float(int(_720)));
    float3 _2591 = select(_2589, float3(0.0), isnan(_2589));
    float _808 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2591.xy, uint(rint(_2591.z)), _738);
    float3 _2600 = float3(_746, _794, float(int(_720)));
    float3 _2602 = select(_2600, float3(0.0), isnan(_2600));
    float _810 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2602.xy, uint(rint(_2602.z)), _738);
    float3 _2611 = float3(_748, _794, float(int(_720)));
    float3 _2613 = select(_2611, float3(0.0), isnan(_2611));
    float _812 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2613.xy, uint(rint(_2613.z)), _738);
    float _814 = _804 + _774;
    float _816 = fma(_754, -1.5, _734);
    float _818 = _814 + _776;
    float _820 = fma(_782, 2.0, -1.0);
    float _822 = fma(_784, 2.0, -1.0);
    float _824 = _820 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _826 = _822 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _828 = fma(_824, 2.0, _54);
    float _830 = fma(_826, 2.0, _56);
    float3 _2652 = float3(_750, _794, float(int(_720)));
    float3 _2654 = select(_2652, float3(0.0), isnan(_2652));
    float _832 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2654.xy, uint(rint(_2654.z)), _738);
    float3 _2663 = float3(_766, _816, float(int(_720)));
    float3 _2665 = select(_2663, float3(0.0), isnan(_2663));
    float _834 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2665.xy, uint(rint(_2665.z)), _738);
    float3 _2674 = float3(_746, _816, float(int(_720)));
    float3 _2676 = select(_2674, float3(0.0), isnan(_2674));
    float _836 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2676.xy, uint(rint(_2676.z)), _738);
    float3 _2685 = float3(_748, _816, float(int(_720)));
    float3 _2687 = select(_2685, float3(0.0), isnan(_2685));
    float _838 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2687.xy, uint(rint(_2687.z)), _738);
    float3 _2696 = float3(_750, _816, float(int(_720)));
    float3 _2698 = select(_2696, float3(0.0), isnan(_2696));
    float _840 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2698.xy, uint(rint(_2698.z)), _738);
    float2 _2704 = float2(_828, _830);
    float _842 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2704, float2(0.0), isnan(_2704))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2704, float2(0.0), isnan(_2704))).x;
    float _844 = _796 * 0.0625;
    float _846 = _818 + _806;
    float _848 = _846 + _808;
    float _850 = _848 + _810;
    float _852 = _850 + _812;
    float _854 = _852 + _832;
    float _856 = _854 + _834;
    float _858 = _856 + _836;
    float _860 = -_66;
    float _862 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _864 = _860 + _862;
    float _866 = -_66;
    float _868 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _870 = _866 + _868;
    float _872 = _858 + _838;
    float _874 = _864 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _876 = precise::clamp(_874, 0.0, 1.0);
    float _878 = _870 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _880 = precise::clamp(_878, 0.0, 1.0);
    float _882 = _872 + _840;
    float _884 = fma(_540, 0.0625, _876);
    float _886 = _882 * 0.0625;
    float _888 = _886 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _890 = fma(_844, (*spvDescriptorSet0.fp_c3)._m0[49].z, _888);
    float _892 = _890 + _880;
    out.m_47.x = _842;
    out.m_47.y = _884;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _892;
    return out;
}

