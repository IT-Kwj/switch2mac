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
    float4 m_43 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_38 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _116 = false;
    bool _114 = false;
    float _50 = in.m_38.x;
    float _52 = in.m_38.y;
    float2 _775 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_775, float2(0.0), isnan(_775))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_775, float2(0.0), isnan(_775))).x;
    float _56 = in.m_40.x;
    float _58 = -_54;
    float _60 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _62 = 1.0 / _60;
    float _64 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _66 = _62 * _64;
    float _68 = _66 * _56;
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
    float _93 = in.m_40.y;
    uint _95 = min(_91, 2u);
    int _98 = int(_95) << 2;
    uint _100 = uint(int(uint(_98) >> uint(2)));
    uint _102 = uint(int(uint(int(_100)) >> uint(2)));
    int _104 = int(_100) & 3;
    float _106 = (*spvDescriptorSet0.fp_c1)._m0[int(_102)][_104];
    float _108 = _66 * _93;
    bool _110 = as_type<int>(_106) == 368;
    if (!_110)
    {
        bool _112 = as_type<int>(_106) == 640;
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
            float _118 = _108 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _120 = _108 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _122 = _108 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _124 = _108 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _126 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].x, _118);
            float _128 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].x, _120);
            float _130 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].x, _122);
            float _132 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].x, _124);
            float _134 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].z, _126);
            float _136 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].z, _128);
            float _138 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].z, _130);
            float _140 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].z, _132);
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
            float _158 = _108 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _160 = _108 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _162 = _108 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _164 = _108 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _166 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[4].x, _158);
            float _168 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[5].x, _160);
            float _170 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[6].x, _162);
            float _172 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[7].x, _164);
            float _174 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].z, _166);
            float _176 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[5].z, _168);
            float _178 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[6].z, _170);
            float _180 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[7].z, _172);
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
            float _190 = _108 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _192 = _108 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _194 = _108 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _196 = _108 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _198 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[8].x, _190);
            float _200 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[9].x, _192);
            float _202 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[10].x, _194);
            float _204 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[11].x, _196);
            float _206 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[8].z, _198);
            float _208 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[9].z, _200);
            float _210 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[10].z, _202);
            float _212 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[11].z, _204);
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
    float _230 = float(int(_91));
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
    float3 _1207 = float3(_252, _254, float(int(_244)));
    float3 _1211 = select(_1207, float3(0.0), isnan(_1207));
    float _262 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1211.xy, uint(rint(_1211.z)), _250);
    float3 _1220 = float3(_256, _254, float(int(_244)));
    float3 _1222 = select(_1220, float3(0.0), isnan(_1220));
    float _264 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1222.xy, uint(rint(_1222.z)), _250);
    float3 _1231 = float3(_260, _254, float(int(_244)));
    float3 _1233 = select(_1231, float3(0.0), isnan(_1231));
    float _266 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1233.xy, uint(rint(_1233.z)), _250);
    float _268 = -_234;
    float _270 = fma(_250, _268, _246);
    float3 _1248 = float3(_256, _246, float(int(_244)));
    float3 _1250 = select(_1248, float3(0.0), isnan(_1248));
    float _272 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1250.xy, uint(rint(_1250.z)), _250);
    float3 _1259 = float3(_252, _246, float(int(_244)));
    float3 _1261 = select(_1259, float3(0.0), isnan(_1259));
    float _274 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1261.xy, uint(rint(_1261.z)), _250);
    float3 _1270 = float3(_260, _246, float(int(_244)));
    float3 _1272 = select(_1270, float3(0.0), isnan(_1270));
    float _276 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1272.xy, uint(rint(_1272.z)), _250);
    float3 _1281 = float3(_256, _270, float(int(_244)));
    float3 _1283 = select(_1281, float3(0.0), isnan(_1281));
    float _278 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1283.xy, uint(rint(_1283.z)), _250);
    float _280 = -_108;
    float _282 = _280 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _284 = -_68;
    float _286 = _284 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _288 = _108 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _290 = _282 * _282;
    float _292 = fma(_286, _286, _290);
    float _294 = -_66;
    float _296 = _294 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _298 = fma(_296, _296, _292);
    float _300 = sqrt(_298);
    float _302 = _108 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    bool _304 = _300 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _306 = _300 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _308 = !_304;
    int _310 = _308 ? 0 : 1;
    int _312 = 2;
    if (!_304)
    {
        _312 = 1;
    }
    int _314 = _312;
    int _316 = _314;
    if (!_306)
    {
        _316 = _310;
    }
    int _318 = _316;
    float _320 = _108 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _322 = _108 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _324 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[22].x, _288);
    float _326 = float(_318);
    float _328 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[21].x, _320);
    float _330 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[19].x, _322);
    float _332 = _108 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _334 = precise::min(_326, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _336 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[21].z, _328);
    float _338 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[24].x, _302);
    float _340 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[19].z, _330);
    bool _342 = _334 != 1.0;
    bool _344 = isnan(_334);
    bool _346 = _342 || _344;
    bool _348 = isnan(1.0);
    bool _350 = _346 || _348;
    float _352 = _108 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _354 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[22].z, _324);
    float _356 = _336 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _358 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[20].x, _332);
    float _360 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[24].z, _338);
    float _362 = _340 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    bool _364 = _334 != 0.0;
    bool _366 = isnan(_334);
    bool _368 = _364 || _366;
    bool _370 = isnan(0.0);
    bool _372 = _368 || _370;
    float _374 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[23].x, _352);
    float _376 = _108 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _378 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[20].z, _358);
    float _380 = _108 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _382 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[23].z, _374);
    float _384 = _356;
    float _386 = _362;
    if (_350)
    {
        float _388 = _360 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _384 = _388;
    }
    float _390 = _384;
    float _392 = _390;
    if (_350)
    {
        float _394 = _354 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _386 = _394;
    }
    float _396 = _386;
    float _398 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[18].x, _376);
    float _400 = rint(_334);
    float _402 = precise::max(_400, 0.0);
    uint _404 = uint(_402);
    uint _406 = clamp(_404, 0u, 65535u);
    float _408 = _108 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _410 = _378 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _412 = _410;
    float _414 = _396;
    if (_350)
    {
        float _416 = _382 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _412 = _416;
    }
    float _418 = _412;
    float _420 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[17].x, _380);
    float _422 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[18].z, _398);
    float _424 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[16].x, _408);
    float _426 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _428 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[17].z, _420);
    float _430 = _418;
    if (!_372)
    {
        float _432 = _422 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _392 = _432;
    }
    float _434 = _392;
    float _436 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[16].z, _424);
    float _438 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    if (!_372)
    {
        float _440 = _428 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _430 = _440;
    }
    float _442 = _430;
    float _444 = 0.0 + _434;
    float _446 = precise::clamp(_444, 0.0, 1.0);
    if (!_372)
    {
        float _448 = _436 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _414 = _448;
    }
    float _450 = _414;
    float _452 = fma(_446, _438, _442);
    float _454 = -_426;
    float _456 = fma(_446, _454, _450);
    float _458 = fma(_446, _426, _450);
    float _460 = _264 + _262;
    float3 _1627 = float3(_252, _270, float(int(_244)));
    float3 _1629 = select(_1627, float3(0.0), isnan(_1627));
    float _462 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1629.xy, uint(rint(_1629.z)), _250);
    float3 _1638 = float3(_260, _270, float(int(_244)));
    float3 _1640 = select(_1638, float3(0.0), isnan(_1638));
    float _464 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1640.xy, uint(rint(_1640.z)), _250);
    float3 _1649 = float3(_450, _452, float(int(_406)));
    float3 _1651 = select(_1649, float3(0.0), isnan(_1649));
    float _466 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1651.xy, uint(rint(_1651.z)), _446);
    float _468 = _460 + _266;
    float3 _1663 = float3(_456, _452, float(int(_406)));
    float3 _1665 = select(_1663, float3(0.0), isnan(_1663));
    float _470 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1665.xy, uint(rint(_1665.z)), _446);
    float3 _1674 = float3(_458, _442, float(int(_406)));
    float3 _1676 = select(_1674, float3(0.0), isnan(_1674));
    float _472 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1676.xy, uint(rint(_1676.z)), _446);
    float3 _1685 = float3(_458, _452, float(int(_406)));
    float3 _1687 = select(_1685, float3(0.0), isnan(_1685));
    float _474 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1687.xy, uint(rint(_1687.z)), _446);
    float _476 = _468 + _272;
    float _478 = -_438;
    float _480 = fma(_446, _478, _442);
    float _482 = _476 + _274;
    float _484 = _482 + _276;
    float _486 = _484 + _278;
    float3 _1714 = float3(_450, _442, float(int(_406)));
    float3 _1716 = select(_1714, float3(0.0), isnan(_1714));
    float _488 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1716.xy, uint(rint(_1716.z)), _446);
    float3 _1725 = float3(_456, _442, float(int(_406)));
    float3 _1727 = select(_1725, float3(0.0), isnan(_1725));
    float _490 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1727.xy, uint(rint(_1727.z)), _446);
    float3 _1736 = float3(_458, _480, float(int(_406)));
    float3 _1738 = select(_1736, float3(0.0), isnan(_1736));
    float _492 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1738.xy, uint(rint(_1738.z)), _446);
    float3 _1747 = float3(_450, _480, float(int(_406)));
    float3 _1749 = select(_1747, float3(0.0), isnan(_1747));
    float _494 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1749.xy, uint(rint(_1749.z)), _446);
    float _496 = _108 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _498 = _108 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _500 = _108 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _502 = _108 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _504 = _108 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _506 = _108 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _508 = _108 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _510 = _108 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _512 = _108 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _514 = -_108;
    float _516 = _514 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _518 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[27].x, _500);
    float _520 = -_68;
    float _522 = _520 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _524 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[25].x, _496);
    float _526 = _516 * _516;
    float _528 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[26].x, _498);
    float _530 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[28].x, _512);
    float _532 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[29].x, _506);
    float _534 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[30].x, _504);
    float _536 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[31].x, _508);
    float _538 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[32].x, _510);
    float _540 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[33].x, _502);
    float _542 = fma(_522, _522, _526);
    float _544 = -_66;
    float _546 = _544 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _548 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[28].z, _530);
    float _550 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[29].z, _532);
    float _552 = fma(_546, _546, _542);
    float _554 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[30].z, _534);
    float _556 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[31].z, _536);
    float _558 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[32].z, _538);
    float _560 = _550 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _562 = _554 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _564 = sqrt(_552);
    float _566 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[27].z, _518);
    float _568 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[26].z, _528);
    float _570 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[25].z, _524);
    bool _572 = _564 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _574 = _564 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _576 = !_572;
    int _578 = _576 ? 0 : 1;
    int _580 = 2;
    float _582 = _560;
    float _584 = _562;
    if (!_572)
    {
        _580 = 1;
    }
    int _586 = _580;
    int _588 = _586;
    if (!_574)
    {
        _588 = _578;
    }
    int _590 = _588;
    float _592 = float(_590);
    float _594 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[33].z, _540);
    float _596 = _548 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _598 = precise::min(_592, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _600 = _598 != 1.0;
    bool _602 = isnan(_598);
    bool _604 = _600 || _602;
    bool _606 = isnan(1.0);
    bool _608 = _604 || _606;
    float _610 = _596;
    if (_608)
    {
        float _612 = _556 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _610 = _612;
    }
    float _614 = _610;
    float _616 = _614;
    if (_608)
    {
        float _618 = _558 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _582 = _618;
    }
    float _620 = _582;
    float _622 = _620;
    if (_608)
    {
        float _624 = _594 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _584 = _624;
    }
    float _626 = _584;
    bool _628 = _598 != 0.0;
    bool _630 = isnan(_598);
    bool _632 = _628 || _630;
    bool _634 = isnan(0.0);
    bool _636 = _632 || _634;
    float _638 = rint(_598);
    float _640 = precise::max(_638, 0.0);
    uint _642 = uint(_640);
    uint _644 = clamp(_642, 0u, 65535u);
    float _646 = _626;
    if (!_636)
    {
        float _648 = _566 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _646 = _648;
    }
    float _650 = _646;
    if (!_636)
    {
        float _652 = _568 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _622 = _652;
    }
    float _654 = _622;
    if (!_636)
    {
        float _656 = _570 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _616 = _656;
    }
    float _658 = _616;
    float _660 = 0.0 + _650;
    float _662 = precise::clamp(_660, 0.0, 1.0);
    float _664 = fma(_438, _662, _654);
    float _666 = fma(_426, _662, _658);
    float3 _2072 = float3(_456, _480, float(int(_406)));
    float3 _2074 = select(_2072, float3(0.0), isnan(_2072));
    float _668 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2074.xy, uint(rint(_2074.z)), _446);
    float _670 = -_426;
    float _672 = fma(_670, _662, _658);
    float3 _2089 = float3(_658, _664, float(int(_644)));
    float3 _2091 = select(_2089, float3(0.0), isnan(_2089));
    float _674 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2091.xy, uint(rint(_2091.z)), _662);
    float3 _2100 = float3(_666, _664, float(int(_644)));
    float3 _2102 = select(_2100, float3(0.0), isnan(_2100));
    float _676 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2102.xy, uint(rint(_2102.z)), _662);
    float3 _2111 = float3(_672, _664, float(int(_644)));
    float3 _2113 = select(_2111, float3(0.0), isnan(_2111));
    float _678 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2113.xy, uint(rint(_2113.z)), _662);
    float3 _2122 = float3(_666, _654, float(int(_644)));
    float3 _2124 = select(_2122, float3(0.0), isnan(_2122));
    float _680 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2124.xy, uint(rint(_2124.z)), _662);
    float _682 = -_438;
    float _684 = fma(_682, _662, _654);
    float3 _2139 = float3(_658, _654, float(int(_644)));
    float3 _2141 = select(_2139, float3(0.0), isnan(_2139));
    float _686 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2141.xy, uint(rint(_2141.z)), _662);
    float3 _2150 = float3(_672, _654, float(int(_644)));
    float3 _2152 = select(_2150, float3(0.0), isnan(_2150));
    float _688 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2152.xy, uint(rint(_2152.z)), _662);
    float3 _2161 = float3(_666, _684, float(int(_644)));
    float3 _2163 = select(_2161, float3(0.0), isnan(_2161));
    float _690 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2163.xy, uint(rint(_2163.z)), _662);
    float3 _2172 = float3(_658, _684, float(int(_644)));
    float3 _2174 = select(_2172, float3(0.0), isnan(_2172));
    float _692 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2174.xy, uint(rint(_2174.z)), _662);
    float3 _2183 = float3(_672, _684, float(int(_644)));
    float3 _2185 = select(_2183, float3(0.0), isnan(_2183));
    float _694 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2185.xy, uint(rint(_2185.z)), _662);
    float _696 = _486 + _462;
    float _698 = _696 + _464;
    float _700 = -_66;
    float _702 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _704 = _700 + _702;
    float _706 = _474 + _466;
    float _708 = _704 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _710 = precise::clamp(_708, 0.0, 1.0);
    float _712 = _706 + _470;
    float _714 = fma(_698, 0.111111111938953399658203125, _710);
    float _716 = -_66;
    float _718 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _720 = _716 + _718;
    float _722 = _712 + _472;
    float _724 = _720 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _726 = precise::clamp(_724, 0.0, 1.0);
    float _728 = _722 + _488;
    float _730 = _728 + _490;
    float _732 = _730 + _492;
    float _734 = _732 + _494;
    float _736 = _734 + _668;
    float _738 = _676 + _674;
    float _740 = _736 * 0.111111111938953399658203125;
    float _742 = _738 + _678;
    float _744 = _742 + _680;
    float _746 = _744 + _686;
    float _748 = _746 + _688;
    float _750 = _748 + _690;
    float _752 = _750 + _692;
    float _754 = _752 + _694;
    float _756 = _754 * 0.111111111938953399658203125;
    float _758 = _756 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _760 = fma(_740, (*spvDescriptorSet0.fp_c3)._m0[49].z, _758);
    float _762 = _760 + _726;
    out.m_43.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_43.y = _714;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _762;
    return out;
}

