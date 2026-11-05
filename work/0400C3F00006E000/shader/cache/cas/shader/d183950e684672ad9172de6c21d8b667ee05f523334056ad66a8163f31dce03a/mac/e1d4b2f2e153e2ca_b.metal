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
    float2 _374 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_374, float2(0.0), isnan(_374))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_374, float2(0.0), isnan(_374))).x;
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
            _150 = _142;
            _152 = _140;
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
            _150 = _182;
            _152 = _180;
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
            _150 = _214;
            _152 = _212;
            _154 = _216;
        }
    }
    float _220 = _148;
    float _222 = _150;
    float _224 = _152;
    float _226 = _154;
    float _228 = _106 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _230 = _106 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _232 = 1.0 / _220;
    float _234 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[15].x, _228);
    float _236 = _106 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _238 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[13].x, _230);
    float _240 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[15].z, _234);
    float _242 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[13].z, _238);
    float _244 = _240 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _246 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[12].x, _236);
    float _248 = float(int(_89));
    float _250 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[12].z, _246);
    float _252 = 1.0 / _244;
    float _254 = _232 * _222;
    float _256 = _232 * _224;
    float _258 = _250 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _260 = _242 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _262 = _232 * _226;
    float _264 = precise::clamp(_262, 0.0, 1.0);
    float _266 = rint(_248);
    float _268 = precise::max(_266, 0.0);
    uint _270 = uint(_268);
    uint _272 = clamp(_270, 0u, 65535u);
    float _274 = _258 * _252;
    float _276 = _260 * _252;
    float2 _837 = float2(_52, _54);
    float2 _280 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_837, float2(0.0), isnan(_837))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_837, float2(0.0), isnan(_837))).xy;
    float _282 = _280.x;
    float _284 = _280.y;
    float2 _849 = float2(_274, _276);
    float2 _286 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_849, float2(0.0), isnan(_849))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_849, float2(0.0), isnan(_849))).xy;
    float _288 = _286.x;
    float _290 = _286.y;
    float3 _865 = float3(_256, _254, float(int(_272)));
    float3 _869 = select(_865, float3(0.0), isnan(_865));
    float _292 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _869.xy, uint(rint(_869.z)), _264);
    float _294 = fma(_282, 2.0, -1.0);
    float _296 = fma(_284, 2.0, -1.0);
    float _298 = _294 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _300 = _296 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _302 = fma(_298, 2.0, _52);
    float _304 = fma(_300, 2.0, _54);
    float2 _896 = float2(_302, _304);
    float _306 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_896, float2(0.0), isnan(_896))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_896, float2(0.0), isnan(_896))).x;
    float _308 = _106 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _310 = -_288;
    float _312 = fma(_310, _288, _290);
    float _314 = -_64;
    float _316 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _318 = _314 + _316;
    float _320 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[14].x, _308);
    float _322 = -_64;
    float _324 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _326 = _322 + _324;
    float _328 = _318 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _330 = precise::clamp(_328, 0.0, 1.0);
    float _332 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[14].z, _320);
    float _334 = _326 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _336 = precise::clamp(_334, 0.0, 1.0);
    float _338 = _292 + _330;
    float _340 = _332 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _342 = precise::min(_340, 1.0);
    float _344 = -_288;
    float _346 = _342 + _344;
    float _348 = fma(_346, _346, _312);
    bool _350 = _346 <= 0.001000000047497451305389404296875;
    float _352 = float(_350);
    float _354 = 1.0 / _348;
    float _356 = _312 * _354;
    float _358 = precise::max(_356, _352);
    float _360 = precise::min(_358, 1.0);
    float _362 = _360 + _336;
    out.m_45.x = _306;
    out.m_45.y = _338;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _362;
    return out;
}

