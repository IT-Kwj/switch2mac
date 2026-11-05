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
    texture2d<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_41 [[color(0)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0), center_no_perspective]];
    float4 m_36 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _114 = false;
    bool _112 = false;
    float _48 = in.m_36.x;
    float _50 = in.m_36.y;
    float2 _402 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_402, float2(0.0), isnan(_402))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_402, float2(0.0), isnan(_402))).x;
    float _54 = in.m_38.x;
    float _56 = in.m_38.y;
    float _58 = -_52;
    float _60 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _62 = 1.0 / _60;
    float _64 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _66 = _62 * _64;
    float _68 = _66 * _54;
    float _70 = -_66;
    bool _74 = _70 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _76 = _66 * _56;
    float _78 = -_66;
    bool _80 = _78 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _82 = !_74;
    uint _85 = uint(_82 ? 0 : 1);
    uint _87 = 2u;
    if (!_74)
    {
        _87 = 1u;
    }
    uint _89 = _87;
    uint _91 = _89;
    if (!_80)
    {
        _91 = _85;
    }
    uint _93 = _91;
    uint _95 = min(_93, 2u);
    int _98 = int(_95) << 2;
    uint _100 = uint(int(uint(_98) >> uint(2)));
    uint _102 = uint(int(uint(int(_100)) >> uint(2)));
    int _104 = int(_100) & 3;
    float _106 = (*spvDescriptorSet0.fp_c1)._m0[int(_102)][_104];
    bool _108 = as_type<int>(_106) == 368;
    if (!_108)
    {
        bool _110 = as_type<int>(_106) == 640;
        _112 = _110;
        if (!_112)
        {
            _114 = true;
        }
    }
    float _148;
    float _150;
    float _152;
    float _154;
    if (!_112)
    {
        if (!_114)
        {
            float _116 = _76 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _118 = _76 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _120 = _76 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _122 = _76 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _124 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].x, _116);
            float _126 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].x, _118);
            float _128 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].x, _120);
            float _130 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].x, _122);
            float _132 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].z, _124);
            float _134 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].z, _126);
            float _136 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].z, _128);
            float _138 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].z, _130);
            float _140 = _132 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _142 = _134 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _144 = _136 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _146 = _138 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _148 = _146;
            _150 = _140;
            _152 = _144;
            _154 = _142;
        }
    }
    if ((false || _114) || _112)
    {
        if ((!_114) || _112)
        {
            _112 = false;
            float _156 = _76 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _158 = _76 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _160 = _76 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _162 = _76 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _164 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[4].x, _156);
            float _166 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[5].x, _158);
            float _168 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[6].x, _160);
            float _170 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[7].x, _162);
            float _172 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].z, _164);
            float _174 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[5].z, _166);
            float _176 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[6].z, _168);
            float _178 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[7].z, _170);
            float _180 = _172 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _182 = _174 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _184 = _176 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _186 = _178 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _148 = _186;
            _150 = _180;
            _152 = _184;
            _154 = _182;
        }
        if (false || _114)
        {
            _114 = false;
            float _188 = _76 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _190 = _76 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _192 = _76 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _194 = _76 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _196 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[8].x, _188);
            float _198 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[9].x, _190);
            float _200 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[10].x, _192);
            float _202 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[11].x, _194);
            float _204 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[8].z, _196);
            float _206 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[9].z, _198);
            float _208 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[10].z, _200);
            float _210 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[11].z, _202);
            float _212 = _204 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _214 = _206 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _216 = _208 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _218 = _210 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _148 = _218;
            _150 = _212;
            _152 = _216;
            _154 = _214;
        }
    }
    float _220 = _148;
    float _222 = _150;
    float _224 = _152;
    float _226 = _154;
    float _228 = _76 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _230 = float(int(_93));
    float _232 = 1.0 / _220;
    float _234 = _76 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _236 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[15].x, _228);
    float _238 = _76 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _240 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[13].x, _234);
    float _242 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[15].z, _236);
    float _244 = rint(_230);
    float _246 = precise::max(_244, 0.0);
    uint _248 = uint(_246);
    uint _250 = clamp(_248, 0u, 65535u);
    float _252 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[13].z, _240);
    float _254 = _242 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _256 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[12].x, _238);
    float _258 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _260 = _252 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _262 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[12].z, _256);
    float _264 = 1.0 / _254;
    float _266 = _232 * _222;
    float _268 = _232 * _224;
    float _270 = precise::clamp(_268, 0.0, 1.0);
    float _272 = _262 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _274 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _276 = _232 * _226;
    float _278 = fma(_270, _274, _266);
    float _280 = -_274;
    float _282 = fma(_270, _280, _266);
    float _284 = fma(_270, _258, _276);
    float _286 = -_258;
    float _288 = fma(_270, _286, _276);
    float _290 = _260 * _264;
    float _292 = _272 * _264;
    float3 _905 = float3(_266, _284, float(int(_250)));
    float3 _909 = select(_905, float3(0.0), isnan(_905));
    float _294 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _909.xy, uint(rint(_909.z)), _270);
    float3 _918 = float3(_278, _284, float(int(_250)));
    float3 _920 = select(_918, float3(0.0), isnan(_918));
    float _296 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _920.xy, uint(rint(_920.z)), _270);
    float3 _929 = float3(_282, _284, float(int(_250)));
    float3 _931 = select(_929, float3(0.0), isnan(_929));
    float _298 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _931.xy, uint(rint(_931.z)), _270);
    float3 _940 = float3(_278, _276, float(int(_250)));
    float3 _942 = select(_940, float3(0.0), isnan(_940));
    float _300 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _942.xy, uint(rint(_942.z)), _270);
    float3 _951 = float3(_266, _276, float(int(_250)));
    float3 _953 = select(_951, float3(0.0), isnan(_951));
    float _302 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _953.xy, uint(rint(_953.z)), _270);
    float2 _959 = float2(_292, _290);
    float2 _306 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_959, float2(0.0), isnan(_959))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_959, float2(0.0), isnan(_959))).xy;
    float _308 = _306.x;
    float _310 = _306.y;
    float3 _974 = float3(_282, _276, float(int(_250)));
    float3 _976 = select(_974, float3(0.0), isnan(_974));
    float _312 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _976.xy, uint(rint(_976.z)), _270);
    float3 _985 = float3(_278, _288, float(int(_250)));
    float3 _987 = select(_985, float3(0.0), isnan(_985));
    float _314 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _987.xy, uint(rint(_987.z)), _270);
    float3 _996 = float3(_266, _288, float(int(_250)));
    float3 _998 = select(_996, float3(0.0), isnan(_996));
    float _316 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _998.xy, uint(rint(_998.z)), _270);
    float3 _1007 = float3(_282, _288, float(int(_250)));
    float3 _1009 = select(_1007, float3(0.0), isnan(_1007));
    float _318 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1009.xy, uint(rint(_1009.z)), _270);
    float _320 = _76 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _322 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[14].x, _320);
    float _324 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[14].z, _322);
    float _326 = _324 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _328 = precise::min(_326, 1.0);
    float _330 = -_66;
    float _332 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _334 = _330 + _332;
    float _336 = -_66;
    float _338 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _340 = _336 + _338;
    float _342 = _334 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _344 = precise::clamp(_342, 0.0, 1.0);
    float _346 = _296 + _294;
    float _348 = _346 + _298;
    float _350 = -_308;
    float _352 = fma(_350, _308, _310);
    float _354 = -_308;
    float _356 = _328 + _354;
    float _358 = _348 + _300;
    float _360 = fma(_356, _356, _352);
    float _362 = _358 + _302;
    bool _364 = _356 <= 0.001000000047497451305389404296875;
    float _366 = float(_364);
    float _368 = _362 + _312;
    float _370 = 1.0 / _360;
    float _372 = _368 + _314;
    float _374 = _352 * _370;
    float _376 = _372 + _316;
    float _378 = _340 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _380 = precise::clamp(_378, 0.0, 1.0);
    float _382 = precise::max(_374, _366);
    float _384 = _376 + _318;
    float _386 = precise::min(_382, 1.0);
    float _388 = fma(_384, 0.111111111938953399658203125, _344);
    float _390 = _386 + _380;
    out.m_41.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_41.y = _388;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _390;
    return out;
}

