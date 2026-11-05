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
    texture2d_array<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
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
    float2 _380 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_380, float2(0.0), isnan(_380))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_380, float2(0.0), isnan(_380))).x;
    float _54 = in.m_38.y;
    float _56 = -_52;
    float _58 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _60 = 1.0 / _58;
    float _62 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _64 = _60 * _62;
    float _66 = _64 * _54;
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
    float _96 = in.m_38.x;
    uint _98 = uint(int(uint(_94) >> uint(2)));
    uint _100 = uint(int(uint(int(_98)) >> uint(2)));
    int _102 = int(_98) & 3;
    float _104 = (*spvDescriptorSet0.fp_c1)._m0[int(_100)][_102];
    float _106 = _64 * _96;
    bool _108 = as_type<int>(_104) == 368;
    if (!_108)
    {
        bool _110 = as_type<int>(_104) == 640;
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
            float _116 = _66 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _118 = _66 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _120 = _66 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _122 = _66 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _124 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[0].x, _116);
            float _126 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[1].x, _118);
            float _128 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[2].x, _120);
            float _130 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[3].x, _122);
            float _132 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].z, _124);
            float _134 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].z, _126);
            float _136 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].z, _128);
            float _138 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].z, _130);
            float _140 = _132 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _142 = _134 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _144 = _136 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _146 = _138 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _148 = _146;
            _150 = _144;
            _152 = _142;
            _154 = _140;
        }
    }
    if ((false || _114) || _112)
    {
        if ((!_114) || _112)
        {
            _112 = false;
            float _156 = _66 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _158 = _66 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _160 = _66 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _162 = _66 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _164 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[4].x, _156);
            float _166 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[5].x, _158);
            float _168 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[6].x, _160);
            float _170 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[7].x, _162);
            float _172 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].z, _164);
            float _174 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[5].z, _166);
            float _176 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[6].z, _168);
            float _178 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[7].z, _170);
            float _180 = _172 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _182 = _174 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _184 = _176 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _186 = _178 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _148 = _186;
            _150 = _184;
            _152 = _182;
            _154 = _180;
        }
        if (false || _114)
        {
            _114 = false;
            float _188 = _66 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _190 = _66 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _192 = _66 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _194 = _66 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _196 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[8].x, _188);
            float _198 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[9].x, _190);
            float _200 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[10].x, _192);
            float _202 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[11].x, _194);
            float _204 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[8].z, _196);
            float _206 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[9].z, _198);
            float _208 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[10].z, _200);
            float _210 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[11].z, _202);
            float _212 = _204 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _214 = _206 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _216 = _208 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _218 = _210 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _148 = _218;
            _150 = _216;
            _152 = _214;
            _154 = _212;
        }
    }
    float _220 = _148;
    float _222 = _150;
    float _224 = _152;
    float _226 = _154;
    float _228 = _66 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _230 = 1.0 / _220;
    float _232 = _66 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _234 = _66 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _236 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[15].x, _228);
    float _238 = float(int(_89));
    float _240 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[12].x, _232);
    float _242 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[15].z, _236);
    float _244 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[12].z, _240);
    float _246 = rint(_238);
    float _248 = precise::max(_246, 0.0);
    uint _250 = uint(_248);
    uint _252 = clamp(_250, 0u, 65535u);
    float _254 = _242 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _256 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[13].x, _234);
    float _258 = _244 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _260 = _230 * _222;
    float _262 = precise::clamp(_260, 0.0, 1.0);
    float _264 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[13].z, _256);
    float _266 = 1.0 / _254;
    float _268 = _230 * _224;
    float _270 = _262 * (*spvDescriptorSet0.fp_c3)._m0[47].x;
    float _272 = _264 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _274 = _230 * _226;
    float _276 = _270 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _278 = _270 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _280 = fma(_278, -0.5, _268);
    float _282 = _258 * _266;
    float _284 = _272 * _266;
    float _286 = fma(_276, 0.5, _274);
    float _288 = fma(_276, -0.5, _274);
    float _290 = fma(_278, 0.5, _268);
    float2 _875 = float2(_282, _284);
    float2 _294 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_875, float2(0.0), isnan(_875))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_875, float2(0.0), isnan(_875))).xy;
    float _296 = _294.x;
    float _298 = _294.y;
    float3 _891 = float3(_288, _290, float(int(_252)));
    float3 _895 = select(_891, float3(0.0), isnan(_891));
    float _300 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _895.xy, uint(rint(_895.z)), _262);
    float3 _904 = float3(_286, _290, float(int(_252)));
    float3 _906 = select(_904, float3(0.0), isnan(_904));
    float _302 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _906.xy, uint(rint(_906.z)), _262);
    float3 _915 = float3(_286, _280, float(int(_252)));
    float3 _917 = select(_915, float3(0.0), isnan(_915));
    float _304 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _917.xy, uint(rint(_917.z)), _262);
    float3 _926 = float3(_288, _280, float(int(_252)));
    float3 _928 = select(_926, float3(0.0), isnan(_926));
    float _306 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _928.xy, uint(rint(_928.z)), _262);
    float _308 = _66 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _310 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[14].x, _308);
    float _312 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[14].z, _310);
    float _314 = _312 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _316 = precise::min(_314, 1.0);
    float _318 = -_64;
    float _320 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _322 = _318 + _320;
    float _324 = -_296;
    float _326 = fma(_324, _296, _298);
    float _328 = -_296;
    float _330 = _316 + _328;
    float _332 = fma(_330, _330, _326);
    bool _334 = _330 <= 0.001000000047497451305389404296875;
    float _336 = float(_334);
    float _338 = _302 + _300;
    float _340 = 1.0 / _332;
    float _342 = _338 + _304;
    float _344 = _326 * _340;
    float _346 = -_64;
    float _348 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _350 = _346 + _348;
    float _352 = precise::max(_344, _336);
    float _354 = _350 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _356 = precise::clamp(_354, 0.0, 1.0);
    float _358 = _342 + _306;
    float _360 = _322 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _362 = precise::clamp(_360, 0.0, 1.0);
    float _364 = precise::min(_352, 1.0);
    float _366 = fma(_358, 0.25, _356);
    float _368 = _364 + _362;
    out.m_41.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_41.y = _366;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _368;
    return out;
}

