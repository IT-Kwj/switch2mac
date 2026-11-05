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
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d<float> fp_t_tcb_10 [[id(6)]];
    sampler fp_t_tcb_10Smplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_E [[id(8)]];
    sampler fp_t_tcb_ESmplr [[id(9)]];
    texture2d<float> fp_t_tcb_A [[id(10)]];
    sampler fp_t_tcb_ASmplr [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    sampler fp_t_tcb_10Smplr_w [[id(14)]];
    sampler fp_t_tcb_ASmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0), center_no_perspective]];
    float4 m_40 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _114 = false;
    bool _112 = false;
    float _52 = in.m_40.x;
    float _54 = in.m_40.y;
    float2 _400 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_400, float2(0.0), isnan(_400))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_400, float2(0.0), isnan(_400))).x;
    float _58 = in.m_42.x;
    float _60 = -_56;
    float _62 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _64 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[46].z, _62);
    float _66 = _64 * _58;
    float _68 = -_64;
    bool _72 = _68 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _74 = -_64;
    bool _76 = _74 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _78 = !_72;
    uint _81 = uint(_78 ? 0 : 1);
    uint _83 = 2u;
    if (!_72)
    {
        _83 = 1u;
    }
    uint _85 = _83;
    uint _87 = _85;
    if (!_76)
    {
        _87 = _81;
    }
    uint _89 = _87;
    uint _91 = min(_89, 2u);
    int _94 = int(_91) << 2;
    float _96 = in.m_42.y;
    uint _98 = uint(int(uint(_94) >> uint(2)));
    uint _100 = uint(int(uint(int(_98)) >> uint(2)));
    int _102 = int(_98) & 3;
    float _104 = (*spvDescriptorSet0.fp_c1)._m0[int(_100)][_102];
    float _106 = _64 * _96;
    bool _108 = as_type<int>(_104) == 336;
    if (!_108)
    {
        bool _110 = as_type<int>(_104) == 608;
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
            float _116 = _106 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _118 = _106 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _120 = _106 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _122 = _106 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _124 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].x, _116);
            float _126 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].x, _118);
            float _128 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].x, _120);
            float _130 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].x, _122);
            float _132 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].z, _124);
            float _134 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].z, _126);
            float _136 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].z, _128);
            float _138 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].z, _130);
            float _140 = _132 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _142 = _134 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _144 = _136 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _146 = _138 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _148 = _146;
            _150 = _140;
            _152 = _142;
            _154 = _144;
        }
    }
    if ((false || _114) || _112)
    {
        if ((!_114) || _112)
        {
            _112 = false;
            float _156 = _106 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _158 = _106 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _160 = _106 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _162 = _106 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _164 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].x, _156);
            float _166 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[5].x, _158);
            float _168 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[6].x, _160);
            float _170 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[7].x, _162);
            float _172 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].z, _164);
            float _174 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[5].z, _166);
            float _176 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[6].z, _168);
            float _178 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[7].z, _170);
            float _180 = _172 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _182 = _174 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _184 = _176 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _186 = _178 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _148 = _186;
            _150 = _180;
            _152 = _182;
            _154 = _184;
        }
        if (false || _114)
        {
            _114 = false;
            float _188 = _106 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _190 = _106 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _192 = _106 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _194 = _106 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _196 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[8].x, _188);
            float _198 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[9].x, _190);
            float _200 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[10].x, _192);
            float _202 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[11].x, _194);
            float _204 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[8].z, _196);
            float _206 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[9].z, _198);
            float _208 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[10].z, _200);
            float _210 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[11].z, _202);
            float _212 = _204 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _214 = _206 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _216 = _208 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _218 = _210 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _148 = _218;
            _150 = _212;
            _152 = _214;
            _154 = _216;
        }
    }
    float _220 = _148;
    float _222 = _150;
    float _224 = _152;
    float _226 = _154;
    float2 _771 = float2(_52, _54);
    float2 _230 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_771, float2(0.0), isnan(_771))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_771, float2(0.0), isnan(_771))).xy;
    float _232 = _230.x;
    float _234 = _230.y;
    float _236 = _106 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _238 = _106 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _240 = 1.0 / _220;
    float _242 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[15].x, _236);
    float _244 = _106 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _246 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[13].x, _238);
    float _248 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[15].z, _242);
    float _250 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[13].z, _246);
    float _252 = _248 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _254 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[12].x, _244);
    float _256 = _250 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _258 = 1.0 / _252;
    float _260 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[12].z, _254);
    float _262 = _240 * _222;
    float _264 = _240 * _224;
    float _266 = _240 * _226;
    float _268 = precise::clamp(_266, 0.0, 1.0);
    float _270 = _260 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _272 = float(int(_89));
    float _274 = _268 * (*spvDescriptorSet0.fp_c3)._m0[47].x;
    float _276 = rint(_272);
    float _278 = precise::max(_276, 0.0);
    uint _280 = uint(_278);
    uint _282 = clamp(_280, 0u, 65535u);
    float _284 = _270 * _258;
    float _286 = _256 * _258;
    float _288 = _274 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _290 = _274 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float2 _889 = float2(_284, _286);
    float2 _292 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_889, float2(0.0), isnan(_889))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_889, float2(0.0), isnan(_889))).xy;
    float _294 = _292.x;
    float _296 = _292.y;
    float _298 = fma(_288, 0.5, _262);
    float _300 = fma(_288, -0.5, _262);
    float _302 = fma(_290, 0.5, _264);
    float _304 = fma(_290, -0.5, _264);
    float _306 = fma(_234, 2.0, -1.0);
    float _308 = fma(_232, 2.0, -1.0);
    float _310 = _306 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _312 = _308 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _314 = fma(_310, 2.0, _54);
    float _316 = fma(_312, 2.0, _52);
    float3 _940 = float3(_300, _302, float(int(_282)));
    float3 _944 = select(_940, float3(0.0), isnan(_940));
    float _318 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _944.xy, uint(rint(_944.z)), _268);
    float3 _953 = float3(_298, _302, float(int(_282)));
    float3 _955 = select(_953, float3(0.0), isnan(_953));
    float _320 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _955.xy, uint(rint(_955.z)), _268);
    float3 _964 = float3(_298, _304, float(int(_282)));
    float3 _966 = select(_964, float3(0.0), isnan(_964));
    float _322 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _966.xy, uint(rint(_966.z)), _268);
    float3 _975 = float3(_300, _304, float(int(_282)));
    float3 _977 = select(_975, float3(0.0), isnan(_975));
    float _324 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _977.xy, uint(rint(_977.z)), _268);
    float2 _983 = float2(_316, _314);
    float _326 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_983, float2(0.0), isnan(_983))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_983, float2(0.0), isnan(_983))).x;
    float _328 = _106 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _330 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[14].x, _328);
    float _332 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[14].z, _330);
    float _334 = _332 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _336 = precise::min(_334, 1.0);
    float _338 = -_294;
    float _340 = fma(_338, _294, _296);
    float _342 = -_294;
    float _344 = _336 + _342;
    float _346 = fma(_344, _344, _340);
    bool _348 = _344 <= 0.001000000047497451305389404296875;
    float _350 = float(_348);
    float _352 = 1.0 / _346;
    float _354 = -_64;
    float _356 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _358 = _354 + _356;
    float _360 = _358 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _362 = precise::clamp(_360, 0.0, 1.0);
    float _364 = _340 * _352;
    float _366 = -_64;
    float _368 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _370 = _366 + _368;
    float _372 = precise::max(_364, _350);
    float _374 = _370 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _376 = precise::clamp(_374, 0.0, 1.0);
    float _378 = precise::min(_372, 1.0);
    float _380 = _378 + _362;
    float _382 = _320 + _318;
    float _384 = _382 + _322;
    float _386 = _384 + _324;
    float _388 = fma(_386, 0.25, _376);
    out.m_45.x = _326;
    out.m_45.y = _388;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _380;
    return out;
}

